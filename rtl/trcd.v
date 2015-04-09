// +FHDR--------------------------------------------------------------------------------------------
// Copyright (c) 2015 Xxx.
// -------------------------------------------------------------------------------------------------
// Filename      : trcd.v
// Author        : r04099
// Created On    : 2015-03-18 07:52
// Last Modified : 2015-04-09 08:32
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
`timescale 1ns/1ps 
`include "mips_16_defs.v"
module trcd(
	input					clk,
    input                   rst, 
	
	// address input, shared by read and write port
	input	[15:0]			mem_access_addr,
	
	// write port
	input	[15:0]			mem_write_data,
	input					mem_write_en,
	// read port
	output	[31:0]			mem_read_data 
); 

    ora ora(.clk(clk), 
            .rst(rst), 
            .access_addr(mem_access_addr), 
            .write_en(mem_write_en), 
            .write_data(mem_write_data), 
            .read_data(mem_read_data)
           ); 

endmodule //trcd 

module ora(
    input                   clk, 
    input                   rst, 

	// address input, shared by read and write port
	input	[15:0]          access_addr,
	
	// write port
	input	[15:0]			write_data,
	input					write_en,
	// read port
	output	[31:0]			read_data
);

    reg     [31:0] ram; 
    reg     [31:0] lfsr; 

    wire     [31:0] misr; 

    //TODO: weight bist functionality 
    assign read_data = ram; 

    // misr assignment taking both write address & data value  
    genvar i; 
    assign misr[31] = ram[31]^write_data[0]; 
    assign misr[15] = ram[15]^access_addr[0]; 

    generate for (i=0; i<15; i=i+1) begin 
        assign misr[i] = ram[i]^write_data[i+1];  
        assign misr[i+16] = ram[i+16]^access_addr[i+1];  
    end endgenerate 
    // ---------------------------------------------------------------------------------------------

    // lfsr combinational 
    always @* begin 
        if(write_en) begin 
            lfsr = {misr[30:22], 
                    misr[31]^misr[21], 
                    misr[20:2], 
                    misr[31]^misr[1], 
                    misr[31]^misr[0], 
                    misr[31]}; 
        end else begin 
            lfsr = {ram[30:22], 
                    ram[31]^ram[21], 
                    ram[20:2], 
                    ram[31]^ram[1], 
                    ram[31]^ram[0], 
                    ram[31]}; 
        end 
    end 
    // ---------------------------------------------------------------------------------------------

    // next-ram logic 
    always @(posedge clk or posedge rst) begin 
        if(rst) begin 
            ram <= 32'd1; 
        end else begin 
            ram <= lfsr; 
        end 
    end 
    // ---------------------------------------------------------------------------------------------
endmodule // ora
