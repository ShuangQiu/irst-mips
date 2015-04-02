/***************************************************
 * Module: MEM_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     a ram
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
`include "mips_16_defs.v"

module MEM_stage
(
	input					clk,
	input					rst,
    input       [15:0]      irst_reg_data, 
    output      [15:0]      rand_data, 
	
	// from EX_stage
	input		[37:0]		pipeline_reg_in,	//	[37:22],16bits:	ex_alu_result[15:0];
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to WB_stage
	output	reg	[36:0]		pipeline_reg_out,	//	[36:21],16bits:	ex_alu_result[15:0]
												//	[20:5],16bits:	mem_read_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	output		[2:0]		mem_op_dest, 

	input	    [15:0]  	mem_read_data, // read port
	
	output	    [15:0]	    ex_alu_result, // address input, shared by read and write port
	output	    [15:0]		mem_write_data, // write port
	output					mem_write_en
);
	
    wire        [15:0]      trcd_data;  

	assign ex_alu_result = pipeline_reg_in[37:22];
	assign mem_write_en = pipeline_reg_in[21];
    assign mem_write_data = pipeline_reg_in[20:5];
    assign rand_data = trcd_data; 

    trcd trcd(.clk(clk), 
              .rst(rst), 
              .mem_access_addr(pipeline_reg_in[37:22]), 
              .mem_write_data(pipeline_reg_in[20:5]), 
              .mem_write_en(pipeline_reg_in[21]), 
              .mem_read_data(trcd_data)
              ); 
	
	/********************** singals to WB_stage *********************/
	always @ (posedge clk) begin
		if(rst) begin
			pipeline_reg_out[36:0] <= 0;
		end
		else begin
			pipeline_reg_out[36:21] <= ex_alu_result;
			pipeline_reg_out[20:5]	<= (irst_reg_data[15])?trcd_data:mem_read_data;
			pipeline_reg_out[4:0] 	<= pipeline_reg_in[4:0];
		end
	end
	
	
	/********************** to hazard detection unit *********************/
	assign mem_op_dest = pipeline_reg_in[3:1];

endmodule 
