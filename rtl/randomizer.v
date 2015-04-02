// +FHDR--------------------------------------------------------------------------------------------
// Copyright (c) 2015 Xxx.
// -------------------------------------------------------------------------------------------------
// Filename      : randomizer.v
// Author        : YK. Huang
// Created On    : 2015-12-21 13:50
// Last Modified : 2015-12-21 13:56
// -------------------------------------------------------------------------------------------------
// Svn Info:
//   $Revision::                                                                                $:
//   $Author::                                                                                  $:
//   $Date::                                                                                    $:
//   $HeadURL::                                                                                 $:
// -------------------------------------------------------------------------------------------------
// Description:
//
//
// -FHDR--------------------------------------------------------------------------------------------

module randomizer(
    input   [15:0]          rand_data, 
    input   [15:0]          inst, 

    output  [15:0]          rand_inst
);


parameter mask_gen1 = 16'b0000111111111000,
		  mask_gen2 = 16'b0000111111111111,
		  mask_gen3 = 16'b0000000111111000;
parameter processor_reg0 = 3'b000, processor_reg1 = 3'b001;

//instructions def
parameter NOP = 4'b0000, ADD = 4'b0001, SUB = 4'b0010, AND = 4'b0011,
		  OR = 4'b0100, XOR = 4'b0101, SL = 4'b0110, SR = 4'b0111,
		  SRU = 4'b1000, ADDI = 4'b1001, LD = 4'b1010, ST = 4'b1011,
		  BZ = 4'b1100;
 
reg [15:0] i_rand_inst ;
reg [15:0] mask_gen ;

always @(inst or rand_data or i_rand_inst) begin
	case(inst[15:12])
		(NOP): mask_gen = mask_gen1;
		(ADD): mask_gen = mask_gen1; 
		(SUB): mask_gen = mask_gen1;
		(AND): mask_gen = mask_gen1;
		(OR):  mask_gen = mask_gen1;
		(XOR): mask_gen = mask_gen1;
		(SL):  mask_gen = mask_gen1;
		(SR):  mask_gen = mask_gen1;
		(SRU): mask_gen = mask_gen1;
		
		(ADDI):mask_gen = mask_gen2;
		(LD):  mask_gen = mask_gen2;
		(ST):  mask_gen = mask_gen2;
		
		(BZ):  mask_gen = mask_gen3; 
		default:begin
		end
	endcase
	
	i_rand_inst = (inst & (~mask_gen)) | (rand_data & mask_gen);
	if (i_rand_inst[15:12] != BZ) begin
		if (i_rand_inst[11:9] == processor_reg0) begin
			i_rand_inst[11:9] = processor_reg1;
		end
	end
end

assign rand_inst = i_rand_inst;

endmodule // randomizer

