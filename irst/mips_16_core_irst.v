
module IF_stage ( clk, rst, irst_reg_data, irst_done, instruction_fetch_en, 
        branch_offset_imm, branch_taken, pc, write_en );
  input [15:0] irst_reg_data;
  input [5:0] branch_offset_imm;
  output [7:0] pc;
  input clk, rst, instruction_fetch_en, branch_taken;
  output irst_done, write_en;
  wire   irst_reg_data_5, irst_reg_data_4, irst_reg_data_3, irst_reg_data_2,
         irst_reg_data_1, irst_reg_data_0, \pc_reg[7] , N73, N74, N75, N76,
         N77, N78, N79, N81, N82, N83, N84, N85, N86, N87, N88, N89, N92, n13,
         n14, n15, n16, n17, n18, \C1/Z_5 , \C1/Z_4 , \C1/Z_3 , \C1/Z_2 ,
         \C1/Z_1 , \C1/Z_0 , \DP_OP_19J1_127_7285/n8 ,
         \DP_OP_19J1_127_7285/n7 , \DP_OP_19J1_127_7285/n6 ,
         \DP_OP_19J1_127_7285/n5 , \DP_OP_19J1_127_7285/n4 ,
         \DP_OP_19J1_127_7285/n3 , \DP_OP_19J1_127_7285/n2 , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67;
  wire   [1:0] state;
  wire   [5:0] cntr;
  wire   [1:0] next_state;
  assign irst_reg_data_5 = irst_reg_data[5];
  assign irst_reg_data_4 = irst_reg_data[4];
  assign irst_reg_data_3 = irst_reg_data[3];
  assign irst_reg_data_2 = irst_reg_data[2];
  assign irst_reg_data_1 = irst_reg_data[1];
  assign irst_reg_data_0 = irst_reg_data[0];
  assign irst_done = N89;
  assign write_en = N92;

  ADDHXL \DP_OP_19J1_127_7285/U9  ( .A(\C1/Z_0 ), .B(pc[0]), .CO(
        \DP_OP_19J1_127_7285/n8 ), .S(N73) );
  ADDFXL \DP_OP_19J1_127_7285/U8  ( .A(pc[1]), .B(\C1/Z_1 ), .CI(
        \DP_OP_19J1_127_7285/n8 ), .CO(\DP_OP_19J1_127_7285/n7 ), .S(N74) );
  ADDFXL \DP_OP_19J1_127_7285/U7  ( .A(pc[2]), .B(\C1/Z_2 ), .CI(
        \DP_OP_19J1_127_7285/n7 ), .CO(\DP_OP_19J1_127_7285/n6 ), .S(N75) );
  ADDFXL \DP_OP_19J1_127_7285/U6  ( .A(pc[3]), .B(\C1/Z_3 ), .CI(
        \DP_OP_19J1_127_7285/n6 ), .CO(\DP_OP_19J1_127_7285/n5 ), .S(N76) );
  ADDFXL \DP_OP_19J1_127_7285/U5  ( .A(pc[4]), .B(\C1/Z_4 ), .CI(
        \DP_OP_19J1_127_7285/n5 ), .CO(\DP_OP_19J1_127_7285/n4 ), .S(N77) );
  ADDFXL \DP_OP_19J1_127_7285/U4  ( .A(\C1/Z_5 ), .B(pc[5]), .CI(
        \DP_OP_19J1_127_7285/n4 ), .CO(\DP_OP_19J1_127_7285/n3 ), .S(N78) );
  ADDFXL \DP_OP_19J1_127_7285/U3  ( .A(\C1/Z_5 ), .B(pc[6]), .CI(
        \DP_OP_19J1_127_7285/n3 ), .CO(\DP_OP_19J1_127_7285/n2 ), .S(N79) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n36), .Q(state[0]), 
        .QN(n25) );
  DFFRX1 \cntr_reg[4]  ( .D(n16), .CK(clk), .RN(n36), .Q(cntr[4]), .QN(n24) );
  DFFRX1 \cntr_reg[2]  ( .D(n14), .CK(clk), .RN(n36), .Q(cntr[2]), .QN(n23) );
  DFFRX1 \cntr_reg[3]  ( .D(n15), .CK(clk), .RN(n36), .Q(cntr[3]), .QN(n22) );
  DFFRX1 \cntr_reg[1]  ( .D(n13), .CK(clk), .RN(n36), .Q(cntr[1]), .QN(n21) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n36), .Q(state[1]), 
        .QN(n20) );
  DFFRX1 \cntr_reg[0]  ( .D(n18), .CK(clk), .RN(n36), .Q(cntr[0]), .QN(n19) );
  DFFRX1 \cntr_reg[5]  ( .D(n17), .CK(clk), .RN(n36), .Q(cntr[5]) );
  DFFRX1 \pc_reg_reg[4]  ( .D(N85), .CK(clk), .RN(n36), .Q(pc[4]) );
  DFFRX1 \pc_reg_reg[3]  ( .D(N84), .CK(clk), .RN(n36), .Q(pc[3]) );
  DFFRX1 \pc_reg_reg[2]  ( .D(N83), .CK(clk), .RN(n36), .Q(pc[2]) );
  DFFRX1 \pc_reg_reg[1]  ( .D(N82), .CK(clk), .RN(n36), .Q(pc[1]) );
  DFFRX1 \pc_reg_reg[6]  ( .D(N87), .CK(clk), .RN(n36), .Q(pc[6]) );
  DFFRX1 \pc_reg_reg[5]  ( .D(N86), .CK(clk), .RN(n36), .Q(pc[5]) );
  DFFRX1 \pc_reg_reg[0]  ( .D(N81), .CK(clk), .RN(n36), .Q(pc[0]) );
  DFFRX1 \pc_reg_reg[7]  ( .D(N88), .CK(clk), .RN(n36), .Q(\pc_reg[7] ) );
  AOI2BB2X1 U3 ( .B0(\C1/Z_5 ), .B1(\pc_reg[7] ), .A0N(\C1/Z_5 ), .A1N(
        \pc_reg[7] ), .Y(n1) );
  AOI2BB2X1 U4 ( .B0(\DP_OP_19J1_127_7285/n2 ), .B1(n1), .A0N(
        \DP_OP_19J1_127_7285/n2 ), .A1N(n1), .Y(n2) );
  OAI22XL U5 ( .A0(instruction_fetch_en), .A1(\pc_reg[7] ), .B0(n37), .B1(n2), 
        .Y(n27) );
  AND2X1 U6 ( .A(n29), .B(irst_reg_data[13]), .Y(n3) );
  NOR2X1 U7 ( .A(irst_reg_data[12]), .B(n3), .Y(n4) );
  OAI22XL U8 ( .A0(irst_reg_data[9]), .A1(n33), .B0(n34), .B1(irst_reg_data[8]), .Y(n5) );
  OAI2BB1X1 U9 ( .A0N(n33), .A1N(irst_reg_data[9]), .B0(n5), .Y(n6) );
  AOI222XL U10 ( .A0(n32), .A1(irst_reg_data[10]), .B0(n32), .B1(n6), .C0(
        irst_reg_data[10]), .C1(n6), .Y(n7) );
  NOR2X1 U11 ( .A(irst_reg_data[11]), .B(n31), .Y(n8) );
  OAI2BB2XL U12 ( .B0(n7), .B1(n8), .A0N(irst_reg_data[11]), .A1N(n31), .Y(n9)
         );
  AOI211X1 U13 ( .A0(irst_reg_data[12]), .A1(n30), .B0(n9), .C0(n3), .Y(n10)
         );
  OAI22XL U14 ( .A0(n28), .A1(irst_reg_data[14]), .B0(n29), .B1(
        irst_reg_data[13]), .Y(n11) );
  AOI211X1 U15 ( .A0(n4), .A1(n26), .B0(n10), .C0(n11), .Y(n12) );
  AOI32X1 U16 ( .A0(irst_reg_data[14]), .A1(n27), .A2(n28), .B0(n12), .B1(n27), 
        .Y(n45) );
  CLKINVX1 U17 ( .A(rst), .Y(n36) );
  NAND2XL U18 ( .A(cntr[1]), .B(cntr[0]), .Y(n64) );
  NOR2X1 U19 ( .A(n35), .B(n30), .Y(N85) );
  NOR2X1 U20 ( .A(n35), .B(n31), .Y(N84) );
  AOI32XL U21 ( .A0(n61), .A1(cntr[4]), .A2(n60), .B0(n57), .B1(n24), .Y(n16)
         );
  CLKINVX1 U22 ( .A(n55), .Y(n62) );
  NOR2X1 U23 ( .A(n35), .B(n33), .Y(N82) );
  OAI22XL U24 ( .A0(n61), .A1(n22), .B0(n60), .B1(n59), .Y(n15) );
  CLKINVX1 U25 ( .A(n58), .Y(n59) );
  NAND3XL U26 ( .A(n53), .B(state[0]), .C(next_state[1]), .Y(n65) );
  NOR3XL U27 ( .A(n21), .B(n19), .C(n23), .Y(n58) );
  NOR2X1 U28 ( .A(n35), .B(n29), .Y(N86) );
  NOR2X1 U29 ( .A(n35), .B(n34), .Y(N81) );
  NOR2X1 U30 ( .A(n35), .B(n27), .Y(N88) );
  NOR2X1 U31 ( .A(n35), .B(n28), .Y(N87) );
  NOR2X1 U32 ( .A(n35), .B(n32), .Y(N83) );
  OAI21XL U33 ( .A0(state[0]), .A1(state[1]), .B0(n45), .Y(n52) );
  OAI22XL U34 ( .A0(n37), .A1(N75), .B0(instruction_fetch_en), .B1(pc[2]), .Y(
        n32) );
  AND2X2 U35 ( .A(branch_taken), .B(branch_offset_imm[3]), .Y(\C1/Z_3 ) );
  AND2X2 U36 ( .A(branch_taken), .B(branch_offset_imm[4]), .Y(\C1/Z_4 ) );
  NOR2XL U37 ( .A(n25), .B(n20), .Y(N89) );
  NOR2XL U38 ( .A(state[0]), .B(n20), .Y(N92) );
  NOR2X1 U39 ( .A(cntr[1]), .B(n65), .Y(n66) );
  NAND3X1 U40 ( .A(cntr[3]), .B(n56), .C(n58), .Y(n57) );
  NAND2X1 U41 ( .A(n56), .B(n22), .Y(n60) );
  CLKINVX1 U42 ( .A(n65), .Y(n56) );
  NAND2X1 U43 ( .A(n49), .B(n38), .Y(next_state[1]) );
  CLKINVX1 U44 ( .A(next_state[0]), .Y(n53) );
  OAI211X1 U45 ( .A0(n52), .A1(n51), .B0(n50), .C0(n49), .Y(next_state[0]) );
  NAND2X1 U46 ( .A(irst_reg_data[15]), .B(N89), .Y(n49) );
  AOI211X1 U47 ( .A0(cntr[4]), .A1(n44), .B0(n43), .C0(n42), .Y(n46) );
  NOR2BX1 U48 ( .AN(cntr[5]), .B(irst_reg_data_5), .Y(n42) );
  AOI22X1 U49 ( .A0(irst_reg_data_0), .A1(n19), .B0(irst_reg_data_1), .B1(n21), 
        .Y(n40) );
  NOR2BX1 U50 ( .AN(irst_reg_data_5), .B(cntr[5]), .Y(n47) );
  CLKINVX1 U51 ( .A(N92), .Y(n51) );
  CLKINVX1 U52 ( .A(n26), .Y(n30) );
  CLKINVX1 U53 ( .A(instruction_fetch_en), .Y(n37) );
  NAND2BX1 U54 ( .AN(branch_offset_imm[0]), .B(branch_taken), .Y(\C1/Z_0 ) );
  AND2X2 U55 ( .A(branch_taken), .B(branch_offset_imm[1]), .Y(\C1/Z_1 ) );
  AND2X2 U56 ( .A(branch_taken), .B(branch_offset_imm[2]), .Y(\C1/Z_2 ) );
  CLKINVX1 U57 ( .A(n52), .Y(n35) );
  OAI22XL U58 ( .A0(n37), .A1(N73), .B0(instruction_fetch_en), .B1(pc[0]), .Y(
        n34) );
  OAI22XL U59 ( .A0(n37), .A1(N74), .B0(instruction_fetch_en), .B1(pc[1]), .Y(
        n33) );
  OAI22XL U60 ( .A0(n37), .A1(N76), .B0(instruction_fetch_en), .B1(pc[3]), .Y(
        n31) );
  OAI22XL U61 ( .A0(n37), .A1(N78), .B0(instruction_fetch_en), .B1(pc[5]), .Y(
        n29) );
  OAI22XL U62 ( .A0(n37), .A1(N79), .B0(instruction_fetch_en), .B1(pc[6]), .Y(
        n28) );
  OAI211XL U63 ( .A0(state[0]), .A1(irst_reg_data[15]), .B0(n48), .C0(n20), 
        .Y(n50) );
  OAI211XL U64 ( .A0(n47), .A1(n46), .B0(state[0]), .C0(n45), .Y(n48) );
  OA22X1 U65 ( .A0(n37), .A1(N77), .B0(instruction_fetch_en), .B1(pc[4]), .Y(
        n26) );
  AND2XL U66 ( .A(branch_taken), .B(branch_offset_imm[5]), .Y(\C1/Z_5 ) );
  AO22X1 U67 ( .A0(n51), .A1(n52), .B0(n45), .B1(state[1]), .Y(n38) );
  OAI22XL U68 ( .A0(irst_reg_data_1), .A1(n21), .B0(irst_reg_data_2), .B1(n23), 
        .Y(n39) );
  OAI2BB2XL U69 ( .B0(n40), .B1(n39), .A0N(n23), .A1N(irst_reg_data_2), .Y(n41) );
  AOI222XL U70 ( .A0(irst_reg_data_3), .A1(n22), .B0(irst_reg_data_3), .B1(n41), .C0(n22), .C1(n41), .Y(n44) );
  AOI2BB1X1 U71 ( .A0N(n44), .A1N(cntr[4]), .B0(irst_reg_data_4), .Y(n43) );
  OAI21XL U72 ( .A0(state[1]), .A1(n53), .B0(state[0]), .Y(n55) );
  OAI22XL U73 ( .A0(cntr[0]), .A1(n65), .B0(n19), .B1(n62), .Y(n18) );
  OAI21XL U74 ( .A0(n56), .A1(n55), .B0(cntr[5]), .Y(n54) );
  OAI21XL U75 ( .A0(n57), .A1(n24), .B0(n54), .Y(n17) );
  AOI2BB1X1 U76 ( .A0N(n58), .A1N(n65), .B0(n55), .Y(n61) );
  OAI21XL U77 ( .A0(cntr[0]), .A1(n65), .B0(n62), .Y(n67) );
  OAI21XL U78 ( .A0(n66), .A1(n67), .B0(cntr[2]), .Y(n63) );
  OAI31XL U79 ( .A0(cntr[2]), .A1(n65), .A2(n64), .B0(n63), .Y(n14) );
  AO22X1 U80 ( .A0(cntr[1]), .A1(n67), .B0(cntr[0]), .B1(n66), .Y(n13) );
  AO21X1 U81 ( .A0(n25), .A1(\pc_reg[7] ), .B0(N92), .Y(pc[7]) );
endmodule


module randomizer ( rand_data, inst, rand_inst );
  input [15:0] rand_data;
  input [15:0] inst;
  output [15:0] rand_inst;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13;

  NOR3BXL U3 ( .AN(inst[15]), .B(inst[14]), .C(n7), .Y(n6) );
  CLKINVX1 U4 ( .A(n6), .Y(n5) );
  CLKINVX1 U5 ( .A(n9), .Y(n8) );
  NOR2X1 U6 ( .A(inst[13]), .B(inst[12]), .Y(n7) );
  CLKINVX1 U7 ( .A(n10), .Y(n11) );
  NOR3X1 U8 ( .A(inst[13]), .B(inst[12]), .C(n10), .Y(n13) );
  CLKBUFX3 U9 ( .A(inst[15]), .Y(rand_inst[15]) );
  CLKBUFX3 U10 ( .A(inst[13]), .Y(rand_inst[13]) );
  CLKBUFX3 U11 ( .A(inst[14]), .Y(rand_inst[14]) );
  CLKBUFX3 U12 ( .A(inst[12]), .Y(rand_inst[12]) );
  AO22X1 U13 ( .A0(n6), .A1(rand_data[0]), .B0(n5), .B1(inst[0]), .Y(
        rand_inst[0]) );
  NAND2X1 U14 ( .A(inst[15]), .B(inst[14]), .Y(n10) );
  AO22X1 U15 ( .A0(n11), .A1(inst[10]), .B0(n10), .B1(rand_data[10]), .Y(
        rand_inst[10]) );
  AO22X1 U16 ( .A0(n11), .A1(inst[11]), .B0(n10), .B1(rand_data[11]), .Y(
        rand_inst[11]) );
  AO22X1 U17 ( .A0(n6), .A1(rand_data[1]), .B0(n5), .B1(inst[1]), .Y(
        rand_inst[1]) );
  AO22X1 U18 ( .A0(n6), .A1(rand_data[2]), .B0(n5), .B1(inst[2]), .Y(
        rand_inst[2]) );
  NOR2X1 U19 ( .A(n7), .B(n10), .Y(n9) );
  AO22X1 U20 ( .A0(n9), .A1(inst[3]), .B0(n8), .B1(rand_data[3]), .Y(
        rand_inst[3]) );
  AO22X1 U21 ( .A0(n9), .A1(inst[4]), .B0(n8), .B1(rand_data[4]), .Y(
        rand_inst[4]) );
  AO22X1 U22 ( .A0(n9), .A1(inst[5]), .B0(n8), .B1(rand_data[5]), .Y(
        rand_inst[5]) );
  AO22X1 U23 ( .A0(n9), .A1(inst[6]), .B0(n8), .B1(rand_data[6]), .Y(
        rand_inst[6]) );
  AO22X1 U24 ( .A0(n9), .A1(inst[7]), .B0(n8), .B1(rand_data[7]), .Y(
        rand_inst[7]) );
  AO22X1 U25 ( .A0(n9), .A1(inst[8]), .B0(n8), .B1(rand_data[8]), .Y(
        rand_inst[8]) );
  OAI22XL U26 ( .A0(n11), .A1(rand_data[9]), .B0(n10), .B1(inst[9]), .Y(n12)
         );
  OAI31XL U27 ( .A0(n13), .A1(rand_inst[11]), .A2(rand_inst[10]), .B0(n12), 
        .Y(rand_inst[9]) );
endmodule


module ID_stage ( clk, rst, instruction_decode_en, pipeline_reg_out, 
        instruction, branch_offset_imm, branch_taken, reg_read_addr_1, 
        reg_read_addr_2, reg_read_data_1, reg_read_data_2, decoding_op_src1, 
        decoding_op_src2 );
  output [56:0] pipeline_reg_out;
  input [15:0] instruction;
  output [5:0] branch_offset_imm;
  output [2:0] reg_read_addr_1;
  output [2:0] reg_read_addr_2;
  input [15:0] reg_read_data_1;
  input [15:0] reg_read_data_2;
  output [2:0] decoding_op_src1;
  output [2:0] decoding_op_src2;
  input clk, rst, instruction_decode_en;
  output branch_taken;
  wire   write_back_en, write_back_result_mux, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n24, n26, n27,
         n29, n30, n51, n1, n21, n22, n23, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68;
  wire   [15:9] instruction_reg;
  wire   [2:0] ir_dest_with_bubble;
  wire   [2:0] ex_alu_cmd;
  wire   [15:0] ex_alu_src2;

  DFFRX1 \instruction_reg_reg[12]  ( .D(n17), .CK(clk), .RN(n32), .Q(n23), 
        .QN(n29) );
  DFFRX1 \instruction_reg_reg[14]  ( .D(n19), .CK(clk), .RN(n32), .Q(n22), 
        .QN(n26) );
  DFFRX1 \instruction_reg_reg[15]  ( .D(n20), .CK(clk), .RN(n32), .Q(n21), 
        .QN(n24) );
  DFFRX1 \instruction_reg_reg[13]  ( .D(n18), .CK(clk), .RN(n32), .Q(n1), .QN(
        n27) );
  DFFSX1 \pipeline_reg_out_reg[21]  ( .D(n51), .CK(clk), .SN(n30), .QN(
        pipeline_reg_out[21]) );
  DFFRX1 \pipeline_reg_out_reg[24]  ( .D(ex_alu_src2[2]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[24]) );
  DFFRX1 \pipeline_reg_out_reg[20]  ( .D(reg_read_data_2[15]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[20]) );
  DFFRX1 \pipeline_reg_out_reg[19]  ( .D(reg_read_data_2[14]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[19]) );
  DFFRX1 \pipeline_reg_out_reg[18]  ( .D(reg_read_data_2[13]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[18]) );
  DFFRX1 \pipeline_reg_out_reg[17]  ( .D(reg_read_data_2[12]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[17]) );
  DFFRX1 \pipeline_reg_out_reg[16]  ( .D(reg_read_data_2[11]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[16]) );
  DFFRX1 \pipeline_reg_out_reg[15]  ( .D(reg_read_data_2[10]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[15]) );
  DFFRX1 \pipeline_reg_out_reg[14]  ( .D(reg_read_data_2[9]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[14]) );
  DFFRX1 \pipeline_reg_out_reg[13]  ( .D(reg_read_data_2[8]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[13]) );
  DFFRX1 \pipeline_reg_out_reg[12]  ( .D(reg_read_data_2[7]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[12]) );
  DFFRX1 \pipeline_reg_out_reg[11]  ( .D(reg_read_data_2[6]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[11]) );
  DFFRX1 \pipeline_reg_out_reg[10]  ( .D(reg_read_data_2[5]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[10]) );
  DFFRX1 \pipeline_reg_out_reg[9]  ( .D(reg_read_data_2[4]), .CK(clk), .RN(n32), .Q(pipeline_reg_out[9]) );
  DFFRX1 \pipeline_reg_out_reg[8]  ( .D(reg_read_data_2[3]), .CK(clk), .RN(n32), .Q(pipeline_reg_out[8]) );
  DFFRX1 \pipeline_reg_out_reg[7]  ( .D(reg_read_data_2[2]), .CK(clk), .RN(n32), .Q(pipeline_reg_out[7]) );
  DFFRX1 \pipeline_reg_out_reg[6]  ( .D(reg_read_data_2[1]), .CK(clk), .RN(n32), .Q(pipeline_reg_out[6]) );
  DFFRX1 \pipeline_reg_out_reg[5]  ( .D(reg_read_data_2[0]), .CK(clk), .RN(n32), .Q(pipeline_reg_out[5]) );
  DFFRX1 \pipeline_reg_out_reg[4]  ( .D(write_back_en), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[4]) );
  DFFRX1 \pipeline_reg_out_reg[0]  ( .D(write_back_result_mux), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[0]) );
  DFFRX1 \instruction_reg_reg[11]  ( .D(n16), .CK(clk), .RN(n32), .Q(
        instruction_reg[11]) );
  DFFRX1 \instruction_reg_reg[10]  ( .D(n15), .CK(clk), .RN(n32), .Q(
        instruction_reg[10]) );
  DFFRX1 \instruction_reg_reg[9]  ( .D(n14), .CK(clk), .RN(n32), .Q(
        instruction_reg[9]) );
  DFFRX1 \pipeline_reg_out_reg[3]  ( .D(ir_dest_with_bubble[2]), .CK(clk), 
        .RN(n32), .Q(pipeline_reg_out[3]) );
  DFFRX1 \pipeline_reg_out_reg[2]  ( .D(ir_dest_with_bubble[1]), .CK(clk), 
        .RN(n32), .Q(pipeline_reg_out[2]) );
  DFFRX1 \pipeline_reg_out_reg[1]  ( .D(ir_dest_with_bubble[0]), .CK(clk), 
        .RN(n32), .Q(pipeline_reg_out[1]) );
  DFFRX1 \instruction_reg_reg[0]  ( .D(n5), .CK(clk), .RN(n32), .Q(
        branch_offset_imm[0]) );
  DFFRX1 \instruction_reg_reg[7]  ( .D(n12), .CK(clk), .RN(n32), .Q(
        decoding_op_src1[1]), .QN(n3) );
  DFFRX1 \pipeline_reg_out_reg[28]  ( .D(ex_alu_src2[6]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[28]) );
  DFFRX1 \pipeline_reg_out_reg[36]  ( .D(ex_alu_src2[14]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[36]) );
  DFFRX1 \pipeline_reg_out_reg[30]  ( .D(ex_alu_src2[8]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[30]) );
  DFFRX1 \instruction_reg_reg[2]  ( .D(n7), .CK(clk), .RN(n32), .Q(
        branch_offset_imm[2]) );
  DFFRX1 \instruction_reg_reg[1]  ( .D(n6), .CK(clk), .RN(n32), .Q(
        branch_offset_imm[1]) );
  DFFRX1 \instruction_reg_reg[4]  ( .D(n9), .CK(clk), .RN(n32), .Q(
        branch_offset_imm[4]) );
  DFFRX1 \instruction_reg_reg[3]  ( .D(n8), .CK(clk), .RN(n32), .Q(
        branch_offset_imm[3]) );
  DFFRX1 \pipeline_reg_out_reg[41]  ( .D(reg_read_data_1[3]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[41]) );
  DFFRX1 \instruction_reg_reg[5]  ( .D(n10), .CK(clk), .RN(n32), .Q(
        branch_offset_imm[5]) );
  DFFRX1 \pipeline_reg_out_reg[45]  ( .D(reg_read_data_1[7]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[45]) );
  DFFRX1 \instruction_reg_reg[8]  ( .D(n13), .CK(clk), .RN(n32), .Q(
        decoding_op_src1[2]), .QN(n2) );
  DFFRX1 \pipeline_reg_out_reg[34]  ( .D(ex_alu_src2[12]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[34]) );
  DFFRX1 \pipeline_reg_out_reg[32]  ( .D(ex_alu_src2[10]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[32]) );
  DFFRX1 \pipeline_reg_out_reg[33]  ( .D(ex_alu_src2[11]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[33]) );
  DFFRX1 \pipeline_reg_out_reg[29]  ( .D(ex_alu_src2[7]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[29]) );
  DFFRX1 \pipeline_reg_out_reg[31]  ( .D(ex_alu_src2[9]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[31]) );
  DFFRX1 \pipeline_reg_out_reg[37]  ( .D(ex_alu_src2[15]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[37]) );
  DFFRX1 \pipeline_reg_out_reg[27]  ( .D(ex_alu_src2[5]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[27]) );
  DFFRX1 \pipeline_reg_out_reg[48]  ( .D(reg_read_data_1[10]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[48]) );
  DFFRX1 \pipeline_reg_out_reg[35]  ( .D(ex_alu_src2[13]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[35]) );
  DFFRX1 \pipeline_reg_out_reg[49]  ( .D(reg_read_data_1[11]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[49]) );
  DFFRX1 \pipeline_reg_out_reg[47]  ( .D(reg_read_data_1[9]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[47]) );
  DFFRX1 \instruction_reg_reg[6]  ( .D(n11), .CK(clk), .RN(n30), .Q(
        decoding_op_src1[0]), .QN(n4) );
  DFFRX1 \pipeline_reg_out_reg[51]  ( .D(reg_read_data_1[13]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[51]) );
  DFFRX1 \pipeline_reg_out_reg[39]  ( .D(reg_read_data_1[1]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[39]) );
  DFFRX1 \pipeline_reg_out_reg[38]  ( .D(reg_read_data_1[0]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[38]) );
  DFFRX1 \pipeline_reg_out_reg[53]  ( .D(reg_read_data_1[15]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[53]) );
  DFFRX1 \pipeline_reg_out_reg[43]  ( .D(reg_read_data_1[5]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[43]) );
  DFFRX1 \pipeline_reg_out_reg[50]  ( .D(reg_read_data_1[12]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[50]) );
  DFFRX1 \pipeline_reg_out_reg[42]  ( .D(reg_read_data_1[4]), .CK(clk), .RN(
        n32), .Q(pipeline_reg_out[42]) );
  DFFRX1 \pipeline_reg_out_reg[22]  ( .D(ex_alu_src2[0]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[22]) );
  DFFRX1 \pipeline_reg_out_reg[23]  ( .D(ex_alu_src2[1]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[23]) );
  DFFRX1 \pipeline_reg_out_reg[40]  ( .D(reg_read_data_1[2]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[40]) );
  DFFRX1 \pipeline_reg_out_reg[54]  ( .D(ex_alu_cmd[0]), .CK(clk), .RN(n32), 
        .Q(pipeline_reg_out[54]) );
  DFFRX1 \pipeline_reg_out_reg[26]  ( .D(ex_alu_src2[4]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[26]) );
  DFFRX1 \pipeline_reg_out_reg[44]  ( .D(reg_read_data_1[6]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[44]) );
  DFFRX1 \pipeline_reg_out_reg[52]  ( .D(reg_read_data_1[14]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[52]) );
  DFFRX1 \pipeline_reg_out_reg[46]  ( .D(reg_read_data_1[8]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[46]) );
  DFFRX1 \pipeline_reg_out_reg[25]  ( .D(ex_alu_src2[3]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[25]) );
  DFFRX1 \pipeline_reg_out_reg[55]  ( .D(ex_alu_cmd[1]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[55]) );
  DFFRX1 \pipeline_reg_out_reg[56]  ( .D(ex_alu_cmd[2]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[56]) );
  CLKBUFX3 U3 ( .A(n30), .Y(n32) );
  NAND2X1 U4 ( .A(n50), .B(n46), .Y(ex_alu_cmd[0]) );
  OAI211X1 U5 ( .A0(n55), .A1(n47), .B0(n49), .C0(n54), .Y(n46) );
  NAND4X1 U6 ( .A(n64), .B(n60), .C(n61), .D(n30), .Y(n50) );
  CLKINVX1 U7 ( .A(n49), .Y(n52) );
  NOR2X1 U8 ( .A(n64), .B(rst), .Y(n49) );
  NOR4X1 U9 ( .A(ir_dest_with_bubble[2]), .B(ir_dest_with_bubble[1]), .C(
        reg_read_data_1[12]), .D(reg_read_data_1[14]), .Y(n36) );
  AOI211X1 U10 ( .A0(n67), .A1(n66), .B0(rst), .C0(n65), .Y(write_back_en) );
  CLKINVX1 U11 ( .A(n64), .Y(n62) );
  NAND2X1 U12 ( .A(n60), .B(n61), .Y(n63) );
  NAND2XL U13 ( .A(branch_offset_imm[5]), .B(n57), .Y(n58) );
  CLKINVX1 U14 ( .A(n59), .Y(n57) );
  AOI31X1 U15 ( .A0(n64), .A1(n30), .A2(n56), .B0(write_back_result_mux), .Y(
        n59) );
  NOR3BXL U16 ( .AN(n67), .B(n66), .C(rst), .Y(write_back_result_mux) );
  NOR4XL U17 ( .A(n22), .B(n68), .C(n24), .D(n27), .Y(n67) );
  OAI21XL U18 ( .A0(n55), .A1(n54), .B0(n53), .Y(n56) );
  NAND2X1 U19 ( .A(n55), .B(n60), .Y(n53) );
  NOR2XL U20 ( .A(n27), .B(n68), .Y(n47) );
  NOR2XL U21 ( .A(n29), .B(n68), .Y(n66) );
  NOR2XL U22 ( .A(n26), .B(n68), .Y(n55) );
  CLKINVX1 U23 ( .A(rst), .Y(n30) );
  NOR2XL U24 ( .A(n24), .B(n68), .Y(n64) );
  CLKINVX1 U25 ( .A(instruction_decode_en), .Y(n68) );
  NOR2X1 U26 ( .A(n1), .B(n43), .Y(n41) );
  NAND4XL U27 ( .A(n26), .B(n23), .C(n21), .D(n1), .Y(n51) );
  NOR3X1 U28 ( .A(ir_dest_with_bubble[0]), .B(n39), .C(n38), .Y(branch_taken)
         );
  NAND4X1 U29 ( .A(n37), .B(n36), .C(n35), .D(n34), .Y(n38) );
  NOR4X1 U30 ( .A(reg_read_data_1[1]), .B(reg_read_data_1[10]), .C(
        reg_read_data_1[9]), .D(reg_read_data_1[7]), .Y(n34) );
  NOR4X1 U31 ( .A(reg_read_data_1[5]), .B(reg_read_data_1[4]), .C(
        reg_read_data_1[2]), .D(reg_read_data_1[6]), .Y(n35) );
  NOR4X1 U32 ( .A(reg_read_data_1[15]), .B(reg_read_data_1[11]), .C(
        reg_read_data_1[0]), .D(reg_read_data_1[13]), .Y(n37) );
  CLKINVX1 U33 ( .A(n55), .Y(n61) );
  NOR2BX1 U34 ( .AN(instruction_reg[11]), .B(n68), .Y(ir_dest_with_bubble[2])
         );
  NOR2BX1 U35 ( .AN(instruction_reg[10]), .B(n68), .Y(ir_dest_with_bubble[1])
         );
  NOR2BX1 U36 ( .AN(instruction_reg[9]), .B(n68), .Y(ir_dest_with_bubble[0])
         );
  NOR2X1 U37 ( .A(n66), .B(n47), .Y(n60) );
  CLKINVX1 U38 ( .A(n66), .Y(n54) );
  NOR2BX1 U39 ( .AN(reg_read_addr_2[2]), .B(n45), .Y(decoding_op_src2[2]) );
  NOR2BX1 U40 ( .AN(reg_read_addr_2[1]), .B(n45), .Y(decoding_op_src2[1]) );
  NOR2BX1 U41 ( .AN(reg_read_addr_2[0]), .B(n45), .Y(decoding_op_src2[0]) );
  AOI211X1 U42 ( .A0(n1), .A1(n43), .B0(n42), .C0(n41), .Y(n45) );
  CLKINVX1 U43 ( .A(n51), .Y(n44) );
  NAND3XL U44 ( .A(n33), .B(n22), .C(n21), .Y(n39) );
  NOR4XL U45 ( .A(reg_read_data_1[8]), .B(reg_read_data_1[3]), .C(n1), .D(n23), 
        .Y(n33) );
  NOR2XL U46 ( .A(n24), .B(n22), .Y(n40) );
  NAND3XL U47 ( .A(n26), .B(n29), .C(n21), .Y(n43) );
  CLKBUFX3 U48 ( .A(decoding_op_src1[2]), .Y(reg_read_addr_1[2]) );
  CLKBUFX3 U49 ( .A(decoding_op_src1[1]), .Y(reg_read_addr_1[1]) );
  CLKBUFX3 U50 ( .A(decoding_op_src1[0]), .Y(reg_read_addr_1[0]) );
  AO22X1 U51 ( .A0(n44), .A1(instruction_reg[9]), .B0(n51), .B1(
        branch_offset_imm[3]), .Y(reg_read_addr_2[0]) );
  OAI22XL U52 ( .A0(n26), .A1(n21), .B0(n29), .B1(n40), .Y(n42) );
  AO22X1 U53 ( .A0(n44), .A1(instruction_reg[10]), .B0(n51), .B1(
        branch_offset_imm[4]), .Y(reg_read_addr_2[1]) );
  AO22X1 U54 ( .A0(n44), .A1(instruction_reg[11]), .B0(n51), .B1(
        branch_offset_imm[5]), .Y(reg_read_addr_2[2]) );
  OAI2BB1X1 U55 ( .A0N(n47), .A1N(n66), .B0(n53), .Y(n48) );
  OAI2BB1X1 U56 ( .A0N(n49), .A1N(n48), .B0(n50), .Y(ex_alu_cmd[1]) );
  OAI31XL U57 ( .A0(n60), .A1(n61), .A2(n52), .B0(n50), .Y(ex_alu_cmd[2]) );
  AO22X1 U58 ( .A0(n59), .A1(reg_read_data_2[0]), .B0(n57), .B1(
        branch_offset_imm[0]), .Y(ex_alu_src2[0]) );
  OAI2BB1X1 U59 ( .A0N(n59), .A1N(reg_read_data_2[10]), .B0(n58), .Y(
        ex_alu_src2[10]) );
  OAI2BB1X1 U60 ( .A0N(n59), .A1N(reg_read_data_2[11]), .B0(n58), .Y(
        ex_alu_src2[11]) );
  OAI2BB1X1 U61 ( .A0N(n59), .A1N(reg_read_data_2[12]), .B0(n58), .Y(
        ex_alu_src2[12]) );
  OAI2BB1X1 U62 ( .A0N(n59), .A1N(reg_read_data_2[13]), .B0(n58), .Y(
        ex_alu_src2[13]) );
  OAI2BB1X1 U63 ( .A0N(n59), .A1N(reg_read_data_2[14]), .B0(n58), .Y(
        ex_alu_src2[14]) );
  OAI2BB1X1 U64 ( .A0N(n59), .A1N(reg_read_data_2[15]), .B0(n58), .Y(
        ex_alu_src2[15]) );
  AO22X1 U65 ( .A0(n59), .A1(reg_read_data_2[1]), .B0(n57), .B1(
        branch_offset_imm[1]), .Y(ex_alu_src2[1]) );
  AO22X1 U66 ( .A0(n59), .A1(reg_read_data_2[2]), .B0(n57), .B1(
        branch_offset_imm[2]), .Y(ex_alu_src2[2]) );
  AO22X1 U67 ( .A0(n59), .A1(reg_read_data_2[3]), .B0(n57), .B1(
        branch_offset_imm[3]), .Y(ex_alu_src2[3]) );
  AO22X1 U68 ( .A0(n59), .A1(reg_read_data_2[4]), .B0(n57), .B1(
        branch_offset_imm[4]), .Y(ex_alu_src2[4]) );
  OAI2BB1X1 U69 ( .A0N(n59), .A1N(reg_read_data_2[5]), .B0(n58), .Y(
        ex_alu_src2[5]) );
  OAI2BB1X1 U70 ( .A0N(n59), .A1N(reg_read_data_2[6]), .B0(n58), .Y(
        ex_alu_src2[6]) );
  OAI2BB1X1 U71 ( .A0N(n59), .A1N(reg_read_data_2[7]), .B0(n58), .Y(
        ex_alu_src2[7]) );
  OAI2BB1X1 U72 ( .A0N(n59), .A1N(reg_read_data_2[8]), .B0(n58), .Y(
        ex_alu_src2[8]) );
  OAI2BB1X1 U73 ( .A0N(n59), .A1N(reg_read_data_2[9]), .B0(n58), .Y(
        ex_alu_src2[9]) );
  OAI22XL U74 ( .A0(n64), .A1(n63), .B0(n62), .B1(n61), .Y(n65) );
  AO22X1 U75 ( .A0(instruction_decode_en), .A1(instruction[0]), .B0(n68), .B1(
        branch_offset_imm[0]), .Y(n5) );
  AO22X1 U76 ( .A0(instruction_decode_en), .A1(instruction[1]), .B0(n68), .B1(
        branch_offset_imm[1]), .Y(n6) );
  AO22X1 U77 ( .A0(instruction_decode_en), .A1(instruction[2]), .B0(n68), .B1(
        branch_offset_imm[2]), .Y(n7) );
  AO22X1 U78 ( .A0(instruction_decode_en), .A1(instruction[3]), .B0(n68), .B1(
        branch_offset_imm[3]), .Y(n8) );
  AO22X1 U79 ( .A0(instruction_decode_en), .A1(instruction[4]), .B0(n68), .B1(
        branch_offset_imm[4]), .Y(n9) );
  AO22X1 U80 ( .A0(instruction_decode_en), .A1(instruction[5]), .B0(n68), .B1(
        branch_offset_imm[5]), .Y(n10) );
  AOI2BB2X1 U81 ( .B0(n68), .B1(n4), .A0N(n68), .A1N(instruction[6]), .Y(n11)
         );
  AOI2BB2X1 U82 ( .B0(n68), .B1(n3), .A0N(n68), .A1N(instruction[7]), .Y(n12)
         );
  AOI2BB2X1 U83 ( .B0(n68), .B1(n2), .A0N(n68), .A1N(instruction[8]), .Y(n13)
         );
  OA22X1 U84 ( .A0(instruction_decode_en), .A1(instruction_reg[9]), .B0(n68), 
        .B1(instruction[9]), .Y(n14) );
  OA22X1 U85 ( .A0(instruction_decode_en), .A1(instruction_reg[10]), .B0(n68), 
        .B1(instruction[10]), .Y(n15) );
  OA22X1 U86 ( .A0(instruction_decode_en), .A1(instruction_reg[11]), .B0(n68), 
        .B1(instruction[11]), .Y(n16) );
  AOI2BB2X1 U87 ( .B0(n68), .B1(n29), .A0N(n68), .A1N(instruction[12]), .Y(n17) );
  AOI2BB2X1 U88 ( .B0(n68), .B1(n27), .A0N(n68), .A1N(instruction[13]), .Y(n18) );
  AOI2BB2X1 U89 ( .B0(n68), .B1(n26), .A0N(n68), .A1N(instruction[14]), .Y(n19) );
  AOI2BB2X1 U90 ( .B0(n68), .B1(n24), .A0N(n68), .A1N(instruction[15]), .Y(n20) );
endmodule


module alu ( a, b, cmd, r );
  input [15:0] a;
  input [15:0] b;
  input [2:0] cmd;
  output [15:0] r;
  wire   \C4/DATA8_0 , \C4/DATA8_1 , \C4/DATA8_2 , \C4/DATA8_3 , \C4/DATA8_4 ,
         \C4/DATA8_5 , \C4/DATA8_6 , \C4/DATA8_7 , \C4/DATA8_8 , \C4/DATA8_9 ,
         \C4/DATA8_10 , \C4/DATA8_11 , \C4/DATA8_12 , \C4/DATA8_13 ,
         \C4/DATA8_14 , \DP_OP_21J1_124_1250/n53 , \DP_OP_21J1_124_1250/n36 ,
         \DP_OP_21J1_124_1250/n35 , \DP_OP_21J1_124_1250/n34 ,
         \DP_OP_21J1_124_1250/n33 , \DP_OP_21J1_124_1250/n32 ,
         \DP_OP_21J1_124_1250/n31 , \DP_OP_21J1_124_1250/n30 ,
         \DP_OP_21J1_124_1250/n29 , \DP_OP_21J1_124_1250/n28 ,
         \DP_OP_21J1_124_1250/n27 , \DP_OP_21J1_124_1250/n26 ,
         \DP_OP_21J1_124_1250/n25 , \DP_OP_21J1_124_1250/n24 ,
         \DP_OP_21J1_124_1250/n23 , \DP_OP_21J1_124_1250/n22 ,
         \DP_OP_21J1_124_1250/n16 , \DP_OP_21J1_124_1250/n15 ,
         \DP_OP_21J1_124_1250/n14 , \DP_OP_21J1_124_1250/n13 ,
         \DP_OP_21J1_124_1250/n12 , \DP_OP_21J1_124_1250/n11 ,
         \DP_OP_21J1_124_1250/n10 , \DP_OP_21J1_124_1250/n9 ,
         \DP_OP_21J1_124_1250/n8 , \DP_OP_21J1_124_1250/n7 ,
         \DP_OP_21J1_124_1250/n6 , \DP_OP_21J1_124_1250/n5 ,
         \DP_OP_21J1_124_1250/n4 , \DP_OP_21J1_124_1250/n3 ,
         \DP_OP_21J1_124_1250/n2 , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347;

  ADDFXL \DP_OP_21J1_124_1250/U17  ( .A(a[0]), .B(\DP_OP_21J1_124_1250/n53 ), 
        .CI(\DP_OP_21J1_124_1250/n36 ), .CO(\DP_OP_21J1_124_1250/n16 ), .S(
        \C4/DATA8_0 ) );
  ADDFXL \DP_OP_21J1_124_1250/U16  ( .A(\DP_OP_21J1_124_1250/n35 ), .B(a[1]), 
        .CI(\DP_OP_21J1_124_1250/n16 ), .CO(\DP_OP_21J1_124_1250/n15 ), .S(
        \C4/DATA8_1 ) );
  ADDFXL \DP_OP_21J1_124_1250/U15  ( .A(\DP_OP_21J1_124_1250/n34 ), .B(a[2]), 
        .CI(\DP_OP_21J1_124_1250/n15 ), .CO(\DP_OP_21J1_124_1250/n14 ), .S(
        \C4/DATA8_2 ) );
  ADDFXL \DP_OP_21J1_124_1250/U14  ( .A(\DP_OP_21J1_124_1250/n33 ), .B(a[3]), 
        .CI(\DP_OP_21J1_124_1250/n14 ), .CO(\DP_OP_21J1_124_1250/n13 ), .S(
        \C4/DATA8_3 ) );
  ADDFXL \DP_OP_21J1_124_1250/U13  ( .A(\DP_OP_21J1_124_1250/n32 ), .B(a[4]), 
        .CI(\DP_OP_21J1_124_1250/n13 ), .CO(\DP_OP_21J1_124_1250/n12 ), .S(
        \C4/DATA8_4 ) );
  ADDFXL \DP_OP_21J1_124_1250/U12  ( .A(\DP_OP_21J1_124_1250/n31 ), .B(a[5]), 
        .CI(\DP_OP_21J1_124_1250/n12 ), .CO(\DP_OP_21J1_124_1250/n11 ), .S(
        \C4/DATA8_5 ) );
  ADDFXL \DP_OP_21J1_124_1250/U10  ( .A(\DP_OP_21J1_124_1250/n29 ), .B(a[7]), 
        .CI(\DP_OP_21J1_124_1250/n10 ), .CO(\DP_OP_21J1_124_1250/n9 ), .S(
        \C4/DATA8_7 ) );
  ADDFXL \DP_OP_21J1_124_1250/U8  ( .A(\DP_OP_21J1_124_1250/n27 ), .B(a[9]), 
        .CI(\DP_OP_21J1_124_1250/n8 ), .CO(\DP_OP_21J1_124_1250/n7 ), .S(
        \C4/DATA8_9 ) );
  ADDFXL \DP_OP_21J1_124_1250/U7  ( .A(\DP_OP_21J1_124_1250/n26 ), .B(a[10]), 
        .CI(\DP_OP_21J1_124_1250/n7 ), .CO(\DP_OP_21J1_124_1250/n6 ), .S(
        \C4/DATA8_10 ) );
  ADDFXL \DP_OP_21J1_124_1250/U6  ( .A(\DP_OP_21J1_124_1250/n25 ), .B(a[11]), 
        .CI(\DP_OP_21J1_124_1250/n6 ), .CO(\DP_OP_21J1_124_1250/n5 ), .S(
        \C4/DATA8_11 ) );
  ADDFXL \DP_OP_21J1_124_1250/U5  ( .A(\DP_OP_21J1_124_1250/n24 ), .B(a[12]), 
        .CI(\DP_OP_21J1_124_1250/n5 ), .CO(\DP_OP_21J1_124_1250/n4 ), .S(
        \C4/DATA8_12 ) );
  ADDFXL \DP_OP_21J1_124_1250/U4  ( .A(\DP_OP_21J1_124_1250/n23 ), .B(a[13]), 
        .CI(\DP_OP_21J1_124_1250/n4 ), .CO(\DP_OP_21J1_124_1250/n3 ), .S(
        \C4/DATA8_13 ) );
  XOR2XL \DP_OP_21J1_124_1250/U35  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[0]), 
        .Y(\DP_OP_21J1_124_1250/n36 ) );
  XOR2XL \DP_OP_21J1_124_1250/U34  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[1]), 
        .Y(\DP_OP_21J1_124_1250/n35 ) );
  XOR2XL \DP_OP_21J1_124_1250/U30  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[5]), 
        .Y(\DP_OP_21J1_124_1250/n31 ) );
  XOR2XL \DP_OP_21J1_124_1250/U31  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[4]), 
        .Y(\DP_OP_21J1_124_1250/n32 ) );
  XOR2XL \DP_OP_21J1_124_1250/U32  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[3]), 
        .Y(\DP_OP_21J1_124_1250/n33 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U33  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[2]), 
        .Y(\DP_OP_21J1_124_1250/n34 ) );
  ADDFXL \DP_OP_21J1_124_1250/U9  ( .A(\DP_OP_21J1_124_1250/n28 ), .B(a[8]), 
        .CI(\DP_OP_21J1_124_1250/n9 ), .CO(\DP_OP_21J1_124_1250/n8 ), .S(
        \C4/DATA8_8 ) );
  ADDFXL \DP_OP_21J1_124_1250/U3  ( .A(\DP_OP_21J1_124_1250/n22 ), .B(a[14]), 
        .CI(\DP_OP_21J1_124_1250/n3 ), .CO(\DP_OP_21J1_124_1250/n2 ), .S(
        \C4/DATA8_14 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U27  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[8]), 
        .Y(\DP_OP_21J1_124_1250/n28 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U28  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[7]), 
        .Y(\DP_OP_21J1_124_1250/n29 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U29  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[6]), 
        .Y(\DP_OP_21J1_124_1250/n30 ) );
  ADDFXL \DP_OP_21J1_124_1250/U11  ( .A(\DP_OP_21J1_124_1250/n30 ), .B(a[6]), 
        .CI(\DP_OP_21J1_124_1250/n11 ), .CO(\DP_OP_21J1_124_1250/n10 ), .S(
        \C4/DATA8_6 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U26  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[9]), 
        .Y(\DP_OP_21J1_124_1250/n27 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U25  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[10]), 
        .Y(\DP_OP_21J1_124_1250/n26 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U24  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[11]), 
        .Y(\DP_OP_21J1_124_1250/n25 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U23  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[12]), 
        .Y(\DP_OP_21J1_124_1250/n24 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U22  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[13]), 
        .Y(\DP_OP_21J1_124_1250/n23 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U21  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[14]), 
        .Y(\DP_OP_21J1_124_1250/n22 ) );
  OAI22XL U2 ( .A0(b[1]), .A1(n160), .B0(n190), .B1(n292), .Y(n1) );
  OAI21XL U3 ( .A0(n42), .A1(n1), .B0(n180), .Y(n338) );
  NOR2BX1 U4 ( .AN(n69), .B(n72), .Y(\DP_OP_21J1_124_1250/n53 ) );
  AOI222XL U5 ( .A0(n210), .A1(n129), .B0(b[1]), .B1(n189), .C0(n211), .C1(
        n310), .Y(n2) );
  OAI22XL U6 ( .A0(n284), .A1(n308), .B0(n326), .B1(n2), .Y(n3) );
  OAI21XL U7 ( .A0(n324), .A1(n238), .B0(n273), .Y(n4) );
  OAI22XL U8 ( .A0(b[0]), .A1(n41), .B0(n343), .B1(n272), .Y(n5) );
  OAI211X1 U9 ( .A0(n329), .A1(n309), .B0(n331), .C0(n5), .Y(n6) );
  CLKINVX1 U10 ( .A(n308), .Y(n7) );
  NAND2X1 U11 ( .A(n211), .B(a[0]), .Y(n8) );
  OAI211X1 U12 ( .A0(n190), .A1(n189), .B0(n83), .C0(n8), .Y(n9) );
  AO22X1 U13 ( .A0(b[2]), .A1(n238), .B0(n42), .B1(n9), .Y(n10) );
  NOR2X1 U14 ( .A(n305), .B(n10), .Y(n11) );
  AOI211X1 U15 ( .A0(n176), .A1(n7), .B0(n287), .C0(n11), .Y(n12) );
  OAI21XL U16 ( .A0(n332), .A1(a[0]), .B0(n331), .Y(n13) );
  AO22X1 U17 ( .A0(b[0]), .A1(n13), .B0(n69), .B1(\C4/DATA8_0 ), .Y(n14) );
  AOI211X1 U18 ( .A0(a[0]), .A1(n6), .B0(n12), .C0(n14), .Y(n15) );
  OAI31XL U19 ( .A0(n262), .A1(n3), .A2(n4), .B0(n15), .Y(r[0]) );
  OAI21XL U20 ( .A0(n284), .A1(n274), .B0(n273), .Y(n16) );
  OAI21XL U21 ( .A0(n326), .A1(n276), .B0(n298), .Y(n17) );
  AOI211X1 U22 ( .A0(n275), .A1(n277), .B0(n16), .C0(n17), .Y(n18) );
  OAI2BB2XL U23 ( .B0(n42), .B1(n277), .A0N(n42), .A1N(n276), .Y(n19) );
  OAI2BB2XL U24 ( .B0(n305), .B1(n19), .A0N(n278), .A1N(n279), .Y(n20) );
  AOI211X1 U25 ( .A0(b[3]), .A1(n280), .B0(n287), .C0(n20), .Y(n21) );
  AOI211X1 U26 ( .A0(n281), .A1(n313), .B0(n18), .C0(n21), .Y(n22) );
  OAI21XL U27 ( .A0(n332), .A1(b[6]), .B0(n331), .Y(n23) );
  AOI22X1 U28 ( .A0(a[6]), .A1(n23), .B0(n69), .B1(\C4/DATA8_6 ), .Y(n24) );
  AO22X1 U29 ( .A0(a[6]), .A1(n272), .B0(n271), .B1(n41), .Y(n25) );
  OAI21XL U30 ( .A0(n317), .A1(n25), .B0(b[6]), .Y(n26) );
  NAND3X1 U31 ( .A(n22), .B(n24), .C(n26), .Y(r[6]) );
  OAI22XL U32 ( .A0(n309), .A1(n346), .B0(n332), .B1(b[15]), .Y(n27) );
  AOI211X1 U33 ( .A0(n272), .A1(b[15]), .B0(n317), .C0(n27), .Y(n28) );
  AOI2BB2X1 U34 ( .B0(\DP_OP_21J1_124_1250/n53 ), .B1(b[15]), .A0N(
        \DP_OP_21J1_124_1250/n53 ), .A1N(b[15]), .Y(n29) );
  AOI2BB2X1 U35 ( .B0(a[15]), .B1(n29), .A0N(a[15]), .A1N(n29), .Y(n30) );
  AOI2BB2X1 U36 ( .B0(\DP_OP_21J1_124_1250/n2 ), .B1(n30), .A0N(
        \DP_OP_21J1_124_1250/n2 ), .A1N(n30), .Y(n31) );
  OAI21XL U37 ( .A0(a[15]), .A1(n332), .B0(n331), .Y(n32) );
  AO22X1 U38 ( .A0(n69), .A1(n31), .B0(b[15]), .B1(n32), .Y(n33) );
  AOI31X1 U39 ( .A0(n253), .A1(n155), .A2(n285), .B0(n33), .Y(n34) );
  CLKINVX1 U40 ( .A(n156), .Y(n35) );
  OAI21XL U41 ( .A0(n330), .A1(n303), .B0(n329), .Y(n36) );
  OAI22XL U42 ( .A0(a[14]), .A1(n215), .B0(a[15]), .B1(n170), .Y(n37) );
  OAI22XL U43 ( .A0(n213), .A1(a[13]), .B0(n214), .B1(a[12]), .Y(n38) );
  OAI21XL U44 ( .A0(n37), .A1(n38), .B0(n296), .Y(n39) );
  OAI211X1 U45 ( .A0(n324), .A1(n35), .B0(n36), .C0(n39), .Y(n40) );
  OAI211X1 U46 ( .A0(n292), .A1(n28), .B0(n34), .C0(n40), .Y(r[15]) );
  CLKINVX1 U47 ( .A(b[2]), .Y(n42) );
  OAI31XL U48 ( .A0(n287), .A1(n206), .A2(n205), .B0(n204), .Y(r[2]) );
  AOI211X1 U49 ( .A0(n306), .A1(n274), .B0(n151), .C0(n150), .Y(n152) );
  AOI211X1 U50 ( .A0(n191), .A1(a[8]), .B0(n89), .C0(n88), .Y(n147) );
  AOI211X1 U51 ( .A0(n339), .A1(n338), .B0(n337), .C0(n336), .Y(n341) );
  AOI211X1 U52 ( .A0(a[6]), .A1(n193), .B0(n166), .C0(n164), .Y(n125) );
  OAI211X1 U53 ( .A0(n300), .A1(n299), .B0(n298), .C0(n297), .Y(n301) );
  NOR3X1 U54 ( .A(n293), .B(n292), .C(n309), .Y(n299) );
  AOI211X1 U55 ( .A0(n295), .A1(n288), .B0(n287), .C0(n286), .Y(n290) );
  NAND2X1 U56 ( .A(b[2]), .B(n339), .Y(n283) );
  AOI211X1 U57 ( .A0(n258), .A1(n339), .B0(n287), .C0(n257), .Y(n260) );
  NOR3X1 U58 ( .A(b[2]), .B(n193), .C(n292), .Y(n254) );
  NAND2X1 U59 ( .A(n190), .B(n42), .Y(n124) );
  OAI211X1 U60 ( .A0(n247), .A1(n305), .B0(n246), .C0(n245), .Y(n248) );
  OAI211X1 U61 ( .A0(n241), .A1(n284), .B0(n240), .C0(n340), .Y(n242) );
  AOI211X1 U62 ( .A0(n275), .A1(n239), .B0(n262), .C0(n233), .Y(n236) );
  NOR2X1 U63 ( .A(n293), .B(n231), .Y(n232) );
  AOI32XL U64 ( .A0(a[15]), .A1(b[2]), .A2(n211), .B0(n294), .B1(n42), .Y(n225) );
  AOI211X1 U65 ( .A0(\C4/DATA8_3 ), .A1(n69), .B0(n56), .C0(n55), .Y(n229) );
  AOI211X1 U66 ( .A0(n279), .A1(n220), .B0(n287), .C0(n219), .Y(n223) );
  OAI211X1 U67 ( .A0(a[5]), .A1(n213), .B0(n42), .C0(n212), .Y(n217) );
  NAND2X1 U68 ( .A(n273), .B(n82), .Y(n330) );
  AOI211X1 U69 ( .A0(\C4/DATA8_1 ), .A1(n69), .B0(n52), .C0(n51), .Y(n185) );
  AOI211X1 U70 ( .A0(n191), .A1(n221), .B0(b[2]), .C0(n171), .Y(n172) );
  NOR2XL U71 ( .A(b[4]), .B(b[3]), .Y(n339) );
  NAND2X1 U72 ( .A(n300), .B(n82), .Y(n329) );
  NOR2XL U73 ( .A(cmd[1]), .B(n78), .Y(n82) );
  NOR2XL U74 ( .A(b[3]), .B(n293), .Y(n300) );
  NAND2XL U75 ( .A(n70), .B(cmd[1]), .Y(n321) );
  NOR2X1 U76 ( .A(cmd[2]), .B(cmd[1]), .Y(n69) );
  NOR2XL U77 ( .A(n42), .B(b[3]), .Y(n275) );
  NOR2XL U78 ( .A(b[3]), .B(b[2]), .Y(n296) );
  INVXL U79 ( .A(cmd[0]), .Y(n72) );
  INVXL U80 ( .A(cmd[2]), .Y(n70) );
  INVXL U81 ( .A(cmd[1]), .Y(n71) );
  NOR2XL U82 ( .A(b[4]), .B(n81), .Y(n273) );
  NOR4XL U83 ( .A(b[13]), .B(b[8]), .C(n77), .D(n76), .Y(n246) );
  INVXL U84 ( .A(b[3]), .Y(n284) );
  NOR2X1 U85 ( .A(n214), .B(n292), .Y(n75) );
  INVXL U86 ( .A(a[15]), .Y(n292) );
  NOR2XL U87 ( .A(n190), .B(b[0]), .Y(n191) );
  NOR2XL U88 ( .A(n343), .B(b[1]), .Y(n210) );
  INVXL U89 ( .A(b[0]), .Y(n343) );
  INVXL U90 ( .A(b[1]), .Y(n190) );
  AOI211X1 U91 ( .A0(\C4/DATA8_2 ), .A1(n69), .B0(n54), .C0(n53), .Y(n204) );
  AND2X2 U92 ( .A(a[2]), .B(n196), .Y(n54) );
  OAI211X1 U93 ( .A0(n153), .A1(n154), .B0(n152), .C0(n67), .Y(n68) );
  NAND2X1 U94 ( .A(a[14]), .B(n137), .Y(n67) );
  AOI211X1 U95 ( .A0(n288), .A1(n278), .B0(n149), .C0(n280), .Y(n150) );
  OAI211X1 U96 ( .A0(a[12]), .A1(n213), .B0(n145), .C0(n144), .Y(n146) );
  NAND2X1 U97 ( .A(n211), .B(n143), .Y(n144) );
  NAND2X1 U98 ( .A(n141), .B(n281), .Y(n148) );
  CLKINVX1 U99 ( .A(a[14]), .Y(n143) );
  CLKINVX1 U100 ( .A(b[14]), .Y(n153) );
  AOI211X1 U101 ( .A0(\C4/DATA8_13 ), .A1(n69), .B0(n50), .C0(n49), .Y(n136)
         );
  OAI211X1 U102 ( .A0(n324), .A1(n325), .B0(n131), .C0(n130), .Y(n132) );
  AND2X2 U103 ( .A(b[13]), .B(n135), .Y(n50) );
  OAI211X1 U104 ( .A0(n346), .A1(n231), .B0(n122), .C0(n121), .Y(r[12]) );
  OAI211X1 U105 ( .A0(n311), .A1(n324), .B0(n120), .C0(n119), .Y(n121) );
  AOI211X1 U106 ( .A0(\C4/DATA8_12 ), .A1(n69), .B0(n48), .C0(n47), .Y(n122)
         );
  AOI211X1 U107 ( .A0(n244), .A1(n288), .B0(n109), .C0(n149), .Y(n111) );
  CLKINVX1 U108 ( .A(n307), .Y(n149) );
  AND2X2 U109 ( .A(b[12]), .B(n112), .Y(n48) );
  OAI211X1 U110 ( .A0(n346), .A1(n225), .B0(n108), .C0(n107), .Y(r[11]) );
  OAI211X1 U111 ( .A0(n294), .A1(n195), .B0(n307), .C0(n218), .Y(n107) );
  CLKINVX1 U112 ( .A(n288), .Y(n195) );
  AOI211X1 U113 ( .A0(\C4/DATA8_11 ), .A1(n69), .B0(n46), .C0(n45), .Y(n108)
         );
  NOR4X1 U114 ( .A(n102), .B(n101), .C(n165), .D(n167), .Y(n156) );
  NOR2X1 U115 ( .A(n213), .B(n322), .Y(n101) );
  AND2X2 U116 ( .A(b[11]), .B(n106), .Y(n46) );
  OAI211X1 U117 ( .A0(n199), .A1(n346), .B0(n96), .C0(n95), .Y(r[10]) );
  OAI211X1 U118 ( .A0(n305), .A1(n194), .B0(n307), .C0(n342), .Y(n95) );
  AOI211X1 U119 ( .A0(\C4/DATA8_10 ), .A1(n69), .B0(n44), .C0(n43), .Y(n96) );
  NAND2X1 U120 ( .A(n141), .B(n200), .Y(n90) );
  NOR2X1 U121 ( .A(b[2]), .B(n139), .Y(n200) );
  CLKINVX1 U122 ( .A(n330), .Y(n141) );
  AND2X2 U123 ( .A(b[10]), .B(n93), .Y(n44) );
  OAI211X1 U124 ( .A0(n347), .A1(n346), .B0(n345), .C0(n344), .Y(r[9]) );
  OAI211X1 U125 ( .A0(n343), .A1(n342), .B0(n341), .C0(n340), .Y(n344) );
  CLKINVX1 U126 ( .A(n155), .Y(n337) );
  AOI211X1 U127 ( .A0(\C4/DATA8_9 ), .A1(n69), .B0(n64), .C0(n63), .Y(n345) );
  AND2X2 U128 ( .A(b[9]), .B(n335), .Y(n64) );
  CLKINVX1 U129 ( .A(n306), .Y(n346) );
  OAI211X1 U130 ( .A0(n303), .A1(n329), .B0(n302), .C0(n301), .Y(r[7]) );
  AOI211X1 U131 ( .A0(\C4/DATA8_7 ), .A1(n69), .B0(n62), .C0(n61), .Y(n302) );
  NOR2X1 U132 ( .A(n305), .B(b[2]), .Y(n288) );
  AND2X2 U133 ( .A(b[7]), .B(n291), .Y(n62) );
  AOI211X1 U134 ( .A0(a[5]), .A1(n191), .B0(n209), .C0(n100), .Y(n157) );
  AOI211X1 U135 ( .A0(a[9]), .A1(n193), .B0(n187), .C0(n186), .Y(n188) );
  NOR2X1 U136 ( .A(n213), .B(n315), .Y(n186) );
  NOR2X1 U137 ( .A(b[2]), .B(n138), .Y(n274) );
  AOI211X1 U138 ( .A0(a[12]), .A1(n191), .B0(n80), .C0(n79), .Y(n277) );
  NOR2X1 U139 ( .A(n170), .B(n207), .Y(n80) );
  AOI21X1 U140 ( .A0(n211), .A1(a[2]), .B0(n84), .Y(n139) );
  AOI211X1 U141 ( .A0(a[4]), .A1(n191), .B0(n187), .C0(n86), .Y(n140) );
  NOR2X1 U142 ( .A(n170), .B(n271), .Y(n187) );
  OAI211X1 U143 ( .A0(n270), .A1(n329), .B0(n269), .C0(n268), .Y(r[5]) );
  OAI211X1 U144 ( .A0(n267), .A1(n326), .B0(n266), .C0(n265), .Y(n268) );
  NAND2X1 U145 ( .A(n275), .B(n264), .Y(n265) );
  NAND2X1 U146 ( .A(n42), .B(n181), .Y(n263) );
  AOI211X1 U147 ( .A0(\C4/DATA8_5 ), .A1(n69), .B0(n60), .C0(n59), .Y(n269) );
  CLKINVX1 U148 ( .A(n252), .Y(n267) );
  AND2X2 U149 ( .A(b[5]), .B(n261), .Y(n60) );
  OAI211X1 U150 ( .A0(n221), .A1(n213), .B0(n128), .C0(n169), .Y(n323) );
  CLKINVX1 U151 ( .A(a[4]), .Y(n192) );
  OAI211X1 U152 ( .A0(n250), .A1(n329), .B0(n249), .C0(n248), .Y(r[4]) );
  AOI211X1 U153 ( .A0(n244), .A1(n279), .B0(n243), .C0(n242), .Y(n245) );
  AOI211X1 U154 ( .A0(\C4/DATA8_4 ), .A1(n69), .B0(n58), .C0(n57), .Y(n249) );
  NAND2BX1 U155 ( .AN(n244), .B(n42), .Y(n231) );
  AND2X2 U156 ( .A(a[4]), .B(n235), .Y(n58) );
  AOI32X1 U157 ( .A0(a[0]), .A1(b[2]), .A2(n211), .B0(n42), .B1(n314), .Y(n250) );
  OAI211X1 U158 ( .A0(n230), .A1(n329), .B0(n229), .C0(n228), .Y(r[3]) );
  CLKINVX1 U159 ( .A(n220), .Y(n294) );
  NAND2X1 U160 ( .A(n211), .B(n221), .Y(n212) );
  AOI211X1 U161 ( .A0(a[8]), .A1(n210), .B0(n209), .C0(n208), .Y(n295) );
  NOR2X1 U162 ( .A(n170), .B(n282), .Y(n209) );
  CLKINVX1 U163 ( .A(n241), .Y(n109) );
  NOR2X1 U164 ( .A(n102), .B(n97), .Y(n220) );
  NOR2X1 U165 ( .A(n170), .B(n162), .Y(n102) );
  NOR2X1 U166 ( .A(b[2]), .B(n255), .Y(n279) );
  NOR2X1 U167 ( .A(n222), .B(n284), .Y(n56) );
  NAND2X1 U168 ( .A(n42), .B(n158), .Y(n230) );
  OAI211X1 U169 ( .A0(n129), .A1(n213), .B0(n99), .C0(n98), .Y(n158) );
  NAND2X1 U170 ( .A(n193), .B(a[0]), .Y(n98) );
  NAND4X1 U171 ( .A(n319), .B(n318), .C(n320), .D(n65), .Y(n66) );
  NAND2X1 U172 ( .A(a[8]), .B(n304), .Y(n65) );
  NOR2X1 U173 ( .A(n287), .B(n336), .Y(n307) );
  OAI211X1 U174 ( .A0(n215), .A1(n282), .B0(n114), .C0(n113), .Y(n311) );
  CLKINVX1 U175 ( .A(a[5]), .Y(n251) );
  NOR3X1 U176 ( .A(n310), .B(n309), .C(n330), .Y(n312) );
  CLKINVX1 U177 ( .A(n329), .Y(n313) );
  OAI211X1 U178 ( .A0(n129), .A1(n214), .B0(n116), .C0(n115), .Y(n314) );
  OAI211X1 U179 ( .A0(n328), .A1(n329), .B0(n185), .C0(n184), .Y(r[1]) );
  AOI211X1 U180 ( .A0(n176), .A1(n338), .B0(n287), .C0(n175), .Y(n178) );
  NAND2X1 U181 ( .A(b[2]), .B(n193), .Y(n174) );
  CLKINVX1 U182 ( .A(a[3]), .Y(n221) );
  NOR4BX1 U183 ( .AN(n169), .B(n168), .C(n167), .D(n166), .Y(n252) );
  NOR2X1 U184 ( .A(n213), .B(n282), .Y(n166) );
  CLKINVX1 U185 ( .A(a[7]), .Y(n282) );
  NOR2X1 U186 ( .A(n214), .B(n315), .Y(n167) );
  CLKINVX1 U187 ( .A(a[8]), .Y(n315) );
  NOR2X1 U188 ( .A(n215), .B(n271), .Y(n168) );
  CLKINVX1 U189 ( .A(a[6]), .Y(n271) );
  NAND2X1 U190 ( .A(n211), .B(a[5]), .Y(n169) );
  NAND2X1 U191 ( .A(n264), .B(n42), .Y(n180) );
  NOR3X1 U192 ( .A(n165), .B(n164), .C(n163), .Y(n264) );
  NOR2X1 U193 ( .A(n170), .B(n322), .Y(n164) );
  NOR2X1 U194 ( .A(n215), .B(n207), .Y(n165) );
  AND2X2 U195 ( .A(a[1]), .B(n177), .Y(n52) );
  NAND2X1 U196 ( .A(n159), .B(n42), .Y(n328) );
  NAND2X1 U197 ( .A(n155), .B(n340), .Y(n287) );
  NOR2X1 U198 ( .A(n81), .B(n243), .Y(n155) );
  CLKINVX1 U199 ( .A(n339), .Y(n305) );
  NAND2X1 U200 ( .A(n210), .B(a[1]), .Y(n83) );
  CLKINVX1 U201 ( .A(n255), .Y(n176) );
  CLKINVX1 U202 ( .A(n321), .Y(n272) );
  CLKINVX1 U203 ( .A(n332), .Y(n41) );
  NAND2X1 U204 ( .A(n211), .B(n42), .Y(n309) );
  CLKINVX1 U205 ( .A(n273), .Y(n293) );
  CLKINVX1 U206 ( .A(n317), .Y(n331) );
  NOR2X1 U207 ( .A(n72), .B(n321), .Y(n317) );
  NAND3X1 U208 ( .A(n71), .B(n72), .C(cmd[2]), .Y(n332) );
  NAND4X1 U209 ( .A(n115), .B(n113), .C(n85), .D(n87), .Y(n238) );
  NAND2X1 U210 ( .A(n193), .B(a[7]), .Y(n87) );
  NAND2X1 U211 ( .A(n210), .B(a[5]), .Y(n85) );
  NAND2X1 U212 ( .A(n191), .B(a[6]), .Y(n113) );
  NAND2X1 U213 ( .A(n211), .B(a[4]), .Y(n115) );
  CLKINVX1 U214 ( .A(n275), .Y(n324) );
  CLKINVX1 U215 ( .A(n296), .Y(n326) );
  CLKINVX1 U216 ( .A(a[0]), .Y(n310) );
  CLKINVX1 U217 ( .A(a[1]), .Y(n129) );
  CLKINVX1 U218 ( .A(n298), .Y(n262) );
  NOR3X1 U219 ( .A(n71), .B(n70), .C(n72), .Y(n298) );
  NAND2X1 U220 ( .A(n246), .B(n240), .Y(n81) );
  CLKINVX1 U221 ( .A(b[5]), .Y(n240) );
  AOI211X1 U222 ( .A0(a[14]), .A1(n191), .B0(n75), .C0(n74), .Y(n244) );
  CLKINVX1 U223 ( .A(a[12]), .Y(n161) );
  CLKINVX1 U224 ( .A(a[13]), .Y(n142) );
  AOI211X1 U225 ( .A0(n211), .A1(a[8]), .B0(n89), .C0(n73), .Y(n239) );
  CLKINVX1 U226 ( .A(a[11]), .Y(n162) );
  CLKINVX1 U227 ( .A(n193), .Y(n214) );
  NOR2X1 U228 ( .A(n190), .B(n343), .Y(n193) );
  CLKINVX1 U229 ( .A(a[10]), .Y(n207) );
  CLKINVX1 U230 ( .A(n191), .Y(n213) );
  NOR2X1 U231 ( .A(n215), .B(n322), .Y(n89) );
  CLKINVX1 U232 ( .A(a[9]), .Y(n322) );
  CLKINVX1 U233 ( .A(n210), .Y(n215) );
  CLKINVX1 U234 ( .A(n170), .Y(n211) );
  NAND2X1 U235 ( .A(n190), .B(n343), .Y(n170) );
  AO21X1 U236 ( .A0(b[2]), .A1(n203), .B0(n202), .Y(n53) );
  AOI211XL U237 ( .A0(n199), .A1(b[3]), .B0(n293), .C0(n198), .Y(n201) );
  AO21X1 U238 ( .A0(n69), .A1(\C4/DATA8_14 ), .B0(n68), .Y(r[14]) );
  AO21X1 U239 ( .A0(a[13]), .A1(n123), .B0(n134), .Y(n49) );
  AO21X1 U240 ( .A0(a[12]), .A1(n110), .B0(n111), .Y(n47) );
  AO21X1 U241 ( .A0(a[11]), .A1(n104), .B0(n105), .Y(n45) );
  AO21X1 U242 ( .A0(a[10]), .A1(n91), .B0(n92), .Y(n43) );
  NAND3XL U243 ( .A(b[4]), .B(b[2]), .C(b[1]), .Y(n342) );
  AO21X1 U244 ( .A0(a[9]), .A1(n333), .B0(n334), .Y(n63) );
  AO21X1 U245 ( .A0(a[7]), .A1(n289), .B0(n290), .Y(n61) );
  AOI21XL U246 ( .A0(b[4]), .A1(n309), .B0(n292), .Y(n285) );
  AOI211XL U247 ( .A0(b[3]), .A1(n263), .B0(n293), .C0(n262), .Y(n266) );
  AO21X1 U248 ( .A0(a[5]), .A1(n259), .B0(n260), .Y(n59) );
  AO21X1 U249 ( .A0(b[4]), .A1(n237), .B0(n236), .Y(n57) );
  AOI211XL U250 ( .A0(b[3]), .A1(n225), .B0(n293), .C0(n262), .Y(n226) );
  AO21X1 U251 ( .A0(a[3]), .A1(n224), .B0(n223), .Y(n55) );
  AO21X1 U252 ( .A0(n69), .A1(\C4/DATA8_8 ), .B0(n66), .Y(r[8]) );
  AOI211XL U253 ( .A0(b[3]), .A1(n347), .B0(n293), .C0(n262), .Y(n182) );
  AO21X1 U254 ( .A0(b[1]), .A1(n179), .B0(n178), .Y(n51) );
  NAND2XL U255 ( .A(b[4]), .B(b[3]), .Y(n253) );
  NAND2XL U256 ( .A(b[4]), .B(n292), .Y(n340) );
  NAND3XL U257 ( .A(cmd[2]), .B(cmd[1]), .C(n72), .Y(n243) );
  NAND2XL U258 ( .A(n234), .B(b[3]), .Y(n255) );
  INVXL U259 ( .A(b[4]), .Y(n234) );
  NAND2XL U260 ( .A(cmd[2]), .B(cmd[0]), .Y(n78) );
  OAI22XL U261 ( .A0(n213), .A1(n207), .B0(n214), .B1(n162), .Y(n73) );
  OAI22XL U262 ( .A0(n215), .A1(n142), .B0(n170), .B1(n161), .Y(n74) );
  OAI22XL U263 ( .A0(b[2]), .A1(n239), .B0(n42), .B1(n244), .Y(n308) );
  OR4X1 U264 ( .A(b[10]), .B(b[12]), .C(b[15]), .D(b[11]), .Y(n77) );
  OR4X1 U265 ( .A(b[14]), .B(b[6]), .C(b[9]), .D(b[7]), .Y(n76) );
  OAI22XL U266 ( .A0(b[0]), .A1(a[2]), .B0(n343), .B1(a[3]), .Y(n189) );
  OAI221XL U267 ( .A0(b[0]), .A1(a[14]), .B0(n343), .B1(a[15]), .C0(n190), .Y(
        n138) );
  OAI22XL U268 ( .A0(n214), .A1(n142), .B0(n215), .B1(n162), .Y(n79) );
  OR2X1 U269 ( .A(n277), .B(b[2]), .Y(n94) );
  OA21XL U270 ( .A0(n42), .A1(n138), .B0(n94), .Y(n199) );
  NOR3X1 U271 ( .A(n262), .B(n81), .C(n305), .Y(n306) );
  OAI221XL U272 ( .A0(a[10]), .A1(n332), .B0(n207), .B1(n321), .C0(n331), .Y(
        n93) );
  OAI21XL U273 ( .A0(n310), .A1(n213), .B0(n83), .Y(n84) );
  OAI21XL U274 ( .A0(n221), .A1(n214), .B0(n85), .Y(n86) );
  OAI21XL U275 ( .A0(n207), .A1(n170), .B0(n87), .Y(n88) );
  AOI222XL U276 ( .A0(n90), .A1(n329), .B0(n275), .B1(n140), .C0(n296), .C1(
        n147), .Y(n92) );
  OAI21XL U277 ( .A0(b[10]), .A1(n332), .B0(n331), .Y(n91) );
  OAI22XL U278 ( .A0(n211), .A1(a[15]), .B0(n170), .B1(a[14]), .Y(n278) );
  OAI21XL U279 ( .A0(n42), .A1(n278), .B0(n94), .Y(n194) );
  OAI21XL U280 ( .A0(a[15]), .A1(n284), .B0(n253), .Y(n336) );
  OAI22XL U281 ( .A0(b[0]), .A1(a[13]), .B0(n343), .B1(a[14]), .Y(n160) );
  OAI22XL U282 ( .A0(n160), .A1(n190), .B0(n215), .B1(n161), .Y(n97) );
  OAI221XL U283 ( .A0(a[11]), .A1(n332), .B0(n162), .B1(n321), .C0(n331), .Y(
        n106) );
  AOI2BB2X1 U284 ( .B0(n210), .B1(a[2]), .A0N(n170), .A1N(n221), .Y(n99) );
  OR2X1 U285 ( .A(n230), .B(n330), .Y(n103) );
  OAI22XL U286 ( .A0(n214), .A1(n192), .B0(n215), .B1(n271), .Y(n100) );
  AOI222XL U287 ( .A0(n103), .A1(n329), .B0(n275), .B1(n157), .C0(n296), .C1(
        n156), .Y(n105) );
  OAI21XL U288 ( .A0(b[11]), .A1(n332), .B0(n331), .Y(n104) );
  OAI21XL U289 ( .A0(n292), .A1(b[4]), .B0(b[2]), .Y(n241) );
  OAI21XL U290 ( .A0(n170), .A1(n292), .B0(n109), .Y(n218) );
  OAI221XL U291 ( .A0(a[12]), .A1(n332), .B0(n161), .B1(n321), .C0(n331), .Y(
        n112) );
  OAI21XL U292 ( .A0(b[12]), .A1(n332), .B0(n331), .Y(n110) );
  AOI2BB2X1 U293 ( .B0(n211), .B1(a[8]), .A0N(n214), .A1N(n251), .Y(n114) );
  AOI2BB2X1 U294 ( .B0(n191), .B1(a[2]), .A0N(n215), .A1N(n221), .Y(n116) );
  OAI21XL U295 ( .A0(n250), .A1(n330), .B0(n329), .Y(n120) );
  OAI22XL U296 ( .A0(a[12]), .A1(n170), .B0(a[11]), .B1(n215), .Y(n118) );
  OAI22XL U297 ( .A0(a[10]), .A1(n213), .B0(a[9]), .B1(n214), .Y(n117) );
  OAI21XL U298 ( .A0(n118), .A1(n117), .B0(n296), .Y(n119) );
  OAI22XL U299 ( .A0(b[1]), .A1(n160), .B0(n292), .B1(n213), .Y(n181) );
  OAI221XL U300 ( .A0(a[13]), .A1(n332), .B0(n142), .B1(n321), .C0(n331), .Y(
        n135) );
  OAI21XL U301 ( .A0(b[13]), .A1(n332), .B0(n331), .Y(n123) );
  OAI2BB2XL U302 ( .B0(n160), .B1(n124), .A0N(a[15]), .A1N(n124), .Y(n256) );
  OAI22XL U303 ( .A0(n256), .A1(n305), .B0(n254), .B1(n234), .Y(n133) );
  OAI21XL U304 ( .A0(n215), .A1(n315), .B0(n125), .Y(n325) );
  OAI22XL U305 ( .A0(a[13]), .A1(n170), .B0(a[12]), .B1(n215), .Y(n127) );
  OAI22XL U306 ( .A0(a[10]), .A1(n214), .B0(a[11]), .B1(n213), .Y(n126) );
  OAI21XL U307 ( .A0(n127), .A1(n126), .B0(n296), .Y(n131) );
  AOI2BB2X1 U308 ( .B0(n193), .B1(a[2]), .A0N(n215), .A1N(n192), .Y(n128) );
  AOI221XL U309 ( .A0(b[0]), .A1(n310), .B0(n343), .B1(n129), .C0(b[1]), .Y(
        n159) );
  OAI22XL U310 ( .A0(b[2]), .A1(n323), .B0(n42), .B1(n159), .Y(n270) );
  OAI21XL U311 ( .A0(n270), .A1(n330), .B0(n329), .Y(n130) );
  OAI31XL U312 ( .A0(n336), .A1(n337), .A2(n133), .B0(n132), .Y(n134) );
  OAI21XL U313 ( .A0(n346), .A1(n263), .B0(n136), .Y(r[13]) );
  AOI221XL U314 ( .A0(n272), .A1(a[14]), .B0(n41), .B1(n143), .C0(n317), .Y(
        n154) );
  OAI21XL U315 ( .A0(b[14]), .A1(n332), .B0(n331), .Y(n137) );
  OAI22XL U316 ( .A0(b[2]), .A1(n140), .B0(n42), .B1(n139), .Y(n281) );
  AOI2BB2X1 U317 ( .B0(n210), .B1(n142), .A0N(n214), .A1N(a[11]), .Y(n145) );
  AOI222XL U318 ( .A0(n148), .A1(n329), .B0(n275), .B1(n147), .C0(n146), .C1(
        n296), .Y(n151) );
  OAI21XL U319 ( .A0(n234), .A1(n190), .B0(n241), .Y(n280) );
  AOI2BB2X1 U320 ( .B0(b[2]), .B1(n158), .A0N(b[2]), .A1N(n157), .Y(n303) );
  OAI21XL U321 ( .A0(a[1]), .A1(n332), .B0(n331), .Y(n179) );
  OAI22XL U322 ( .A0(n213), .A1(n162), .B0(n214), .B1(n161), .Y(n163) );
  OAI22XL U323 ( .A0(a[1]), .A1(n170), .B0(a[2]), .B1(n215), .Y(n171) );
  OAI21XL U324 ( .A0(a[4]), .A1(n214), .B0(n172), .Y(n173) );
  OAI21XL U325 ( .A0(n252), .A1(n42), .B0(n173), .Y(n183) );
  OAI22XL U326 ( .A0(n305), .A1(n183), .B0(n253), .B1(n174), .Y(n175) );
  OAI221XL U327 ( .A0(b[1]), .A1(n332), .B0(n190), .B1(n321), .C0(n331), .Y(
        n177) );
  OAI21XL U328 ( .A0(n181), .A1(n42), .B0(n180), .Y(n347) );
  OAI21XL U329 ( .A0(b[3]), .A1(n183), .B0(n182), .Y(n184) );
  OAI21XL U330 ( .A0(n215), .A1(n282), .B0(n188), .Y(n276) );
  OAI22XL U331 ( .A0(n284), .A1(n342), .B0(n276), .B1(n283), .Y(n206) );
  AOI222XL U332 ( .A0(n251), .A1(n193), .B0(n192), .B1(n191), .C0(n190), .C1(
        n189), .Y(n197) );
  OAI22XL U333 ( .A0(n197), .A1(n195), .B0(n255), .B1(n194), .Y(n205) );
  OAI21XL U334 ( .A0(a[2]), .A1(n332), .B0(n331), .Y(n203) );
  OAI221XL U335 ( .A0(b[2]), .A1(n332), .B0(n42), .B1(n321), .C0(n331), .Y(
        n196) );
  OAI22XL U336 ( .A0(n197), .A1(n326), .B0(n324), .B1(n276), .Y(n198) );
  AO22X1 U337 ( .A0(n298), .A1(n201), .B0(n313), .B1(n200), .Y(n202) );
  OAI21XL U338 ( .A0(b[3]), .A1(n332), .B0(n331), .Y(n224) );
  OAI22XL U339 ( .A0(n213), .A1(n322), .B0(n214), .B1(n207), .Y(n208) );
  OAI22XL U340 ( .A0(a[4]), .A1(n215), .B0(a[6]), .B1(n214), .Y(n216) );
  OAI22XL U341 ( .A0(n295), .A1(n42), .B0(n217), .B1(n216), .Y(n227) );
  OAI22XL U342 ( .A0(n284), .A1(n218), .B0(n305), .B1(n227), .Y(n219) );
  AOI221XL U343 ( .A0(n272), .A1(a[3]), .B0(n41), .B1(n221), .C0(n317), .Y(
        n222) );
  OAI21XL U344 ( .A0(b[3]), .A1(n227), .B0(n226), .Y(n228) );
  OAI21XL U345 ( .A0(a[4]), .A1(n332), .B0(n331), .Y(n237) );
  OAI22XL U346 ( .A0(n300), .A1(n232), .B0(n238), .B1(n326), .Y(n233) );
  OAI221XL U347 ( .A0(b[4]), .A1(n332), .B0(n234), .B1(n321), .C0(n331), .Y(
        n235) );
  OAI2BB2XL U348 ( .B0(n42), .B1(n239), .A0N(n42), .A1N(n238), .Y(n247) );
  OAI221XL U349 ( .A0(a[5]), .A1(n332), .B0(n251), .B1(n321), .C0(n331), .Y(
        n261) );
  OAI2BB2XL U350 ( .B0(b[2]), .B1(n267), .A0N(b[2]), .A1N(n264), .Y(n258) );
  OAI22XL U351 ( .A0(n256), .A1(n255), .B0(n254), .B1(n253), .Y(n257) );
  OAI21XL U352 ( .A0(b[5]), .A1(n332), .B0(n331), .Y(n259) );
  OAI221XL U353 ( .A0(a[7]), .A1(n332), .B0(n282), .B1(n321), .C0(n331), .Y(
        n291) );
  OAI22XL U354 ( .A0(n285), .A1(n284), .B0(n294), .B1(n283), .Y(n286) );
  OAI21XL U355 ( .A0(b[7]), .A1(n332), .B0(n331), .Y(n289) );
  AOI2BB2X1 U356 ( .B0(n296), .B1(n295), .A0N(n324), .A1N(n294), .Y(n297) );
  OAI21XL U357 ( .A0(b[8]), .A1(n332), .B0(n331), .Y(n304) );
  AOI222XL U358 ( .A0(n308), .A1(n307), .B0(n308), .B1(n306), .C0(n307), .C1(
        n305), .Y(n320) );
  OAI222XL U359 ( .A0(n314), .A1(n324), .B0(n313), .B1(n312), .C0(n326), .C1(
        n311), .Y(n319) );
  OAI22XL U360 ( .A0(a[8]), .A1(n332), .B0(n315), .B1(n321), .Y(n316) );
  OAI21XL U361 ( .A0(n317), .A1(n316), .B0(b[8]), .Y(n318) );
  OAI221XL U362 ( .A0(a[9]), .A1(n332), .B0(n322), .B1(n321), .C0(n331), .Y(
        n335) );
  OAI22XL U363 ( .A0(n326), .A1(n325), .B0(n324), .B1(n323), .Y(n327) );
  AOI221XL U364 ( .A0(n330), .A1(n329), .B0(n328), .B1(n329), .C0(n327), .Y(
        n334) );
  OAI21XL U365 ( .A0(b[9]), .A1(n332), .B0(n331), .Y(n333) );
endmodule


module EX_stage ( clk, rst, pipeline_reg_in, pipeline_reg_out, ex_op_dest );
  input [56:0] pipeline_reg_in;
  output [37:0] pipeline_reg_out;
  output [2:0] ex_op_dest;
  input clk, rst;
  wire   pipeline_reg_in_0, n1;
  wire   [15:0] ex_alu_result;
  assign pipeline_reg_in_0 = pipeline_reg_in[0];

  alu alu_inst ( .a(pipeline_reg_in[53:38]), .b(pipeline_reg_in[37:22]), .cmd(
        pipeline_reg_in[56:54]), .r(ex_alu_result) );
  DFFTRX1 \pipeline_reg_out_reg[4]  ( .D(pipeline_reg_in[4]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[4]) );
  DFFTRX1 \pipeline_reg_out_reg[0]  ( .D(pipeline_reg_in_0), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[0]) );
  DFFTRX1 \pipeline_reg_out_reg[20]  ( .D(pipeline_reg_in[20]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[20]) );
  DFFTRX1 \pipeline_reg_out_reg[19]  ( .D(pipeline_reg_in[19]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[19]) );
  DFFTRX1 \pipeline_reg_out_reg[18]  ( .D(pipeline_reg_in[18]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[18]) );
  DFFTRX1 \pipeline_reg_out_reg[17]  ( .D(pipeline_reg_in[17]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[17]) );
  DFFTRX1 \pipeline_reg_out_reg[16]  ( .D(pipeline_reg_in[16]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[16]) );
  DFFTRX1 \pipeline_reg_out_reg[15]  ( .D(pipeline_reg_in[15]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[15]) );
  DFFTRX1 \pipeline_reg_out_reg[14]  ( .D(pipeline_reg_in[14]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[14]) );
  DFFTRX1 \pipeline_reg_out_reg[13]  ( .D(pipeline_reg_in[13]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[13]) );
  DFFTRX1 \pipeline_reg_out_reg[12]  ( .D(pipeline_reg_in[12]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[12]) );
  DFFTRX1 \pipeline_reg_out_reg[11]  ( .D(pipeline_reg_in[11]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[11]) );
  DFFTRX1 \pipeline_reg_out_reg[10]  ( .D(pipeline_reg_in[10]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[10]) );
  DFFTRX1 \pipeline_reg_out_reg[9]  ( .D(pipeline_reg_in[9]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[9]) );
  DFFTRX1 \pipeline_reg_out_reg[8]  ( .D(pipeline_reg_in[8]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[8]) );
  DFFTRX1 \pipeline_reg_out_reg[5]  ( .D(pipeline_reg_in[5]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[5]) );
  DFFTRX1 \pipeline_reg_out_reg[3]  ( .D(pipeline_reg_in[3]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[3]) );
  DFFTRX1 \pipeline_reg_out_reg[2]  ( .D(pipeline_reg_in[2]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[2]) );
  DFFTRX1 \pipeline_reg_out_reg[1]  ( .D(pipeline_reg_in[1]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[1]) );
  DFFTRX1 \pipeline_reg_out_reg[6]  ( .D(pipeline_reg_in[6]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[6]) );
  DFFTRX1 \pipeline_reg_out_reg[7]  ( .D(pipeline_reg_in[7]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[7]) );
  DFFTRX1 \pipeline_reg_out_reg[24]  ( .D(ex_alu_result[2]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[24]) );
  DFFTRX1 \pipeline_reg_out_reg[37]  ( .D(ex_alu_result[15]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[37]) );
  DFFTRX1 \pipeline_reg_out_reg[36]  ( .D(ex_alu_result[14]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[36]) );
  DFFTRX1 \pipeline_reg_out_reg[35]  ( .D(ex_alu_result[13]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[35]) );
  DFFTRX1 \pipeline_reg_out_reg[34]  ( .D(ex_alu_result[12]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[34]) );
  DFFTRX1 \pipeline_reg_out_reg[33]  ( .D(ex_alu_result[11]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[33]) );
  DFFTRX1 \pipeline_reg_out_reg[32]  ( .D(ex_alu_result[10]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[32]) );
  DFFTRX1 \pipeline_reg_out_reg[31]  ( .D(ex_alu_result[9]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[31]) );
  DFFTRX1 \pipeline_reg_out_reg[29]  ( .D(ex_alu_result[7]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[29]) );
  DFFTRX1 \pipeline_reg_out_reg[28]  ( .D(ex_alu_result[6]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[28]) );
  DFFTRX1 \pipeline_reg_out_reg[27]  ( .D(ex_alu_result[5]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[27]) );
  DFFTRX1 \pipeline_reg_out_reg[26]  ( .D(ex_alu_result[4]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[26]) );
  DFFTRX1 \pipeline_reg_out_reg[25]  ( .D(ex_alu_result[3]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[25]) );
  DFFTRX1 \pipeline_reg_out_reg[30]  ( .D(ex_alu_result[8]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[30]) );
  DFFTRX1 \pipeline_reg_out_reg[23]  ( .D(ex_alu_result[1]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[23]) );
  DFFTRX1 \pipeline_reg_out_reg[21]  ( .D(pipeline_reg_in[21]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[21]) );
  DFFTRX1 \pipeline_reg_out_reg[22]  ( .D(ex_alu_result[0]), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[22]) );
  CLKINVX1 U3 ( .A(rst), .Y(n1) );
  CLKBUFX3 U4 ( .A(pipeline_reg_in[2]), .Y(ex_op_dest[1]) );
  CLKBUFX3 U5 ( .A(pipeline_reg_in[1]), .Y(ex_op_dest[0]) );
  CLKBUFX3 U6 ( .A(pipeline_reg_in[3]), .Y(ex_op_dest[2]) );
endmodule


module ora ( clk, rst, access_addr, write_data, write_en, read_data );
  input [15:0] access_addr;
  input [15:0] write_data;
  output [31:0] read_data;
  input clk, rst, write_en;
  wire   n1, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n2, n3, n28,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120;
  wire   [31:0] ram;
  wire   [31:0] lfsr;

  DFFRX1 \ram_reg[15]  ( .D(lfsr[15]), .CK(clk), .RN(n35), .Q(n34), .QN(n14)
         );
  DFFRX1 \ram_reg[19]  ( .D(lfsr[19]), .CK(clk), .RN(n1), .Q(ram[19]), .QN(n33) );
  DFFRX1 \ram_reg[18]  ( .D(lfsr[18]), .CK(clk), .RN(n35), .Q(ram[18]), .QN(
        n32) );
  DFFRX1 \ram_reg[16]  ( .D(lfsr[16]), .CK(clk), .RN(n1), .Q(ram[16]), .QN(n31) );
  DFFRX1 \ram_reg[17]  ( .D(lfsr[17]), .CK(clk), .RN(n35), .Q(ram[17]), .QN(
        n30) );
  DFFRX1 \ram_reg[31]  ( .D(lfsr[31]), .CK(clk), .RN(n35), .Q(ram[31]), .QN(
        n28) );
  DFFRX1 \ram_reg[21]  ( .D(lfsr[21]), .CK(clk), .RN(n1), .QN(n3) );
  DFFRX1 \ram_reg[1]  ( .D(lfsr[1]), .CK(clk), .RN(n35), .Q(ram[1]), .QN(n2)
         );
  DFFSX1 \ram_reg[0]  ( .D(lfsr[0]), .CK(clk), .SN(n35), .QN(n29) );
  DFFRX1 \ram_reg[2]  ( .D(lfsr[2]), .CK(clk), .RN(n35), .QN(n27) );
  DFFRX1 \ram_reg[3]  ( .D(lfsr[3]), .CK(clk), .RN(n35), .QN(n26) );
  DFFRX1 \ram_reg[4]  ( .D(lfsr[4]), .CK(clk), .RN(n35), .QN(n25) );
  DFFRX1 \ram_reg[5]  ( .D(lfsr[5]), .CK(clk), .RN(n35), .QN(n24) );
  DFFRX1 \ram_reg[6]  ( .D(lfsr[6]), .CK(clk), .RN(n35), .QN(n23) );
  DFFRX1 \ram_reg[7]  ( .D(lfsr[7]), .CK(clk), .RN(n35), .QN(n22) );
  DFFRX1 \ram_reg[8]  ( .D(lfsr[8]), .CK(clk), .RN(n35), .QN(n21) );
  DFFRX1 \ram_reg[9]  ( .D(lfsr[9]), .CK(clk), .RN(n35), .QN(n20) );
  DFFRX1 \ram_reg[10]  ( .D(lfsr[10]), .CK(clk), .RN(n1), .QN(n19) );
  DFFRX1 \ram_reg[11]  ( .D(lfsr[11]), .CK(clk), .RN(n35), .QN(n18) );
  DFFRX1 \ram_reg[12]  ( .D(lfsr[12]), .CK(clk), .RN(n1), .QN(n17) );
  DFFRX1 \ram_reg[13]  ( .D(lfsr[13]), .CK(clk), .RN(n35), .QN(n16) );
  DFFRX1 \ram_reg[14]  ( .D(lfsr[14]), .CK(clk), .RN(n1), .QN(n15) );
  DFFRX1 \ram_reg[20]  ( .D(lfsr[20]), .CK(clk), .RN(n1), .QN(n13) );
  DFFRX1 \ram_reg[22]  ( .D(lfsr[22]), .CK(clk), .RN(n1), .QN(n12) );
  DFFRX1 \ram_reg[23]  ( .D(lfsr[23]), .CK(clk), .RN(n35), .QN(n11) );
  DFFRX1 \ram_reg[24]  ( .D(lfsr[24]), .CK(clk), .RN(n1), .QN(n10) );
  DFFRX1 \ram_reg[25]  ( .D(lfsr[25]), .CK(clk), .RN(n35), .QN(n9) );
  DFFRX1 \ram_reg[26]  ( .D(lfsr[26]), .CK(clk), .RN(n1), .QN(n8) );
  DFFRX1 \ram_reg[27]  ( .D(lfsr[27]), .CK(clk), .RN(n35), .QN(n7) );
  DFFRX1 \ram_reg[28]  ( .D(lfsr[28]), .CK(clk), .RN(n35), .QN(n6) );
  DFFRX1 \ram_reg[29]  ( .D(lfsr[29]), .CK(clk), .RN(n1), .QN(n5) );
  DFFRX1 \ram_reg[30]  ( .D(lfsr[30]), .CK(clk), .RN(n35), .QN(n4) );
  CLKBUFX3 U3 ( .A(n1), .Y(n35) );
  CLKINVX1 U4 ( .A(rst), .Y(n1) );
  NAND2X1 U5 ( .A(write_en), .B(n62), .Y(n53) );
  CLKINVX1 U6 ( .A(write_en), .Y(n36) );
  NOR3XL U7 ( .A(n6), .B(n17), .C(n87), .Y(n85) );
  NOR3XL U8 ( .A(n7), .B(n18), .C(n82), .Y(n83) );
  NOR3XL U9 ( .A(n8), .B(n19), .C(n82), .Y(n80) );
  INVXL U10 ( .A(access_addr[5]), .Y(n82) );
  NOR3BXL U11 ( .AN(access_addr[7]), .B(n4), .C(n15), .Y(n91) );
  NOR3XL U12 ( .A(n5), .B(n16), .C(n87), .Y(n88) );
  INVXL U13 ( .A(access_addr[6]), .Y(n87) );
  INVXL U14 ( .A(access_addr[4]), .Y(n118) );
  NAND2XL U15 ( .A(access_addr[0]), .B(access_addr[1]), .Y(n90) );
  INVXL U16 ( .A(access_addr[3]), .Y(n108) );
  INVXL U17 ( .A(access_addr[1]), .Y(n111) );
  NOR2XL U18 ( .A(access_addr[1]), .B(n100), .Y(n99) );
  INVXL U19 ( .A(access_addr[2]), .Y(n100) );
  NAND2X1 U20 ( .A(n52), .B(n68), .Y(lfsr[0]) );
  NAND2X1 U21 ( .A(ram[31]), .B(n36), .Y(n68) );
  NAND2X1 U22 ( .A(n28), .B(n36), .Y(n67) );
  NAND2X1 U23 ( .A(write_en), .B(n63), .Y(n52) );
  CLKINVX1 U24 ( .A(n63), .Y(n62) );
  AOI21X1 U25 ( .A0(n99), .A1(ram[18]), .B0(n37), .Y(n98) );
  AOI21X1 U26 ( .A0(n99), .A1(ram[16]), .B0(n37), .Y(n79) );
  AOI21X1 U27 ( .A0(n99), .A1(ram[19]), .B0(n37), .Y(n102) );
  AOI21X1 U28 ( .A0(n99), .A1(ram[17]), .B0(n37), .Y(n96) );
  CLKINVX1 U29 ( .A(access_addr[0]), .Y(n37) );
  NAND2XL U30 ( .A(write_en), .B(access_addr[7]), .Y(n55) );
  NAND2XL U31 ( .A(write_en), .B(write_data[15]), .Y(n43) );
  NAND2XL U32 ( .A(write_en), .B(access_addr[11]), .Y(n59) );
  NAND2XL U33 ( .A(write_en), .B(access_addr[10]), .Y(n58) );
  NAND2XL U34 ( .A(write_en), .B(write_data[14]), .Y(n42) );
  NAND2XL U35 ( .A(write_en), .B(write_data[13]), .Y(n41) );
  NAND2XL U36 ( .A(write_en), .B(access_addr[12]), .Y(n60) );
  NAND2XL U37 ( .A(write_en), .B(access_addr[13]), .Y(n61) );
  NAND2XL U38 ( .A(write_en), .B(write_data[12]), .Y(n40) );
  NAND2XL U39 ( .A(write_en), .B(write_data[11]), .Y(n39) );
  NAND2XL U40 ( .A(write_en), .B(access_addr[14]), .Y(n69) );
  NAND2XL U41 ( .A(write_en), .B(write_data[10]), .Y(n38) );
  NAND2XL U42 ( .A(write_en), .B(access_addr[8]), .Y(n56) );
  NAND2XL U43 ( .A(write_en), .B(access_addr[9]), .Y(n57) );
  NAND2XL U44 ( .A(write_en), .B(write_data[9]), .Y(n77) );
  NAND2XL U45 ( .A(write_en), .B(write_data[8]), .Y(n76) );
  NAND2XL U46 ( .A(write_en), .B(write_data[7]), .Y(n75) );
  NAND2XL U47 ( .A(write_en), .B(write_data[6]), .Y(n74) );
  NAND2XL U48 ( .A(write_en), .B(write_data[5]), .Y(n73) );
  NAND2XL U49 ( .A(write_en), .B(write_data[4]), .Y(n72) );
  NAND2XL U50 ( .A(write_en), .B(write_data[3]), .Y(n71) );
  OAI211XL U51 ( .A0(write_data[2]), .A1(n65), .B0(write_en), .C0(n64), .Y(n66) );
  NAND2XL U52 ( .A(write_data[2]), .B(n65), .Y(n64) );
  INVXL U53 ( .A(write_data[1]), .Y(n48) );
  NAND2XL U54 ( .A(write_en), .B(access_addr[5]), .Y(n51) );
  NAND2XL U55 ( .A(write_en), .B(access_addr[15]), .Y(n70) );
  NAND3XL U56 ( .A(ram[31]), .B(access_addr[8]), .C(n34), .Y(n93) );
  NAND2XL U57 ( .A(access_addr[3]), .B(n111), .Y(n107) );
  NAND2XL U58 ( .A(access_addr[4]), .B(n111), .Y(n116) );
  OAI2BB2XL U59 ( .B0(write_data[0]), .B1(n28), .A0N(write_data[0]), .A1N(n28), 
        .Y(n63) );
  AOI2BB2X1 U60 ( .B0(n20), .B1(n38), .A0N(n20), .A1N(n38), .Y(lfsr[10]) );
  AOI2BB2X1 U61 ( .B0(n19), .B1(n39), .A0N(n19), .A1N(n39), .Y(lfsr[11]) );
  AOI2BB2X1 U62 ( .B0(n18), .B1(n40), .A0N(n18), .A1N(n40), .Y(lfsr[12]) );
  AOI2BB2X1 U63 ( .B0(n17), .B1(n41), .A0N(n17), .A1N(n41), .Y(lfsr[13]) );
  AOI2BB2X1 U64 ( .B0(n16), .B1(n42), .A0N(n16), .A1N(n42), .Y(lfsr[14]) );
  AOI2BB2X1 U65 ( .B0(n15), .B1(n43), .A0N(n15), .A1N(n43), .Y(lfsr[15]) );
  OAI21XL U66 ( .A0(n36), .A1(n37), .B0(n34), .Y(n44) );
  OAI31XL U67 ( .A0(n36), .A1(n34), .A2(n37), .B0(n44), .Y(lfsr[16]) );
  OAI21XL U68 ( .A0(n36), .A1(n111), .B0(ram[16]), .Y(n45) );
  OAI31XL U69 ( .A0(n36), .A1(ram[16]), .A2(n111), .B0(n45), .Y(lfsr[17]) );
  OAI21XL U70 ( .A0(n36), .A1(n100), .B0(ram[17]), .Y(n46) );
  OAI31XL U71 ( .A0(n36), .A1(ram[17]), .A2(n100), .B0(n46), .Y(lfsr[18]) );
  OAI21XL U72 ( .A0(n36), .A1(n108), .B0(ram[18]), .Y(n47) );
  OAI31XL U73 ( .A0(n36), .A1(ram[18]), .A2(n108), .B0(n47), .Y(lfsr[19]) );
  OAI221XL U74 ( .A0(write_data[1]), .A1(n53), .B0(n48), .B1(n52), .C0(n67), 
        .Y(n49) );
  AOI2BB2X1 U75 ( .B0(n29), .B1(n49), .A0N(n29), .A1N(n49), .Y(lfsr[1]) );
  OAI21XL U76 ( .A0(n36), .A1(n118), .B0(ram[19]), .Y(n50) );
  OAI31XL U77 ( .A0(n36), .A1(ram[19]), .A2(n118), .B0(n50), .Y(lfsr[20]) );
  AOI2BB2X1 U78 ( .B0(n13), .B1(n51), .A0N(n13), .A1N(n51), .Y(lfsr[21]) );
  OAI221XL U79 ( .A0(access_addr[6]), .A1(n53), .B0(n87), .B1(n52), .C0(n67), 
        .Y(n54) );
  AOI2BB2X1 U80 ( .B0(n3), .B1(n54), .A0N(n3), .A1N(n54), .Y(lfsr[22]) );
  AOI2BB2X1 U81 ( .B0(n12), .B1(n55), .A0N(n12), .A1N(n55), .Y(lfsr[23]) );
  AOI2BB2X1 U82 ( .B0(n11), .B1(n56), .A0N(n11), .A1N(n56), .Y(lfsr[24]) );
  AOI2BB2X1 U83 ( .B0(n10), .B1(n57), .A0N(n10), .A1N(n57), .Y(lfsr[25]) );
  AOI2BB2X1 U84 ( .B0(n9), .B1(n58), .A0N(n9), .A1N(n58), .Y(lfsr[26]) );
  AOI2BB2X1 U85 ( .B0(n8), .B1(n59), .A0N(n8), .A1N(n59), .Y(lfsr[27]) );
  AOI2BB2X1 U86 ( .B0(n7), .B1(n60), .A0N(n7), .A1N(n60), .Y(lfsr[28]) );
  AOI2BB2X1 U87 ( .B0(n6), .B1(n61), .A0N(n6), .A1N(n61), .Y(lfsr[29]) );
  OAI22XL U88 ( .A0(n63), .A1(n2), .B0(n62), .B1(ram[1]), .Y(n65) );
  OAI221XL U89 ( .A0(ram[1]), .A1(n68), .B0(n2), .B1(n67), .C0(n66), .Y(
        lfsr[2]) );
  AOI2BB2X1 U90 ( .B0(n5), .B1(n69), .A0N(n5), .A1N(n69), .Y(lfsr[30]) );
  AOI2BB2X1 U91 ( .B0(n4), .B1(n70), .A0N(n4), .A1N(n70), .Y(lfsr[31]) );
  AOI2BB2X1 U92 ( .B0(n27), .B1(n71), .A0N(n27), .A1N(n71), .Y(lfsr[3]) );
  AOI2BB2X1 U93 ( .B0(n26), .B1(n72), .A0N(n26), .A1N(n72), .Y(lfsr[4]) );
  AOI2BB2X1 U94 ( .B0(n25), .B1(n73), .A0N(n25), .A1N(n73), .Y(lfsr[5]) );
  AOI2BB2X1 U95 ( .B0(n24), .B1(n74), .A0N(n24), .A1N(n74), .Y(lfsr[6]) );
  AOI2BB2X1 U96 ( .B0(n23), .B1(n75), .A0N(n23), .A1N(n75), .Y(lfsr[7]) );
  AOI2BB2X1 U97 ( .B0(n22), .B1(n76), .A0N(n22), .A1N(n76), .Y(lfsr[8]) );
  AOI2BB2X1 U98 ( .B0(n21), .B1(n77), .A0N(n21), .A1N(n77), .Y(lfsr[9]) );
  CLKINVX1 U99 ( .A(n90), .Y(n117) );
  OAI31XL U100 ( .A0(n29), .A1(n100), .A2(n31), .B0(n117), .Y(n78) );
  OAI21XL U101 ( .A0(n29), .A1(n79), .B0(n78), .Y(read_data[0]) );
  AOI2BB2X1 U102 ( .B0(n80), .B1(n111), .A0N(n80), .A1N(n90), .Y(n81) );
  OAI21XL U103 ( .A0(access_addr[0]), .A1(n19), .B0(n81), .Y(read_data[10]) );
  AOI2BB2X1 U104 ( .B0(n83), .B1(n111), .A0N(n83), .A1N(n90), .Y(n84) );
  OAI21XL U105 ( .A0(access_addr[0]), .A1(n18), .B0(n84), .Y(read_data[11]) );
  AOI2BB2X1 U106 ( .B0(n85), .B1(n111), .A0N(n85), .A1N(n90), .Y(n86) );
  OAI21XL U107 ( .A0(access_addr[0]), .A1(n17), .B0(n86), .Y(read_data[12]) );
  AOI2BB2X1 U108 ( .B0(n88), .B1(n111), .A0N(n88), .A1N(n90), .Y(n89) );
  OAI21XL U109 ( .A0(access_addr[0]), .A1(n16), .B0(n89), .Y(read_data[13]) );
  AOI2BB2X1 U110 ( .B0(n91), .B1(n111), .A0N(n91), .A1N(n90), .Y(n92) );
  OAI21XL U111 ( .A0(access_addr[0]), .A1(n15), .B0(n92), .Y(read_data[14]) );
  AOI2BB2X1 U112 ( .B0(n93), .B1(n117), .A0N(n93), .A1N(access_addr[1]), .Y(
        n94) );
  OAI21XL U113 ( .A0(access_addr[0]), .A1(n14), .B0(n94), .Y(read_data[15]) );
  NOR2X1 U114 ( .A(access_addr[0]), .B(n31), .Y(read_data[16]) );
  NOR2X1 U115 ( .A(access_addr[0]), .B(n30), .Y(read_data[17]) );
  NOR2X1 U116 ( .A(access_addr[0]), .B(n32), .Y(read_data[18]) );
  NOR2X1 U117 ( .A(access_addr[0]), .B(n33), .Y(read_data[19]) );
  OAI31XL U118 ( .A0(n100), .A1(n30), .A2(n2), .B0(n117), .Y(n95) );
  OAI21XL U119 ( .A0(n96), .A1(n2), .B0(n95), .Y(read_data[1]) );
  NOR2X1 U120 ( .A(access_addr[0]), .B(n13), .Y(read_data[20]) );
  NOR2X1 U121 ( .A(access_addr[0]), .B(n3), .Y(read_data[21]) );
  NOR2X1 U122 ( .A(access_addr[0]), .B(n12), .Y(read_data[22]) );
  NOR2X1 U123 ( .A(access_addr[0]), .B(n11), .Y(read_data[23]) );
  NOR2X1 U124 ( .A(access_addr[0]), .B(n10), .Y(read_data[24]) );
  NOR2X1 U125 ( .A(access_addr[0]), .B(n9), .Y(read_data[25]) );
  NOR2X1 U126 ( .A(access_addr[0]), .B(n8), .Y(read_data[26]) );
  NOR2X1 U127 ( .A(access_addr[0]), .B(n7), .Y(read_data[27]) );
  NOR2X1 U128 ( .A(access_addr[0]), .B(n6), .Y(read_data[28]) );
  NOR2X1 U129 ( .A(access_addr[0]), .B(n5), .Y(read_data[29]) );
  OAI31XL U130 ( .A0(n27), .A1(n100), .A2(n32), .B0(n117), .Y(n97) );
  OAI21XL U131 ( .A0(n27), .A1(n98), .B0(n97), .Y(read_data[2]) );
  NOR2X1 U132 ( .A(access_addr[0]), .B(n4), .Y(read_data[30]) );
  NOR2X1 U133 ( .A(access_addr[0]), .B(n28), .Y(read_data[31]) );
  OAI31XL U134 ( .A0(n26), .A1(n100), .A2(n33), .B0(n117), .Y(n101) );
  OAI21XL U135 ( .A0(n26), .A1(n102), .B0(n101), .Y(read_data[3]) );
  OA21XL U136 ( .A0(n13), .A1(n107), .B0(access_addr[0]), .Y(n104) );
  OAI31XL U137 ( .A0(n25), .A1(n13), .A2(n108), .B0(n117), .Y(n103) );
  OAI21XL U138 ( .A0(n25), .A1(n104), .B0(n103), .Y(read_data[4]) );
  OA21XL U139 ( .A0(n3), .A1(n107), .B0(access_addr[0]), .Y(n106) );
  OAI31XL U140 ( .A0(n24), .A1(n3), .A2(n108), .B0(n117), .Y(n105) );
  OAI21XL U141 ( .A0(n24), .A1(n106), .B0(n105), .Y(read_data[5]) );
  OA21XL U142 ( .A0(n12), .A1(n107), .B0(access_addr[0]), .Y(n110) );
  OAI31XL U143 ( .A0(n23), .A1(n12), .A2(n108), .B0(n117), .Y(n109) );
  OAI21XL U144 ( .A0(n23), .A1(n110), .B0(n109), .Y(read_data[6]) );
  OA21XL U145 ( .A0(n11), .A1(n116), .B0(access_addr[0]), .Y(n113) );
  OAI31XL U146 ( .A0(n22), .A1(n11), .A2(n118), .B0(n117), .Y(n112) );
  OAI21XL U147 ( .A0(n22), .A1(n113), .B0(n112), .Y(read_data[7]) );
  OA21XL U148 ( .A0(n10), .A1(n116), .B0(access_addr[0]), .Y(n115) );
  OAI31XL U149 ( .A0(n21), .A1(n10), .A2(n118), .B0(n117), .Y(n114) );
  OAI21XL U150 ( .A0(n21), .A1(n115), .B0(n114), .Y(read_data[8]) );
  OA21XL U151 ( .A0(n9), .A1(n116), .B0(access_addr[0]), .Y(n120) );
  OAI31XL U152 ( .A0(n9), .A1(n20), .A2(n118), .B0(n117), .Y(n119) );
  OAI21XL U153 ( .A0(n20), .A1(n120), .B0(n119), .Y(read_data[9]) );
endmodule


module trcd ( clk, rst, mem_access_addr, mem_write_data, mem_write_en, 
        mem_read_data );
  input [15:0] mem_access_addr;
  input [15:0] mem_write_data;
  output [31:0] mem_read_data;
  input clk, rst, mem_write_en;
  wire   n1, n2;

  ora ora ( .clk(clk), .rst(rst), .access_addr({mem_access_addr[15:1], n2}), 
        .write_data(mem_write_data), .write_en(n1), .read_data(mem_read_data)
         );
  CLKBUFX3 U1 ( .A(mem_write_en), .Y(n1) );
  CLKBUFX3 U2 ( .A(mem_access_addr[0]), .Y(n2) );
endmodule


module MEM_stage ( clk, rst, irst_reg_data, rand_data, pipeline_reg_in, 
        pipeline_reg_out, mem_op_dest, mem_read_data, ex_alu_result, 
        mem_write_data, mem_write_en );
  input [15:0] irst_reg_data;
  output [31:0] rand_data;
  input [37:0] pipeline_reg_in;
  output [36:0] pipeline_reg_out;
  output [2:0] mem_op_dest;
  input [15:0] mem_read_data;
  output [15:0] ex_alu_result;
  output [15:0] mem_write_data;
  input clk, rst;
  output mem_write_en;
  wire   pipeline_reg_in_4, pipeline_reg_in_0, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, n1, n38, n39;
  assign pipeline_reg_in_4 = pipeline_reg_in[4];
  assign pipeline_reg_in_0 = pipeline_reg_in[0];

  trcd trcd ( .clk(clk), .rst(rst), .mem_access_addr(pipeline_reg_in[37:22]), 
        .mem_write_data(pipeline_reg_in[20:5]), .mem_write_en(
        pipeline_reg_in[21]), .mem_read_data(rand_data) );
  DFFQX1 \pipeline_reg_out_reg[20]  ( .D(N42), .CK(clk), .Q(
        pipeline_reg_out[20]) );
  DFFQX1 \pipeline_reg_out_reg[19]  ( .D(N41), .CK(clk), .Q(
        pipeline_reg_out[19]) );
  DFFQX1 \pipeline_reg_out_reg[18]  ( .D(N40), .CK(clk), .Q(
        pipeline_reg_out[18]) );
  DFFQX1 \pipeline_reg_out_reg[17]  ( .D(N39), .CK(clk), .Q(
        pipeline_reg_out[17]) );
  DFFQX1 \pipeline_reg_out_reg[16]  ( .D(N38), .CK(clk), .Q(
        pipeline_reg_out[16]) );
  DFFQX1 \pipeline_reg_out_reg[15]  ( .D(N37), .CK(clk), .Q(
        pipeline_reg_out[15]) );
  DFFQX1 \pipeline_reg_out_reg[14]  ( .D(N36), .CK(clk), .Q(
        pipeline_reg_out[14]) );
  DFFQX1 \pipeline_reg_out_reg[13]  ( .D(N35), .CK(clk), .Q(
        pipeline_reg_out[13]) );
  DFFQX1 \pipeline_reg_out_reg[12]  ( .D(N34), .CK(clk), .Q(
        pipeline_reg_out[12]) );
  DFFQX1 \pipeline_reg_out_reg[11]  ( .D(N33), .CK(clk), .Q(
        pipeline_reg_out[11]) );
  DFFQX1 \pipeline_reg_out_reg[10]  ( .D(N32), .CK(clk), .Q(
        pipeline_reg_out[10]) );
  DFFQX1 \pipeline_reg_out_reg[9]  ( .D(N31), .CK(clk), .Q(pipeline_reg_out[9]) );
  DFFQX1 \pipeline_reg_out_reg[8]  ( .D(N30), .CK(clk), .Q(pipeline_reg_out[8]) );
  DFFQX1 \pipeline_reg_out_reg[7]  ( .D(N29), .CK(clk), .Q(pipeline_reg_out[7]) );
  DFFQX1 \pipeline_reg_out_reg[6]  ( .D(N28), .CK(clk), .Q(pipeline_reg_out[6]) );
  DFFQX1 \pipeline_reg_out_reg[5]  ( .D(N27), .CK(clk), .Q(pipeline_reg_out[5]) );
  DFFTRX1 \pipeline_reg_out_reg[36]  ( .D(pipeline_reg_in[37]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[36]) );
  DFFTRX1 \pipeline_reg_out_reg[35]  ( .D(pipeline_reg_in[36]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[35]) );
  DFFTRX1 \pipeline_reg_out_reg[34]  ( .D(pipeline_reg_in[35]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[34]) );
  DFFTRX1 \pipeline_reg_out_reg[33]  ( .D(pipeline_reg_in[34]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[33]) );
  DFFTRX1 \pipeline_reg_out_reg[32]  ( .D(pipeline_reg_in[33]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[32]) );
  DFFTRX1 \pipeline_reg_out_reg[31]  ( .D(pipeline_reg_in[32]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[31]) );
  DFFTRX1 \pipeline_reg_out_reg[30]  ( .D(pipeline_reg_in[31]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[30]) );
  DFFTRX1 \pipeline_reg_out_reg[29]  ( .D(pipeline_reg_in[30]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[29]) );
  DFFTRX1 \pipeline_reg_out_reg[28]  ( .D(pipeline_reg_in[29]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[28]) );
  DFFTRX1 \pipeline_reg_out_reg[27]  ( .D(pipeline_reg_in[28]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[27]) );
  DFFTRX1 \pipeline_reg_out_reg[26]  ( .D(pipeline_reg_in[27]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[26]) );
  DFFTRX1 \pipeline_reg_out_reg[25]  ( .D(pipeline_reg_in[26]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[25]) );
  DFFTRX1 \pipeline_reg_out_reg[24]  ( .D(pipeline_reg_in[25]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[24]) );
  DFFTRX1 \pipeline_reg_out_reg[23]  ( .D(pipeline_reg_in[24]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[23]) );
  DFFTRX1 \pipeline_reg_out_reg[22]  ( .D(pipeline_reg_in[23]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[22]) );
  DFFTRX1 \pipeline_reg_out_reg[21]  ( .D(pipeline_reg_in[22]), .RN(n1), .CK(
        clk), .Q(pipeline_reg_out[21]) );
  DFFTRX1 \pipeline_reg_out_reg[4]  ( .D(pipeline_reg_in_4), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[4]) );
  DFFTRX1 \pipeline_reg_out_reg[3]  ( .D(pipeline_reg_in[3]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[3]) );
  DFFTRX1 \pipeline_reg_out_reg[2]  ( .D(pipeline_reg_in[2]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[2]) );
  DFFTRX1 \pipeline_reg_out_reg[1]  ( .D(pipeline_reg_in[1]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[1]) );
  DFFTRX1 \pipeline_reg_out_reg[0]  ( .D(pipeline_reg_in_0), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[0]) );
  CLKINVX1 U3 ( .A(rst), .Y(n1) );
  NOR2X1 U4 ( .A(rst), .B(irst_reg_data[15]), .Y(n38) );
  AND2X2 U5 ( .A(irst_reg_data[15]), .B(n1), .Y(n39) );
  CLKBUFX3 U6 ( .A(pipeline_reg_in[3]), .Y(mem_op_dest[2]) );
  CLKBUFX3 U7 ( .A(pipeline_reg_in[1]), .Y(mem_op_dest[0]) );
  CLKBUFX3 U8 ( .A(pipeline_reg_in[2]), .Y(mem_op_dest[1]) );
  CLKBUFX3 U9 ( .A(pipeline_reg_in[37]), .Y(ex_alu_result[15]) );
  CLKBUFX3 U10 ( .A(pipeline_reg_in[36]), .Y(ex_alu_result[14]) );
  CLKBUFX3 U11 ( .A(pipeline_reg_in[35]), .Y(ex_alu_result[13]) );
  CLKBUFX3 U12 ( .A(pipeline_reg_in[34]), .Y(ex_alu_result[12]) );
  CLKBUFX3 U13 ( .A(pipeline_reg_in[33]), .Y(ex_alu_result[11]) );
  CLKBUFX3 U14 ( .A(pipeline_reg_in[32]), .Y(ex_alu_result[10]) );
  CLKBUFX3 U15 ( .A(pipeline_reg_in[31]), .Y(ex_alu_result[9]) );
  CLKBUFX3 U16 ( .A(pipeline_reg_in[30]), .Y(ex_alu_result[8]) );
  CLKBUFX3 U17 ( .A(pipeline_reg_in[29]), .Y(ex_alu_result[7]) );
  CLKBUFX3 U18 ( .A(pipeline_reg_in[28]), .Y(ex_alu_result[6]) );
  CLKBUFX3 U19 ( .A(pipeline_reg_in[27]), .Y(ex_alu_result[5]) );
  CLKBUFX3 U20 ( .A(pipeline_reg_in[26]), .Y(ex_alu_result[4]) );
  CLKBUFX3 U21 ( .A(pipeline_reg_in[25]), .Y(ex_alu_result[3]) );
  CLKBUFX3 U22 ( .A(pipeline_reg_in[24]), .Y(ex_alu_result[2]) );
  CLKBUFX3 U23 ( .A(pipeline_reg_in[23]), .Y(ex_alu_result[1]) );
  CLKBUFX3 U24 ( .A(pipeline_reg_in[22]), .Y(ex_alu_result[0]) );
  CLKBUFX3 U25 ( .A(pipeline_reg_in[20]), .Y(mem_write_data[15]) );
  CLKBUFX3 U26 ( .A(pipeline_reg_in[19]), .Y(mem_write_data[14]) );
  CLKBUFX3 U27 ( .A(pipeline_reg_in[18]), .Y(mem_write_data[13]) );
  CLKBUFX3 U28 ( .A(pipeline_reg_in[17]), .Y(mem_write_data[12]) );
  CLKBUFX3 U29 ( .A(pipeline_reg_in[16]), .Y(mem_write_data[11]) );
  CLKBUFX3 U30 ( .A(pipeline_reg_in[15]), .Y(mem_write_data[10]) );
  CLKBUFX3 U31 ( .A(pipeline_reg_in[14]), .Y(mem_write_data[9]) );
  CLKBUFX3 U32 ( .A(pipeline_reg_in[13]), .Y(mem_write_data[8]) );
  CLKBUFX3 U33 ( .A(pipeline_reg_in[12]), .Y(mem_write_data[7]) );
  CLKBUFX3 U34 ( .A(pipeline_reg_in[11]), .Y(mem_write_data[6]) );
  CLKBUFX3 U35 ( .A(pipeline_reg_in[10]), .Y(mem_write_data[5]) );
  CLKBUFX3 U36 ( .A(pipeline_reg_in[9]), .Y(mem_write_data[4]) );
  CLKBUFX3 U37 ( .A(pipeline_reg_in[8]), .Y(mem_write_data[3]) );
  CLKBUFX3 U38 ( .A(pipeline_reg_in[7]), .Y(mem_write_data[2]) );
  CLKBUFX3 U39 ( .A(pipeline_reg_in[6]), .Y(mem_write_data[1]) );
  CLKBUFX3 U40 ( .A(pipeline_reg_in[5]), .Y(mem_write_data[0]) );
  CLKBUFX3 U41 ( .A(pipeline_reg_in[21]), .Y(mem_write_en) );
  AO22X1 U42 ( .A0(n39), .A1(rand_data[0]), .B0(n38), .B1(mem_read_data[0]), 
        .Y(N27) );
  AO22X1 U43 ( .A0(n39), .A1(rand_data[1]), .B0(n38), .B1(mem_read_data[1]), 
        .Y(N28) );
  AO22X1 U44 ( .A0(n39), .A1(rand_data[2]), .B0(n38), .B1(mem_read_data[2]), 
        .Y(N29) );
  AO22X1 U45 ( .A0(n39), .A1(rand_data[3]), .B0(n38), .B1(mem_read_data[3]), 
        .Y(N30) );
  AO22X1 U46 ( .A0(n39), .A1(rand_data[4]), .B0(n38), .B1(mem_read_data[4]), 
        .Y(N31) );
  AO22X1 U47 ( .A0(n39), .A1(rand_data[5]), .B0(n38), .B1(mem_read_data[5]), 
        .Y(N32) );
  AO22X1 U48 ( .A0(n39), .A1(rand_data[6]), .B0(n38), .B1(mem_read_data[6]), 
        .Y(N33) );
  AO22X1 U49 ( .A0(n39), .A1(rand_data[7]), .B0(n38), .B1(mem_read_data[7]), 
        .Y(N34) );
  AO22X1 U50 ( .A0(n39), .A1(rand_data[8]), .B0(n38), .B1(mem_read_data[8]), 
        .Y(N35) );
  AO22X1 U51 ( .A0(n39), .A1(rand_data[9]), .B0(n38), .B1(mem_read_data[9]), 
        .Y(N36) );
  AO22X1 U52 ( .A0(n39), .A1(rand_data[10]), .B0(n38), .B1(mem_read_data[10]), 
        .Y(N37) );
  AO22X1 U53 ( .A0(n39), .A1(rand_data[11]), .B0(n38), .B1(mem_read_data[11]), 
        .Y(N38) );
  AO22X1 U54 ( .A0(n39), .A1(rand_data[12]), .B0(n38), .B1(mem_read_data[12]), 
        .Y(N39) );
  AO22X1 U55 ( .A0(n39), .A1(rand_data[13]), .B0(n38), .B1(mem_read_data[13]), 
        .Y(N40) );
  AO22X1 U56 ( .A0(n39), .A1(rand_data[14]), .B0(n38), .B1(mem_read_data[14]), 
        .Y(N41) );
  AO22X1 U57 ( .A0(n39), .A1(rand_data[15]), .B0(n38), .B1(mem_read_data[15]), 
        .Y(N42) );
endmodule


module WB_stage ( pipeline_reg_in, reg_write_en, reg_write_dest, 
        reg_write_data, wb_op_dest );
  input [36:0] pipeline_reg_in;
  output [2:0] reg_write_dest;
  output [15:0] reg_write_data;
  output [2:0] wb_op_dest;
  output reg_write_en;
  wire   pipeline_reg_in_0, n1, n4, n7, n11;
  assign pipeline_reg_in_0 = pipeline_reg_in[0];

  INVXL U1 ( .A(pipeline_reg_in[3]), .Y(n7) );
  INVXL U2 ( .A(pipeline_reg_in[2]), .Y(n4) );
  INVXL U3 ( .A(pipeline_reg_in[1]), .Y(n1) );
  INVXL U4 ( .A(pipeline_reg_in_0), .Y(n11) );
  CLKINVX1 U5 ( .A(n7), .Y(wb_op_dest[2]) );
  CLKINVX1 U6 ( .A(n1), .Y(wb_op_dest[0]) );
  CLKINVX1 U7 ( .A(n4), .Y(wb_op_dest[1]) );
  CLKINVX1 U8 ( .A(n7), .Y(reg_write_dest[2]) );
  CLKINVX1 U9 ( .A(n4), .Y(reg_write_dest[1]) );
  CLKINVX1 U10 ( .A(n1), .Y(reg_write_dest[0]) );
  CLKBUFX3 U11 ( .A(pipeline_reg_in[4]), .Y(reg_write_en) );
  AO22X1 U12 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[5]), .B0(n11), .B1(
        pipeline_reg_in[21]), .Y(reg_write_data[0]) );
  AO22X1 U13 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[15]), .B0(n11), 
        .B1(pipeline_reg_in[31]), .Y(reg_write_data[10]) );
  AO22X1 U14 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[16]), .B0(n11), 
        .B1(pipeline_reg_in[32]), .Y(reg_write_data[11]) );
  AO22X1 U15 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[17]), .B0(n11), 
        .B1(pipeline_reg_in[33]), .Y(reg_write_data[12]) );
  AO22X1 U16 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[18]), .B0(n11), 
        .B1(pipeline_reg_in[34]), .Y(reg_write_data[13]) );
  AO22X1 U17 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[19]), .B0(n11), 
        .B1(pipeline_reg_in[35]), .Y(reg_write_data[14]) );
  AO22X1 U18 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[20]), .B0(n11), 
        .B1(pipeline_reg_in[36]), .Y(reg_write_data[15]) );
  AO22X1 U19 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[6]), .B0(n11), .B1(
        pipeline_reg_in[22]), .Y(reg_write_data[1]) );
  AO22X1 U20 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[7]), .B0(n11), .B1(
        pipeline_reg_in[23]), .Y(reg_write_data[2]) );
  AO22X1 U21 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[8]), .B0(n11), .B1(
        pipeline_reg_in[24]), .Y(reg_write_data[3]) );
  AO22X1 U22 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[9]), .B0(n11), .B1(
        pipeline_reg_in[25]), .Y(reg_write_data[4]) );
  AO22X1 U23 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[10]), .B0(n11), 
        .B1(pipeline_reg_in[26]), .Y(reg_write_data[5]) );
  AO22X1 U24 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[11]), .B0(n11), 
        .B1(pipeline_reg_in[27]), .Y(reg_write_data[6]) );
  AO22X1 U25 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[12]), .B0(n11), 
        .B1(pipeline_reg_in[28]), .Y(reg_write_data[7]) );
  AO22X1 U26 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[13]), .B0(n11), 
        .B1(pipeline_reg_in[29]), .Y(reg_write_data[8]) );
  AO22X1 U27 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[14]), .B0(n11), 
        .B1(pipeline_reg_in[30]), .Y(reg_write_data[9]) );
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

  OA22X1 U2 ( .A0(n31), .A1(n30), .B0(n29), .B1(n28), .Y(pipeline_stall_n) );
  AOI221XL U3 ( .A0(n14), .A1(ex_op_dest[0]), .B0(n23), .B1(ex_op_dest[1]), 
        .C0(n13), .Y(n27) );
  NOR3XL U4 ( .A(decoding_op_src1[0]), .B(decoding_op_src1[2]), .C(
        decoding_op_src1[1]), .Y(n30) );
  INVXL U5 ( .A(decoding_op_src1[1]), .Y(n8) );
  NOR3X1 U6 ( .A(decoding_op_src2[1]), .B(decoding_op_src2[0]), .C(
        decoding_op_src2[2]), .Y(n28) );
  AOI211X1 U7 ( .A0(n27), .A1(n26), .B0(n25), .C0(n24), .Y(n29) );
  AOI211X1 U8 ( .A0(wb_op_dest[1]), .A1(n23), .B0(n22), .C0(n21), .Y(n24) );
  AOI211X1 U9 ( .A0(mem_op_dest[1]), .A1(n23), .B0(n18), .C0(n17), .Y(n25) );
  CLKINVX1 U10 ( .A(decoding_op_src2[2]), .Y(n20) );
  CLKINVX1 U11 ( .A(decoding_op_src2[1]), .Y(n23) );
  CLKINVX1 U12 ( .A(decoding_op_src2[0]), .Y(n14) );
  AOI211X1 U13 ( .A0(n12), .A1(n11), .B0(n10), .C0(n9), .Y(n31) );
  AOI211X1 U14 ( .A0(wb_op_dest[1]), .A1(n8), .B0(n7), .C0(n6), .Y(n9) );
  CLKINVX1 U15 ( .A(wb_op_dest[2]), .Y(n19) );
  AOI211X1 U16 ( .A0(mem_op_dest[1]), .A1(n8), .B0(n4), .C0(n3), .Y(n10) );
  CLKINVX1 U17 ( .A(mem_op_dest[2]), .Y(n16) );
  CLKINVX1 U18 ( .A(ex_op_dest[2]), .Y(n15) );
  INVXL U19 ( .A(decoding_op_src1[0]), .Y(n2) );
  INVXL U20 ( .A(decoding_op_src1[2]), .Y(n5) );
  OAI22XL U21 ( .A0(decoding_op_src1[2]), .A1(ex_op_dest[2]), .B0(n5), .B1(n15), .Y(n12) );
  OAI22XL U22 ( .A0(n2), .A1(ex_op_dest[0]), .B0(n8), .B1(ex_op_dest[1]), .Y(
        n1) );
  AOI221XL U23 ( .A0(n2), .A1(ex_op_dest[0]), .B0(ex_op_dest[1]), .B1(n8), 
        .C0(n1), .Y(n11) );
  AOI2BB2X1 U24 ( .B0(decoding_op_src1[0]), .B1(mem_op_dest[0]), .A0N(
        decoding_op_src1[0]), .A1N(mem_op_dest[0]), .Y(n4) );
  OAI222XL U25 ( .A0(mem_op_dest[2]), .A1(n5), .B0(n16), .B1(
        decoding_op_src1[2]), .C0(mem_op_dest[1]), .C1(n8), .Y(n3) );
  AOI2BB2X1 U26 ( .B0(decoding_op_src1[0]), .B1(wb_op_dest[0]), .A0N(
        decoding_op_src1[0]), .A1N(wb_op_dest[0]), .Y(n7) );
  OAI222XL U27 ( .A0(decoding_op_src1[2]), .A1(n19), .B0(n5), .B1(
        wb_op_dest[2]), .C0(wb_op_dest[1]), .C1(n8), .Y(n6) );
  OAI22XL U28 ( .A0(ex_op_dest[0]), .A1(n14), .B0(n23), .B1(ex_op_dest[1]), 
        .Y(n13) );
  OAI22XL U29 ( .A0(ex_op_dest[2]), .A1(decoding_op_src2[2]), .B0(n15), .B1(
        n20), .Y(n26) );
  AOI2BB2X1 U30 ( .B0(mem_op_dest[0]), .B1(decoding_op_src2[0]), .A0N(
        mem_op_dest[0]), .A1N(decoding_op_src2[0]), .Y(n18) );
  OAI222XL U31 ( .A0(mem_op_dest[2]), .A1(n20), .B0(n16), .B1(
        decoding_op_src2[2]), .C0(mem_op_dest[1]), .C1(n23), .Y(n17) );
  AOI2BB2X1 U32 ( .B0(wb_op_dest[0]), .B1(decoding_op_src2[0]), .A0N(
        wb_op_dest[0]), .A1N(decoding_op_src2[0]), .Y(n22) );
  OAI222XL U33 ( .A0(wb_op_dest[2]), .A1(n20), .B0(n19), .B1(
        decoding_op_src2[2]), .C0(wb_op_dest[1]), .C1(n23), .Y(n21) );
endmodule


module mips_16_core_top ( clk, rst, irst_reg_data, irst_done, instruction, pc, 
        inst_write_en, inst_write_data, reg_read_data_1, reg_read_data_2, 
        reg_write_en, reg_write_dest, reg_write_data, reg_read_addr_1, 
        reg_read_addr_2, mem_read_data, mem_access_addr, mem_write_data, 
        mem_write_en, rand_data );
  input [15:0] irst_reg_data;
  input [15:0] instruction;
  output [7:0] pc;
  output [15:0] inst_write_data;
  input [15:0] reg_read_data_1;
  input [15:0] reg_read_data_2;
  output [2:0] reg_write_dest;
  output [15:0] reg_write_data;
  output [2:0] reg_read_addr_1;
  output [2:0] reg_read_addr_2;
  input [15:0] mem_read_data;
  output [15:0] mem_access_addr;
  output [15:0] mem_write_data;
  inout [31:0] rand_data;
  input clk, rst;
  output irst_done, inst_write_en, reg_write_en, mem_write_en;
  wire   pipeline_stall_n, branch_taken;
  wire   [5:0] branch_offset_imm;
  wire   [56:0] ID_pipeline_reg_out;
  wire   [2:0] decoding_op_src1;
  wire   [2:0] decoding_op_src2;
  wire   [37:0] EX_pipeline_reg_out;
  wire   [2:0] ex_op_dest;
  wire   [36:0] MEM_pipeline_reg_out;
  wire   [2:0] mem_op_dest;
  wire   [2:0] wb_op_dest;

  IF_stage IF_stage_inst ( .clk(clk), .rst(rst), .irst_reg_data({
        irst_reg_data[15:8], 1'b0, 1'b0, irst_reg_data[5:0]}), .irst_done(
        irst_done), .instruction_fetch_en(pipeline_stall_n), 
        .branch_offset_imm(branch_offset_imm), .branch_taken(branch_taken), 
        .pc(pc), .write_en(inst_write_en) );
  randomizer rand ( .rand_data({1'b0, 1'b0, 1'b0, 1'b0, rand_data[11:0]}), 
        .inst(instruction), .rand_inst(inst_write_data) );
  ID_stage ID_stage_inst ( .clk(clk), .rst(rst), .instruction_decode_en(
        pipeline_stall_n), .pipeline_reg_out(ID_pipeline_reg_out), 
        .instruction(instruction), .branch_offset_imm(branch_offset_imm), 
        .branch_taken(branch_taken), .reg_read_addr_1(reg_read_addr_1), 
        .reg_read_addr_2(reg_read_addr_2), .reg_read_data_1(reg_read_data_1), 
        .reg_read_data_2(reg_read_data_2), .decoding_op_src1(decoding_op_src1), 
        .decoding_op_src2(decoding_op_src2) );
  EX_stage EX_stage_inst ( .clk(clk), .rst(rst), .pipeline_reg_in(
        ID_pipeline_reg_out), .pipeline_reg_out(EX_pipeline_reg_out), 
        .ex_op_dest(ex_op_dest) );
  MEM_stage MEM_stage_inst ( .clk(clk), .rst(rst), .irst_reg_data({
        irst_reg_data[15], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .rand_data(rand_data), 
        .pipeline_reg_in(EX_pipeline_reg_out), .pipeline_reg_out(
        MEM_pipeline_reg_out), .mem_op_dest(mem_op_dest), .mem_read_data(
        mem_read_data), .ex_alu_result(mem_access_addr), .mem_write_data(
        mem_write_data), .mem_write_en(mem_write_en) );
  WB_stage WB_stage_inst ( .pipeline_reg_in(MEM_pipeline_reg_out), 
        .reg_write_en(reg_write_en), .reg_write_dest(reg_write_dest), 
        .reg_write_data(reg_write_data), .wb_op_dest(wb_op_dest) );
  hazard_detection_unit hazard_detection_unit_inst ( .decoding_op_src1(
        decoding_op_src1), .decoding_op_src2(decoding_op_src2), .ex_op_dest(
        ex_op_dest), .mem_op_dest(mem_op_dest), .wb_op_dest(wb_op_dest), 
        .pipeline_stall_n(pipeline_stall_n) );
endmodule

