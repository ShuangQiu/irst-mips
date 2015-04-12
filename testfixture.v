////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:38:28 02/09/2012
// Design Name:   mips_16_core_top
// Module Name:   F:/Projects/My_MIPS/mips_16/bench/mips_16_core_top/mips_16_core_top_tb_0.v
// Project Name:  mips_16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_16_core_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

`include "instruction_mem.v"
`include "register_file.v"
`include "data_mem.v"

`define  SDFFILE "./mips_16_core_irst.sdf"
`define  END_CYCLE  10000

module mips_16_core_top_tb_0_v;

	// Inputs
	reg clk;
	reg rst;
    reg irst_done_reg; 

	// Outputs
    wire [15:0] irst_reg_data; 
    wire        irst_done; 

	wire [15:0]	instruction;
	wire [`PC_WIDTH-1:0] pc;
    wire        inst_write_en; 
    wire [15:0] inst_write_data; 
	
	wire [15:0]	reg_read_data_1;	// register file read port 1 data
	wire [15:0]	reg_read_data_2;	// register file read port 2 data

    wire		reg_write_en;
	wire [2:0]	reg_write_dest;
	wire [15:0]	reg_write_data;
    wire [2:0]	reg_read_addr_1;	// register file read port 1 address
	wire [2:0]	reg_read_addr_2;	// register file read port 2 address

	wire [15:0] mem_read_data;  // read port
	
	wire [15:0]	mem_access_addr; // address input, shared by read and write port
	wire [15:0] mem_write_data; // write port
	wire        mem_write_en;

    wire [31:0] rand_data;  

	parameter CLK_PERIOD = 10;
	always #(CLK_PERIOD /2) 
		clk =~clk;

    always @(posedge clk) 
        irst_done_reg <= irst_done; 

	integer i;
	integer test;
    integer fout; 
	
	// Instantiate the Unit Under Test (UUT)
	mips_16_core_top uut (
		.clk                (clk), 
		.rst                (rst), 
        .irst_reg_data      (irst_reg_data), 
        .irst_done          (irst_done), 

		.instruction		(instruction), 

		.pc(pc), 
        .inst_write_en(inst_write_en), 
        .inst_write_data(inst_write_data), 

		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.reg_read_addr_1		(reg_read_addr_1), 
		.reg_read_data_1		(reg_read_data_1), 
		.reg_read_addr_2		(reg_read_addr_2), 
		.reg_read_data_2		(reg_read_data_2), 

		.mem_access_addr    	(mem_access_addr), 
		.mem_write_data		    (mem_write_data), 
		.mem_write_en		    (mem_write_en), 
		.mem_read_data		    (mem_read_data), 

        .rand_data              (rand_data)
	);
	
	// instruction memory, or rom
	instruction_mem imem(
		.clk				(clk),
		.pc					(pc),

        .write_en           (inst_write_en), 
        .write_data         (inst_write_data), 
		
		.instruction		(instruction)
	);

	register_file register_file_inst (
		.clk					(clk), 
		.rst					(rst), 
		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.reg_read_addr_1		(reg_read_addr_1), 
		.reg_read_data_1		(reg_read_data_1), 
		.reg_read_addr_2		(reg_read_addr_2), 
		.reg_read_data_2		(reg_read_data_2), 
        .irst_reg_data          (irst_reg_data), 
        .irst_done              (irst_done)
	);
	
	/********************** Data memory *********************/
	// a ram
	data_mem dmem (
		.clk(clk), 
		.mem_access_addr	(mem_access_addr), 
		.mem_write_data		(mem_write_data), 
		.mem_write_en		(mem_write_en), 
		.mem_read_data		(mem_read_data)
	);

    `ifdef SDF 
    initial $sdf_annotate(`SDFFILE, uut); 
    `endif 
    
    `ifdef VCD
    initial begin 
        $dumpfile("mips_16_core.vcd");
        $dumpvars;
    end 
    `endif 

    initial begin // write file 
        fout = $fopen("mips_16_core.out"); 
        if (fout == 0) begin
            $display("Output file open error !");
            $finish;
        end
    end 
	

    initial begin 
        #(CLK_PERIOD*`END_CYCLE); 

        $display("WARNNING!! Simulation out of time ...!\n"); 
        $fdisplay(fout, "%b", 32'bx); 
        $finish;  
    end 

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

        // ***************************
        // fault injected here 
        // ***************************
        force uut.rand_data[3]=0;
        // ***************************

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#(CLK_PERIOD/2)
		#1
		display_debug_message;
		//test1;
		test2;
		$finish;
	end
      
	task display_debug_message;
		begin
			$display("\n");
			$display("mips_16 core test");
			$display("***************************\n");
		end
	endtask
	
	task sys_reset;
		begin
			rst = 0;
			#(CLK_PERIOD*1) rst = 1;
			#(CLK_PERIOD*1) rst = 0;
		end
	endtask
	
	
	task test1;
		begin
			$readmemb("./dat/test1.prog",imem.rom);
			$display("rom load successfully\n");
			$display("running test1\n");
			sys_reset;
			#1
			
			//#(CLK_PERIOD) test = 1;
			
			$monitor("current pc: %d ,instruction: %x", pc, uut.instruction);
			
			#(CLK_PERIOD*100)
			$monitoroff;
			display_all_regs;
			//$display("ram[10] = %d", dmem.ram[10]);
			//#(CLK_PERIOD*100) test = 0;
			sys_reset;
			
		end
	endtask
	
	task test2;
		begin
			//$readmemb("./dat/test2.prog",imem.rom);
			$readmemb("./dat/fti.prog",imem.rom);
			$readmemb("./dat/mis.prog",imem.rom,128);
			$display("rom load successfully\n");
			$display("running test2\n");
			$display("multiply R3=R1*R2\n");
			sys_reset;
			display_all_regs;
			#1
			test = 2;
			
			//#(CLK_PERIOD) test = 1;
			
			$monitor("current pc: %d ,instruction: %x", pc, uut.instruction);
			
			//#(CLK_PERIOD*400)
            @ (posedge irst_done_reg); 
			$monitoroff;
			display_all_regs;
            $fdisplay(fout, "%b", uut.rand_data); 

			$display("------------------------------");
            $display("trcd_data: "); 
            $display("%h", uut.rand_data); 
			$display("------------------------------");
			
			test = 0;
			sys_reset;
			
		end
	endtask
	
	task display_all_regs;
		begin
			$display("display_all_regs:");
			$display("------------------------------");
			$display("R0\tR1\tR2\tR3\tR4\tR5\tR6\tR7");
			for(i=0; i<8; i=i+1)
					$write("%d\t",register_file_inst.reg_array[i]);
			$display("\n------------------------------");
		end
	endtask
	
	
	always @ (test) begin
	    case(test)
			// 1: begin
			    // $display("running test1\n");
				 // while(test == 1) begin
				    // @(uut.pc)
					// $display("current pc : %d",uut.pc);
					// if(uut.pc == 40) begin
						// #1
					    // branch_taken = 1;
						// branch_offset_imm = -30;
						// #(CLK_PERIOD*1) 
						// branch_taken =0;
						// branch_offset_imm = 0;
					// end
				 // end
			// end
			
			2: begin
			    $display("running test2\n");
				 while(test == 2) begin
				    @(pc)
					if(pc%128==0) begin
						$display("current pc : %d",uut.pc);
						display_all_regs();
					end
							
				 end
			end
			
		endcase
	end
endmodule

