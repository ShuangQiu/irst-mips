// Verilog STILDPV testbench written by  TetraMAX (TM)  G-2012.06-SP5-i130118_181936 
// Date: Fri Dec  4 02:12:29 2015
// Module tested: mips_16_core_top

`timescale 1 ns / 1 ns

module mips_16_core_top_test;
   integer verbose;         // message verbosity level
   integer report_interval; // pattern reporting intervals
   integer diagnostic_msg;  // format miscompares for TetraMAX diagnostics
   parameter NINPUTS = 69, NOUTPUTS = 69;
   // The next two variables hold the current value of the TetraMAX pattern number
   // and vector number, while the simulation is progressing. $monitor or $display these
   // variables, or add them to waveform views, to see these values change with time
   integer pattern_number;
   integer vector_number;

   wire clk;  reg clk_REG ;
   wire rst;  reg rst_REG ;
   wire reg_write_en;
   wire mem_write_en;
   wire test_si1;  reg test_si1_REG ;
   wire test_so1;
   wire test_si2;  reg test_si2_REG ;
   wire test_so2;
   wire test_se;  reg test_se_REG ;
   wire [15:0] instruction;
//   reg [15:0] instruction_REG;
   reg \instruction_REG[0] ;
   reg \instruction_REG[1] ;
   reg \instruction_REG[2] ;
   reg \instruction_REG[3] ;
   reg \instruction_REG[4] ;
   reg \instruction_REG[5] ;
   reg \instruction_REG[6] ;
   reg \instruction_REG[7] ;
   reg \instruction_REG[8] ;
   reg \instruction_REG[9] ;
   reg \instruction_REG[10] ;
   reg \instruction_REG[11] ;
   reg \instruction_REG[12] ;
   reg \instruction_REG[13] ;
   reg \instruction_REG[14] ;
   reg \instruction_REG[15] ;
   wire [7:0] pc;
   wire [15:0] reg_read_data_1;
//   reg [15:0] reg_read_data_1_REG;
   reg \reg_read_data_1_REG[0] ;
   reg \reg_read_data_1_REG[1] ;
   reg \reg_read_data_1_REG[2] ;
   reg \reg_read_data_1_REG[3] ;
   reg \reg_read_data_1_REG[4] ;
   reg \reg_read_data_1_REG[5] ;
   reg \reg_read_data_1_REG[6] ;
   reg \reg_read_data_1_REG[7] ;
   reg \reg_read_data_1_REG[8] ;
   reg \reg_read_data_1_REG[9] ;
   reg \reg_read_data_1_REG[10] ;
   reg \reg_read_data_1_REG[11] ;
   reg \reg_read_data_1_REG[12] ;
   reg \reg_read_data_1_REG[13] ;
   reg \reg_read_data_1_REG[14] ;
   reg \reg_read_data_1_REG[15] ;
   wire [15:0] reg_read_data_2;
//   reg [15:0] reg_read_data_2_REG;
   reg \reg_read_data_2_REG[0] ;
   reg \reg_read_data_2_REG[1] ;
   reg \reg_read_data_2_REG[2] ;
   reg \reg_read_data_2_REG[3] ;
   reg \reg_read_data_2_REG[4] ;
   reg \reg_read_data_2_REG[5] ;
   reg \reg_read_data_2_REG[6] ;
   reg \reg_read_data_2_REG[7] ;
   reg \reg_read_data_2_REG[8] ;
   reg \reg_read_data_2_REG[9] ;
   reg \reg_read_data_2_REG[10] ;
   reg \reg_read_data_2_REG[11] ;
   reg \reg_read_data_2_REG[12] ;
   reg \reg_read_data_2_REG[13] ;
   reg \reg_read_data_2_REG[14] ;
   reg \reg_read_data_2_REG[15] ;
   wire [2:0] reg_write_dest;
   wire [15:0] reg_write_data;
   wire [2:0] reg_read_addr_1;
   wire [2:0] reg_read_addr_2;
   wire [15:0] mem_read_data;
//   reg [15:0] mem_read_data_REG;
   reg \mem_read_data_REG[0] ;
   reg \mem_read_data_REG[1] ;
   reg \mem_read_data_REG[2] ;
   reg \mem_read_data_REG[3] ;
   reg \mem_read_data_REG[4] ;
   reg \mem_read_data_REG[5] ;
   reg \mem_read_data_REG[6] ;
   reg \mem_read_data_REG[7] ;
   reg \mem_read_data_REG[8] ;
   reg \mem_read_data_REG[9] ;
   reg \mem_read_data_REG[10] ;
   reg \mem_read_data_REG[11] ;
   reg \mem_read_data_REG[12] ;
   reg \mem_read_data_REG[13] ;
   reg \mem_read_data_REG[14] ;
   reg \mem_read_data_REG[15] ;
   wire [15:0] mem_access_addr;
   wire [15:0] mem_write_data;

   // map register to wire for DUT inputs and bidis
   assign clk = clk_REG ;
   assign rst = rst_REG ;
   assign instruction = { \instruction_REG[15] , \instruction_REG[14] , \instruction_REG[13]
          , \instruction_REG[12] , \instruction_REG[11] , \instruction_REG[10] ,
          \instruction_REG[9] , \instruction_REG[8] , \instruction_REG[7] , \instruction_REG[6]
          , \instruction_REG[5] , \instruction_REG[4] , \instruction_REG[3] , \instruction_REG[2]
          , \instruction_REG[1] , \instruction_REG[0]  };
   assign reg_read_data_1 = { \reg_read_data_1_REG[15] , \reg_read_data_1_REG[14]
          , \reg_read_data_1_REG[13] , \reg_read_data_1_REG[12] , \reg_read_data_1_REG[11]
          , \reg_read_data_1_REG[10] , \reg_read_data_1_REG[9] , \reg_read_data_1_REG[8]
          , \reg_read_data_1_REG[7] , \reg_read_data_1_REG[6] , \reg_read_data_1_REG[5]
          , \reg_read_data_1_REG[4] , \reg_read_data_1_REG[3] , \reg_read_data_1_REG[2]
          , \reg_read_data_1_REG[1] , \reg_read_data_1_REG[0]  };
   assign reg_read_data_2 = { \reg_read_data_2_REG[15] , \reg_read_data_2_REG[14]
          , \reg_read_data_2_REG[13] , \reg_read_data_2_REG[12] , \reg_read_data_2_REG[11]
          , \reg_read_data_2_REG[10] , \reg_read_data_2_REG[9] , \reg_read_data_2_REG[8]
          , \reg_read_data_2_REG[7] , \reg_read_data_2_REG[6] , \reg_read_data_2_REG[5]
          , \reg_read_data_2_REG[4] , \reg_read_data_2_REG[3] , \reg_read_data_2_REG[2]
          , \reg_read_data_2_REG[1] , \reg_read_data_2_REG[0]  };
   assign mem_read_data = { \mem_read_data_REG[15] , \mem_read_data_REG[14] , \mem_read_data_REG[13]
          , \mem_read_data_REG[12] , \mem_read_data_REG[11] , \mem_read_data_REG[10]
          , \mem_read_data_REG[9] , \mem_read_data_REG[8] , \mem_read_data_REG[7]
          , \mem_read_data_REG[6] , \mem_read_data_REG[5] , \mem_read_data_REG[4]
          , \mem_read_data_REG[3] , \mem_read_data_REG[2] , \mem_read_data_REG[1]
          , \mem_read_data_REG[0]  };
   assign test_si1 = test_si1_REG ;
   assign test_si2 = test_si2_REG ;
   assign test_se = test_se_REG ;

   // instantiate the design into the testbench
   mips_16_core_top dut (
      .clk(clk),
      .rst(rst),
      .instruction({ instruction[15], instruction[14], instruction[13],
          instruction[12], instruction[11], instruction[10], instruction[9], instruction[8],
          instruction[7], instruction[6], instruction[5], instruction[4], instruction[3],
          instruction[2], instruction[1], instruction[0] }),
      .pc({ pc[7], pc[6], pc[5],
          pc[4], pc[3], pc[2], pc[1], pc[0] }),
      .reg_read_data_1({ reg_read_data_1[15], reg_read_data_1[14],
          reg_read_data_1[13], reg_read_data_1[12], reg_read_data_1[11], reg_read_data_1[10],
          reg_read_data_1[9], reg_read_data_1[8], reg_read_data_1[7], reg_read_data_1[6],
          reg_read_data_1[5], reg_read_data_1[4], reg_read_data_1[3], reg_read_data_1[2],
          reg_read_data_1[1], reg_read_data_1[0] }),
      .reg_read_data_2({ reg_read_data_2[15], reg_read_data_2[14],
          reg_read_data_2[13], reg_read_data_2[12], reg_read_data_2[11], reg_read_data_2[10],
          reg_read_data_2[9], reg_read_data_2[8], reg_read_data_2[7], reg_read_data_2[6],
          reg_read_data_2[5], reg_read_data_2[4], reg_read_data_2[3], reg_read_data_2[2],
          reg_read_data_2[1], reg_read_data_2[0] }),
      .reg_write_en(reg_write_en),
      .reg_write_dest({ reg_write_dest[2], reg_write_dest[1],
          reg_write_dest[0] }),
      .reg_write_data({ reg_write_data[15], reg_write_data[14], reg_write_data[13],
          reg_write_data[12], reg_write_data[11], reg_write_data[10], reg_write_data[9],
          reg_write_data[8], reg_write_data[7], reg_write_data[6], reg_write_data[5],
          reg_write_data[4], reg_write_data[3], reg_write_data[2], reg_write_data[1],
          reg_write_data[0] }),
      .reg_read_addr_1({ reg_read_addr_1[2], reg_read_addr_1[1], reg_read_addr_1[0]
          }),
      .reg_read_addr_2({ reg_read_addr_2[2], reg_read_addr_2[1], reg_read_addr_2[0] }),
      .mem_read_data({ mem_read_data[15],
          mem_read_data[14], mem_read_data[13], mem_read_data[12], mem_read_data[11],
          mem_read_data[10], mem_read_data[9], mem_read_data[8], mem_read_data[7],
          mem_read_data[6], mem_read_data[5], mem_read_data[4], mem_read_data[3],
          mem_read_data[2], mem_read_data[1], mem_read_data[0] }),
      .mem_access_addr({ mem_access_addr[15],
          mem_access_addr[14], mem_access_addr[13], mem_access_addr[12], mem_access_addr[11],
          mem_access_addr[10], mem_access_addr[9], mem_access_addr[8], mem_access_addr[7],
          mem_access_addr[6], mem_access_addr[5], mem_access_addr[4], mem_access_addr[3],
          mem_access_addr[2], mem_access_addr[1], mem_access_addr[0] }),
      .mem_write_data({ mem_write_data[15],
          mem_write_data[14], mem_write_data[13], mem_write_data[12], mem_write_data[11],
          mem_write_data[10], mem_write_data[9], mem_write_data[8], mem_write_data[7],
          mem_write_data[6], mem_write_data[5], mem_write_data[4], mem_write_data[3],
          mem_write_data[2], mem_write_data[1], mem_write_data[0] }),
      .mem_write_en(mem_write_en),
      .test_si1(test_si1),
      .test_so1(test_so1),
      .test_si2(test_si2),
      .test_so2(test_so2),
      .test_se(test_se)   );

   // STIL Direct Pattern Validate Access
   initial begin
      //
      // --- establish a default time format for %t
      //
      $timeformat(-9,2," ns",18);
      vector_number = 0;

      //
      // --- default verbosity to 0; use '+define+tmax_msg=N' on verilog compile line to change.
      //
      `ifdef tmax_msg
         verbose = `tmax_msg ;
      `else
         verbose = 0 ;
      `endif

      //
      // --- default pattern reporting interval is every 5 patterns;
      //     use '+define+tmax_rpt=N' on verilog compile line to change.
      //
      `ifdef tmax_rpt
         report_interval = `tmax_rpt ;
      `else
         report_interval = 5 ;
      `endif

      //
      // --- support generating Extened VCD output by using
      //     '+define+tmax_vcde' on verilog compile line.
      //
      `ifdef tmax_vcde
         // extended VCD, see Verilog specification, IEEE Std. 1364-2001 section 18.3
         if (verbose >= 1) $display("// %t : opening Extended VCD output file sim_vcde.vcd", $time);
         $dumpports( dut, "sim_vcde.vcd");
      `endif

      //
      // --- default miscompare messages are not formatted for TetraMAX diagnostics;
      //     use '+define+tmax_diag=N' on verilog compile line to format errors for diagnostics.
      //
      `ifdef tmax_diag
         diagnostic_msg = `tmax_diag ;
      `else
         diagnostic_msg = 0 ;
      `endif

      // '+define+tmax_parallel=N' on the command line overrides default simulation, using parallel load
      //   with N serial vectors at the end of each Shift
      // '+define+tmax_serial=M' on the command line forces M initial serial patterns,
      //   followed by the remainder in parallel (with N serial vectors if tmax_parallel is also specified)

      // +define+tmax_par_force_time on the command line overrides default parallel check/load time
      `ifdef tmax_par_force_time
         $STILDPV_parallel(,,,`tmax_par_force_time);
      `endif

      // TetraMAX parallel-mode simulation required for these patterns
      `ifdef tmax_parallel
         // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
         `ifdef tmax_serial_timing
         `else
            $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
            // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
         `endif
         `ifdef tmax_serial
            $STILDPV_parallel(`tmax_parallel,`tmax_serial);
         `else
            $STILDPV_parallel(`tmax_parallel,0);
         `endif
      `else
         `ifdef tmax_serial
            // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
            `ifdef tmax_serial_timing
            `else
               $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
               // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
            `endif
            $STILDPV_parallel(0,`tmax_serial);
         `else
            // default serial mode
         `endif
      `endif

      if (verbose>3)      $STILDPV_trace(1,1,1,1,1,report_interval,diagnostic_msg); // verbose=4; + trace each Vector
      else if (verbose>2) $STILDPV_trace(1,0,1,1,1,report_interval,diagnostic_msg); // verbose=3; + trace labels
      else if (verbose>1) $STILDPV_trace(0,0,1,1,1,report_interval,diagnostic_msg); // verbose=2; + trace WFT-changes
      else if (verbose>0) $STILDPV_trace(0,0,1,0,1,report_interval,diagnostic_msg); // verbose=1; + trace proc/macro entries
      else                $STILDPV_trace(0,0,0,0,0,report_interval,diagnostic_msg); // verbose=0; only pattern-interval

      $STILDPV_setup( "mips_16_core_atpg.stil",,,"mips_16_core_top_test.dut" );
      while ( !$STILDPV_done()) #($STILDPV_run( pattern_number, vector_number ));
      $display("Time %t: STIL simulation data completed.",$time);
      $finish; // comment this out if you terminate the simulation from other activities
   end

   // STIL Direct Pattern Validate Trace Options
   // The STILDPV_trace() function takes '1' to enable a trace and '0' to disable.
   // Unspecified arguments maintain their current state. Tracing may be changed at any time.
   // The following arguments control tracing of:
   // 1st argument: enable or disable tracing of all STIL labels
   // 2nd argument: enable or disable tracing of each STIL Vector and current Vector count
   // 3rd argument: enable or disable tracing of each additional Thread (new Pattern)
   // 4th argument: enable or disable tracing of each WaveformTable change
   // 5th argument: enable or disable tracing of each Procedure or Macro entry
   // 6th argument: interval to print starting pattern messages; 0 to disable
   // For example, a separate initial block may be used to control these options
   // (uncomment and change time values to use):
   // initial begin
   //    #800000 $STILDPV_trace(1,1);
   //    #600000 $STILDPV_trace(,0);
   // Additional calls to $STILDPV_parallel() may also be defined to change parallel/serial
   // operation during simulation. Any additional calls need a # time value.
   // 1st integer is number of serial (flat) cycles to simulate at end of each shift
   // 2nd integer is TetraMAX pattern number (starting at zero) to start parallel load
   // 3rd optional value '1' will advance time during the load_unload the same as a serial
   //     shift operation (with no events during that time), '0' will advance minimal time
   //     (1 shift vector) during the parallel load_unload.
   // For example,
   //    #8000 $STILDPV_parallel( 2,10 );
   // end // of initial block with additional trace/parallel options
endmodule
