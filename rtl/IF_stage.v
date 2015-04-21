/***************************************************
 * Module: IF_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     PC, IMEM, 
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
`include "mips_16_defs.v"


module IF_stage
(
	input							clk,
	input							rst,				//active high
    input   [15:0]                  irst_reg_data, 
    output                          irst_done, 

	input							instruction_fetch_en,
	
	input	[5:0]					branch_offset_imm,
	input							branch_taken,

	output	[`PC_WIDTH-1:0]		    pc, 
    output                          write_en,  
    input   [2:0]                   rand_data
);
    localparam  FUNC = 2'b00; 
    localparam  FTI  = 2'b01; 
    localparam  MIS  = 2'b10; 
    localparam  DONE = 2'b11; 

    reg     [`PC_WIDTH-1:0]         pc_reg, next_pc; 
    reg     [1:0]                   state, next_state; 
    reg     [5:0]                   cntr, next_cntr; 
    reg                             trigger; 

    wire                            toggle; 

    assign irst_done = (state==DONE); 
    assign write_en = (state==MIS); 
    assign pc = (state==FUNC)?pc_reg:{(state==MIS), pc_reg[`PC_WIDTH-2:0]};

    assign toggle = (state!=FUNC)&&(next_pc>irst_reg_data[14:8]); 

    always @* begin 
        case(irst_reg_data[7:6]) 
      //2'b00: trigger = 1'b1; 
        2'b01: trigger = rand_data[0]; 
        2'b10: trigger = rand_data[0]&rand_data[1]; 
        2'b11: trigger = rand_data[0]&rand_data[1]&rand_data[2]; 
        default 
            trigger = 1'b1; 
        endcase
    end 

    always @* begin 
        case(state) 
        FTI  : next_cntr=(next_state==MIS)?cntr+1'd1:cntr; 
        DONE : next_cntr=5'd0; 
        default 
            next_cntr=cntr; 
        endcase 
    end 

    //TODO: trigger freq. 
    always @* begin 
        case(state) 
        FUNC : next_state=(irst_reg_data[15])?FTI:FUNC; 
        FTI  : begin //TODO: also introduce trigger sig. 
            if(cntr<irst_reg_data[5:0]) 
                next_state=(toggle)?MIS:FTI; 
            else 
                next_state=(toggle)?DONE:FTI; 
        end 
        MIS  : next_state=(toggle&&trigger)?FTI:MIS; 
        default //DONE 
            next_state = (irst_reg_data[15])?DONE:FUNC; 
        endcase  
    end 

    always @* begin 
        if(instruction_fetch_en) begin
			if(branch_taken)
				//don't forget sign bit expansion
				next_pc=pc_reg + {{(`PC_WIDTH-6){branch_offset_imm[5]}}, branch_offset_imm[5:0]};	
			else
				next_pc=pc_reg + `PC_WIDTH'd1;
		end else 
            next_pc=pc_reg; 
    end 

	always @ (posedge clk or posedge rst) begin
	    if (rst) begin
	        pc_reg  <= `PC_WIDTH'b0;
            state   <= FUNC; 
            cntr    <= 8'd0; 
	    end else begin
            pc_reg  <= (toggle)?`PC_WIDTH'b0:next_pc;
            state   <= next_state; 
            cntr    <= next_cntr; 
		end
	end
endmodule 
