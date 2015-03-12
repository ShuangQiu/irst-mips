
module WB_stage ( pipeline_reg_in, reg_write_en, reg_write_dest, 
        reg_write_data, wb_op_dest );
  input [36:0] pipeline_reg_in;
  output [2:0] reg_write_dest;
  output [15:0] reg_write_data;
  output [2:0] wb_op_dest;
  output reg_write_en;
  wire   n2, n3, n4, n5;

  CLKBUFX2 U1 ( .A(pipeline_reg_in[3]), .Y(reg_write_dest[2]) );
  CLKBUFX2 U2 ( .A(pipeline_reg_in[2]), .Y(reg_write_dest[1]) );
  CLKBUFX2 U3 ( .A(pipeline_reg_in[1]), .Y(reg_write_dest[0]) );
  INVX3 U4 ( .A(n5), .Y(n2) );
  INVX3 U5 ( .A(n4), .Y(n3) );
  BUFX2 U6 ( .A(pipeline_reg_in[0]), .Y(n4) );
  BUFX2 U7 ( .A(pipeline_reg_in[0]), .Y(n5) );
  CLKBUFX3 U8 ( .A(pipeline_reg_in[4]), .Y(reg_write_en) );
  CLKBUFX3 U9 ( .A(pipeline_reg_in[2]), .Y(wb_op_dest[1]) );
  CLKBUFX3 U10 ( .A(pipeline_reg_in[3]), .Y(wb_op_dest[2]) );
  CLKBUFX3 U11 ( .A(pipeline_reg_in[1]), .Y(wb_op_dest[0]) );
  AO22X1 U12 ( .A0(n5), .A1(pipeline_reg_in[5]), .B0(n2), .B1(
        pipeline_reg_in[21]), .Y(reg_write_data[0]) );
  AO22X1 U13 ( .A0(pipeline_reg_in[0]), .A1(pipeline_reg_in[15]), .B0(n2), 
        .B1(pipeline_reg_in[31]), .Y(reg_write_data[10]) );
  AO22X1 U14 ( .A0(n4), .A1(pipeline_reg_in[16]), .B0(n2), .B1(
        pipeline_reg_in[32]), .Y(reg_write_data[11]) );
  AO22X1 U15 ( .A0(n5), .A1(pipeline_reg_in[17]), .B0(n2), .B1(
        pipeline_reg_in[33]), .Y(reg_write_data[12]) );
  AO22X1 U16 ( .A0(pipeline_reg_in[0]), .A1(pipeline_reg_in[18]), .B0(n2), 
        .B1(pipeline_reg_in[34]), .Y(reg_write_data[13]) );
  AO22X1 U17 ( .A0(n4), .A1(pipeline_reg_in[19]), .B0(n2), .B1(
        pipeline_reg_in[35]), .Y(reg_write_data[14]) );
  AO22X1 U18 ( .A0(n5), .A1(pipeline_reg_in[20]), .B0(n2), .B1(
        pipeline_reg_in[36]), .Y(reg_write_data[15]) );
  AO22X1 U19 ( .A0(pipeline_reg_in[0]), .A1(pipeline_reg_in[6]), .B0(n2), .B1(
        pipeline_reg_in[22]), .Y(reg_write_data[1]) );
  AO22X1 U20 ( .A0(n4), .A1(pipeline_reg_in[7]), .B0(n3), .B1(
        pipeline_reg_in[23]), .Y(reg_write_data[2]) );
  AO22X1 U21 ( .A0(n5), .A1(pipeline_reg_in[8]), .B0(n3), .B1(
        pipeline_reg_in[24]), .Y(reg_write_data[3]) );
  AO22X1 U22 ( .A0(pipeline_reg_in[0]), .A1(pipeline_reg_in[9]), .B0(n3), .B1(
        pipeline_reg_in[25]), .Y(reg_write_data[4]) );
  AO22X1 U23 ( .A0(n4), .A1(pipeline_reg_in[10]), .B0(n3), .B1(
        pipeline_reg_in[26]), .Y(reg_write_data[5]) );
  AO22X1 U24 ( .A0(n5), .A1(pipeline_reg_in[11]), .B0(n3), .B1(
        pipeline_reg_in[27]), .Y(reg_write_data[6]) );
  AO22X1 U25 ( .A0(pipeline_reg_in[0]), .A1(pipeline_reg_in[12]), .B0(n3), 
        .B1(pipeline_reg_in[28]), .Y(reg_write_data[7]) );
  AO22X1 U26 ( .A0(n4), .A1(pipeline_reg_in[13]), .B0(n3), .B1(
        pipeline_reg_in[29]), .Y(reg_write_data[8]) );
  AO22X1 U27 ( .A0(n5), .A1(pipeline_reg_in[14]), .B0(n3), .B1(
        pipeline_reg_in[30]), .Y(reg_write_data[9]) );
endmodule


module hazard_detection_unit ( decoding_op_src1, decoding_op_src2, ex_op_dest, 
        mem_op_dest, wb_op_dest, pipeline_stall_n );
  input [2:0] decoding_op_src1;
  input [2:0] decoding_op_src2;
  input [2:0] ex_op_dest;
  input [2:0] mem_op_dest;
  input [2:0] wb_op_dest;
  output pipeline_stall_n;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31;

  OAI22XL U2 ( .A0(ex_op_dest[2]), .A1(decoding_op_src2[2]), .B0(n15), .B1(n20), .Y(n26) );
  OA22X2 U4 ( .A0(n31), .A1(n30), .B0(n29), .B1(n28), .Y(pipeline_stall_n) );
  AOI221XL U5 ( .A0(n2), .A1(ex_op_dest[0]), .B0(ex_op_dest[1]), .B1(n8), .C0(
        n1), .Y(n11) );
  NOR3X1 U6 ( .A(decoding_op_src2[1]), .B(decoding_op_src2[0]), .C(
        decoding_op_src2[2]), .Y(n28) );
  INVX3 U7 ( .A(decoding_op_src2[1]), .Y(n23) );
  OAI22XL U8 ( .A0(decoding_op_src1[2]), .A1(ex_op_dest[2]), .B0(n5), .B1(n15), 
        .Y(n12) );
  OAI222XL U9 ( .A0(decoding_op_src1[2]), .A1(n19), .B0(n5), .B1(wb_op_dest[2]), .C0(wb_op_dest[1]), .C1(n8), .Y(n6) );
  CLKINVX1 U10 ( .A(decoding_op_src1[1]), .Y(n8) );
  OAI22XL U11 ( .A0(n2), .A1(ex_op_dest[0]), .B0(n8), .B1(ex_op_dest[1]), .Y(
        n1) );
  INVX3 U12 ( .A(decoding_op_src2[2]), .Y(n20) );
  OAI222X1 U13 ( .A0(wb_op_dest[2]), .A1(n20), .B0(n19), .B1(
        decoding_op_src2[2]), .C0(wb_op_dest[1]), .C1(n23), .Y(n21) );
  OAI222X1 U14 ( .A0(mem_op_dest[2]), .A1(n20), .B0(n16), .B1(
        decoding_op_src2[2]), .C0(mem_op_dest[1]), .C1(n23), .Y(n17) );
  OAI22X1 U15 ( .A0(ex_op_dest[0]), .A1(n14), .B0(n23), .B1(ex_op_dest[1]), 
        .Y(n13) );
  AOI211X1 U16 ( .A0(n27), .A1(n26), .B0(n25), .C0(n24), .Y(n29) );
  AOI211X1 U17 ( .A0(wb_op_dest[1]), .A1(n23), .B0(n22), .C0(n21), .Y(n24) );
  AOI211X1 U18 ( .A0(mem_op_dest[1]), .A1(n23), .B0(n18), .C0(n17), .Y(n25) );
  AOI221X1 U19 ( .A0(n14), .A1(ex_op_dest[0]), .B0(n23), .B1(ex_op_dest[1]), 
        .C0(n13), .Y(n27) );
  CLKINVX1 U20 ( .A(decoding_op_src2[0]), .Y(n14) );
  AOI211X1 U21 ( .A0(n12), .A1(n11), .B0(n10), .C0(n9), .Y(n31) );
  AOI211X1 U22 ( .A0(wb_op_dest[1]), .A1(n8), .B0(n7), .C0(n6), .Y(n9) );
  CLKINVX1 U23 ( .A(wb_op_dest[2]), .Y(n19) );
  AOI211X1 U24 ( .A0(mem_op_dest[1]), .A1(n8), .B0(n4), .C0(n3), .Y(n10) );
  CLKINVX1 U25 ( .A(mem_op_dest[2]), .Y(n16) );
  CLKINVX1 U26 ( .A(decoding_op_src1[0]), .Y(n2) );
  CLKINVX1 U27 ( .A(ex_op_dest[2]), .Y(n15) );
  CLKINVX1 U28 ( .A(decoding_op_src1[2]), .Y(n5) );
  AOI2BB2X1 U29 ( .B0(decoding_op_src1[0]), .B1(mem_op_dest[0]), .A0N(
        decoding_op_src1[0]), .A1N(mem_op_dest[0]), .Y(n4) );
  OAI222XL U30 ( .A0(mem_op_dest[2]), .A1(n5), .B0(n16), .B1(
        decoding_op_src1[2]), .C0(mem_op_dest[1]), .C1(n8), .Y(n3) );
  AOI2BB2X1 U31 ( .B0(decoding_op_src1[0]), .B1(wb_op_dest[0]), .A0N(
        decoding_op_src1[0]), .A1N(wb_op_dest[0]), .Y(n7) );
  AOI2BB2X1 U32 ( .B0(mem_op_dest[0]), .B1(decoding_op_src2[0]), .A0N(
        mem_op_dest[0]), .A1N(decoding_op_src2[0]), .Y(n18) );
  AOI2BB2X1 U33 ( .B0(wb_op_dest[0]), .B1(decoding_op_src2[0]), .A0N(
        wb_op_dest[0]), .A1N(decoding_op_src2[0]), .Y(n22) );
  NOR3XL U1 ( .A(decoding_op_src1[0]), .B(decoding_op_src1[2]), .C(
        decoding_op_src1[1]), .Y(n30) );
endmodule


module ID_stage_test_1 ( clk, rst, instruction_decode_en, pipeline_reg_out, 
        instruction, branch_offset_imm, branch_taken, reg_read_addr_1, 
        reg_read_addr_2, reg_read_data_1, reg_read_data_2, decoding_op_src1, 
        decoding_op_src2, test_si2, test_si1, test_so2, test_so1, test_se );
  output [56:0] pipeline_reg_out;
  input [15:0] instruction;
  output [5:0] branch_offset_imm;
  output [2:0] reg_read_addr_1;
  output [2:0] reg_read_addr_2;
  input [15:0] reg_read_data_1;
  input [15:0] reg_read_data_2;
  output [2:0] decoding_op_src1;
  output [2:0] decoding_op_src2;
  input clk, rst, instruction_decode_en, test_si2, test_si1, test_se;
  output branch_taken, test_so2, test_so1;
  wire   write_back_en, write_back_result_mux, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n24, n26, n27,
         n29, n30, n51, n1, n21, n22, n23, n25, n28, n31, n32, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n34, n35, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148;
  wire   [15:9] instruction_reg;
  wire   [2:0] ir_dest_with_bubble;
  wire   [2:0] ex_alu_cmd;
  wire   [15:0] ex_alu_src2;

  CLKINVX1 U3 ( .A(n77), .Y(n1) );
  NAND2X1 U4 ( .A(branch_offset_imm[5]), .B(n75), .Y(n76) );
  CLKINVX1 U5 ( .A(n1), .Y(n21) );
  OAI21XL U6 ( .A0(n73), .A1(n72), .B0(n71), .Y(n74) );
  AOI2BB2XL U7 ( .B0(n46), .B1(n26), .A0N(n48), .A1N(instruction[14]), .Y(n19)
         );
  AOI31X1 U8 ( .A0(n82), .A1(n30), .A2(n74), .B0(write_back_result_mux), .Y(
        n77) );
  INVXL U9 ( .A(n82), .Y(n80) );
  CLKBUFX3 U10 ( .A(n76), .Y(n23) );
  INVX3 U11 ( .A(n21), .Y(n75) );
  INVX3 U12 ( .A(n1), .Y(n22) );
  OAI2BB1XL U13 ( .A0N(n66), .A1N(n84), .B0(n71), .Y(n67) );
  NAND2X1 U14 ( .A(n73), .B(n78), .Y(n71) );
  NAND2XL U15 ( .A(n78), .B(n79), .Y(n81) );
  AOI2BB2XL U16 ( .B0(n46), .B1(n29), .A0N(n48), .A1N(instruction[12]), .Y(n17) );
  CLKBUFX2 U17 ( .A(decoding_op_src1[0]), .Y(reg_read_addr_1[0]) );
  CLKBUFX2 U18 ( .A(decoding_op_src1[1]), .Y(reg_read_addr_1[1]) );
  CLKBUFX2 U19 ( .A(decoding_op_src1[2]), .Y(reg_read_addr_1[2]) );
  NOR4X1 U20 ( .A(reg_read_data_1[8]), .B(reg_read_data_1[3]), .C(n31), .D(n25), .Y(n52) );
  INVX3 U22 ( .A(n50), .Y(n48) );
  NOR2X2 U23 ( .A(n84), .B(n66), .Y(n78) );
  NOR2X1 U24 ( .A(n82), .B(rst), .Y(n68) );
  NOR2X2 U25 ( .A(n24), .B(n47), .Y(n82) );
  INVX6 U26 ( .A(instruction_decode_en), .Y(n47) );
  NOR2X2 U28 ( .A(n29), .B(n47), .Y(n84) );
  NOR2BX1 U29 ( .AN(instruction_reg[9]), .B(n47), .Y(ir_dest_with_bubble[0])
         );
  CLKBUFX3 U30 ( .A(instruction_decode_en), .Y(n50) );
  INVX3 U31 ( .A(instruction_decode_en), .Y(n46) );
  AO22X1 U32 ( .A0(n63), .A1(instruction_reg[11]), .B0(n51), .B1(
        branch_offset_imm[5]), .Y(reg_read_addr_2[2]) );
  NOR2BX2 U33 ( .AN(reg_read_addr_2[1]), .B(n64), .Y(decoding_op_src2[1]) );
  AO22X1 U34 ( .A0(n63), .A1(instruction_reg[10]), .B0(n51), .B1(
        branch_offset_imm[4]), .Y(reg_read_addr_2[1]) );
  AO22X1 U35 ( .A0(n63), .A1(instruction_reg[9]), .B0(n51), .B1(
        branch_offset_imm[3]), .Y(reg_read_addr_2[0]) );
  CLKINVX1 U36 ( .A(n50), .Y(n49) );
  NAND3XL U37 ( .A(n52), .B(n28), .C(n32), .Y(n58) );
  CLKINVX1 U38 ( .A(n84), .Y(n72) );
  NOR3X4 U39 ( .A(ir_dest_with_bubble[0]), .B(n58), .C(n57), .Y(branch_taken)
         );
  CLKINVX1 U40 ( .A(rst), .Y(n30) );
  CLKBUFX3 U41 ( .A(n44), .Y(n40) );
  CLKBUFX3 U42 ( .A(n43), .Y(n38) );
  CLKBUFX3 U43 ( .A(n45), .Y(n39) );
  CLKBUFX3 U44 ( .A(n44), .Y(n41) );
  CLKBUFX3 U45 ( .A(n43), .Y(n44) );
  CLKBUFX3 U46 ( .A(n45), .Y(n36) );
  CLKBUFX3 U47 ( .A(n45), .Y(n37) );
  CLKBUFX3 U48 ( .A(n43), .Y(n45) );
  CLKBUFX3 U49 ( .A(n30), .Y(n43) );
  OAI2BB1X1 U50 ( .A0N(n68), .A1N(n67), .B0(n69), .Y(ex_alu_cmd[1]) );
  CLKBUFX3 U51 ( .A(n30), .Y(n42) );
  NOR4X1 U52 ( .A(ir_dest_with_bubble[2]), .B(ir_dest_with_bubble[1]), .C(
        reg_read_data_1[12]), .D(reg_read_data_1[14]), .Y(n55) );
  INVX3 U53 ( .A(n51), .Y(n63) );
  NAND2X1 U54 ( .A(n69), .B(n65), .Y(ex_alu_cmd[0]) );
  NAND4X1 U55 ( .A(n82), .B(n78), .C(n79), .D(n42), .Y(n69) );
  CLKINVX1 U56 ( .A(n68), .Y(n70) );
  CLKINVX1 U57 ( .A(n73), .Y(n79) );
  NAND4X1 U58 ( .A(n56), .B(n55), .C(n54), .D(n53), .Y(n57) );
  NOR4X1 U59 ( .A(reg_read_data_1[1]), .B(reg_read_data_1[10]), .C(
        reg_read_data_1[9]), .D(reg_read_data_1[7]), .Y(n53) );
  NOR4X1 U60 ( .A(reg_read_data_1[5]), .B(reg_read_data_1[4]), .C(
        reg_read_data_1[2]), .D(reg_read_data_1[6]), .Y(n54) );
  NOR2BX1 U61 ( .AN(instruction_reg[10]), .B(n47), .Y(ir_dest_with_bubble[1])
         );
  NOR2BX1 U62 ( .AN(instruction_reg[11]), .B(n47), .Y(ir_dest_with_bubble[2])
         );
  NOR4X1 U63 ( .A(reg_read_data_1[15]), .B(reg_read_data_1[11]), .C(
        reg_read_data_1[0]), .D(reg_read_data_1[13]), .Y(n56) );
  NOR2BX4 U64 ( .AN(reg_read_addr_2[2]), .B(n64), .Y(decoding_op_src2[2]) );
  NOR2BX4 U65 ( .AN(reg_read_addr_2[0]), .B(n64), .Y(decoding_op_src2[0]) );
  AOI211X4 U66 ( .A0(n31), .A1(n62), .B0(n61), .C0(n60), .Y(n64) );
  NOR2X1 U67 ( .A(n31), .B(n62), .Y(n60) );
  NOR2X1 U68 ( .A(n24), .B(n28), .Y(n59) );
  OAI211XL U71 ( .A0(n73), .A1(n66), .B0(n68), .C0(n72), .Y(n65) );
  AOI211XL U72 ( .A0(n85), .A1(n84), .B0(rst), .C0(n83), .Y(write_back_en) );
  NOR3BX1 U73 ( .AN(n85), .B(n84), .C(rst), .Y(write_back_result_mux) );
  NOR2X1 U74 ( .A(n27), .B(n47), .Y(n66) );
  OAI31XL U75 ( .A0(n78), .A1(n79), .A2(n70), .B0(n69), .Y(ex_alu_cmd[2]) );
  NOR4X1 U76 ( .A(n28), .B(n46), .C(n24), .D(n27), .Y(n85) );
  AO22X1 U77 ( .A0(n21), .A1(reg_read_data_2[0]), .B0(n75), .B1(
        branch_offset_imm[0]), .Y(ex_alu_src2[0]) );
  OAI2BB1X1 U78 ( .A0N(n22), .A1N(reg_read_data_2[10]), .B0(n76), .Y(
        ex_alu_src2[10]) );
  OAI2BB1X1 U79 ( .A0N(n22), .A1N(reg_read_data_2[11]), .B0(n76), .Y(
        ex_alu_src2[11]) );
  OAI2BB1X1 U80 ( .A0N(n22), .A1N(reg_read_data_2[12]), .B0(n76), .Y(
        ex_alu_src2[12]) );
  OAI2BB1X1 U81 ( .A0N(n21), .A1N(reg_read_data_2[13]), .B0(n23), .Y(
        ex_alu_src2[13]) );
  OAI2BB1X1 U82 ( .A0N(n21), .A1N(reg_read_data_2[14]), .B0(n23), .Y(
        ex_alu_src2[14]) );
  OAI2BB1X1 U83 ( .A0N(n22), .A1N(reg_read_data_2[15]), .B0(n23), .Y(
        ex_alu_src2[15]) );
  AO22X1 U85 ( .A0(n21), .A1(reg_read_data_2[2]), .B0(n75), .B1(
        branch_offset_imm[2]), .Y(ex_alu_src2[2]) );
  AO22X1 U86 ( .A0(n21), .A1(reg_read_data_2[3]), .B0(n75), .B1(
        branch_offset_imm[3]), .Y(ex_alu_src2[3]) );
  OAI2BB1X1 U88 ( .A0N(n21), .A1N(reg_read_data_2[5]), .B0(n23), .Y(
        ex_alu_src2[5]) );
  OAI2BB1X1 U89 ( .A0N(n22), .A1N(reg_read_data_2[6]), .B0(n23), .Y(
        ex_alu_src2[6]) );
  OAI2BB1X1 U90 ( .A0N(n77), .A1N(reg_read_data_2[7]), .B0(n23), .Y(
        ex_alu_src2[7]) );
  OAI2BB1X1 U91 ( .A0N(n22), .A1N(reg_read_data_2[8]), .B0(n23), .Y(
        ex_alu_src2[8]) );
  OAI2BB1X1 U92 ( .A0N(n77), .A1N(reg_read_data_2[9]), .B0(n23), .Y(
        ex_alu_src2[9]) );
  OAI22XL U93 ( .A0(n82), .A1(n81), .B0(n80), .B1(n79), .Y(n83) );
  AO22X1 U94 ( .A0(n50), .A1(instruction[0]), .B0(n49), .B1(
        branch_offset_imm[0]), .Y(n5) );
  AO22X1 U95 ( .A0(n50), .A1(instruction[1]), .B0(n49), .B1(
        branch_offset_imm[1]), .Y(n6) );
  AO22X1 U96 ( .A0(n50), .A1(instruction[2]), .B0(n49), .B1(
        branch_offset_imm[2]), .Y(n7) );
  AO22X1 U97 ( .A0(instruction_decode_en), .A1(instruction[3]), .B0(n49), .B1(
        branch_offset_imm[3]), .Y(n8) );
  AO22X1 U98 ( .A0(instruction_decode_en), .A1(instruction[4]), .B0(n49), .B1(
        branch_offset_imm[4]), .Y(n9) );
  AO22X1 U99 ( .A0(n50), .A1(instruction[5]), .B0(n49), .B1(
        branch_offset_imm[5]), .Y(n10) );
  AOI2BB2X1 U100 ( .B0(n46), .B1(n4), .A0N(n48), .A1N(instruction[6]), .Y(n11)
         );
  AOI2BB2X1 U101 ( .B0(n46), .B1(n3), .A0N(n48), .A1N(instruction[7]), .Y(n12)
         );
  AOI2BB2X1 U102 ( .B0(n46), .B1(n2), .A0N(n48), .A1N(instruction[8]), .Y(n13)
         );
  OA22X1 U103 ( .A0(instruction_decode_en), .A1(instruction_reg[9]), .B0(n48), 
        .B1(instruction[9]), .Y(n14) );
  OA22X1 U104 ( .A0(n50), .A1(instruction_reg[10]), .B0(n47), .B1(
        instruction[10]), .Y(n15) );
  OA22X1 U105 ( .A0(n50), .A1(instruction_reg[11]), .B0(n48), .B1(
        instruction[11]), .Y(n16) );
  AOI2BB2X1 U106 ( .B0(n46), .B1(n27), .A0N(n48), .A1N(instruction[13]), .Y(
        n18) );
  AOI2BB2X1 U107 ( .B0(n46), .B1(n24), .A0N(n49), .A1N(instruction[15]), .Y(
        n20) );
  SDFFRXL \pipeline_reg_out_reg[20]  ( .D(reg_read_data_2[15]), .SI(n120), 
        .SE(test_se), .CK(clk), .RN(n45), .Q(pipeline_reg_out[20]), .QN(n119)
         );
  SDFFRXL \pipeline_reg_out_reg[19]  ( .D(reg_read_data_2[14]), .SI(n121), 
        .SE(test_se), .CK(clk), .RN(n43), .Q(pipeline_reg_out[19]), .QN(n120)
         );
  SDFFRXL \pipeline_reg_out_reg[18]  ( .D(reg_read_data_2[13]), .SI(n122), 
        .SE(test_se), .CK(clk), .RN(n43), .Q(pipeline_reg_out[18]), .QN(n121)
         );
  SDFFRXL \pipeline_reg_out_reg[17]  ( .D(reg_read_data_2[12]), .SI(n123), 
        .SE(test_se), .CK(clk), .RN(n43), .Q(pipeline_reg_out[17]), .QN(n122)
         );
  SDFFRXL \pipeline_reg_out_reg[16]  ( .D(reg_read_data_2[11]), .SI(n124), 
        .SE(test_se), .CK(clk), .RN(n43), .Q(pipeline_reg_out[16]), .QN(n123)
         );
  SDFFRXL \pipeline_reg_out_reg[15]  ( .D(reg_read_data_2[10]), .SI(n125), 
        .SE(test_se), .CK(clk), .RN(n44), .Q(pipeline_reg_out[15]), .QN(n124)
         );
  SDFFRXL \pipeline_reg_out_reg[14]  ( .D(reg_read_data_2[9]), .SI(n126), .SE(
        test_se), .CK(clk), .RN(n45), .Q(pipeline_reg_out[14]), .QN(n125) );
  SDFFRXL \pipeline_reg_out_reg[13]  ( .D(reg_read_data_2[8]), .SI(n127), .SE(
        test_se), .CK(clk), .RN(n44), .Q(pipeline_reg_out[13]), .QN(n126) );
  SDFFRXL \pipeline_reg_out_reg[12]  ( .D(reg_read_data_2[7]), .SI(n128), .SE(
        test_se), .CK(clk), .RN(n44), .Q(pipeline_reg_out[12]), .QN(n127) );
  SDFFRXL \pipeline_reg_out_reg[11]  ( .D(reg_read_data_2[6]), .SI(n129), .SE(
        test_se), .CK(clk), .RN(n45), .Q(pipeline_reg_out[11]), .QN(n128) );
  SDFFRXL \pipeline_reg_out_reg[10]  ( .D(reg_read_data_2[5]), .SI(n130), .SE(
        test_se), .CK(clk), .RN(n44), .Q(pipeline_reg_out[10]), .QN(n129) );
  SDFFRXL \pipeline_reg_out_reg[9]  ( .D(reg_read_data_2[4]), .SI(n131), .SE(
        test_se), .CK(clk), .RN(n44), .Q(pipeline_reg_out[9]), .QN(n130) );
  SDFFRXL \pipeline_reg_out_reg[8]  ( .D(reg_read_data_2[3]), .SI(n132), .SE(
        test_se), .CK(clk), .RN(n45), .Q(pipeline_reg_out[8]), .QN(n131) );
  SDFFRXL \pipeline_reg_out_reg[7]  ( .D(reg_read_data_2[2]), .SI(n133), .SE(
        test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[7]), .QN(n132) );
  SDFFRXL \pipeline_reg_out_reg[6]  ( .D(reg_read_data_2[1]), .SI(n134), .SE(
        test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[6]), .QN(n133) );
  SDFFRXL \pipeline_reg_out_reg[5]  ( .D(reg_read_data_2[0]), .SI(n135), .SE(
        test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[5]), .QN(n134) );
  SDFFRXL \pipeline_reg_out_reg[4]  ( .D(write_back_en), .SI(n136), .SE(
        test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[4]), .QN(n135) );
  SDFFRXL \pipeline_reg_out_reg[0]  ( .D(write_back_result_mux), .SI(n24), 
        .SE(test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[0]), .QN(n139)
         );
  SDFFSXL \pipeline_reg_out_reg[21]  ( .D(n51), .SI(n119), .SE(test_se), .CK(
        clk), .SN(n30), .Q(n118), .QN(pipeline_reg_out[21]) );
  SDFFRXL \instruction_reg_reg[0]  ( .D(n5), .SI(test_si1), .SE(test_se), .CK(
        clk), .RN(n37), .Q(branch_offset_imm[0]), .QN(n148) );
  SDFFRXL \pipeline_reg_out_reg[50]  ( .D(reg_read_data_1[12]), .SI(n90), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[50]), .QN(n89) );
  SDFFRXL \pipeline_reg_out_reg[3]  ( .D(ir_dest_with_bubble[2]), .SI(n137), 
        .SE(test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[3]), .QN(n136)
         );
  SDFFRXL \pipeline_reg_out_reg[2]  ( .D(ir_dest_with_bubble[1]), .SI(n138), 
        .SE(test_se), .CK(clk), .RN(n42), .Q(pipeline_reg_out[2]), .QN(n137)
         );
  SDFFRXL \pipeline_reg_out_reg[1]  ( .D(ir_dest_with_bubble[0]), .SI(n139), 
        .SE(test_se), .CK(clk), .RN(n30), .Q(pipeline_reg_out[1]), .QN(n138)
         );
  SDFFRXL \pipeline_reg_out_reg[40]  ( .D(reg_read_data_1[2]), .SI(n100), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[40]), .QN(n99) );
  SDFFRX2 \pipeline_reg_out_reg[55]  ( .D(ex_alu_cmd[1]), .SI(n35), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[55]), .QN(n34) );
  SDFFRX4 \pipeline_reg_out_reg[22]  ( .D(ex_alu_src2[0]), .SI(n118), .SE(
        test_se), .CK(clk), .RN(n43), .Q(pipeline_reg_out[22]), .QN(n117) );
  SDFFRX4 \pipeline_reg_out_reg[56]  ( .D(ex_alu_cmd[2]), .SI(n34), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[56]), .QN(test_so2)
         );
  SDFFRX2 \instruction_reg_reg[15]  ( .D(n20), .SI(n28), .SE(test_se), .CK(clk), .RN(n36), .Q(n32), .QN(n24) );
  SDFFRX2 \instruction_reg_reg[13]  ( .D(n18), .SI(n25), .SE(test_se), .CK(clk), .RN(n36), .Q(n31), .QN(n27) );
  SDFFRX2 \instruction_reg_reg[12]  ( .D(n17), .SI(n140), .SE(test_se), .CK(
        clk), .RN(n36), .Q(n25), .QN(n29) );
  SDFFRX4 \pipeline_reg_out_reg[54]  ( .D(ex_alu_cmd[0]), .SI(n86), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[54]), .QN(n35) );
  SDFFRX2 \instruction_reg_reg[8]  ( .D(n13), .SI(reg_read_addr_1[1]), .SE(
        test_se), .CK(clk), .RN(n36), .Q(decoding_op_src1[2]), .QN(n2) );
  SDFFRX2 \instruction_reg_reg[6]  ( .D(n11), .SI(n143), .SE(test_se), .CK(clk), .RN(n37), .Q(decoding_op_src1[0]), .QN(n4) );
  SDFFRX2 \instruction_reg_reg[14]  ( .D(n19), .SI(n27), .SE(test_se), .CK(clk), .RN(n36), .Q(n28), .QN(n26) );
  SDFFRX1 \pipeline_reg_out_reg[24]  ( .D(ex_alu_src2[2]), .SI(test_si2), .SE(
        test_se), .CK(clk), .RN(n44), .Q(pipeline_reg_out[24]), .QN(n115) );
  SDFFRX2 \pipeline_reg_out_reg[43]  ( .D(reg_read_data_1[5]), .SI(n97), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[43]), .QN(n96) );
  SDFFRX2 \pipeline_reg_out_reg[42]  ( .D(reg_read_data_1[4]), .SI(n98), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[42]), .QN(n97) );
  SDFFRX2 \pipeline_reg_out_reg[53]  ( .D(reg_read_data_1[15]), .SI(n87), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[53]), .QN(n86) );
  SDFFRX1 \pipeline_reg_out_reg[52]  ( .D(reg_read_data_1[14]), .SI(n88), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[52]), .QN(n87) );
  SDFFRX2 \pipeline_reg_out_reg[46]  ( .D(reg_read_data_1[8]), .SI(n94), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[46]), .QN(n93) );
  SDFFRX1 \pipeline_reg_out_reg[45]  ( .D(reg_read_data_1[7]), .SI(n95), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[45]), .QN(n94) );
  SDFFRX2 \pipeline_reg_out_reg[51]  ( .D(reg_read_data_1[13]), .SI(n89), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[51]), .QN(n88) );
  SDFFRX2 \pipeline_reg_out_reg[44]  ( .D(reg_read_data_1[6]), .SI(n96), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[44]), .QN(n95) );
  SDFFRX2 \pipeline_reg_out_reg[49]  ( .D(reg_read_data_1[11]), .SI(n91), .SE(
        test_se), .CK(clk), .RN(n38), .Q(pipeline_reg_out[49]), .QN(n90) );
  SDFFRX2 \pipeline_reg_out_reg[48]  ( .D(reg_read_data_1[10]), .SI(n92), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[48]), .QN(n91) );
  SDFFRX2 \pipeline_reg_out_reg[39]  ( .D(reg_read_data_1[1]), .SI(n101), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[39]), .QN(n100) );
  SDFFRX2 \pipeline_reg_out_reg[38]  ( .D(reg_read_data_1[0]), .SI(n102), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[38]), .QN(n101) );
  SDFFRX2 \pipeline_reg_out_reg[47]  ( .D(reg_read_data_1[9]), .SI(n93), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[47]), .QN(n92) );
  SDFFRX1 \pipeline_reg_out_reg[41]  ( .D(reg_read_data_1[3]), .SI(n99), .SE(
        test_se), .CK(clk), .RN(n39), .Q(pipeline_reg_out[41]), .QN(n98) );
  SDFFRX1 \pipeline_reg_out_reg[37]  ( .D(ex_alu_src2[15]), .SI(n103), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[37]), .QN(n102) );
  SDFFRX1 \pipeline_reg_out_reg[26]  ( .D(ex_alu_src2[4]), .SI(n114), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[26]), .QN(n113) );
  SDFFRX1 \pipeline_reg_out_reg[23]  ( .D(ex_alu_src2[1]), .SI(n117), .SE(
        test_se), .CK(clk), .RN(n45), .Q(pipeline_reg_out[23]), .QN(test_so1)
         );
  SDFFRX1 \pipeline_reg_out_reg[35]  ( .D(ex_alu_src2[13]), .SI(n105), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[35]), .QN(n104) );
  SDFFRX1 \pipeline_reg_out_reg[27]  ( .D(ex_alu_src2[5]), .SI(n113), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[27]), .QN(n112) );
  SDFFRX1 \pipeline_reg_out_reg[29]  ( .D(ex_alu_src2[7]), .SI(n111), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[29]), .QN(n110) );
  SDFFRX1 \pipeline_reg_out_reg[28]  ( .D(ex_alu_src2[6]), .SI(n112), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[28]), .QN(n111) );
  SDFFRX1 \pipeline_reg_out_reg[30]  ( .D(ex_alu_src2[8]), .SI(n110), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[30]), .QN(n109) );
  SDFFRX1 \pipeline_reg_out_reg[36]  ( .D(ex_alu_src2[14]), .SI(n104), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[36]), .QN(n103) );
  SDFFRX1 \pipeline_reg_out_reg[31]  ( .D(ex_alu_src2[9]), .SI(n109), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[31]), .QN(n108) );
  SDFFRX1 \pipeline_reg_out_reg[33]  ( .D(ex_alu_src2[11]), .SI(n107), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[33]), .QN(n106) );
  SDFFRX1 \pipeline_reg_out_reg[32]  ( .D(ex_alu_src2[10]), .SI(n108), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[32]), .QN(n107) );
  SDFFRX1 \pipeline_reg_out_reg[34]  ( .D(ex_alu_src2[12]), .SI(n106), .SE(
        test_se), .CK(clk), .RN(n40), .Q(pipeline_reg_out[34]), .QN(n105) );
  SDFFRX1 \instruction_reg_reg[5]  ( .D(n10), .SI(n144), .SE(test_se), .CK(clk), .RN(n37), .Q(branch_offset_imm[5]), .QN(n143) );
  SDFFRX1 \instruction_reg_reg[3]  ( .D(n8), .SI(n146), .SE(test_se), .CK(clk), 
        .RN(n37), .Q(branch_offset_imm[3]), .QN(n145) );
  SDFFRX1 \instruction_reg_reg[4]  ( .D(n9), .SI(n145), .SE(test_se), .CK(clk), 
        .RN(n37), .Q(branch_offset_imm[4]), .QN(n144) );
  SDFFRX1 \pipeline_reg_out_reg[25]  ( .D(ex_alu_src2[3]), .SI(n115), .SE(
        test_se), .CK(clk), .RN(n41), .Q(pipeline_reg_out[25]), .QN(n114) );
  SDFFRX1 \instruction_reg_reg[7]  ( .D(n12), .SI(reg_read_addr_1[0]), .SE(
        test_se), .CK(clk), .RN(n37), .Q(decoding_op_src1[1]), .QN(n3) );
  SDFFRX1 \instruction_reg_reg[2]  ( .D(n7), .SI(n147), .SE(test_se), .CK(clk), 
        .RN(n37), .Q(branch_offset_imm[2]), .QN(n146) );
  SDFFRX1 \instruction_reg_reg[1]  ( .D(n6), .SI(n148), .SE(test_se), .CK(clk), 
        .RN(n37), .Q(branch_offset_imm[1]), .QN(n147) );
  SDFFRX1 \instruction_reg_reg[11]  ( .D(n16), .SI(n141), .SE(test_se), .CK(
        clk), .RN(n36), .Q(instruction_reg[11]), .QN(n140) );
  SDFFRX1 \instruction_reg_reg[9]  ( .D(n14), .SI(reg_read_addr_1[2]), .SE(
        test_se), .CK(clk), .RN(n36), .Q(instruction_reg[9]), .QN(n142) );
  SDFFRX1 \instruction_reg_reg[10]  ( .D(n15), .SI(n142), .SE(test_se), .CK(
        clk), .RN(n36), .Q(instruction_reg[10]), .QN(n141) );
  NOR2X2 U1 ( .A(n26), .B(n47), .Y(n73) );
  AO22XL U2 ( .A0(n22), .A1(reg_read_data_2[1]), .B0(n75), .B1(
        branch_offset_imm[1]), .Y(ex_alu_src2[1]) );
  AO22XL U21 ( .A0(n22), .A1(reg_read_data_2[4]), .B0(n75), .B1(
        branch_offset_imm[4]), .Y(ex_alu_src2[4]) );
  NAND3X1 U27 ( .A(n26), .B(n29), .C(n32), .Y(n62) );
  NAND4X2 U69 ( .A(n26), .B(n25), .C(n32), .D(n31), .Y(n51) );
  OAI22XL U70 ( .A0(n26), .A1(n32), .B0(n29), .B1(n59), .Y(n61) );
endmodule


module IF_stage_test_1 ( clk, rst, instruction_fetch_en, branch_offset_imm, 
        branch_taken, pc, test_si, test_so, test_se );
  input [5:0] branch_offset_imm;
  output [7:0] pc;
  input clk, rst, instruction_fetch_en, branch_taken, test_si, test_se;
  output test_so;
  wire   n31, n32, n33, n34, n35, n36, n37, n38, N22, N23, N24, N25, N26, N27,
         N28, N29, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n18, \C1/Z_5 , \C1/Z_4 , \C1/Z_3 , \C1/Z_2 , \C1/Z_1 ,
         \C1/Z_0 , \DP_OP_10J1_127_1806/n8 , \DP_OP_10J1_127_1806/n7 ,
         \DP_OP_10J1_127_1806/n6 , \DP_OP_10J1_127_1806/n5 ,
         \DP_OP_10J1_127_1806/n4 , \DP_OP_10J1_127_1806/n3 ,
         \DP_OP_10J1_127_1806/n2 , \DP_OP_10J1_127_1806/n1 , n25, n26, n27,
         n28, n29, n30;
  assign test_so = n31;

  ADDFXL \DP_OP_10J1_127_1806/U8  ( .A(pc[1]), .B(\C1/Z_1 ), .CI(
        \DP_OP_10J1_127_1806/n8 ), .CO(\DP_OP_10J1_127_1806/n7 ), .S(N23) );
  ADDFX1 \DP_OP_10J1_127_1806/U4  ( .A(\C1/Z_5 ), .B(pc[5]), .CI(
        \DP_OP_10J1_127_1806/n4 ), .CO(\DP_OP_10J1_127_1806/n3 ), .S(N27) );
  ADDFX1 \DP_OP_10J1_127_1806/U7  ( .A(pc[2]), .B(\C1/Z_2 ), .CI(
        \DP_OP_10J1_127_1806/n7 ), .CO(\DP_OP_10J1_127_1806/n6 ), .S(N24) );
  ADDFX1 \DP_OP_10J1_127_1806/U6  ( .A(pc[3]), .B(\C1/Z_3 ), .CI(
        \DP_OP_10J1_127_1806/n6 ), .CO(\DP_OP_10J1_127_1806/n5 ), .S(N25) );
  ADDFX1 \DP_OP_10J1_127_1806/U5  ( .A(pc[4]), .B(\C1/Z_4 ), .CI(
        \DP_OP_10J1_127_1806/n5 ), .CO(\DP_OP_10J1_127_1806/n4 ), .S(N26) );
  ADDFX2 \DP_OP_10J1_127_1806/U3  ( .A(\C1/Z_5 ), .B(pc[6]), .CI(
        \DP_OP_10J1_127_1806/n3 ), .CO(\DP_OP_10J1_127_1806/n2 ), .S(N28) );
  OAI2BB2XL U3 ( .B0(n25), .B1(n5), .A0N(N26), .A1N(n26), .Y(n14) );
  OAI2BB2XL U4 ( .B0(n25), .B1(n7), .A0N(N24), .A1N(n26), .Y(n12) );
  OAI2BB2XL U5 ( .B0(n25), .B1(n3), .A0N(N28), .A1N(n26), .Y(n16) );
  OAI2BB2XL U6 ( .B0(n25), .B1(n4), .A0N(N27), .A1N(n26), .Y(n15) );
  OAI2BB2XL U7 ( .B0(n25), .B1(n9), .A0N(N22), .A1N(n26), .Y(n10) );
  XOR2X1 U8 ( .A(\C1/Z_5 ), .B(n31), .Y(\DP_OP_10J1_127_1806/n1 ) );
  INVX2 U9 ( .A(rst), .Y(n30) );
  BUFX16 U10 ( .A(n37), .Y(pc[1]) );
  INVX16 U11 ( .A(n2), .Y(pc[7]) );
  BUFX16 U12 ( .A(n35), .Y(pc[3]) );
  BUFX16 U13 ( .A(n34), .Y(pc[4]) );
  BUFX16 U14 ( .A(n36), .Y(pc[2]) );
  BUFX16 U15 ( .A(n32), .Y(pc[6]) );
  BUFX16 U16 ( .A(n33), .Y(pc[5]) );
  BUFX16 U17 ( .A(n38), .Y(pc[0]) );
  ADDHXL U18 ( .A(\C1/Z_0 ), .B(pc[0]), .CO(\DP_OP_10J1_127_1806/n8 ), .S(N22)
         );
  CLKXOR2X2 U19 ( .A(\DP_OP_10J1_127_1806/n2 ), .B(\DP_OP_10J1_127_1806/n1 ), 
        .Y(N29) );
  OAI21XL U20 ( .A0(n25), .A1(n6), .B0(n28), .Y(n13) );
  OAI21XL U21 ( .A0(n25), .A1(n8), .B0(n29), .Y(n11) );
  CLKBUFX3 U22 ( .A(instruction_fetch_en), .Y(n26) );
  CLKBUFX3 U23 ( .A(instruction_fetch_en), .Y(n25) );
  NAND2X1 U24 ( .A(N23), .B(n26), .Y(n29) );
  NAND2X1 U25 ( .A(N25), .B(n26), .Y(n28) );
  NAND2X1 U27 ( .A(N29), .B(n26), .Y(n27) );
  NAND2BX1 U28 ( .AN(branch_offset_imm[0]), .B(branch_taken), .Y(\C1/Z_0 ) );
  AND2X2 U29 ( .A(branch_taken), .B(branch_offset_imm[1]), .Y(\C1/Z_1 ) );
  AND2X2 U30 ( .A(branch_taken), .B(branch_offset_imm[2]), .Y(\C1/Z_2 ) );
  AND2X2 U31 ( .A(branch_taken), .B(branch_offset_imm[3]), .Y(\C1/Z_3 ) );
  AND2X2 U32 ( .A(branch_taken), .B(branch_offset_imm[4]), .Y(\C1/Z_4 ) );
  AND2X2 U33 ( .A(branch_taken), .B(branch_offset_imm[5]), .Y(\C1/Z_5 ) );
  SDFFRXL \pc_reg[0]  ( .D(n10), .SI(test_si), .SE(test_se), .CK(clk), .RN(n30), .Q(n38), .QN(n9) );
  SDFFRXL \pc_reg[5]  ( .D(n15), .SI(n5), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n33), .QN(n4) );
  SDFFRXL \pc_reg[6]  ( .D(n16), .SI(n4), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n32), .QN(n3) );
  SDFFRXL \pc_reg[2]  ( .D(n12), .SI(n8), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n36), .QN(n7) );
  SDFFRXL \pc_reg[4]  ( .D(n14), .SI(n6), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n34), .QN(n5) );
  SDFFRXL \pc_reg[3]  ( .D(n13), .SI(n7), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n35), .QN(n6) );
  SDFFRXL \pc_reg[1]  ( .D(n11), .SI(n9), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n37), .QN(n8) );
  SDFFRX1 \pc_reg[7]  ( .D(n18), .SI(n3), .SE(test_se), .CK(clk), .RN(n30), 
        .Q(n31), .QN(n2) );
  OAI21XL U1 ( .A0(n2), .A1(n25), .B0(n27), .Y(n18) );
endmodule


module MEM_stage_test_1 ( clk, rst, pipeline_reg_in, pipeline_reg_out, 
        mem_op_dest, mem_read_data, ex_alu_result, mem_write_data, 
        mem_write_en, test_si, test_se );
  input [37:0] pipeline_reg_in;
  output [36:0] pipeline_reg_out;
  output [2:0] mem_op_dest;
  input [15:0] mem_read_data;
  output [15:0] ex_alu_result;
  output [15:0] mem_write_data;
  input clk, rst, test_si, test_se;
  output mem_write_en;
  wire   pipeline_reg_in_4, pipeline_reg_in_0, n1, n2, n3, n4, n5, n6, n7, n8,
         n9;
  assign pipeline_reg_in_4 = pipeline_reg_in[4];
  assign pipeline_reg_in_0 = pipeline_reg_in[0];

  CLKINVX1 U3 ( .A(n1), .Y(n5) );
  CLKINVX1 U4 ( .A(n1), .Y(n4) );
  INVX3 U5 ( .A(n1), .Y(n2) );
  CLKINVX1 U6 ( .A(n1), .Y(n6) );
  CLKBUFX3 U7 ( .A(rst), .Y(n1) );
  INVX3 U8 ( .A(n1), .Y(n3) );
  CLKBUFX3 U9 ( .A(pipeline_reg_in[21]), .Y(mem_write_en) );
  CLKBUFX3 U10 ( .A(pipeline_reg_in[5]), .Y(mem_write_data[0]) );
  CLKBUFX3 U11 ( .A(pipeline_reg_in[6]), .Y(mem_write_data[1]) );
  CLKBUFX3 U12 ( .A(pipeline_reg_in[7]), .Y(mem_write_data[2]) );
  CLKBUFX3 U13 ( .A(pipeline_reg_in[8]), .Y(mem_write_data[3]) );
  CLKBUFX3 U14 ( .A(pipeline_reg_in[9]), .Y(mem_write_data[4]) );
  CLKBUFX3 U15 ( .A(pipeline_reg_in[10]), .Y(mem_write_data[5]) );
  CLKBUFX3 U16 ( .A(pipeline_reg_in[11]), .Y(mem_write_data[6]) );
  CLKBUFX3 U17 ( .A(pipeline_reg_in[12]), .Y(mem_write_data[7]) );
  CLKBUFX3 U18 ( .A(pipeline_reg_in[13]), .Y(mem_write_data[8]) );
  CLKBUFX3 U19 ( .A(pipeline_reg_in[14]), .Y(mem_write_data[9]) );
  CLKBUFX3 U20 ( .A(pipeline_reg_in[15]), .Y(mem_write_data[10]) );
  CLKBUFX3 U21 ( .A(pipeline_reg_in[16]), .Y(mem_write_data[11]) );
  CLKBUFX3 U22 ( .A(pipeline_reg_in[17]), .Y(mem_write_data[12]) );
  CLKBUFX3 U23 ( .A(pipeline_reg_in[18]), .Y(mem_write_data[13]) );
  CLKBUFX3 U24 ( .A(pipeline_reg_in[19]), .Y(mem_write_data[14]) );
  CLKBUFX3 U25 ( .A(pipeline_reg_in[20]), .Y(mem_write_data[15]) );
  CLKBUFX3 U26 ( .A(pipeline_reg_in[22]), .Y(ex_alu_result[0]) );
  CLKBUFX3 U27 ( .A(pipeline_reg_in[23]), .Y(ex_alu_result[1]) );
  CLKBUFX3 U28 ( .A(pipeline_reg_in[24]), .Y(ex_alu_result[2]) );
  CLKBUFX3 U29 ( .A(pipeline_reg_in[25]), .Y(ex_alu_result[3]) );
  CLKBUFX3 U30 ( .A(pipeline_reg_in[26]), .Y(ex_alu_result[4]) );
  CLKBUFX3 U31 ( .A(pipeline_reg_in[27]), .Y(ex_alu_result[5]) );
  CLKBUFX3 U32 ( .A(pipeline_reg_in[28]), .Y(ex_alu_result[6]) );
  CLKBUFX3 U33 ( .A(pipeline_reg_in[29]), .Y(ex_alu_result[7]) );
  CLKBUFX3 U34 ( .A(pipeline_reg_in[30]), .Y(ex_alu_result[8]) );
  CLKBUFX3 U35 ( .A(pipeline_reg_in[31]), .Y(ex_alu_result[9]) );
  CLKBUFX3 U36 ( .A(pipeline_reg_in[32]), .Y(ex_alu_result[10]) );
  CLKBUFX3 U37 ( .A(pipeline_reg_in[33]), .Y(ex_alu_result[11]) );
  CLKBUFX3 U38 ( .A(pipeline_reg_in[34]), .Y(ex_alu_result[12]) );
  CLKBUFX3 U39 ( .A(pipeline_reg_in[35]), .Y(ex_alu_result[13]) );
  CLKBUFX3 U40 ( .A(pipeline_reg_in[36]), .Y(ex_alu_result[14]) );
  CLKBUFX3 U41 ( .A(pipeline_reg_in[37]), .Y(ex_alu_result[15]) );
  CLKBUFX3 U42 ( .A(pipeline_reg_in[2]), .Y(mem_op_dest[1]) );
  CLKBUFX3 U43 ( .A(pipeline_reg_in[3]), .Y(mem_op_dest[2]) );
  CLKBUFX3 U44 ( .A(pipeline_reg_in[1]), .Y(mem_op_dest[0]) );
  SDFFTRXL \pipeline_reg_out_reg[7]  ( .RN(n6), .D(mem_read_data[2]), .SI(
        pipeline_reg_out[6]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[7])
         );
  SDFFTRXL \pipeline_reg_out_reg[6]  ( .RN(n4), .D(mem_read_data[1]), .SI(
        pipeline_reg_out[5]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[6])
         );
  SDFFTRXL \pipeline_reg_out_reg[5]  ( .RN(n5), .D(mem_read_data[0]), .SI(
        pipeline_reg_out[4]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[5])
         );
  SDFFTRXL \pipeline_reg_out_reg[4]  ( .RN(n6), .D(pipeline_reg_in_4), .SI(n7), 
        .SE(test_se), .CK(clk), .Q(pipeline_reg_out[4]) );
  SDFFTRXL \pipeline_reg_out_reg[3]  ( .RN(n4), .D(pipeline_reg_in[3]), .SI(n8), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[3]), .QN(n7) );
  SDFFTRXL \pipeline_reg_out_reg[2]  ( .RN(n4), .D(pipeline_reg_in[2]), .SI(n9), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[2]), .QN(n8) );
  SDFFTRXL \pipeline_reg_out_reg[1]  ( .RN(n6), .D(pipeline_reg_in[1]), .SI(
        pipeline_reg_out[0]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[1]), 
        .QN(n9) );
  SDFFTRXL \pipeline_reg_out_reg[0]  ( .RN(n5), .D(pipeline_reg_in_0), .SI(
        test_si), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[0]) );
  SDFFTRXL \pipeline_reg_out_reg[32]  ( .RN(n2), .D(pipeline_reg_in[33]), .SI(
        pipeline_reg_out[31]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[32]) );
  SDFFTRXL \pipeline_reg_out_reg[31]  ( .RN(n6), .D(pipeline_reg_in[32]), .SI(
        pipeline_reg_out[30]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[31]) );
  SDFFTRXL \pipeline_reg_out_reg[30]  ( .RN(n5), .D(pipeline_reg_in[31]), .SI(
        pipeline_reg_out[29]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[30]) );
  SDFFTRXL \pipeline_reg_out_reg[29]  ( .RN(n5), .D(pipeline_reg_in[30]), .SI(
        pipeline_reg_out[28]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[29]) );
  SDFFTRXL \pipeline_reg_out_reg[28]  ( .RN(n6), .D(pipeline_reg_in[29]), .SI(
        pipeline_reg_out[27]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[28]) );
  SDFFTRXL \pipeline_reg_out_reg[36]  ( .RN(n2), .D(pipeline_reg_in[37]), .SI(
        pipeline_reg_out[35]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[36]) );
  SDFFTRXL \pipeline_reg_out_reg[35]  ( .RN(n3), .D(pipeline_reg_in[36]), .SI(
        pipeline_reg_out[34]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[35]) );
  SDFFTRXL \pipeline_reg_out_reg[34]  ( .RN(n4), .D(pipeline_reg_in[35]), .SI(
        pipeline_reg_out[33]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[34]) );
  SDFFTRXL \pipeline_reg_out_reg[33]  ( .RN(n4), .D(pipeline_reg_in[34]), .SI(
        pipeline_reg_out[32]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[33]) );
  SDFFTRXL \pipeline_reg_out_reg[27]  ( .RN(n2), .D(pipeline_reg_in[28]), .SI(
        pipeline_reg_out[26]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[27]) );
  SDFFTRXL \pipeline_reg_out_reg[26]  ( .RN(n6), .D(pipeline_reg_in[27]), .SI(
        pipeline_reg_out[25]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[26]) );
  SDFFTRXL \pipeline_reg_out_reg[25]  ( .RN(n3), .D(pipeline_reg_in[26]), .SI(
        pipeline_reg_out[24]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[25]) );
  SDFFTRXL \pipeline_reg_out_reg[24]  ( .RN(n2), .D(pipeline_reg_in[25]), .SI(
        pipeline_reg_out[23]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[24]) );
  SDFFTRXL \pipeline_reg_out_reg[23]  ( .RN(n5), .D(pipeline_reg_in[24]), .SI(
        pipeline_reg_out[22]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[23]) );
  SDFFTRXL \pipeline_reg_out_reg[22]  ( .RN(n5), .D(pipeline_reg_in[23]), .SI(
        pipeline_reg_out[21]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[22]) );
  SDFFTRXL \pipeline_reg_out_reg[21]  ( .RN(n3), .D(pipeline_reg_in[22]), .SI(
        pipeline_reg_out[20]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[21]) );
  SDFFTRXL \pipeline_reg_out_reg[20]  ( .RN(n6), .D(mem_read_data[15]), .SI(
        pipeline_reg_out[19]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[20]) );
  SDFFTRXL \pipeline_reg_out_reg[19]  ( .RN(n4), .D(mem_read_data[14]), .SI(
        pipeline_reg_out[18]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[19]) );
  SDFFTRXL \pipeline_reg_out_reg[18]  ( .RN(n3), .D(mem_read_data[13]), .SI(
        pipeline_reg_out[17]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[18]) );
  SDFFTRXL \pipeline_reg_out_reg[17]  ( .RN(n5), .D(mem_read_data[12]), .SI(
        pipeline_reg_out[16]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[17]) );
  SDFFTRXL \pipeline_reg_out_reg[16]  ( .RN(n2), .D(mem_read_data[11]), .SI(
        pipeline_reg_out[15]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[16]) );
  SDFFTRXL \pipeline_reg_out_reg[15]  ( .RN(n2), .D(mem_read_data[10]), .SI(
        pipeline_reg_out[14]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[15]) );
  SDFFTRXL \pipeline_reg_out_reg[14]  ( .RN(n3), .D(mem_read_data[9]), .SI(
        pipeline_reg_out[13]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[14]) );
  SDFFTRXL \pipeline_reg_out_reg[13]  ( .RN(n3), .D(mem_read_data[8]), .SI(
        pipeline_reg_out[12]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[13]) );
  SDFFTRXL \pipeline_reg_out_reg[12]  ( .RN(n2), .D(mem_read_data[7]), .SI(
        pipeline_reg_out[11]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[12]) );
  SDFFTRXL \pipeline_reg_out_reg[11]  ( .RN(n2), .D(mem_read_data[6]), .SI(
        pipeline_reg_out[10]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[11]) );
  SDFFTRXL \pipeline_reg_out_reg[10]  ( .RN(n3), .D(mem_read_data[5]), .SI(
        pipeline_reg_out[9]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[10])
         );
  SDFFTRXL \pipeline_reg_out_reg[9]  ( .RN(n3), .D(mem_read_data[4]), .SI(
        pipeline_reg_out[8]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[9])
         );
  SDFFTRXL \pipeline_reg_out_reg[8]  ( .RN(n4), .D(mem_read_data[3]), .SI(
        pipeline_reg_out[7]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[8])
         );
endmodule


module alu ( a, b, cmd, r );
  input [15:0] a;
  input [15:0] b;
  input [2:0] cmd;
  output [15:0] r;
  wire   \C4/DATA8_0 , \C4/DATA8_1 , \C4/DATA8_2 , \C4/DATA8_3 , \C4/DATA8_4 ,
         \C4/DATA8_5 , \C4/DATA8_6 , \C4/DATA8_7 , \C4/DATA8_8 , \C4/DATA8_9 ,
         \C4/DATA8_10 , \C4/DATA8_11 , \C4/DATA8_12 , \C4/DATA8_13 ,
         \C4/DATA8_14 , \C4/DATA8_15 , \DP_OP_21J1_124_1250/n56 ,
         \DP_OP_21J1_124_1250/n53 , \DP_OP_21J1_124_1250/n35 ,
         \DP_OP_21J1_124_1250/n34 , \DP_OP_21J1_124_1250/n33 ,
         \DP_OP_21J1_124_1250/n32 , \DP_OP_21J1_124_1250/n31 ,
         \DP_OP_21J1_124_1250/n30 , \DP_OP_21J1_124_1250/n29 ,
         \DP_OP_21J1_124_1250/n28 , \DP_OP_21J1_124_1250/n27 ,
         \DP_OP_21J1_124_1250/n26 , \DP_OP_21J1_124_1250/n25 ,
         \DP_OP_21J1_124_1250/n24 , \DP_OP_21J1_124_1250/n23 ,
         \DP_OP_21J1_124_1250/n22 , \DP_OP_21J1_124_1250/n21 ,
         \DP_OP_21J1_124_1250/n16 , \DP_OP_21J1_124_1250/n15 ,
         \DP_OP_21J1_124_1250/n14 , \DP_OP_21J1_124_1250/n13 ,
         \DP_OP_21J1_124_1250/n12 , \DP_OP_21J1_124_1250/n11 ,
         \DP_OP_21J1_124_1250/n10 , \DP_OP_21J1_124_1250/n9 ,
         \DP_OP_21J1_124_1250/n8 , \DP_OP_21J1_124_1250/n7 ,
         \DP_OP_21J1_124_1250/n6 , \DP_OP_21J1_124_1250/n5 ,
         \DP_OP_21J1_124_1250/n4 , \DP_OP_21J1_124_1250/n3 ,
         \DP_OP_21J1_124_1250/n2 , \DP_OP_21J1_124_1250/n1 , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405;

  ADDFXL \DP_OP_21J1_124_1250/U12  ( .A(\DP_OP_21J1_124_1250/n31 ), .B(a[5]), 
        .CI(\DP_OP_21J1_124_1250/n12 ), .CO(\DP_OP_21J1_124_1250/n11 ), .S(
        \C4/DATA8_5 ) );
  ADDFXL \DP_OP_21J1_124_1250/U10  ( .A(\DP_OP_21J1_124_1250/n29 ), .B(a[7]), 
        .CI(\DP_OP_21J1_124_1250/n10 ), .CO(\DP_OP_21J1_124_1250/n9 ), .S(
        \C4/DATA8_7 ) );
  ADDFXL \DP_OP_21J1_124_1250/U14  ( .A(\DP_OP_21J1_124_1250/n33 ), .B(a[3]), 
        .CI(\DP_OP_21J1_124_1250/n14 ), .CO(\DP_OP_21J1_124_1250/n13 ), .S(
        \C4/DATA8_3 ) );
  ADDFXL \DP_OP_21J1_124_1250/U11  ( .A(\DP_OP_21J1_124_1250/n30 ), .B(a[6]), 
        .CI(\DP_OP_21J1_124_1250/n11 ), .CO(\DP_OP_21J1_124_1250/n10 ), .S(
        \C4/DATA8_6 ) );
  ADDFXL \DP_OP_21J1_124_1250/U8  ( .A(\DP_OP_21J1_124_1250/n27 ), .B(a[9]), 
        .CI(\DP_OP_21J1_124_1250/n8 ), .CO(\DP_OP_21J1_124_1250/n7 ), .S(
        \C4/DATA8_9 ) );
  CMPR32X2 \DP_OP_21J1_124_1250/U6  ( .A(\DP_OP_21J1_124_1250/n25 ), .B(a[11]), 
        .C(\DP_OP_21J1_124_1250/n6 ), .CO(\DP_OP_21J1_124_1250/n5 ), .S(
        \C4/DATA8_11 ) );
  ADDFX1 \DP_OP_21J1_124_1250/U5  ( .A(\DP_OP_21J1_124_1250/n24 ), .B(a[12]), 
        .CI(\DP_OP_21J1_124_1250/n5 ), .CO(\DP_OP_21J1_124_1250/n4 ), .S(
        \C4/DATA8_12 ) );
  ADDFX1 \DP_OP_21J1_124_1250/U4  ( .A(\DP_OP_21J1_124_1250/n23 ), .B(a[13]), 
        .CI(\DP_OP_21J1_124_1250/n4 ), .CO(\DP_OP_21J1_124_1250/n3 ), .S(
        \C4/DATA8_13 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U2  ( .A(\DP_OP_21J1_124_1250/n21 ), .B(a[15]), 
        .Y(\DP_OP_21J1_124_1250/n1 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U20  ( .A(n78), .B(b[15]), .Y(
        \DP_OP_21J1_124_1250/n21 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U33  ( .A(n80), .B(\DP_OP_21J1_124_1250/n56 ), 
        .Y(\DP_OP_21J1_124_1250/n34 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U32  ( .A(n78), .B(b[3]), .Y(
        \DP_OP_21J1_124_1250/n33 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U31  ( .A(n80), .B(b[4]), .Y(
        \DP_OP_21J1_124_1250/n32 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U30  ( .A(n79), .B(b[5]), .Y(
        \DP_OP_21J1_124_1250/n31 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U29  ( .A(n78), .B(b[6]), .Y(
        \DP_OP_21J1_124_1250/n30 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U28  ( .A(n80), .B(b[7]), .Y(
        \DP_OP_21J1_124_1250/n29 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U27  ( .A(n79), .B(b[8]), .Y(
        \DP_OP_21J1_124_1250/n28 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U26  ( .A(n78), .B(b[9]), .Y(
        \DP_OP_21J1_124_1250/n27 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U25  ( .A(n80), .B(b[10]), .Y(
        \DP_OP_21J1_124_1250/n26 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U24  ( .A(n79), .B(b[11]), .Y(
        \DP_OP_21J1_124_1250/n25 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U23  ( .A(n78), .B(b[12]), .Y(
        \DP_OP_21J1_124_1250/n24 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U22  ( .A(n80), .B(b[13]), .Y(
        \DP_OP_21J1_124_1250/n23 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U21  ( .A(n79), .B(b[14]), .Y(
        \DP_OP_21J1_124_1250/n22 ) );
  ADDFXL U2 ( .A(\DP_OP_21J1_124_1250/n32 ), .B(a[4]), .CI(
        \DP_OP_21J1_124_1250/n13 ), .CO(\DP_OP_21J1_124_1250/n12 ), .S(
        \C4/DATA8_4 ) );
  ADDFX2 U3 ( .A(\DP_OP_21J1_124_1250/n35 ), .B(a[1]), .CI(
        \DP_OP_21J1_124_1250/n16 ), .CO(\DP_OP_21J1_124_1250/n15 ), .S(
        \C4/DATA8_1 ) );
  AOI211XL U4 ( .A0(n340), .A1(n357), .B0(n206), .C0(n344), .Y(n1) );
  NAND2X1 U5 ( .A(n347), .B(n202), .Y(n2) );
  AOI2BB2X1 U6 ( .B0(n273), .B1(n203), .A0N(n76), .A1N(a[11]), .Y(n3) );
  NAND2X1 U7 ( .A(n204), .B(n57), .Y(n4) );
  OAI211X1 U8 ( .A0(a[12]), .A1(n71), .B0(n3), .C0(n4), .Y(n5) );
  AOI222XL U9 ( .A0(n2), .A1(n86), .B0(n337), .B1(n205), .C0(n5), .C1(n93), 
        .Y(n6) );
  AOI211X1 U10 ( .A0(n334), .A1(n374), .B0(n1), .C0(n6), .Y(n7) );
  NAND2X1 U11 ( .A(n87), .B(\C4/DATA8_14 ), .Y(n8) );
  OAI21XL U12 ( .A0(b[14]), .A1(n103), .B0(n101), .Y(n9) );
  NAND2X1 U13 ( .A(n54), .B(n9), .Y(n10) );
  AO22X1 U14 ( .A0(n94), .A1(n204), .B0(n54), .B1(n387), .Y(n11) );
  OAI21XL U15 ( .A0(n383), .A1(n11), .B0(b[14]), .Y(n12) );
  NAND4X1 U16 ( .A(n7), .B(n8), .C(n10), .D(n12), .Y(r[14]) );
  AOI211X1 U17 ( .A0(n304), .A1(n357), .B0(n206), .C0(n180), .Y(n13) );
  OAI21XL U18 ( .A0(b[12]), .A1(n102), .B0(n396), .Y(n14) );
  OA22X1 U19 ( .A0(a[12]), .A1(n105), .B0(n223), .B1(n68), .Y(n15) );
  NAND2X1 U20 ( .A(n99), .B(n15), .Y(n16) );
  AO22X1 U21 ( .A0(a[12]), .A1(n14), .B0(b[12]), .B1(n16), .Y(n17) );
  AOI211X1 U22 ( .A0(n88), .A1(\C4/DATA8_12 ), .B0(n13), .C0(n17), .Y(n18) );
  OAI21XL U23 ( .A0(n310), .A1(n395), .B0(n86), .Y(n19) );
  OAI22XL U24 ( .A0(a[12]), .A1(n73), .B0(n83), .B1(a[11]), .Y(n20) );
  OAI22XL U25 ( .A0(a[9]), .A1(n76), .B0(a[10]), .B1(n71), .Y(n21) );
  OAI21XL U26 ( .A0(n20), .A1(n21), .B0(n93), .Y(n22) );
  OAI211X1 U27 ( .A0(n378), .A1(n390), .B0(n19), .C0(n22), .Y(n23) );
  OAI211X1 U28 ( .A0(n404), .A1(n291), .B0(n18), .C0(n23), .Y(r[12]) );
  CLKINVX1 U29 ( .A(a[0]), .Y(n24) );
  OAI22XL U30 ( .A0(n61), .A1(n77), .B0(n403), .B1(n24), .Y(
        \DP_OP_21J1_124_1250/n16 ) );
  OAI22XL U31 ( .A0(n61), .A1(n24), .B0(n403), .B1(a[0]), .Y(\C4/DATA8_0 ) );
  OR2X1 U32 ( .A(n395), .B(n290), .Y(n25) );
  AOI222XL U33 ( .A0(n25), .A1(n84), .B0(n210), .B1(n93), .C0(n211), .C1(n337), 
        .Y(n26) );
  OAI21XL U34 ( .A0(b[11]), .A1(n103), .B0(n396), .Y(n27) );
  OA22X1 U35 ( .A0(a[11]), .A1(n102), .B0(n224), .B1(n69), .Y(n28) );
  NAND2X1 U36 ( .A(n99), .B(n28), .Y(n29) );
  AO22X1 U37 ( .A0(a[11]), .A1(n27), .B0(b[11]), .B1(n29), .Y(n30) );
  AOI211X1 U38 ( .A0(n87), .A1(\C4/DATA8_11 ), .B0(n26), .C0(n30), .Y(n31) );
  OAI211X1 U39 ( .A0(n363), .A1(n258), .B0(n375), .C0(n278), .Y(n32) );
  OAI211X1 U40 ( .A0(n404), .A1(n285), .B0(n31), .C0(n32), .Y(r[11]) );
  OAI21XL U41 ( .A0(n83), .A1(n331), .B0(n232), .Y(n33) );
  NOR3X1 U42 ( .A(n231), .B(n230), .C(n33), .Y(n312) );
  NAND2X1 U43 ( .A(n263), .B(n202), .Y(n34) );
  AOI222XL U44 ( .A0(n34), .A1(n86), .B0(n205), .B1(n93), .C0(n201), .C1(n337), 
        .Y(n35) );
  OAI21XL U45 ( .A0(b[10]), .A1(n103), .B0(n396), .Y(n36) );
  OA22X1 U46 ( .A0(a[10]), .A1(n102), .B0(n270), .B1(n69), .Y(n37) );
  NAND2X1 U47 ( .A(n99), .B(n37), .Y(n38) );
  AO22X1 U48 ( .A0(a[10]), .A1(n36), .B0(b[10]), .B1(n38), .Y(n39) );
  AOI211X1 U49 ( .A0(n88), .A1(\C4/DATA8_10 ), .B0(n35), .C0(n39), .Y(n40) );
  OAI211X1 U50 ( .A0(n89), .A1(n257), .B0(n375), .C0(n402), .Y(n41) );
  OAI211X1 U51 ( .A0(n262), .A1(n404), .B0(n40), .C0(n41), .Y(r[10]) );
  CLKINVX1 U52 ( .A(n64), .Y(n42) );
  OAI22XL U53 ( .A0(n223), .A1(n42), .B0(n73), .B1(n270), .Y(n43) );
  OAI22XL U54 ( .A0(n81), .A1(n224), .B0(n75), .B1(n203), .Y(n44) );
  NOR2X1 U55 ( .A(n43), .B(n44), .Y(n339) );
  OAI22XL U56 ( .A0(n390), .A1(n389), .B0(n392), .B1(n391), .Y(n45) );
  AOI221XL U57 ( .A0(n395), .A1(n85), .B0(n393), .B1(n85), .C0(n45), .Y(n46)
         );
  OAI21XL U58 ( .A0(b[9]), .A1(n102), .B0(n396), .Y(n47) );
  OA22X1 U59 ( .A0(a[9]), .A1(n103), .B0(n388), .B1(n68), .Y(n48) );
  NAND2X1 U60 ( .A(n99), .B(n48), .Y(n49) );
  AO22X1 U61 ( .A0(a[9]), .A1(n47), .B0(b[9]), .B1(n49), .Y(n50) );
  AOI211X1 U62 ( .A0(n87), .A1(\C4/DATA8_9 ), .B0(n46), .C0(n50), .Y(n51) );
  AOI211X1 U63 ( .A0(n399), .A1(n400), .B0(n398), .C0(n397), .Y(n52) );
  OAI211X1 U64 ( .A0(n403), .A1(n402), .B0(n401), .C0(n52), .Y(n53) );
  OAI211X1 U65 ( .A0(n405), .A1(n404), .B0(n51), .C0(n53), .Y(r[9]) );
  NOR2X4 U67 ( .A(n113), .B(n145), .Y(\DP_OP_21J1_124_1250/n53 ) );
  CLKINVX1 U68 ( .A(n233), .Y(n72) );
  CLKINVX1 U69 ( .A(b[1]), .Y(n253) );
  CLKINVX1 U70 ( .A(n91), .Y(n353) );
  NOR2X2 U71 ( .A(cmd[2]), .B(cmd[1]), .Y(n142) );
  CLKBUFX2 U72 ( .A(a[14]), .Y(n54) );
  CLKBUFX2 U73 ( .A(b[1]), .Y(n55) );
  CLKBUFX2 U74 ( .A(b[4]), .Y(n56) );
  NOR2X4 U75 ( .A(n90), .B(n106), .Y(n93) );
  NOR3X2 U76 ( .A(n144), .B(n143), .C(n145), .Y(n366) );
  CLKINVX2 U77 ( .A(cmd[0]), .Y(n145) );
  INVX1 U78 ( .A(n123), .Y(n267) );
  NAND2XL U79 ( .A(a[8]), .B(n372), .Y(n140) );
  CLKINVX1 U80 ( .A(n312), .Y(n327) );
  OAI211XL U81 ( .A0(n252), .A1(n253), .B0(n166), .C0(n154), .Y(n155) );
  AOI2BB2XL U82 ( .B0(n233), .B1(a[8]), .A0N(n76), .A1N(n311), .Y(n182) );
  CLKINVX1 U83 ( .A(n254), .Y(n63) );
  CLKINVX1 U84 ( .A(n256), .Y(n59) );
  INVX3 U85 ( .A(n72), .Y(n57) );
  OAI21XL U86 ( .A0(n404), .A1(n323), .B0(n198), .Y(r[13]) );
  INVX1 U87 ( .A(n115), .Y(n116) );
  OAI211XL U88 ( .A0(n368), .A1(n367), .B0(n366), .C0(n365), .Y(n369) );
  INVX1 U89 ( .A(n376), .Y(n157) );
  INVX16 U90 ( .A(\DP_OP_21J1_124_1250/n53 ), .Y(n77) );
  AND2X2 U91 ( .A(n67), .B(n62), .Y(n233) );
  INVX3 U92 ( .A(n109), .Y(n106) );
  OAI211X1 U93 ( .A0(n390), .A1(n391), .B0(n193), .C0(n192), .Y(n194) );
  AOI211X1 U94 ( .A0(n91), .A1(n344), .B0(n356), .C0(n343), .Y(n345) );
  AOI32X1 U95 ( .A0(a[0]), .A1(\DP_OP_21J1_124_1250/n56 ), .A2(n57), .B0(n110), 
        .B1(n380), .Y(n310) );
  AOI211X1 U96 ( .A0(a[9]), .A1(n60), .B0(n250), .C0(n249), .Y(n251) );
  AOI32X1 U97 ( .A0(a[15]), .A1(\DP_OP_21J1_124_1250/n56 ), .A2(n233), .B0(
        n363), .B1(n109), .Y(n285) );
  AOI211X1 U98 ( .A0(a[5]), .A1(n64), .B0(n272), .C0(n177), .Y(n211) );
  AOI211X1 U99 ( .A0(a[6]), .A1(n60), .B0(n230), .C0(n226), .Y(n187) );
  NAND2X1 U100 ( .A(n57), .B(a[5]), .Y(n232) );
  AOI211X1 U101 ( .A0(n64), .A1(a[8]), .B0(n172), .C0(n171), .Y(n205) );
  NAND2X1 U102 ( .A(n60), .B(a[0]), .Y(n175) );
  AOI222X1 U103 ( .A0(n311), .A1(n60), .B0(n255), .B1(n64), .C0(n253), .C1(
        n252), .Y(n260) );
  NAND2X1 U104 ( .A(n63), .B(a[6]), .Y(n181) );
  AND2X2 U105 ( .A(n368), .B(n165), .Y(n394) );
  INVX3 U106 ( .A(n77), .Y(n79) );
  NAND2XL U107 ( .A(n106), .B(n60), .Y(n237) );
  INVX1 U108 ( .A(n375), .Y(n206) );
  INVX3 U109 ( .A(n383), .Y(n396) );
  INVX1 U110 ( .A(n209), .Y(n398) );
  CLKBUFX3 U111 ( .A(n273), .Y(n275) );
  INVX3 U112 ( .A(n337), .Y(n390) );
  NAND2X1 U113 ( .A(n273), .B(a[1]), .Y(n166) );
  NAND2X1 U114 ( .A(n273), .B(a[5]), .Y(n168) );
  CLKINVX1 U116 ( .A(n387), .Y(n68) );
  OR2X1 U118 ( .A(n67), .B(n62), .Y(n256) );
  CLKBUFX3 U119 ( .A(b[3]), .Y(n90) );
  CLKBUFX3 U120 ( .A(a[2]), .Y(n92) );
  CLKBUFX3 U121 ( .A(b[3]), .Y(n91) );
  AND2X2 U122 ( .A(n143), .B(cmd[1]), .Y(n387) );
  INVX1 U123 ( .A(b[6]), .Y(n349) );
  CLKBUFX3 U124 ( .A(a[15]), .Y(n361) );
  INVX1 U125 ( .A(n54), .Y(n204) );
  INVX3 U126 ( .A(n256), .Y(n60) );
  CLKINVX1 U127 ( .A(n403), .Y(n61) );
  CLKINVX1 U128 ( .A(n61), .Y(n62) );
  XOR2X1 U129 ( .A(n79), .B(b[1]), .Y(\DP_OP_21J1_124_1250/n35 ) );
  INVX3 U130 ( .A(n254), .Y(n64) );
  CLKINVX1 U131 ( .A(n361), .Y(n65) );
  INVX3 U132 ( .A(n361), .Y(n66) );
  CLKINVX1 U133 ( .A(n55), .Y(n67) );
  CLKINVX1 U134 ( .A(n387), .Y(n69) );
  CLKINVX1 U135 ( .A(n63), .Y(n70) );
  CLKINVX1 U136 ( .A(n63), .Y(n71) );
  CLKINVX1 U137 ( .A(n233), .Y(n73) );
  CLKINVX1 U138 ( .A(n233), .Y(n74) );
  CLKINVX1 U139 ( .A(n59), .Y(n75) );
  CLKINVX1 U140 ( .A(n59), .Y(n76) );
  CLKINVX1 U141 ( .A(n77), .Y(n78) );
  CLKINVX1 U142 ( .A(n77), .Y(n80) );
  CLKINVX1 U143 ( .A(n275), .Y(n81) );
  INVX3 U144 ( .A(n275), .Y(n82) );
  INVX3 U145 ( .A(n275), .Y(n83) );
  OAI21X2 U146 ( .A0(n83), .A1(n351), .B0(n251), .Y(n338) );
  OAI21X1 U147 ( .A0(n312), .A1(n108), .B0(n236), .Y(n246) );
  OAI21X1 U148 ( .A0(n108), .A1(n340), .B0(n173), .Y(n257) );
  OAI21X1 U149 ( .A0(n82), .A1(n381), .B0(n187), .Y(n391) );
  OAI21X1 U150 ( .A0(n73), .A1(n66), .B0(n180), .Y(n278) );
  OAI22X1 U151 ( .A0(n364), .A1(n109), .B0(n277), .B1(n276), .Y(n287) );
  OAI22X1 U152 ( .A0(n55), .A1(n222), .B0(n66), .B1(n254), .Y(n244) );
  OAI31X1 U154 ( .A0(n229), .A1(n228), .A2(n110), .B0(n243), .Y(n399) );
  NOR2X2 U155 ( .A(n356), .B(n397), .Y(n375) );
  NAND2X2 U156 ( .A(n333), .B(n165), .Y(n395) );
  NOR3XL U157 ( .A(n362), .B(n66), .C(n377), .Y(n367) );
  AOI211X4 U159 ( .A0(a[8]), .A1(n273), .B0(n272), .C0(n271), .Y(n364) );
  NOR2X2 U160 ( .A(n62), .B(b[1]), .Y(n273) );
  OAI22X1 U161 ( .A0(n107), .A1(n389), .B0(n109), .B1(n221), .Y(n330) );
  OAI22X1 U162 ( .A0(n107), .A1(n201), .B0(n109), .B1(n200), .Y(n347) );
  INVX3 U163 ( .A(n108), .Y(n107) );
  OAI21X1 U164 ( .A0(a[15]), .A1(n353), .B0(n313), .Y(n397) );
  OAI22X1 U166 ( .A0(n233), .A1(a[15]), .B0(n74), .B1(n54), .Y(n340) );
  OAI2BB2X1 U167 ( .B0(n222), .B1(n186), .A0N(a[15]), .A1N(n186), .Y(n316) );
  CLKINVX1 U168 ( .A(n394), .Y(n84) );
  CLKINVX1 U169 ( .A(n394), .Y(n85) );
  CLKINVX1 U170 ( .A(n394), .Y(n86) );
  NOR2X2 U171 ( .A(b[4]), .B(n164), .Y(n333) );
  NAND2X1 U172 ( .A(n56), .B(n65), .Y(n401) );
  CLKBUFX3 U173 ( .A(n142), .Y(n87) );
  CLKBUFX3 U174 ( .A(n142), .Y(n88) );
  NAND2XL U175 ( .A(n337), .B(n324), .Y(n325) );
  OAI21X1 U176 ( .A0(n244), .A1(n108), .B0(n243), .Y(n405) );
  NAND2XL U177 ( .A(n324), .B(n110), .Y(n243) );
  ADDFXL U178 ( .A(\DP_OP_21J1_124_1250/n26 ), .B(a[10]), .CI(
        \DP_OP_21J1_124_1250/n7 ), .CO(\DP_OP_21J1_124_1250/n6 ), .S(
        \C4/DATA8_10 ) );
  OAI22X2 U179 ( .A0(n107), .A1(n299), .B0(n109), .B1(n304), .Y(n376) );
  AOI211X4 U180 ( .A0(a[14]), .A1(n64), .B0(n148), .C0(n147), .Y(n304) );
  CLKINVX1 U181 ( .A(n400), .Y(n89) );
  NOR3X2 U182 ( .A(n322), .B(n164), .C(n373), .Y(n374) );
  NOR2X2 U183 ( .A(n373), .B(n106), .Y(n357) );
  NAND2XL U184 ( .A(n57), .B(a[0]), .Y(n154) );
  OAI21X1 U185 ( .A0(n294), .A1(n67), .B0(n301), .Y(n344) );
  OAI211XL U186 ( .A0(n301), .A1(n353), .B0(n300), .C0(n401), .Y(n302) );
  OAI21X1 U187 ( .A0(n65), .A1(n56), .B0(n107), .Y(n301) );
  NOR2X2 U188 ( .A(n145), .B(n68), .Y(n383) );
  ADDFXL U189 ( .A(\DP_OP_21J1_124_1250/n28 ), .B(a[8]), .CI(
        \DP_OP_21J1_124_1250/n9 ), .CO(\DP_OP_21J1_124_1250/n8 ), .S(
        \C4/DATA8_8 ) );
  AOI211X4 U190 ( .A0(n233), .A1(a[8]), .B0(n172), .C0(n146), .Y(n299) );
  NAND2X2 U191 ( .A(n209), .B(n401), .Y(n356) );
  AOI211XL U192 ( .A0(n91), .A1(n323), .B0(n362), .C0(n322), .Y(n326) );
  AOI211XL U193 ( .A0(n90), .A1(n405), .B0(n362), .C0(n322), .Y(n245) );
  AOI211XL U194 ( .A0(n90), .A1(n285), .B0(n362), .C0(n322), .Y(n286) );
  AOI211XL U195 ( .A0(n262), .A1(n90), .B0(n362), .C0(n261), .Y(n264) );
  NOR2X2 U196 ( .A(n111), .B(n90), .Y(n337) );
  NOR2X2 U197 ( .A(b[4]), .B(n91), .Y(n400) );
  ADDFHX2 U198 ( .A(\DP_OP_21J1_124_1250/n34 ), .B(a[2]), .CI(
        \DP_OP_21J1_124_1250/n15 ), .CO(\DP_OP_21J1_124_1250/n14 ), .S(
        \C4/DATA8_2 ) );
  ADDFHX2 U199 ( .A(\DP_OP_21J1_124_1250/n22 ), .B(n54), .CI(
        \DP_OP_21J1_124_1250/n3 ), .CO(\DP_OP_21J1_124_1250/n2 ), .S(
        \C4/DATA8_14 ) );
  CLKINVX1 U200 ( .A(n333), .Y(n362) );
  CLKINVX1 U201 ( .A(n400), .Y(n373) );
  AO21X1 U202 ( .A0(\C4/DATA8_8 ), .A1(n88), .B0(n141), .Y(r[8]) );
  INVX3 U203 ( .A(n142), .Y(n113) );
  CLKINVX1 U204 ( .A(n374), .Y(n404) );
  AO21X1 U205 ( .A0(\C4/DATA8_6 ), .A1(n87), .B0(n139), .Y(r[6]) );
  NAND2XL U206 ( .A(cmd[2]), .B(cmd[0]), .Y(n152) );
  CLKINVX1 U207 ( .A(b[2]), .Y(n112) );
  AOI211X1 U208 ( .A0(n318), .A1(n400), .B0(n356), .C0(n317), .Y(n320) );
  OAI31XL U209 ( .A0(n356), .A1(n269), .A2(n268), .B0(n267), .Y(r[2]) );
  OAI31XL U210 ( .A0(n163), .A1(n322), .A2(n162), .B0(n161), .Y(r[0]) );
  INVX3 U211 ( .A(n110), .Y(\DP_OP_21J1_124_1250/n56 ) );
  CLKINVX1 U212 ( .A(n366), .Y(n322) );
  OAI211X1 U213 ( .A0(n330), .A1(n85), .B0(n329), .C0(n328), .Y(r[5]) );
  OAI211X1 U214 ( .A0(n327), .A1(n392), .B0(n326), .C0(n325), .Y(n328) );
  CLKINVX1 U215 ( .A(n134), .Y(n329) );
  CLKINVX1 U216 ( .A(n132), .Y(n133) );
  NAND2BX1 U217 ( .AN(n320), .B(n98), .Y(n132) );
  AOI22X1 U218 ( .A0(n321), .A1(b[5]), .B0(n319), .B1(a[5]), .Y(n98) );
  OAI211X1 U219 ( .A0(n371), .A1(n86), .B0(n370), .C0(n369), .Y(r[7]) );
  CLKINVX1 U220 ( .A(n137), .Y(n370) );
  CLKINVX1 U221 ( .A(n135), .Y(n136) );
  NAND2BX1 U222 ( .AN(n359), .B(n97), .Y(n135) );
  AOI22X1 U223 ( .A0(n360), .A1(b[7]), .B0(n358), .B1(a[7]), .Y(n97) );
  AOI211X1 U224 ( .A0(n364), .A1(n357), .B0(n356), .C0(n355), .Y(n359) );
  OAI211X1 U225 ( .A0(n290), .A1(n85), .B0(n289), .C0(n288), .Y(r[3]) );
  CLKINVX1 U226 ( .A(n128), .Y(n289) );
  CLKINVX1 U227 ( .A(n126), .Y(n127) );
  NAND2BX1 U228 ( .AN(n282), .B(n90), .Y(n124) );
  NAND2X1 U229 ( .A(a[3]), .B(n284), .Y(n125) );
  AOI211X1 U230 ( .A0(n341), .A1(n280), .B0(n356), .C0(n279), .Y(n283) );
  OAI211X1 U231 ( .A0(a[5]), .A1(n71), .B0(n111), .C0(n274), .Y(n277) );
  NAND2X1 U232 ( .A(n57), .B(n281), .Y(n274) );
  OAI211X1 U233 ( .A0(n393), .A1(n86), .B0(n248), .C0(n247), .Y(r[1]) );
  AOI211X1 U234 ( .A0(\C4/DATA8_1 ), .A1(n87), .B0(n241), .C0(n120), .Y(n248)
         );
  AOI211X1 U235 ( .A0(n239), .A1(n399), .B0(n356), .C0(n238), .Y(n241) );
  AOI211X1 U236 ( .A0(n64), .A1(n281), .B0(\DP_OP_21J1_124_1250/n56 ), .C0(
        n234), .Y(n235) );
  OAI211X1 U237 ( .A0(n349), .A1(n350), .B0(n348), .C0(n138), .Y(n139) );
  NAND2X1 U238 ( .A(a[6]), .B(n332), .Y(n138) );
  AOI211X1 U239 ( .A0(n347), .A1(n394), .B0(n346), .C0(n345), .Y(n348) );
  AOI211X1 U240 ( .A0(n339), .A1(n337), .B0(n336), .C0(n335), .Y(n346) );
  OAI211X1 U241 ( .A0(n310), .A1(n85), .B0(n309), .C0(n308), .Y(r[4]) );
  OAI211X1 U242 ( .A0(n307), .A1(n89), .B0(n306), .C0(n305), .Y(n308) );
  AOI211X1 U243 ( .A0(n304), .A1(n341), .B0(n303), .C0(n302), .Y(n305) );
  NOR2X1 U244 ( .A(n106), .B(n315), .Y(n341) );
  CLKINVX1 U245 ( .A(n131), .Y(n309) );
  CLKINVX1 U246 ( .A(n129), .Y(n130) );
  NAND2BX1 U247 ( .AN(n296), .B(n96), .Y(n129) );
  AOI22X1 U248 ( .A0(n295), .A1(a[4]), .B0(n297), .B1(n56), .Y(n96) );
  AOI211X1 U249 ( .A0(n337), .A1(n299), .B0(n322), .C0(n293), .Y(n296) );
  NOR2X1 U250 ( .A(n362), .B(n291), .Y(n292) );
  NOR2X1 U251 ( .A(n67), .B(n66), .Y(n228) );
  NOR2X1 U252 ( .A(n55), .B(n222), .Y(n229) );
  NAND2X1 U253 ( .A(n221), .B(n111), .Y(n393) );
  NOR3X1 U254 ( .A(n227), .B(n226), .C(n225), .Y(n324) );
  AOI211X1 U255 ( .A0(n92), .A1(n259), .B0(n265), .C0(n121), .Y(n122) );
  NOR2BX1 U256 ( .AN(n266), .B(n108), .Y(n121) );
  NAND2X1 U257 ( .A(n106), .B(n400), .Y(n352) );
  NOR2X1 U258 ( .A(n70), .B(n381), .Y(n249) );
  NAND3X1 U259 ( .A(n56), .B(\DP_OP_21J1_124_1250/n56 ), .C(n55), .Y(n402) );
  NOR2X1 U260 ( .A(\DP_OP_21J1_124_1250/n56 ), .B(n200), .Y(n263) );
  NAND4X1 U261 ( .A(n385), .B(n386), .C(n384), .D(n140), .Y(n141) );
  NOR3X1 U262 ( .A(n24), .B(n377), .C(n395), .Y(n379) );
  AOI211X1 U263 ( .A0(a[0]), .A1(n160), .B0(n159), .C0(n114), .Y(n161) );
  CLKINVX1 U264 ( .A(n94), .Y(n103) );
  AOI211X1 U265 ( .A0(n239), .A1(n157), .B0(n156), .C0(n356), .Y(n159) );
  CLKINVX1 U266 ( .A(n315), .Y(n239) );
  NAND2X1 U267 ( .A(n294), .B(n91), .Y(n315) );
  OAI211X1 U268 ( .A0(n86), .A1(n377), .B0(n153), .C0(n99), .Y(n160) );
  NAND4X1 U269 ( .A(n183), .B(n181), .C(n168), .D(n170), .Y(n298) );
  CLKINVX1 U270 ( .A(n93), .Y(n392) );
  CLKINVX1 U271 ( .A(n357), .Y(n258) );
  NAND2X1 U272 ( .A(n111), .B(n212), .Y(n290) );
  CLKINVX1 U273 ( .A(n280), .Y(n363) );
  NOR2X1 U274 ( .A(n179), .B(n174), .Y(n280) );
  OAI211X1 U275 ( .A0(n191), .A1(n75), .B0(n184), .C0(n183), .Y(n380) );
  NAND2X1 U276 ( .A(n233), .B(a[4]), .Y(n183) );
  OAI211X1 U277 ( .A0(n83), .A1(n351), .B0(n182), .C0(n181), .Y(n378) );
  CLKINVX1 U278 ( .A(a[5]), .Y(n311) );
  CLKINVX1 U279 ( .A(n301), .Y(n180) );
  NAND2BX1 U280 ( .AN(n304), .B(n111), .Y(n291) );
  CLKINVX1 U281 ( .A(a[12]), .Y(n223) );
  NOR2X1 U282 ( .A(n76), .B(n65), .Y(n148) );
  CLKINVX1 U283 ( .A(n117), .Y(n198) );
  NAND2BX1 U284 ( .AN(n196), .B(n95), .Y(n115) );
  AOI22X1 U285 ( .A0(n197), .A1(b[13]), .B0(n185), .B1(a[13]), .Y(n95) );
  CLKINVX1 U286 ( .A(n94), .Y(n105) );
  OAI211X1 U287 ( .A0(n281), .A1(n71), .B0(n190), .C0(n232), .Y(n389) );
  NOR2X1 U288 ( .A(n73), .B(n388), .Y(n226) );
  NOR2X1 U289 ( .A(n70), .B(n351), .Y(n230) );
  NOR3X1 U290 ( .A(\DP_OP_21J1_124_1250/n56 ), .B(n60), .C(n66), .Y(n314) );
  NAND2X1 U291 ( .A(n253), .B(n111), .Y(n186) );
  NAND2X1 U292 ( .A(n111), .B(n244), .Y(n323) );
  CLKINVX1 U293 ( .A(n56), .Y(n294) );
  CLKINVX1 U294 ( .A(a[13]), .Y(n203) );
  NAND2X1 U295 ( .A(n60), .B(a[7]), .Y(n170) );
  NOR2X1 U296 ( .A(n82), .B(n388), .Y(n172) );
  AOI21X1 U297 ( .A0(n57), .A1(a[2]), .B0(n167), .Y(n200) );
  AOI211X1 U298 ( .A0(a[4]), .A1(n64), .B0(n250), .C0(n169), .Y(n201) );
  NOR2X1 U299 ( .A(n72), .B(n331), .Y(n250) );
  CLKINVX1 U300 ( .A(n395), .Y(n202) );
  NOR2X1 U301 ( .A(\DP_OP_21J1_124_1250/n56 ), .B(n199), .Y(n334) );
  OAI211X1 U302 ( .A0(n220), .A1(n66), .B0(n219), .C0(n218), .Y(r[15]) );
  OAI211X1 U303 ( .A0(n217), .A1(n390), .B0(n216), .C0(n215), .Y(n218) );
  NOR2X1 U304 ( .A(n91), .B(n362), .Y(n368) );
  CLKINVX1 U305 ( .A(a[6]), .Y(n331) );
  CLKINVX1 U306 ( .A(a[4]), .Y(n255) );
  NOR2X1 U307 ( .A(n73), .B(n351), .Y(n272) );
  CLKINVX1 U308 ( .A(a[7]), .Y(n351) );
  OAI211X1 U309 ( .A0(n191), .A1(n70), .B0(n176), .C0(n175), .Y(n212) );
  CLKINVX1 U310 ( .A(a[3]), .Y(n281) );
  CLKINVX1 U311 ( .A(a[1]), .Y(n191) );
  NOR2X1 U312 ( .A(cmd[1]), .B(n152), .Y(n165) );
  CLKINVX1 U313 ( .A(n210), .Y(n217) );
  NOR2X1 U314 ( .A(n76), .B(n381), .Y(n231) );
  CLKINVX1 U315 ( .A(a[8]), .Y(n381) );
  NOR2X1 U316 ( .A(n82), .B(n270), .Y(n227) );
  CLKINVX1 U317 ( .A(a[10]), .Y(n270) );
  NOR2X1 U318 ( .A(n254), .B(n388), .Y(n178) );
  CLKINVX1 U319 ( .A(a[9]), .Y(n388) );
  NOR2X1 U320 ( .A(n74), .B(n224), .Y(n179) );
  CLKINVX1 U321 ( .A(a[11]), .Y(n224) );
  NAND3X1 U323 ( .A(n354), .B(n313), .C(n209), .Y(n118) );
  NOR2X1 U324 ( .A(n164), .B(n303), .Y(n209) );
  NAND2X1 U325 ( .A(n56), .B(n90), .Y(n313) );
  AOI21X1 U326 ( .A0(n56), .A1(n377), .B0(n66), .Y(n354) );
  CLKINVX1 U327 ( .A(n94), .Y(n104) );
  AOI211X1 U328 ( .A0(n387), .A1(b[15]), .B0(n383), .C0(n207), .Y(n220) );
  NAND2X1 U329 ( .A(n57), .B(n109), .Y(n377) );
  NAND2X1 U330 ( .A(n306), .B(n300), .Y(n164) );
  CLKINVX1 U331 ( .A(b[5]), .Y(n300) );
  CLKINVX1 U333 ( .A(n94), .Y(n102) );
  AND3X2 U334 ( .A(n144), .B(n145), .C(cmd[2]), .Y(n94) );
  CLKINVX1 U335 ( .A(cmd[1]), .Y(n144) );
  CLKINVX1 U336 ( .A(cmd[2]), .Y(n143) );
  OAI2BB1X1 U337 ( .A0N(n87), .A1N(\C4/DATA8_5 ), .B0(n133), .Y(n134) );
  OAI2BB1X1 U338 ( .A0N(n88), .A1N(\C4/DATA8_7 ), .B0(n136), .Y(n137) );
  OAI2BB1X1 U339 ( .A0N(n88), .A1N(\C4/DATA8_3 ), .B0(n127), .Y(n128) );
  NAND3BX1 U340 ( .AN(n283), .B(n125), .C(n124), .Y(n126) );
  AO22X1 U341 ( .A0(n240), .A1(a[1]), .B0(n242), .B1(n55), .Y(n120) );
  OAI2BB1X1 U342 ( .A0N(n87), .A1N(\C4/DATA8_4 ), .B0(n130), .Y(n131) );
  OAI2BB1X1 U343 ( .A0N(n88), .A1N(\C4/DATA8_2 ), .B0(n122), .Y(n123) );
  AO22X1 U344 ( .A0(\C4/DATA8_0 ), .A1(n87), .B0(b[0]), .B1(n158), .Y(n114) );
  CLKBUFX3 U345 ( .A(n101), .Y(n100) );
  OAI2BB1X1 U346 ( .A0N(n88), .A1N(\C4/DATA8_13 ), .B0(n116), .Y(n117) );
  CLKBUFX3 U347 ( .A(n396), .Y(n99) );
  OAI2BB1X1 U348 ( .A0N(b[15]), .A1N(n208), .B0(n118), .Y(n119) );
  NAND3XL U349 ( .A(cmd[2]), .B(cmd[1]), .C(n145), .Y(n303) );
  CLKBUFX3 U350 ( .A(n396), .Y(n101) );
  CLKBUFX3 U351 ( .A(n112), .Y(n108) );
  CLKBUFX3 U352 ( .A(n112), .Y(n111) );
  CLKBUFX3 U353 ( .A(n112), .Y(n109) );
  CLKBUFX3 U354 ( .A(n112), .Y(n110) );
  OAI22XL U355 ( .A0(n71), .A1(n270), .B0(n76), .B1(n224), .Y(n146) );
  OAI22XL U356 ( .A0(n81), .A1(n203), .B0(n74), .B1(n223), .Y(n147) );
  OAI21XL U359 ( .A0(n376), .A1(n353), .B0(n333), .Y(n163) );
  AOI222XL U360 ( .A0(n191), .A1(n273), .B0(n55), .B1(n252), .C0(n24), .C1(n57), .Y(n151) );
  OAI22XL U361 ( .A0(n151), .A1(n392), .B0(n390), .B1(n298), .Y(n162) );
  OAI22XL U362 ( .A0(b[0]), .A1(n94), .B0(n403), .B1(n387), .Y(n153) );
  AOI221XL U363 ( .A0(n106), .A1(n298), .B0(n109), .B1(n155), .C0(n373), .Y(
        n156) );
  OAI21XL U364 ( .A0(a[0]), .A1(n102), .B0(n100), .Y(n158) );
  OR2X1 U365 ( .A(n339), .B(n107), .Y(n173) );
  OA21XL U366 ( .A0(n108), .A1(n199), .B0(n173), .Y(n262) );
  OAI21XL U367 ( .A0(n24), .A1(n71), .B0(n166), .Y(n167) );
  OAI21XL U368 ( .A0(n281), .A1(n256), .B0(n168), .Y(n169) );
  OAI21XL U369 ( .A0(n270), .A1(n74), .B0(n170), .Y(n171) );
  OAI22XL U370 ( .A0(n222), .A1(n67), .B0(n83), .B1(n223), .Y(n174) );
  AOI2BB2X1 U371 ( .B0(n273), .B1(a[2]), .A0N(n74), .A1N(n281), .Y(n176) );
  OAI22XL U372 ( .A0(n256), .A1(n255), .B0(n82), .B1(n331), .Y(n177) );
  NOR4X1 U373 ( .A(n179), .B(n178), .C(n227), .D(n231), .Y(n210) );
  AOI2BB2X1 U374 ( .B0(n64), .B1(a[2]), .A0N(n82), .A1N(n281), .Y(n184) );
  OAI221XL U375 ( .A0(a[13]), .A1(n104), .B0(n203), .B1(n69), .C0(n99), .Y(
        n197) );
  OAI21XL U376 ( .A0(b[13]), .A1(n105), .B0(n101), .Y(n185) );
  OAI22XL U377 ( .A0(n316), .A1(n373), .B0(n314), .B1(n294), .Y(n195) );
  OAI22XL U378 ( .A0(a[13]), .A1(n73), .B0(a[12]), .B1(n83), .Y(n189) );
  OAI22XL U379 ( .A0(a[10]), .A1(n76), .B0(a[11]), .B1(n70), .Y(n188) );
  OAI21XL U380 ( .A0(n189), .A1(n188), .B0(n93), .Y(n193) );
  AOI2BB2X1 U381 ( .B0(n59), .B1(a[2]), .A0N(n81), .A1N(n255), .Y(n190) );
  OAI21XL U382 ( .A0(n330), .A1(n395), .B0(n84), .Y(n192) );
  OAI31XL U383 ( .A0(n397), .A1(n398), .A2(n195), .B0(n194), .Y(n196) );
  OAI22XL U384 ( .A0(b[15]), .A1(n105), .B0(n404), .B1(n377), .Y(n207) );
  OAI21XL U385 ( .A0(n361), .A1(n104), .B0(n101), .Y(n208) );
  AOI2BB2X1 U386 ( .B0(n106), .B1(n212), .A0N(n107), .A1N(n211), .Y(n371) );
  OAI21XL U387 ( .A0(n395), .A1(n371), .B0(n85), .Y(n216) );
  OAI22XL U388 ( .A0(a[15]), .A1(n74), .B0(n54), .B1(n82), .Y(n214) );
  OAI22XL U389 ( .A0(a[13]), .A1(n254), .B0(a[12]), .B1(n75), .Y(n213) );
  OAI21XL U390 ( .A0(n214), .A1(n213), .B0(n93), .Y(n215) );
  OAI21XL U391 ( .A0(a[1]), .A1(n103), .B0(n101), .Y(n242) );
  OAI22XL U392 ( .A0(n70), .A1(n224), .B0(n75), .B1(n223), .Y(n225) );
  OAI22XL U393 ( .A0(a[1]), .A1(n74), .B0(a[2]), .B1(n83), .Y(n234) );
  OAI21XL U394 ( .A0(a[4]), .A1(n75), .B0(n235), .Y(n236) );
  OAI22XL U395 ( .A0(n89), .A1(n246), .B0(n313), .B1(n237), .Y(n238) );
  OAI221XL U396 ( .A0(n55), .A1(n104), .B0(n67), .B1(n68), .C0(n99), .Y(n240)
         );
  OAI21XL U397 ( .A0(n90), .A1(n246), .B0(n245), .Y(n247) );
  OAI22XL U398 ( .A0(n353), .A1(n402), .B0(n338), .B1(n352), .Y(n269) );
  OAI22XL U399 ( .A0(n260), .A1(n258), .B0(n315), .B1(n257), .Y(n268) );
  OAI21XL U400 ( .A0(n92), .A1(n104), .B0(n101), .Y(n266) );
  OAI221XL U401 ( .A0(n106), .A1(n104), .B0(n110), .B1(n69), .C0(n100), .Y(
        n259) );
  OAI22XL U402 ( .A0(n260), .A1(n392), .B0(n390), .B1(n338), .Y(n261) );
  AO22X1 U403 ( .A0(n366), .A1(n264), .B0(n394), .B1(n263), .Y(n265) );
  OAI21XL U404 ( .A0(n91), .A1(n102), .B0(n396), .Y(n284) );
  OAI22XL U405 ( .A0(n70), .A1(n388), .B0(n75), .B1(n270), .Y(n271) );
  OAI22XL U406 ( .A0(a[4]), .A1(n82), .B0(a[6]), .B1(n256), .Y(n276) );
  OAI22XL U407 ( .A0(n353), .A1(n278), .B0(n373), .B1(n287), .Y(n279) );
  AOI221XL U408 ( .A0(n387), .A1(a[3]), .B0(n94), .B1(n281), .C0(n383), .Y(
        n282) );
  OAI21XL U409 ( .A0(n91), .A1(n287), .B0(n286), .Y(n288) );
  OAI21XL U410 ( .A0(a[4]), .A1(n104), .B0(n396), .Y(n297) );
  OAI22XL U411 ( .A0(n368), .A1(n292), .B0(n298), .B1(n392), .Y(n293) );
  OAI221XL U412 ( .A0(n56), .A1(n104), .B0(n294), .B1(n68), .C0(n100), .Y(n295) );
  OAI2BB2XL U413 ( .B0(n108), .B1(n299), .A0N(n111), .A1N(n298), .Y(n307) );
  OAI221XL U414 ( .A0(a[5]), .A1(n105), .B0(n311), .B1(n69), .C0(n100), .Y(
        n321) );
  OAI2BB2XL U415 ( .B0(n107), .B1(n327), .A0N(n107), .A1N(n324), .Y(n318) );
  OAI22XL U416 ( .A0(n316), .A1(n315), .B0(n314), .B1(n313), .Y(n317) );
  OAI21XL U417 ( .A0(b[5]), .A1(n105), .B0(n100), .Y(n319) );
  AOI221XL U418 ( .A0(n387), .A1(a[6]), .B0(n94), .B1(n331), .C0(n383), .Y(
        n350) );
  OAI21XL U419 ( .A0(b[6]), .A1(n105), .B0(n100), .Y(n332) );
  OAI21XL U420 ( .A0(n334), .A1(n353), .B0(n333), .Y(n336) );
  OAI21XL U421 ( .A0(n392), .A1(n338), .B0(n366), .Y(n335) );
  OAI2BB2XL U422 ( .B0(n110), .B1(n339), .A0N(n108), .A1N(n338), .Y(n342) );
  OAI2BB2XL U423 ( .B0(n89), .B1(n342), .A0N(n341), .A1N(n340), .Y(n343) );
  OAI221XL U424 ( .A0(a[7]), .A1(n103), .B0(n351), .B1(n69), .C0(n99), .Y(n360) );
  OAI22XL U425 ( .A0(n354), .A1(n353), .B0(n363), .B1(n352), .Y(n355) );
  OAI21XL U426 ( .A0(b[7]), .A1(n103), .B0(n100), .Y(n358) );
  AOI2BB2X1 U427 ( .B0(n93), .B1(n364), .A0N(n390), .A1N(n363), .Y(n365) );
  OAI21XL U428 ( .A0(b[8]), .A1(n102), .B0(n100), .Y(n372) );
  AOI222XL U429 ( .A0(n376), .A1(n375), .B0(n376), .B1(n374), .C0(n375), .C1(
        n373), .Y(n386) );
  OAI222XL U430 ( .A0(n380), .A1(n390), .B0(n394), .B1(n379), .C0(n392), .C1(
        n378), .Y(n385) );
  OAI22XL U431 ( .A0(a[8]), .A1(n105), .B0(n381), .B1(n69), .Y(n382) );
  OAI21XL U432 ( .A0(n383), .A1(n382), .B0(b[8]), .Y(n384) );
  OAI221X1 U1 ( .A0(b[0]), .A1(a[14]), .B0(n403), .B1(a[15]), .C0(n253), .Y(
        n199) );
  AOI221X1 U66 ( .A0(b[0]), .A1(n24), .B0(n62), .B1(n191), .C0(n55), .Y(n221)
         );
  NOR4X1 U115 ( .A(b[13]), .B(b[8]), .C(n150), .D(n149), .Y(n306) );
  OR4XL U117 ( .A(b[14]), .B(b[6]), .C(b[9]), .D(b[7]), .Y(n149) );
  OR4XL U153 ( .A(b[10]), .B(b[12]), .C(b[15]), .D(b[11]), .Y(n150) );
  OAI22X1 U158 ( .A0(b[0]), .A1(a[2]), .B0(n62), .B1(a[3]), .Y(n252) );
  OR2X1 U165 ( .A(n67), .B(b[0]), .Y(n254) );
  OAI22X2 U322 ( .A0(b[0]), .A1(a[13]), .B0(n62), .B1(a[14]), .Y(n222) );
  AOI21X4 U332 ( .A0(\C4/DATA8_15 ), .A1(n88), .B0(n119), .Y(n219) );
  XOR2X4 U357 ( .A(\DP_OP_21J1_124_1250/n2 ), .B(\DP_OP_21J1_124_1250/n1 ), 
        .Y(\C4/DATA8_15 ) );
  INVX8 U358 ( .A(b[0]), .Y(n403) );
endmodule


module EX_stage_test_1 ( clk, rst, pipeline_reg_in, pipeline_reg_out, 
        ex_op_dest, test_si, test_so, test_se );
  input [56:0] pipeline_reg_in;
  output [37:0] pipeline_reg_out;
  output [2:0] ex_op_dest;
  input clk, rst, test_si, test_se;
  output test_so;
  wire   pipeline_reg_in_0, n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29;
  wire   [15:0] ex_alu_result;
  assign pipeline_reg_in_0 = pipeline_reg_in[0];

  alu alu_inst ( .a({pipeline_reg_in[53:51], n7, pipeline_reg_in[49:41], n8, 
        pipeline_reg_in[39:38]}), .b(pipeline_reg_in[37:22]), .cmd(
        pipeline_reg_in[56:54]), .r(ex_alu_result) );
  CLKINVX1 U3 ( .A(n1), .Y(n5) );
  CLKINVX1 U4 ( .A(n1), .Y(n2) );
  CLKBUFX3 U5 ( .A(rst), .Y(n1) );
  INVX3 U6 ( .A(n1), .Y(n3) );
  CLKINVX2 U7 ( .A(n1), .Y(n4) );
  CLKINVX2 U8 ( .A(n1), .Y(n6) );
  CLKBUFX3 U9 ( .A(pipeline_reg_in[50]), .Y(n7) );
  CLKBUFX3 U10 ( .A(pipeline_reg_in[40]), .Y(n8) );
  CLKBUFX3 U11 ( .A(pipeline_reg_in[2]), .Y(ex_op_dest[1]) );
  CLKBUFX3 U12 ( .A(pipeline_reg_in[1]), .Y(ex_op_dest[0]) );
  CLKBUFX3 U13 ( .A(pipeline_reg_in[3]), .Y(ex_op_dest[2]) );
  SDFFTRXL \pipeline_reg_out_reg[7]  ( .RN(n4), .D(pipeline_reg_in[7]), .SI(
        pipeline_reg_out[6]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[7])
         );
  SDFFTRXL \pipeline_reg_out_reg[6]  ( .RN(n5), .D(pipeline_reg_in[6]), .SI(
        pipeline_reg_out[5]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[6])
         );
  SDFFTRXL \pipeline_reg_out_reg[5]  ( .RN(n5), .D(pipeline_reg_in[5]), .SI(
        n25), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[5]) );
  SDFFTRXL \pipeline_reg_out_reg[4]  ( .RN(n4), .D(pipeline_reg_in[4]), .SI(
        n26), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[4]), .QN(n25) );
  SDFFTRXL \pipeline_reg_out_reg[0]  ( .RN(n5), .D(pipeline_reg_in_0), .SI(
        test_si), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[0]), .QN(n29) );
  SDFFTRXL \pipeline_reg_out_reg[15]  ( .RN(n2), .D(pipeline_reg_in[15]), .SI(
        pipeline_reg_out[14]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[15]) );
  SDFFTRXL \pipeline_reg_out_reg[14]  ( .RN(n4), .D(pipeline_reg_in[14]), .SI(
        pipeline_reg_out[13]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[14]) );
  SDFFTRXL \pipeline_reg_out_reg[13]  ( .RN(n6), .D(pipeline_reg_in[13]), .SI(
        pipeline_reg_out[12]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[13]) );
  SDFFTRXL \pipeline_reg_out_reg[3]  ( .RN(n6), .D(pipeline_reg_in[3]), .SI(
        n27), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[3]), .QN(n26) );
  SDFFTRXL \pipeline_reg_out_reg[12]  ( .RN(n4), .D(pipeline_reg_in[12]), .SI(
        pipeline_reg_out[11]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[12]) );
  SDFFTRXL \pipeline_reg_out_reg[11]  ( .RN(n2), .D(pipeline_reg_in[11]), .SI(
        pipeline_reg_out[10]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[11]) );
  SDFFTRXL \pipeline_reg_out_reg[10]  ( .RN(n6), .D(pipeline_reg_in[10]), .SI(
        pipeline_reg_out[9]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[10])
         );
  SDFFTRXL \pipeline_reg_out_reg[9]  ( .RN(n4), .D(pipeline_reg_in[9]), .SI(
        pipeline_reg_out[8]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[9])
         );
  SDFFTRXL \pipeline_reg_out_reg[8]  ( .RN(n5), .D(pipeline_reg_in[8]), .SI(
        pipeline_reg_out[7]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[8])
         );
  SDFFTRXL \pipeline_reg_out_reg[2]  ( .RN(n3), .D(pipeline_reg_in[2]), .SI(
        n28), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[2]), .QN(n27) );
  SDFFTRXL \pipeline_reg_out_reg[1]  ( .RN(n4), .D(pipeline_reg_in[1]), .SI(
        n29), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[1]), .QN(n28) );
  SDFFTRXL \pipeline_reg_out_reg[21]  ( .RN(n6), .D(pipeline_reg_in[21]), .SI(
        pipeline_reg_out[20]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[21]) );
  SDFFTRXL \pipeline_reg_out_reg[20]  ( .RN(n3), .D(pipeline_reg_in[20]), .SI(
        pipeline_reg_out[19]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[20]) );
  SDFFTRXL \pipeline_reg_out_reg[19]  ( .RN(n6), .D(pipeline_reg_in[19]), .SI(
        pipeline_reg_out[18]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[19]) );
  SDFFTRXL \pipeline_reg_out_reg[18]  ( .RN(n6), .D(pipeline_reg_in[18]), .SI(
        pipeline_reg_out[17]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[18]) );
  SDFFTRXL \pipeline_reg_out_reg[17]  ( .RN(n3), .D(pipeline_reg_in[17]), .SI(
        pipeline_reg_out[16]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[17]) );
  SDFFTRXL \pipeline_reg_out_reg[16]  ( .RN(n4), .D(pipeline_reg_in[16]), .SI(
        pipeline_reg_out[15]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[16]) );
  SDFFTRXL \pipeline_reg_out_reg[25]  ( .RN(n5), .D(ex_alu_result[3]), .SI(n22), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[25]), .QN(n21) );
  SDFFTRXL \pipeline_reg_out_reg[28]  ( .RN(n2), .D(ex_alu_result[6]), .SI(n19), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[28]), .QN(n18) );
  SDFFTRXL \pipeline_reg_out_reg[29]  ( .RN(n2), .D(ex_alu_result[7]), .SI(n18), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[29]), .QN(n17) );
  SDFFTRXL \pipeline_reg_out_reg[27]  ( .RN(n2), .D(ex_alu_result[5]), .SI(n20), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[27]), .QN(n19) );
  SDFFTRXL \pipeline_reg_out_reg[23]  ( .RN(n5), .D(ex_alu_result[1]), .SI(n24), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[23]), .QN(n23) );
  SDFFTRXL \pipeline_reg_out_reg[26]  ( .RN(n4), .D(ex_alu_result[4]), .SI(n21), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[26]), .QN(n20) );
  SDFFTRXL \pipeline_reg_out_reg[30]  ( .RN(n5), .D(ex_alu_result[8]), .SI(n17), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[30]), .QN(n16) );
  SDFFTRXL \pipeline_reg_out_reg[22]  ( .RN(n6), .D(ex_alu_result[0]), .SI(
        pipeline_reg_out[21]), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[22]), .QN(n24) );
  SDFFTRXL \pipeline_reg_out_reg[24]  ( .RN(n6), .D(ex_alu_result[2]), .SI(n23), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[24]), .QN(n22) );
  SDFFTRXL \pipeline_reg_out_reg[31]  ( .RN(n2), .D(ex_alu_result[9]), .SI(n16), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[31]), .QN(n15) );
  SDFFTRXL \pipeline_reg_out_reg[32]  ( .RN(n2), .D(ex_alu_result[10]), .SI(
        n15), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[32]), .QN(n14) );
  SDFFTRXL \pipeline_reg_out_reg[33]  ( .RN(n3), .D(ex_alu_result[11]), .SI(
        n14), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[33]), .QN(n13) );
  SDFFTRXL \pipeline_reg_out_reg[34]  ( .RN(n3), .D(ex_alu_result[12]), .SI(
        n13), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[34]), .QN(n12) );
  SDFFTRXL \pipeline_reg_out_reg[36]  ( .RN(n3), .D(ex_alu_result[14]), .SI(
        n11), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[36]), .QN(n10) );
  SDFFTRXL \pipeline_reg_out_reg[35]  ( .RN(n3), .D(ex_alu_result[13]), .SI(
        n12), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[35]), .QN(n11) );
  SDFFTRXL \pipeline_reg_out_reg[37]  ( .RN(n3), .D(ex_alu_result[15]), .SI(
        n10), .SE(test_se), .CK(clk), .Q(pipeline_reg_out[37]), .QN(test_so)
         );
endmodule


module mips_16_core_top ( clk, rst, instruction, pc, reg_read_data_1, 
        reg_read_data_2, reg_write_en, reg_write_dest, reg_write_data, 
        reg_read_addr_1, reg_read_addr_2, mem_read_data, mem_access_addr, 
        mem_write_data, mem_write_en, test_si1, test_so1, test_si2, test_so2, 
        test_se );
  input [15:0] instruction;
  output [7:0] pc;
  input [15:0] reg_read_data_1;
  input [15:0] reg_read_data_2;
  output [2:0] reg_write_dest;
  output [15:0] reg_write_data;
  output [2:0] reg_read_addr_1;
  output [2:0] reg_read_addr_2;
  input [15:0] mem_read_data;
  output [15:0] mem_access_addr;
  output [15:0] mem_write_data;
  input clk, rst, test_si1, test_si2, test_se;
  output reg_write_en, mem_write_en, test_so1, test_so2;
  wire   pipeline_stall_n, branch_taken, n1, n3, n4, n7;
  wire   [5:0] branch_offset_imm;
  wire   [56:0] ID_pipeline_reg_out;
  wire   [2:0] decoding_op_src1;
  wire   [2:0] decoding_op_src2;
  wire   [37:0] EX_pipeline_reg_out;
  wire   [2:0] ex_op_dest;
  wire   [36:0] MEM_pipeline_reg_out;
  wire   [2:0] mem_op_dest;
  wire   [2:0] wb_op_dest;
  assign test_so2 = MEM_pipeline_reg_out[36];

  IF_stage_test_1 IF_stage_inst ( .clk(clk), .rst(rst), .instruction_fetch_en(
        pipeline_stall_n), .branch_offset_imm(branch_offset_imm), 
        .branch_taken(branch_taken), .pc(pc), .test_si(n4), .test_so(n3), 
        .test_se(test_se) );
  ID_stage_test_1 ID_stage_inst ( .clk(clk), .rst(rst), 
        .instruction_decode_en(pipeline_stall_n), .pipeline_reg_out(
        ID_pipeline_reg_out), .instruction(instruction), .branch_offset_imm(
        branch_offset_imm), .branch_taken(branch_taken), .reg_read_addr_1(
        reg_read_addr_1), .reg_read_addr_2(reg_read_addr_2), .reg_read_data_1(
        reg_read_data_1), .reg_read_data_2(reg_read_data_2), 
        .decoding_op_src1(decoding_op_src1), .decoding_op_src2(
        decoding_op_src2), .test_si2(test_si2), .test_si1(n7), .test_so2(n4), 
        .test_so1(test_so1), .test_se(test_se) );
  EX_stage_test_1 EX_stage_inst ( .clk(clk), .rst(rst), .pipeline_reg_in(
        ID_pipeline_reg_out), .pipeline_reg_out(EX_pipeline_reg_out), 
        .ex_op_dest(ex_op_dest), .test_si(test_si1), .test_so(n7), .test_se(
        test_se) );
  MEM_stage_test_1 MEM_stage_inst ( .clk(clk), .rst(rst), .pipeline_reg_in(
        EX_pipeline_reg_out), .pipeline_reg_out(MEM_pipeline_reg_out), 
        .mem_op_dest(mem_op_dest), .mem_read_data(mem_read_data), 
        .ex_alu_result(mem_access_addr), .mem_write_data(mem_write_data), 
        .mem_write_en(mem_write_en), .test_si(n3), .test_se(test_se) );
  WB_stage WB_stage_inst ( .pipeline_reg_in({MEM_pipeline_reg_out[36:1], n1}), 
        .reg_write_en(reg_write_en), .reg_write_dest(reg_write_dest), 
        .reg_write_data(reg_write_data), .wb_op_dest(wb_op_dest) );
  hazard_detection_unit hazard_detection_unit_inst ( .decoding_op_src1(
        decoding_op_src1), .decoding_op_src2(decoding_op_src2), .ex_op_dest(
        ex_op_dest), .mem_op_dest(mem_op_dest), .wb_op_dest(wb_op_dest), 
        .pipeline_stall_n(pipeline_stall_n) );
  CLKBUFX3 U1 ( .A(MEM_pipeline_reg_out[0]), .Y(n1) );
endmodule

