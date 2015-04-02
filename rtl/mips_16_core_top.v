/***************************************************
 * Module: mips_16_core_top
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     top module of mips_16 cpu core. Technical details:
 *			1.	16-bit data width
 *			2.	classic 5-stage static pipeline, 1 branch delay slot, theoretical CPI is 1.0
 *			3.	pipeline is able to detect and prevent RAW hazards, no forwarding logic
 *			4.	8 general purpose register (reg 0 is special, according to mips architecture)
 *			5.	up to now supports 13 instrcutions, see ./doc/instruction_set.txt for details
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
`include "mips_16_defs.v"
module mips_16_core_top
(
	input						clk,
	input						rst,
    input   [15:0]              irst_reg_data, 
    output                      irst_done, 

	input	[15:0]				instruction, 

	output	[`PC_WIDTH-1:0]		pc, 
    output                      inst_write_en, 
    output  [15:0]              inst_write_data, 
	
	input	[15:0]				reg_read_data_1,	// register file read port 1 data
	input	[15:0]				reg_read_data_2,	// register file read port 2 data

    output						reg_write_en,
	output	[2:0]				reg_write_dest,
	output	[15:0]				reg_write_data,
	output	[2:0]				reg_read_addr_1,	// register file read port 1 address
	output	[2:0]				reg_read_addr_2,	// register file read port 2 address

	input	[15:0]  			mem_read_data, // read port
	
	output	[15:0]	    		mem_access_addr, // address input, shared by read and write port
	output	[15:0]		    	mem_write_data, // write port
	output					    mem_write_en
);
    wire    [15:0]              rand_data; 

	wire 						pipeline_stall_n ;
	wire	[5:0]				branch_offset_imm;
	wire						branch_taken;
	wire	[56:0]				ID_pipeline_reg_out;
	wire	[37:0]				EX_pipeline_reg_out;
	wire	[36:0]				MEM_pipeline_reg_out;
	
	wire	[2:0]				decoding_op_src1;		//source_1 register number
	wire	[2:0]				decoding_op_src2;		//source_2 register number
	wire	[2:0]				ex_op_dest;				//EX stage destinaton register number
	wire	[2:0]				mem_op_dest;			//MEM stage destinaton register number
	wire	[2:0]				wb_op_dest;				//WB stage destinaton register number
	
	IF_stage IF_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
        .irst_reg_data          (irst_reg_data), 
        .irst_done              (irst_done), 
		.instruction_fetch_en	(pipeline_stall_n),
		.branch_offset_imm		(branch_offset_imm), 
		.branch_taken			(branch_taken), 
		.pc						(pc), 
        .write_en               (inst_write_en) 
	);

    //TODO
    randomizer rand(
        .rand_data              (rand_data), 
        .inst                   (instruction), 
        .rand_inst              (inst_write_data)
    ); 
	
	ID_stage ID_stage_inst (
		.clk					(clk),
		.rst					(rst),
		.instruction_decode_en	(pipeline_stall_n),
		.pipeline_reg_out		(ID_pipeline_reg_out),
		.instruction			(instruction),
		.branch_offset_imm		(branch_offset_imm),
		.branch_taken			(branch_taken),
		.reg_read_addr_1		(reg_read_addr_1),	//
		.reg_read_addr_2		(reg_read_addr_2),	//
		.reg_read_data_1		(reg_read_data_1),	//
		.reg_read_data_2		(reg_read_data_2),	//
		.decoding_op_src1		(decoding_op_src1),		
		.decoding_op_src2		(decoding_op_src2)
	);
	
	EX_stage EX_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_reg_in		(ID_pipeline_reg_out), 
		.pipeline_reg_out		(EX_pipeline_reg_out), 
		.ex_op_dest				(ex_op_dest)
	);
	
	MEM_stage MEM_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
        .irst_reg_data          (irst_reg_data), 
        .rand_data              (rand_data), 

		.pipeline_reg_in		(EX_pipeline_reg_out), 
		.pipeline_reg_out		(MEM_pipeline_reg_out), 
		.mem_op_dest			(mem_op_dest), 

		.ex_alu_result        	(mem_access_addr), 
		.mem_write_data		    (mem_write_data), 
		.mem_write_en		    (mem_write_en), 
		.mem_read_data		    (mem_read_data)
	);
	
	WB_stage WB_stage_inst (
		.pipeline_reg_in		(MEM_pipeline_reg_out), 
		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.wb_op_dest				(wb_op_dest)
	);
	
	hazard_detection_unit hazard_detection_unit_inst (
		.decoding_op_src1		(decoding_op_src1), 
		.decoding_op_src2		(decoding_op_src2), 
		.ex_op_dest				(ex_op_dest), 
		.mem_op_dest			(mem_op_dest), 
		.wb_op_dest				(wb_op_dest), 
		.pipeline_stall_n		(pipeline_stall_n)
	);
	
endmodule 




 




