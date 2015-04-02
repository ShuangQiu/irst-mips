
module IF_stage ( clk, rst, irst_reg_data, irst_done, instruction_fetch_en, 
        branch_offset_imm, branch_taken, pc, write_en_BAR );
  input [15:0] irst_reg_data;
  input [5:0] branch_offset_imm;
  output [7:0] pc;
  input clk, rst, instruction_fetch_en, branch_taken;
  output irst_done, write_en_BAR;
  wire   irst_reg_data_5, irst_reg_data_4, irst_reg_data_3, irst_reg_data_2,
         irst_reg_data_1, irst_reg_data_0, n85, n86, n87, n88, n89, n90, n91,
         n92, \pc_reg[7] , N70, N71, N72, N73, N74, N75, N76, N77, N82, N83,
         N85, N86, n12, n13, n14, n15, n16, n17, \C1/Z_5 , \C1/Z_4 , \C1/Z_3 ,
         \C1/Z_2 , \C1/Z_1 , \DP_OP_19J1_127_73/n8 , \DP_OP_19J1_127_73/n7 ,
         \DP_OP_19J1_127_73/n6 , \DP_OP_19J1_127_73/n5 ,
         \DP_OP_19J1_127_73/n4 , \DP_OP_19J1_127_73/n3 ,
         \DP_OP_19J1_127_73/n2 , \DP_OP_19J1_127_73/n1 , n1, n2, n4, n5, n6,
         n7, n8, n9, n10, n11, n18, n19, n20, n22, n24, n26, n28, n30, n32,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84;
  wire   [1:0] state;
  wire   [7:0] next_pc;
  wire   [5:0] cntr;
  wire   [1:0] next_state;
  assign irst_reg_data_5 = irst_reg_data[5];
  assign irst_reg_data_4 = irst_reg_data[4];
  assign irst_reg_data_3 = irst_reg_data[3];
  assign irst_reg_data_2 = irst_reg_data[2];
  assign irst_reg_data_1 = irst_reg_data[1];
  assign irst_reg_data_0 = irst_reg_data[0];

  TLATX1 \next_pc_reg[0]  ( .G(instruction_fetch_en), .D(N70), .Q(next_pc[0]), 
        .QN(n53) );
  TLATX1 \next_pc_reg[2]  ( .G(instruction_fetch_en), .D(N72), .Q(next_pc[2]), 
        .QN(n52) );
  TLATX1 \next_pc_reg[7]  ( .G(instruction_fetch_en), .D(N77), .QN(n51) );
  TLATX1 \next_pc_reg[5]  ( .G(instruction_fetch_en), .D(N75), .QN(n50) );
  TLATX1 \next_pc_reg[4]  ( .G(instruction_fetch_en), .D(N74), .QN(n49) );
  TLATX1 \next_pc_reg[3]  ( .G(instruction_fetch_en), .D(N73), .Q(next_pc[3]), 
        .QN(n39) );
  TLATX1 \next_pc_reg[6]  ( .G(instruction_fetch_en), .D(N76), .Q(next_pc[6])
         );
  DFFRX1 \cntr_reg[5]  ( .D(n16), .CK(clk), .RN(n55), .Q(cntr[5]) );
  DFFRX1 \pc_reg_reg[7]  ( .D(N85), .CK(clk), .RN(n55), .Q(\pc_reg[7] ) );
  XOR2X1 \DP_OP_19J1_127_73/U2  ( .A(\C1/Z_5 ), .B(\pc_reg[7] ), .Y(
        \DP_OP_19J1_127_73/n1 ) );
  ADDFXL \DP_OP_19J1_127_73/U8  ( .A(n91), .B(\C1/Z_1 ), .CI(
        \DP_OP_19J1_127_73/n8 ), .CO(\DP_OP_19J1_127_73/n7 ), .S(N71) );
  ADDFXL \DP_OP_19J1_127_73/U7  ( .A(n90), .B(\C1/Z_2 ), .CI(
        \DP_OP_19J1_127_73/n7 ), .CO(\DP_OP_19J1_127_73/n6 ), .S(N72) );
  ADDFXL \DP_OP_19J1_127_73/U6  ( .A(n89), .B(\C1/Z_3 ), .CI(
        \DP_OP_19J1_127_73/n6 ), .CO(\DP_OP_19J1_127_73/n5 ), .S(N73) );
  ADDFXL \DP_OP_19J1_127_73/U5  ( .A(n88), .B(\C1/Z_4 ), .CI(
        \DP_OP_19J1_127_73/n5 ), .CO(\DP_OP_19J1_127_73/n4 ), .S(N74) );
  ADDFXL \DP_OP_19J1_127_73/U4  ( .A(\C1/Z_5 ), .B(n87), .CI(
        \DP_OP_19J1_127_73/n4 ), .CO(\DP_OP_19J1_127_73/n3 ), .S(N75) );
  ADDFXL \DP_OP_19J1_127_73/U3  ( .A(\C1/Z_5 ), .B(n86), .CI(
        \DP_OP_19J1_127_73/n3 ), .CO(\DP_OP_19J1_127_73/n2 ), .S(N76) );
  XOR2X1 \DP_OP_19J1_127_73/U1  ( .A(\DP_OP_19J1_127_73/n2 ), .B(
        \DP_OP_19J1_127_73/n1 ), .Y(N77) );
  DFFRX1 \pc_reg_reg[6]  ( .D(n47), .CK(clk), .RN(n55), .Q(n86), .QN(n30) );
  DFFRX1 \pc_reg_reg[3]  ( .D(n46), .CK(clk), .RN(n55), .Q(n89), .QN(n26) );
  DFFRX1 \pc_reg_reg[2]  ( .D(n45), .CK(clk), .RN(n55), .Q(n90), .QN(n24) );
  DFFRX1 \pc_reg_reg[1]  ( .D(n44), .CK(clk), .RN(n55), .Q(n91), .QN(n22) );
  DFFRX1 \pc_reg_reg[0]  ( .D(n43), .CK(clk), .RN(n55), .Q(n92), .QN(n32) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n55), .Q(state[0]), 
        .QN(n38) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n55), .Q(state[1]), 
        .QN(n42) );
  DFFRX1 \pc_reg_reg[5]  ( .D(N83), .CK(clk), .RN(n55), .Q(n87), .QN(n28) );
  DFFRX1 \pc_reg_reg[4]  ( .D(N82), .CK(clk), .RN(n55), .Q(n88), .QN(n20) );
  DFFRX1 \cntr_reg[0]  ( .D(n17), .CK(clk), .RN(n55), .Q(cntr[0]), .QN(n36) );
  DFFRX1 \cntr_reg[1]  ( .D(n12), .CK(clk), .RN(n55), .Q(cntr[1]), .QN(n37) );
  DFFRX1 \cntr_reg[4]  ( .D(n15), .CK(clk), .RN(n55), .Q(cntr[4]), .QN(n48) );
  DFFRX1 \cntr_reg[3]  ( .D(n14), .CK(clk), .RN(n55), .Q(cntr[3]), .QN(n41) );
  DFFRX1 \cntr_reg[2]  ( .D(n13), .CK(clk), .RN(n55), .Q(cntr[2]), .QN(n40) );
  TLATXL \next_pc_reg[1]  ( .G(instruction_fetch_en), .D(N71), .Q(next_pc[1]), 
        .QN(n1) );
  CLKINVX1 U3 ( .A(irst_reg_data[10]), .Y(n2) );
  OAI211X1 U4 ( .A0(irst_reg_data[9]), .A1(n1), .B0(irst_reg_data[8]), .C0(n53), .Y(n4) );
  NAND2X1 U5 ( .A(irst_reg_data[9]), .B(n1), .Y(n5) );
  OAI211X1 U6 ( .A0(next_pc[2]), .A1(n2), .B0(n4), .C0(n5), .Y(n6) );
  OA22X1 U7 ( .A0(irst_reg_data[11]), .A1(n39), .B0(irst_reg_data[10]), .B1(
        n52), .Y(n7) );
  AOI222XL U8 ( .A0(n6), .A1(n7), .B0(irst_reg_data[12]), .B1(n49), .C0(
        irst_reg_data[11]), .C1(n39), .Y(n8) );
  OAI22XL U9 ( .A0(n49), .A1(irst_reg_data[12]), .B0(n50), .B1(
        irst_reg_data[13]), .Y(n9) );
  NAND2X1 U10 ( .A(n50), .B(irst_reg_data[13]), .Y(n10) );
  OAI21XL U11 ( .A0(n8), .A1(n9), .B0(n10), .Y(n11) );
  OAI2BB1X1 U12 ( .A0N(n11), .A1N(irst_reg_data[14]), .B0(next_pc[6]), .Y(n18)
         );
  OAI211X1 U13 ( .A0(n11), .A1(irst_reg_data[14]), .B0(n51), .C0(n18), .Y(n63)
         );
  NAND2BX1 U14 ( .AN(branch_offset_imm[0]), .B(branch_taken), .Y(n19) );
  AND2X1 U15 ( .A(n92), .B(n19), .Y(\DP_OP_19J1_127_73/n8 ) );
  AOI2BB2X1 U16 ( .B0(n92), .B1(n19), .A0N(n92), .A1N(n19), .Y(N70) );
  INVX12 U17 ( .A(n20), .Y(pc[4]) );
  INVX12 U18 ( .A(n22), .Y(pc[1]) );
  INVX12 U19 ( .A(n24), .Y(pc[2]) );
  INVX12 U20 ( .A(n26), .Y(pc[3]) );
  INVX12 U21 ( .A(n28), .Y(pc[5]) );
  INVX12 U22 ( .A(n30), .Y(pc[6]) );
  INVX12 U23 ( .A(n32), .Y(pc[0]) );
  AND2XL U24 ( .A(branch_taken), .B(branch_offset_imm[3]), .Y(\C1/Z_3 ) );
  AND2XL U25 ( .A(branch_taken), .B(branch_offset_imm[4]), .Y(\C1/Z_4 ) );
  INVX1 U26 ( .A(n72), .Y(n79) );
  NOR2X1 U27 ( .A(n54), .B(n51), .Y(N85) );
  AND2X2 U28 ( .A(n69), .B(next_pc[1]), .Y(n44) );
  AND2X2 U29 ( .A(n69), .B(next_pc[6]), .Y(n47) );
  AND2X2 U30 ( .A(n69), .B(next_pc[3]), .Y(n46) );
  OAI211X1 U31 ( .A0(state[0]), .A1(irst_reg_data[15]), .B0(n66), .C0(n42), 
        .Y(n68) );
  AND2X2 U32 ( .A(n69), .B(next_pc[2]), .Y(n45) );
  INVX1 U33 ( .A(n75), .Y(n76) );
  OR2X1 U34 ( .A(n38), .B(n42), .Y(N86) );
  OAI21X1 U35 ( .A0(state[1]), .A1(n70), .B0(state[0]), .Y(n72) );
  OAI2BB1X2 U36 ( .A0N(n38), .A1N(n42), .B0(n63), .Y(n69) );
  INVX12 U37 ( .A(N86), .Y(irst_done) );
  BUFX12 U38 ( .A(n85), .Y(pc[7]) );
  AOI2BB1X1 U39 ( .A0N(state[1]), .A1N(\pc_reg[7] ), .B0(state[0]), .Y(n85) );
  CLKINVX1 U40 ( .A(n69), .Y(n54) );
  INVX3 U41 ( .A(rst), .Y(n55) );
  AND2XL U42 ( .A(branch_taken), .B(branch_offset_imm[5]), .Y(\C1/Z_5 ) );
  OAI22XL U43 ( .A0(n78), .A1(n41), .B0(n77), .B1(n76), .Y(n14) );
  OAI31XL U44 ( .A0(cntr[2]), .A1(n82), .A2(n81), .B0(n80), .Y(n13) );
  NAND2X1 U45 ( .A(irst_reg_data[15]), .B(irst_done), .Y(n67) );
  AND2X2 U46 ( .A(branch_taken), .B(branch_offset_imm[1]), .Y(\C1/Z_1 ) );
  AND2X2 U47 ( .A(branch_taken), .B(branch_offset_imm[2]), .Y(\C1/Z_2 ) );
  AND2X2 U48 ( .A(n69), .B(next_pc[0]), .Y(n43) );
  AOI32X1 U49 ( .A0(n78), .A1(cntr[4]), .A2(n77), .B0(n74), .B1(n48), .Y(n15)
         );
  NAND2X1 U50 ( .A(n73), .B(n41), .Y(n77) );
  NAND3X1 U51 ( .A(cntr[3]), .B(n73), .C(n75), .Y(n74) );
  NOR3X1 U52 ( .A(n37), .B(n36), .C(n40), .Y(n75) );
  CLKINVX1 U53 ( .A(n82), .Y(n73) );
  NOR2X1 U54 ( .A(cntr[1]), .B(n82), .Y(n83) );
  NAND2X1 U55 ( .A(cntr[1]), .B(cntr[0]), .Y(n81) );
  NAND3X1 U56 ( .A(n70), .B(state[0]), .C(next_state[1]), .Y(n82) );
  NAND2X1 U57 ( .A(n67), .B(n56), .Y(next_state[1]) );
  CLKINVX1 U58 ( .A(next_state[0]), .Y(n70) );
  OAI211X1 U59 ( .A0(n69), .A1(write_en_BAR), .B0(n68), .C0(n67), .Y(
        next_state[0]) );
  OAI211X1 U60 ( .A0(n65), .A1(n64), .B0(state[0]), .C0(n63), .Y(n66) );
  AOI211X1 U61 ( .A0(cntr[4]), .A1(n62), .B0(n61), .C0(n60), .Y(n64) );
  NOR2BX1 U62 ( .AN(cntr[5]), .B(irst_reg_data_5), .Y(n60) );
  AOI22X1 U63 ( .A0(irst_reg_data_0), .A1(n36), .B0(irst_reg_data_1), .B1(n37), 
        .Y(n58) );
  NOR2BX1 U64 ( .AN(irst_reg_data_5), .B(cntr[5]), .Y(n65) );
  NOR2X1 U65 ( .A(n54), .B(n50), .Y(N83) );
  NOR2X1 U66 ( .A(n54), .B(n49), .Y(N82) );
  NAND2X1 U67 ( .A(state[1]), .B(n38), .Y(write_en_BAR) );
  AO22X1 U68 ( .A0(state[1]), .A1(n63), .B0(write_en_BAR), .B1(n69), .Y(n56)
         );
  OAI22XL U69 ( .A0(irst_reg_data_1), .A1(n37), .B0(irst_reg_data_2), .B1(n40), 
        .Y(n57) );
  OAI2BB2XL U70 ( .B0(n58), .B1(n57), .A0N(n40), .A1N(irst_reg_data_2), .Y(n59) );
  AOI222XL U71 ( .A0(irst_reg_data_3), .A1(n41), .B0(irst_reg_data_3), .B1(n59), .C0(n41), .C1(n59), .Y(n62) );
  AOI2BB1X1 U72 ( .A0N(n62), .A1N(cntr[4]), .B0(irst_reg_data_4), .Y(n61) );
  OAI22XL U73 ( .A0(cntr[0]), .A1(n82), .B0(n36), .B1(n79), .Y(n17) );
  OAI21XL U74 ( .A0(n73), .A1(n72), .B0(cntr[5]), .Y(n71) );
  OAI21XL U75 ( .A0(n74), .A1(n48), .B0(n71), .Y(n16) );
  AOI2BB1X1 U76 ( .A0N(n75), .A1N(n82), .B0(n72), .Y(n78) );
  OAI21XL U77 ( .A0(cntr[0]), .A1(n82), .B0(n79), .Y(n84) );
  OAI21XL U78 ( .A0(n83), .A1(n84), .B0(cntr[2]), .Y(n80) );
  AO22X1 U79 ( .A0(cntr[1]), .A1(n84), .B0(cntr[0]), .B1(n83), .Y(n12) );
endmodule


module randomizer ( inst, \rand_data[15] , \rand_data[14] , \rand_data[13] , 
        \rand_data[12] , \rand_data[11] , \rand_data[10] , \rand_data[9] , 
        \rand_data[8]_BAR , \rand_data[2] , \rand_data[1] , \rand_data[0] , 
        \rand_inst[15] , \rand_inst[14] , \rand_inst[13] , \rand_inst[12] , 
        \rand_inst[11] , \rand_inst[10] , \rand_inst[9] , \rand_inst[8]_BAR , 
        \rand_inst[2] , \rand_inst[1] , \rand_inst[0] , \rand_data[7]_BAR , 
        \rand_inst[7]_BAR , \rand_data[6]_BAR , \rand_inst[6]_BAR , 
        \rand_data[5]_BAR , \rand_inst[5]_BAR , \rand_data[4]_BAR , 
        \rand_inst[4]_BAR , \rand_data[3]_BAR , \rand_inst[3]_BAR  );
  input [15:0] inst;
  input \rand_data[15] , \rand_data[14] , \rand_data[13] , \rand_data[12] ,
         \rand_data[11] , \rand_data[10] , \rand_data[9] , \rand_data[8]_BAR ,
         \rand_data[2] , \rand_data[1] , \rand_data[0] , \rand_data[7]_BAR ,
         \rand_data[6]_BAR , \rand_data[5]_BAR , \rand_data[4]_BAR ,
         \rand_data[3]_BAR ;
  output \rand_inst[15] , \rand_inst[14] , \rand_inst[13] , \rand_inst[12] ,
         \rand_inst[11] , \rand_inst[10] , \rand_inst[9] , \rand_inst[8]_BAR ,
         \rand_inst[2] , \rand_inst[1] , \rand_inst[0] , \rand_inst[7]_BAR ,
         \rand_inst[6]_BAR , \rand_inst[5]_BAR , \rand_inst[4]_BAR ,
         \rand_inst[3]_BAR ;
  wire   n21, n22, n23, n24, n25, N42, N43, N44, n1, n7, n8, n19, n20;
  wire   [15:0] rand_data;
  wire   [15:0] rand_inst;
  wire   [15:0] mask_gen;
  assign rand_data[8] = \rand_data[8]_BAR ;
  assign rand_data[7] = \rand_data[7]_BAR ;
  assign rand_data[6] = \rand_data[6]_BAR ;
  assign rand_data[5] = \rand_data[5]_BAR ;
  assign rand_data[4] = \rand_data[4]_BAR ;
  assign rand_data[3] = \rand_data[3]_BAR ;

  TLATX1 \mask_gen_reg[0]  ( .G(N42), .D(N43), .Q(mask_gen[0]), .QN(n8) );
  TLATX1 \mask_gen_reg[9]  ( .G(N42), .D(N44), .Q(mask_gen[9]), .QN(n7) );
  OAI21XL U3 ( .A0(inst[13]), .A1(inst[12]), .B0(inst[15]), .Y(n1) );
  NOR2X1 U4 ( .A(inst[14]), .B(n1), .Y(N43) );
  AOI22X1 U5 ( .A0(mask_gen[9]), .A1(rand_data[10]), .B0(n7), .B1(inst[10]), 
        .Y(n22) );
  AOI22X1 U6 ( .A0(mask_gen[0]), .A1(rand_data[2]), .B0(n8), .B1(inst[2]), .Y(
        n23) );
  AOI22X1 U7 ( .A0(mask_gen[0]), .A1(rand_data[1]), .B0(n8), .B1(inst[1]), .Y(
        n24) );
  NOR3X1 U8 ( .A(inst[12]), .B(inst[13]), .C(N44), .Y(n20) );
  NAND2X1 U9 ( .A(inst[15]), .B(inst[14]), .Y(N44) );
  INVX12 U10 ( .A(n23), .Y(rand_inst[2]) );
  INVX12 U11 ( .A(n24), .Y(rand_inst[1]) );
  INVX12 U12 ( .A(n22), .Y(rand_inst[10]) );
  AOI22X1 U13 ( .A0(mask_gen[0]), .A1(rand_data[0]), .B0(n8), .B1(inst[0]), 
        .Y(n25) );
  INVX12 U14 ( .A(n25), .Y(rand_inst[0]) );
  AOI22X1 U15 ( .A0(mask_gen[9]), .A1(rand_data[11]), .B0(n7), .B1(inst[11]), 
        .Y(n21) );
  INVX12 U16 ( .A(n21), .Y(rand_inst[11]) );
  OAI31XL U17 ( .A0(n20), .A1(rand_inst[11]), .A2(rand_inst[10]), .B0(n19), 
        .Y(rand_inst[9]) );
  BUFX12 U18 ( .A(inst[15]), .Y(\rand_inst[15] ) );
  BUFX12 U19 ( .A(inst[14]), .Y(\rand_inst[14] ) );
  BUFX12 U20 ( .A(inst[13]), .Y(\rand_inst[13] ) );
  BUFX12 U21 ( .A(inst[12]), .Y(\rand_inst[12] ) );
  CLKBUFX3 U22 ( .A(rand_data[5]), .Y(\rand_inst[5]_BAR ) );
  CLKBUFX3 U23 ( .A(rand_data[4]), .Y(\rand_inst[4]_BAR ) );
  CLKBUFX3 U24 ( .A(rand_data[6]), .Y(\rand_inst[6]_BAR ) );
  CLKBUFX3 U25 ( .A(rand_data[7]), .Y(\rand_inst[7]_BAR ) );
  CLKBUFX3 U26 ( .A(rand_data[3]), .Y(\rand_inst[3]_BAR ) );
  CLKBUFX3 U27 ( .A(rand_data[8]), .Y(\rand_inst[8]_BAR ) );
  OR2X1 U28 ( .A(n20), .B(N44), .Y(N42) );
  OAI22XL U29 ( .A0(mask_gen[9]), .A1(inst[9]), .B0(n7), .B1(rand_data[9]), 
        .Y(n19) );
endmodule


module ID_stage ( clk, rst, instruction_decode_en, pipeline_reg_out, 
        instruction, branch_offset_imm, branch_taken, reg_read_addr_2, 
        reg_read_data_1, reg_read_data_2, decoding_op_src2, 
        \reg_read_addr_1[2]_BAR , \decoding_op_src1[2]_BAR , 
        \reg_read_addr_1[1]_BAR , \decoding_op_src1[1]_BAR , 
        \reg_read_addr_1[0]_BAR , \decoding_op_src1[0]_BAR  );
  output [56:0] pipeline_reg_out;
  input [15:0] instruction;
  output [5:0] branch_offset_imm;
  output [2:0] reg_read_addr_2;
  input [15:0] reg_read_data_1;
  input [15:0] reg_read_data_2;
  output [2:0] decoding_op_src2;
  input clk, rst, instruction_decode_en;
  output branch_taken, \reg_read_addr_1[2]_BAR , \decoding_op_src1[2]_BAR ,
         \reg_read_addr_1[1]_BAR , \decoding_op_src1[1]_BAR ,
         \reg_read_addr_1[0]_BAR , \decoding_op_src1[0]_BAR ;
  wire   n73, n74, n75, write_back_en, write_back_result_mux, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n24, n26,
         n27, n29, n30, n51, n25, n28, n31, n32, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72;
  wire   [15:9] instruction_reg;
  wire   [2:0] ir_dest_with_bubble;
  wire   [2:0] ex_alu_cmd;
  wire   [15:0] ex_alu_src2;

  DFFRX1 \pipeline_reg_out_reg[19]  ( .D(reg_read_data_2[14]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[19]) );
  DFFRX1 \pipeline_reg_out_reg[18]  ( .D(reg_read_data_2[13]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[18]) );
  DFFRX1 \pipeline_reg_out_reg[17]  ( .D(reg_read_data_2[12]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[17]) );
  DFFRX1 \pipeline_reg_out_reg[16]  ( .D(reg_read_data_2[11]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[16]) );
  DFFRX1 \pipeline_reg_out_reg[15]  ( .D(reg_read_data_2[10]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[15]) );
  DFFRX1 \pipeline_reg_out_reg[14]  ( .D(reg_read_data_2[9]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[14]) );
  DFFRX1 \pipeline_reg_out_reg[13]  ( .D(reg_read_data_2[8]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[13]) );
  DFFRX1 \pipeline_reg_out_reg[12]  ( .D(reg_read_data_2[7]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[12]) );
  DFFRX1 \pipeline_reg_out_reg[11]  ( .D(reg_read_data_2[6]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[11]) );
  DFFRX1 \pipeline_reg_out_reg[10]  ( .D(reg_read_data_2[5]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[10]) );
  DFFRX1 \pipeline_reg_out_reg[9]  ( .D(reg_read_data_2[4]), .CK(clk), .RN(n30), .Q(pipeline_reg_out[9]) );
  DFFRX1 \pipeline_reg_out_reg[8]  ( .D(reg_read_data_2[3]), .CK(clk), .RN(n30), .Q(pipeline_reg_out[8]) );
  DFFRX1 \pipeline_reg_out_reg[7]  ( .D(reg_read_data_2[2]), .CK(clk), .RN(n30), .Q(pipeline_reg_out[7]) );
  DFFRX1 \pipeline_reg_out_reg[6]  ( .D(reg_read_data_2[1]), .CK(clk), .RN(n30), .Q(pipeline_reg_out[6]) );
  DFFRX1 \pipeline_reg_out_reg[5]  ( .D(reg_read_data_2[0]), .CK(clk), .RN(n30), .Q(pipeline_reg_out[5]) );
  DFFRX1 \pipeline_reg_out_reg[4]  ( .D(write_back_en), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[4]) );
  DFFRX1 \pipeline_reg_out_reg[0]  ( .D(write_back_result_mux), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[0]) );
  DFFSX1 \pipeline_reg_out_reg[21]  ( .D(n51), .CK(clk), .SN(n30), .QN(
        pipeline_reg_out[21]) );
  DFFRX1 \instruction_reg_reg[0]  ( .D(n5), .CK(clk), .RN(n30), .Q(
        branch_offset_imm[0]) );
  DFFRX1 \instruction_reg_reg[2]  ( .D(n7), .CK(clk), .RN(n30), .Q(
        branch_offset_imm[2]) );
  DFFRX1 \instruction_reg_reg[1]  ( .D(n6), .CK(clk), .RN(n30), .Q(
        branch_offset_imm[1]) );
  DFFRX1 \pipeline_reg_out_reg[48]  ( .D(reg_read_data_1[10]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[48]) );
  DFFRX1 \pipeline_reg_out_reg[47]  ( .D(reg_read_data_1[9]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[47]) );
  DFFRX1 \pipeline_reg_out_reg[49]  ( .D(reg_read_data_1[11]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[49]) );
  DFFRX1 \pipeline_reg_out_reg[3]  ( .D(ir_dest_with_bubble[2]), .CK(clk), 
        .RN(n30), .Q(pipeline_reg_out[3]) );
  DFFRX1 \pipeline_reg_out_reg[2]  ( .D(ir_dest_with_bubble[1]), .CK(clk), 
        .RN(n30), .Q(pipeline_reg_out[2]) );
  DFFRX1 \pipeline_reg_out_reg[1]  ( .D(ir_dest_with_bubble[0]), .CK(clk), 
        .RN(n30), .Q(pipeline_reg_out[1]) );
  DFFRX1 \pipeline_reg_out_reg[36]  ( .D(ex_alu_src2[14]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[36]) );
  DFFRX1 \pipeline_reg_out_reg[30]  ( .D(ex_alu_src2[8]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[30]) );
  DFFRX1 \pipeline_reg_out_reg[32]  ( .D(ex_alu_src2[10]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[32]) );
  DFFRX1 \pipeline_reg_out_reg[35]  ( .D(ex_alu_src2[13]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[35]) );
  DFFRX1 \pipeline_reg_out_reg[45]  ( .D(reg_read_data_1[7]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[45]) );
  DFFRX1 \pipeline_reg_out_reg[44]  ( .D(reg_read_data_1[6]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[44]) );
  DFFRX1 \pipeline_reg_out_reg[28]  ( .D(ex_alu_src2[6]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[28]) );
  DFFRX1 \pipeline_reg_out_reg[33]  ( .D(ex_alu_src2[11]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[33]) );
  DFFRX1 \pipeline_reg_out_reg[31]  ( .D(ex_alu_src2[9]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[31]) );
  DFFRX1 \pipeline_reg_out_reg[34]  ( .D(ex_alu_src2[12]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[34]) );
  DFFRX1 \pipeline_reg_out_reg[29]  ( .D(ex_alu_src2[7]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[29]) );
  DFFRX1 \pipeline_reg_out_reg[27]  ( .D(ex_alu_src2[5]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[27]) );
  DFFRX1 \pipeline_reg_out_reg[41]  ( .D(reg_read_data_1[3]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[41]) );
  DFFRX1 \pipeline_reg_out_reg[37]  ( .D(ex_alu_src2[15]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[37]) );
  DFFRX1 \instruction_reg_reg[11]  ( .D(n16), .CK(clk), .RN(n30), .Q(
        instruction_reg[11]) );
  DFFRX1 \instruction_reg_reg[5]  ( .D(n10), .CK(clk), .RN(n30), .Q(
        branch_offset_imm[5]) );
  DFFRX1 \pipeline_reg_out_reg[39]  ( .D(reg_read_data_1[1]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[39]) );
  DFFRX1 \pipeline_reg_out_reg[38]  ( .D(reg_read_data_1[0]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[38]) );
  DFFRX1 \pipeline_reg_out_reg[54]  ( .D(ex_alu_cmd[0]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[54]) );
  DFFRX1 \instruction_reg_reg[10]  ( .D(n15), .CK(clk), .RN(n30), .Q(
        instruction_reg[10]) );
  DFFRX1 \instruction_reg_reg[9]  ( .D(n14), .CK(clk), .RN(n30), .Q(
        instruction_reg[9]) );
  DFFRX1 \instruction_reg_reg[4]  ( .D(n9), .CK(clk), .RN(n30), .Q(
        branch_offset_imm[4]) );
  DFFRX1 \instruction_reg_reg[3]  ( .D(n8), .CK(clk), .RN(n30), .Q(
        branch_offset_imm[3]) );
  DFFRX1 \pipeline_reg_out_reg[56]  ( .D(ex_alu_cmd[2]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[56]) );
  DFFRX1 \pipeline_reg_out_reg[55]  ( .D(ex_alu_cmd[1]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[55]) );
  DFFRX2 \instruction_reg_reg[7]  ( .D(n12), .CK(clk), .RN(n30), .QN(
        \decoding_op_src1[1]_BAR ) );
  DFFRX2 \instruction_reg_reg[8]  ( .D(n13), .CK(clk), .RN(n30), .QN(
        \decoding_op_src1[2]_BAR ) );
  DFFRX2 \instruction_reg_reg[6]  ( .D(n11), .CK(clk), .RN(n30), .QN(
        \decoding_op_src1[0]_BAR ) );
  DFFRX1 \instruction_reg_reg[15]  ( .D(n20), .CK(clk), .RN(n30), .Q(n28), 
        .QN(n24) );
  DFFRX1 \instruction_reg_reg[13]  ( .D(n18), .CK(clk), .RN(n30), .Q(n31), 
        .QN(n27) );
  DFFRX1 \instruction_reg_reg[12]  ( .D(n17), .CK(clk), .RN(n30), .Q(n25), 
        .QN(n29) );
  DFFRX1 \instruction_reg_reg[14]  ( .D(n19), .CK(clk), .RN(n30), .Q(n32), 
        .QN(n26) );
  DFFRX2 \pipeline_reg_out_reg[46]  ( .D(reg_read_data_1[8]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[46]) );
  DFFRX2 \pipeline_reg_out_reg[52]  ( .D(reg_read_data_1[14]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[52]) );
  DFFRX2 \pipeline_reg_out_reg[51]  ( .D(reg_read_data_1[13]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[51]) );
  DFFRX2 \pipeline_reg_out_reg[42]  ( .D(reg_read_data_1[4]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[42]) );
  DFFRX2 \pipeline_reg_out_reg[50]  ( .D(reg_read_data_1[12]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[50]) );
  DFFRX2 \pipeline_reg_out_reg[40]  ( .D(reg_read_data_1[2]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[40]) );
  DFFRX2 \pipeline_reg_out_reg[53]  ( .D(reg_read_data_1[15]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[53]) );
  DFFRX2 \pipeline_reg_out_reg[43]  ( .D(reg_read_data_1[5]), .CK(clk), .RN(
        n30), .Q(pipeline_reg_out[43]) );
  DFFRX2 \pipeline_reg_out_reg[26]  ( .D(ex_alu_src2[4]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[26]) );
  DFFRX2 \pipeline_reg_out_reg[23]  ( .D(ex_alu_src2[1]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[23]) );
  DFFRX2 \pipeline_reg_out_reg[22]  ( .D(ex_alu_src2[0]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[22]) );
  DFFSRXL \pipeline_reg_out_reg[20]  ( .D(reg_read_data_2[15]), .CK(clk), .SN(
        1'b1), .RN(n30), .Q(pipeline_reg_out[20]) );
  DFFRX4 \pipeline_reg_out_reg[24]  ( .D(ex_alu_src2[2]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[24]) );
  DFFRX4 \pipeline_reg_out_reg[25]  ( .D(ex_alu_src2[3]), .CK(clk), .RN(n30), 
        .Q(pipeline_reg_out[25]) );
  CLKBUFX6 U3 ( .A(n72), .Y(n36) );
  INVX16 U4 ( .A(rst), .Y(n30) );
  CLKINVX1 U6 ( .A(n63), .Y(n61) );
  CLKINVX1 U7 ( .A(n54), .Y(n56) );
  INVXL U8 ( .A(n68), .Y(n66) );
  INVX1 U9 ( .A(instruction_decode_en), .Y(n72) );
  CLKBUFX2 U10 ( .A(\decoding_op_src1[1]_BAR ), .Y(\reg_read_addr_1[1]_BAR )
         );
  OAI21XL U11 ( .A0(n59), .A1(n58), .B0(n57), .Y(n60) );
  OAI2BB1XL U12 ( .A0N(n52), .A1N(n70), .B0(n57), .Y(n53) );
  NAND2XL U13 ( .A(n64), .B(n65), .Y(n67) );
  OAI211XL U14 ( .A0(n59), .A1(n52), .B0(n54), .C0(n58), .Y(n50) );
  AOI2BB2XL U15 ( .B0(n36), .B1(n26), .A0N(n36), .A1N(instruction[14]), .Y(n19) );
  AOI22X1 U16 ( .A0(n48), .A1(instruction_reg[11]), .B0(n51), .B1(
        branch_offset_imm[5]), .Y(n73) );
  AOI22X1 U17 ( .A0(n48), .A1(instruction_reg[10]), .B0(n51), .B1(
        branch_offset_imm[4]), .Y(n74) );
  NOR2X1 U18 ( .A(n31), .B(n47), .Y(n45) );
  NOR2X1 U19 ( .A(n24), .B(n32), .Y(n44) );
  NAND3X1 U20 ( .A(n26), .B(n29), .C(n28), .Y(n47) );
  CLKBUFX2 U21 ( .A(\decoding_op_src1[2]_BAR ), .Y(\reg_read_addr_1[2]_BAR )
         );
  INVX12 U22 ( .A(n74), .Y(reg_read_addr_2[1]) );
  INVX12 U23 ( .A(n73), .Y(reg_read_addr_2[2]) );
  NOR2X1 U24 ( .A(n68), .B(rst), .Y(n54) );
  NOR3X2 U25 ( .A(ir_dest_with_bubble[0]), .B(n43), .C(n42), .Y(branch_taken)
         );
  AOI22X1 U26 ( .A0(n48), .A1(instruction_reg[9]), .B0(n51), .B1(
        branch_offset_imm[3]), .Y(n75) );
  INVX12 U27 ( .A(n75), .Y(reg_read_addr_2[0]) );
  NOR3BXL U28 ( .AN(n71), .B(n70), .C(rst), .Y(write_back_result_mux) );
  CLKINVX1 U29 ( .A(n51), .Y(n48) );
  NAND4X1 U30 ( .A(n26), .B(n25), .C(n28), .D(n31), .Y(n51) );
  NOR2X1 U31 ( .A(n29), .B(n36), .Y(n70) );
  NOR2BX1 U32 ( .AN(reg_read_addr_2[2]), .B(n49), .Y(decoding_op_src2[2]) );
  NAND2X2 U33 ( .A(branch_offset_imm[5]), .B(n61), .Y(n62) );
  NOR2X1 U34 ( .A(n26), .B(n36), .Y(n59) );
  NOR2X1 U35 ( .A(n24), .B(n36), .Y(n68) );
  NOR2BX1 U36 ( .AN(reg_read_addr_2[1]), .B(n49), .Y(decoding_op_src2[1]) );
  NOR2BX1 U37 ( .AN(reg_read_addr_2[0]), .B(n49), .Y(decoding_op_src2[0]) );
  AOI211X1 U38 ( .A0(n31), .A1(n47), .B0(n46), .C0(n45), .Y(n49) );
  NOR2X1 U39 ( .A(n70), .B(n52), .Y(n64) );
  OAI22XL U40 ( .A0(n26), .A1(n28), .B0(n29), .B1(n44), .Y(n46) );
  NAND3XL U41 ( .A(n37), .B(n32), .C(n28), .Y(n43) );
  NOR4XL U42 ( .A(reg_read_data_1[8]), .B(reg_read_data_1[3]), .C(n31), .D(n25), .Y(n37) );
  NOR2BX1 U43 ( .AN(instruction_reg[9]), .B(n36), .Y(ir_dest_with_bubble[0])
         );
  OAI31XL U44 ( .A0(n64), .A1(n65), .A2(n56), .B0(n55), .Y(ex_alu_cmd[2]) );
  NAND4X1 U45 ( .A(n41), .B(n40), .C(n39), .D(n38), .Y(n42) );
  NOR4X1 U46 ( .A(reg_read_data_1[1]), .B(reg_read_data_1[10]), .C(
        reg_read_data_1[9]), .D(reg_read_data_1[7]), .Y(n38) );
  NOR4X1 U47 ( .A(reg_read_data_1[5]), .B(reg_read_data_1[4]), .C(
        reg_read_data_1[2]), .D(reg_read_data_1[6]), .Y(n39) );
  NOR4X1 U48 ( .A(ir_dest_with_bubble[2]), .B(ir_dest_with_bubble[1]), .C(
        reg_read_data_1[12]), .D(reg_read_data_1[14]), .Y(n40) );
  NOR4X1 U49 ( .A(reg_read_data_1[15]), .B(reg_read_data_1[11]), .C(
        reg_read_data_1[0]), .D(reg_read_data_1[13]), .Y(n41) );
  NOR2BX1 U50 ( .AN(instruction_reg[10]), .B(n36), .Y(ir_dest_with_bubble[1])
         );
  NOR2BX1 U51 ( .AN(instruction_reg[11]), .B(n36), .Y(ir_dest_with_bubble[2])
         );
  NAND2X1 U52 ( .A(n55), .B(n50), .Y(ex_alu_cmd[0]) );
  NAND4X1 U53 ( .A(n68), .B(n64), .C(n65), .D(n30), .Y(n55) );
  CLKINVX1 U54 ( .A(n59), .Y(n65) );
  CLKINVX1 U55 ( .A(n70), .Y(n58) );
  CLKBUFX3 U56 ( .A(\decoding_op_src1[0]_BAR ), .Y(\reg_read_addr_1[0]_BAR )
         );
  NAND2X1 U57 ( .A(n59), .B(n64), .Y(n57) );
  AOI211XL U58 ( .A0(n71), .A1(n70), .B0(rst), .C0(n69), .Y(write_back_en) );
  NOR4X1 U59 ( .A(n32), .B(n36), .C(n24), .D(n27), .Y(n71) );
  NOR2X1 U60 ( .A(n27), .B(n36), .Y(n52) );
  AOI31X4 U61 ( .A0(n68), .A1(n30), .A2(n60), .B0(write_back_result_mux), .Y(
        n63) );
  OAI2BB1X1 U62 ( .A0N(n54), .A1N(n53), .B0(n55), .Y(ex_alu_cmd[1]) );
  AO22X1 U63 ( .A0(n63), .A1(reg_read_data_2[0]), .B0(n61), .B1(
        branch_offset_imm[0]), .Y(ex_alu_src2[0]) );
  OAI2BB1X1 U64 ( .A0N(n63), .A1N(reg_read_data_2[10]), .B0(n62), .Y(
        ex_alu_src2[10]) );
  OAI2BB1X1 U65 ( .A0N(n63), .A1N(reg_read_data_2[11]), .B0(n62), .Y(
        ex_alu_src2[11]) );
  OAI2BB1X1 U66 ( .A0N(n63), .A1N(reg_read_data_2[12]), .B0(n62), .Y(
        ex_alu_src2[12]) );
  OAI2BB1X1 U67 ( .A0N(n63), .A1N(reg_read_data_2[13]), .B0(n62), .Y(
        ex_alu_src2[13]) );
  OAI2BB1X1 U68 ( .A0N(n63), .A1N(reg_read_data_2[14]), .B0(n62), .Y(
        ex_alu_src2[14]) );
  OAI2BB1X1 U69 ( .A0N(n63), .A1N(reg_read_data_2[15]), .B0(n62), .Y(
        ex_alu_src2[15]) );
  AO22X1 U70 ( .A0(n63), .A1(reg_read_data_2[1]), .B0(n61), .B1(
        branch_offset_imm[1]), .Y(ex_alu_src2[1]) );
  AO22X1 U71 ( .A0(n63), .A1(reg_read_data_2[2]), .B0(n61), .B1(
        branch_offset_imm[2]), .Y(ex_alu_src2[2]) );
  AO22X1 U72 ( .A0(n63), .A1(reg_read_data_2[3]), .B0(n61), .B1(
        branch_offset_imm[3]), .Y(ex_alu_src2[3]) );
  AO22X1 U73 ( .A0(n63), .A1(reg_read_data_2[4]), .B0(n61), .B1(
        branch_offset_imm[4]), .Y(ex_alu_src2[4]) );
  OAI2BB1X1 U74 ( .A0N(n63), .A1N(reg_read_data_2[5]), .B0(n62), .Y(
        ex_alu_src2[5]) );
  OAI2BB1X1 U75 ( .A0N(n63), .A1N(reg_read_data_2[6]), .B0(n62), .Y(
        ex_alu_src2[6]) );
  OAI2BB1X1 U76 ( .A0N(n63), .A1N(reg_read_data_2[7]), .B0(n62), .Y(
        ex_alu_src2[7]) );
  OAI2BB1X1 U77 ( .A0N(n63), .A1N(reg_read_data_2[8]), .B0(n62), .Y(
        ex_alu_src2[8]) );
  OAI2BB1X1 U78 ( .A0N(n63), .A1N(reg_read_data_2[9]), .B0(n62), .Y(
        ex_alu_src2[9]) );
  OAI22XL U79 ( .A0(n68), .A1(n67), .B0(n66), .B1(n65), .Y(n69) );
  AO22X1 U80 ( .A0(instruction_decode_en), .A1(instruction[0]), .B0(n36), .B1(
        branch_offset_imm[0]), .Y(n5) );
  AO22X1 U81 ( .A0(instruction_decode_en), .A1(instruction[1]), .B0(n36), .B1(
        branch_offset_imm[1]), .Y(n6) );
  AO22X1 U82 ( .A0(instruction_decode_en), .A1(instruction[2]), .B0(n36), .B1(
        branch_offset_imm[2]), .Y(n7) );
  AO22X1 U83 ( .A0(instruction_decode_en), .A1(instruction[3]), .B0(n36), .B1(
        branch_offset_imm[3]), .Y(n8) );
  AO22X1 U84 ( .A0(instruction_decode_en), .A1(instruction[4]), .B0(n36), .B1(
        branch_offset_imm[4]), .Y(n9) );
  AO22X1 U85 ( .A0(instruction_decode_en), .A1(instruction[5]), .B0(n36), .B1(
        branch_offset_imm[5]), .Y(n10) );
  AOI2BB2X1 U86 ( .B0(n36), .B1(\decoding_op_src1[0]_BAR ), .A0N(n36), .A1N(
        instruction[6]), .Y(n11) );
  AOI2BB2X1 U87 ( .B0(n36), .B1(\decoding_op_src1[1]_BAR ), .A0N(n36), .A1N(
        instruction[7]), .Y(n12) );
  AOI2BB2X1 U88 ( .B0(n36), .B1(\decoding_op_src1[2]_BAR ), .A0N(n36), .A1N(
        instruction[8]), .Y(n13) );
  OA22X1 U89 ( .A0(instruction_decode_en), .A1(instruction_reg[9]), .B0(n36), 
        .B1(instruction[9]), .Y(n14) );
  OA22X1 U90 ( .A0(instruction_decode_en), .A1(instruction_reg[10]), .B0(n36), 
        .B1(instruction[10]), .Y(n15) );
  OA22X1 U91 ( .A0(instruction_decode_en), .A1(instruction_reg[11]), .B0(n36), 
        .B1(instruction[11]), .Y(n16) );
  AOI2BB2X1 U92 ( .B0(n36), .B1(n29), .A0N(n36), .A1N(instruction[12]), .Y(n17) );
  AOI2BB2X1 U93 ( .B0(n36), .B1(n27), .A0N(n36), .A1N(instruction[13]), .Y(n18) );
  AOI2BB2X1 U94 ( .B0(n36), .B1(n24), .A0N(n36), .A1N(instruction[15]), .Y(n20) );
endmodule


module alu ( a, b, cmd, r );
  input [15:0] a;
  input [15:0] b;
  input [2:0] cmd;
  output [15:0] r;
  wire   \C4/DATA8_0 , \C4/DATA8_1 , \C4/DATA8_2 , \C4/DATA8_3 , \C4/DATA8_4 ,
         \C4/DATA8_5 , \C4/DATA8_6 , \C4/DATA8_7 , \C4/DATA8_8 , \C4/DATA8_9 ,
         \C4/DATA8_10 , \C4/DATA8_11 , \C4/DATA8_12 , \C4/DATA8_13 ,
         \C4/DATA8_14 , \C4/DATA8_15 , \DP_OP_21J1_124_1250/n53 ,
         \DP_OP_21J1_124_1250/n36 , \DP_OP_21J1_124_1250/n35 ,
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
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349;

  ADDFXL \DP_OP_21J1_124_1250/U17  ( .A(a[0]), .B(\DP_OP_21J1_124_1250/n53 ), 
        .CI(\DP_OP_21J1_124_1250/n36 ), .CO(\DP_OP_21J1_124_1250/n16 ), .S(
        \C4/DATA8_0 ) );
  ADDFXL \DP_OP_21J1_124_1250/U16  ( .A(\DP_OP_21J1_124_1250/n35 ), .B(a[1]), 
        .CI(\DP_OP_21J1_124_1250/n16 ), .CO(\DP_OP_21J1_124_1250/n15 ), .S(
        \C4/DATA8_1 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U21  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[14]), 
        .Y(\DP_OP_21J1_124_1250/n22 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U22  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[13]), 
        .Y(\DP_OP_21J1_124_1250/n23 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U23  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[12]), 
        .Y(\DP_OP_21J1_124_1250/n24 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U24  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[11]), 
        .Y(\DP_OP_21J1_124_1250/n25 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U25  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[10]), 
        .Y(\DP_OP_21J1_124_1250/n26 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U26  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[9]), 
        .Y(\DP_OP_21J1_124_1250/n27 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U27  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[8]), 
        .Y(\DP_OP_21J1_124_1250/n28 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U28  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[7]), 
        .Y(\DP_OP_21J1_124_1250/n29 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U29  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[6]), 
        .Y(\DP_OP_21J1_124_1250/n30 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U30  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[5]), 
        .Y(\DP_OP_21J1_124_1250/n31 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U31  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[4]), 
        .Y(\DP_OP_21J1_124_1250/n32 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U32  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[3]), 
        .Y(\DP_OP_21J1_124_1250/n33 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U33  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[2]), 
        .Y(\DP_OP_21J1_124_1250/n34 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U34  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[1]), 
        .Y(\DP_OP_21J1_124_1250/n35 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U35  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[0]), 
        .Y(\DP_OP_21J1_124_1250/n36 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U20  ( .A(\DP_OP_21J1_124_1250/n53 ), .B(b[15]), 
        .Y(\DP_OP_21J1_124_1250/n21 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U2  ( .A(\DP_OP_21J1_124_1250/n21 ), .B(a[15]), 
        .Y(\DP_OP_21J1_124_1250/n1 ) );
  XOR2X1 \DP_OP_21J1_124_1250/U1  ( .A(\DP_OP_21J1_124_1250/n2 ), .B(
        \DP_OP_21J1_124_1250/n1 ), .Y(\C4/DATA8_15 ) );
  ADDFXL \DP_OP_21J1_124_1250/U3  ( .A(\DP_OP_21J1_124_1250/n22 ), .B(a[14]), 
        .CI(\DP_OP_21J1_124_1250/n3 ), .CO(\DP_OP_21J1_124_1250/n2 ), .S(
        \C4/DATA8_14 ) );
  ADDFXL \DP_OP_21J1_124_1250/U4  ( .A(\DP_OP_21J1_124_1250/n23 ), .B(a[13]), 
        .CI(\DP_OP_21J1_124_1250/n4 ), .CO(\DP_OP_21J1_124_1250/n3 ), .S(
        \C4/DATA8_13 ) );
  ADDFXL \DP_OP_21J1_124_1250/U5  ( .A(\DP_OP_21J1_124_1250/n24 ), .B(a[12]), 
        .CI(\DP_OP_21J1_124_1250/n5 ), .CO(\DP_OP_21J1_124_1250/n4 ), .S(
        \C4/DATA8_12 ) );
  ADDFXL \DP_OP_21J1_124_1250/U6  ( .A(\DP_OP_21J1_124_1250/n25 ), .B(a[11]), 
        .CI(\DP_OP_21J1_124_1250/n6 ), .CO(\DP_OP_21J1_124_1250/n5 ), .S(
        \C4/DATA8_11 ) );
  ADDFXL \DP_OP_21J1_124_1250/U7  ( .A(\DP_OP_21J1_124_1250/n26 ), .B(a[10]), 
        .CI(\DP_OP_21J1_124_1250/n7 ), .CO(\DP_OP_21J1_124_1250/n6 ), .S(
        \C4/DATA8_10 ) );
  ADDFXL \DP_OP_21J1_124_1250/U8  ( .A(\DP_OP_21J1_124_1250/n27 ), .B(a[9]), 
        .CI(\DP_OP_21J1_124_1250/n8 ), .CO(\DP_OP_21J1_124_1250/n7 ), .S(
        \C4/DATA8_9 ) );
  ADDFXL \DP_OP_21J1_124_1250/U15  ( .A(\DP_OP_21J1_124_1250/n34 ), .B(a[2]), 
        .CI(\DP_OP_21J1_124_1250/n15 ), .CO(\DP_OP_21J1_124_1250/n14 ), .S(
        \C4/DATA8_2 ) );
  ADDFXL \DP_OP_21J1_124_1250/U9  ( .A(\DP_OP_21J1_124_1250/n28 ), .B(a[8]), 
        .CI(\DP_OP_21J1_124_1250/n9 ), .CO(\DP_OP_21J1_124_1250/n8 ), .S(
        \C4/DATA8_8 ) );
  ADDFXL \DP_OP_21J1_124_1250/U10  ( .A(\DP_OP_21J1_124_1250/n29 ), .B(a[7]), 
        .CI(\DP_OP_21J1_124_1250/n10 ), .CO(\DP_OP_21J1_124_1250/n9 ), .S(
        \C4/DATA8_7 ) );
  ADDFXL \DP_OP_21J1_124_1250/U11  ( .A(\DP_OP_21J1_124_1250/n30 ), .B(a[6]), 
        .CI(\DP_OP_21J1_124_1250/n11 ), .CO(\DP_OP_21J1_124_1250/n10 ), .S(
        \C4/DATA8_6 ) );
  ADDFXL \DP_OP_21J1_124_1250/U12  ( .A(\DP_OP_21J1_124_1250/n31 ), .B(a[5]), 
        .CI(\DP_OP_21J1_124_1250/n12 ), .CO(\DP_OP_21J1_124_1250/n11 ), .S(
        \C4/DATA8_5 ) );
  ADDFXL \DP_OP_21J1_124_1250/U13  ( .A(\DP_OP_21J1_124_1250/n32 ), .B(a[4]), 
        .CI(\DP_OP_21J1_124_1250/n13 ), .CO(\DP_OP_21J1_124_1250/n12 ), .S(
        \C4/DATA8_4 ) );
  ADDFXL \DP_OP_21J1_124_1250/U14  ( .A(\DP_OP_21J1_124_1250/n33 ), .B(a[3]), 
        .CI(\DP_OP_21J1_124_1250/n14 ), .CO(\DP_OP_21J1_124_1250/n13 ), .S(
        \C4/DATA8_3 ) );
  AOI221XL U2 ( .A0(a[4]), .A1(n27), .B0(n25), .B1(n27), .C0(n235), .Y(n1) );
  AOI2BB1X1 U3 ( .A0N(n296), .A1N(n234), .B0(n303), .Y(n2) );
  OAI2BB2XL U4 ( .B0(n236), .B1(n329), .A0N(n237), .A1N(n271), .Y(n3) );
  CLKINVX1 U5 ( .A(n27), .Y(n4) );
  OAI22XL U6 ( .A0(b[4]), .A1(n25), .B0(n235), .B1(n324), .Y(n5) );
  OAI21XL U7 ( .A0(n4), .A1(n5), .B0(a[4]), .Y(n6) );
  OAI31XL U8 ( .A0(n2), .A1(n255), .A2(n3), .B0(n6), .Y(n7) );
  AOI211X1 U9 ( .A0(\C4/DATA8_4 ), .A1(n59), .B0(n1), .C0(n7), .Y(n8) );
  OAI2BB2XL U10 ( .B0(n28), .B1(n237), .A0N(n28), .A1N(n236), .Y(n9) );
  OAI211X1 U11 ( .A0(n239), .A1(n287), .B0(n238), .C0(n342), .Y(n10) );
  AOI211X1 U12 ( .A0(n241), .A1(n275), .B0(n240), .C0(n10), .Y(n11) );
  OAI211X1 U13 ( .A0(n308), .A1(n9), .B0(n242), .C0(n11), .Y(n12) );
  OAI211X1 U14 ( .A0(n243), .A1(n332), .B0(n8), .C0(n12), .Y(r[4]) );
  NAND2X1 U15 ( .A(n142), .B(n281), .Y(n13) );
  OAI211X1 U16 ( .A0(a[12]), .A1(n216), .B0(n146), .C0(n145), .Y(n14) );
  AOI222XL U17 ( .A0(n13), .A1(n332), .B0(n271), .B1(n147), .C0(n14), .C1(n299), .Y(n15) );
  AOI211X1 U18 ( .A0(n291), .A1(n274), .B0(n148), .C0(n278), .Y(n16) );
  AOI211X1 U19 ( .A0(n309), .A1(n268), .B0(n15), .C0(n16), .Y(n17) );
  OAI21XL U20 ( .A0(b[14]), .A1(n25), .B0(n27), .Y(n18) );
  AOI22X1 U21 ( .A0(a[14]), .A1(n18), .B0(n59), .B1(\C4/DATA8_14 ), .Y(n19) );
  AO22X1 U22 ( .A0(a[14]), .A1(n265), .B0(n26), .B1(n144), .Y(n20) );
  OAI21XL U23 ( .A0(n320), .A1(n20), .B0(b[14]), .Y(n21) );
  NAND3X1 U24 ( .A(n17), .B(n19), .C(n21), .Y(r[14]) );
  AOI211XL U25 ( .A0(b[15]), .A1(n265), .B0(n320), .C0(n149), .Y(n22) );
  OAI211X1 U26 ( .A0(n159), .A1(n327), .B0(n158), .C0(n157), .Y(n23) );
  OAI211X1 U27 ( .A0(n295), .A1(n22), .B0(n160), .C0(n23), .Y(r[15]) );
  OAI21XL U28 ( .A0(n218), .A1(n264), .B0(n172), .Y(n24) );
  NOR3X1 U29 ( .A(n171), .B(n170), .C(n24), .Y(n245) );
  NAND2XL U30 ( .A(n307), .B(a[8]), .Y(n57) );
  NAND2XL U31 ( .A(n271), .B(n257), .Y(n258) );
  CLKINVX1 U32 ( .A(n245), .Y(n260) );
  INVX1 U33 ( .A(n291), .Y(n198) );
  INVX4 U34 ( .A(n26), .Y(n25) );
  INVX1 U35 ( .A(n59), .Y(n29) );
  INVXL U36 ( .A(b[6]), .Y(n283) );
  INVX1 U37 ( .A(n45), .Y(n46) );
  OAI211XL U38 ( .A0(n303), .A1(n302), .B0(n301), .C0(n300), .Y(n304) );
  INVX1 U39 ( .A(n310), .Y(n148) );
  AOI32X1 U40 ( .A0(a[15]), .A1(b[2]), .A2(n214), .B0(n297), .B1(n28), .Y(n228) );
  AND2X1 U41 ( .A(n292), .B(a[7]), .Y(n51) );
  INVX1 U42 ( .A(n311), .Y(n74) );
  NOR2X1 U43 ( .A(b[2]), .B(n140), .Y(n203) );
  OAI211XL U44 ( .A0(n192), .A1(n193), .B0(n85), .C0(n71), .Y(n72) );
  INVX1 U45 ( .A(n151), .Y(n339) );
  AOI2BB2XL U46 ( .B0(n213), .B1(n143), .A0N(n217), .A1N(a[11]), .Y(n146) );
  AOI2BB2XL U47 ( .B0(n194), .B1(a[2]), .A0N(n218), .A1N(n224), .Y(n118) );
  NAND2XL U48 ( .A(n214), .B(n224), .Y(n215) );
  AOI2BB2XL U49 ( .B0(n196), .B1(a[2]), .A0N(n218), .A1N(n195), .Y(n130) );
  INVX1 U50 ( .A(n320), .Y(n334) );
  NAND2XL U51 ( .A(n214), .B(n144), .Y(n145) );
  INVX3 U52 ( .A(n173), .Y(n214) );
  NOR2X1 U53 ( .A(b[2]), .B(n139), .Y(n268) );
  INVX1 U54 ( .A(n239), .Y(n111) );
  NAND2X1 U55 ( .A(b[4]), .B(n295), .Y(n342) );
  NOR2X1 U56 ( .A(cmd[1]), .B(n69), .Y(n84) );
  INVX3 U57 ( .A(b[1]), .Y(n193) );
  INVX1 U58 ( .A(a[5]), .Y(n244) );
  NAND3X1 U59 ( .A(b[4]), .B(b[2]), .C(b[1]), .Y(n344) );
  INVX1 U60 ( .A(a[14]), .Y(n144) );
  INVX1 U61 ( .A(cmd[1]), .Y(n61) );
  INVX1 U62 ( .A(cmd[2]), .Y(n60) );
  OAI21X1 U63 ( .A0(n295), .A1(b[4]), .B0(b[2]), .Y(n239) );
  OAI21X1 U64 ( .A0(a[15]), .A1(n287), .B0(n246), .Y(n338) );
  OAI211XL U65 ( .A0(n260), .A1(n329), .B0(n259), .C0(n258), .Y(n261) );
  AOI211XL U66 ( .A0(a[0]), .A1(n77), .B0(n76), .C0(n30), .Y(n78) );
  NAND2XL U67 ( .A(n214), .B(a[0]), .Y(n71) );
  NAND2XL U68 ( .A(n196), .B(a[0]), .Y(n100) );
  INVX3 U69 ( .A(n267), .Y(n296) );
  NAND2X2 U70 ( .A(n151), .B(n342), .Y(n290) );
  OAI22X1 U71 ( .A0(b[0]), .A1(a[2]), .B0(n345), .B1(a[3]), .Y(n192) );
  NAND2X4 U72 ( .A(n303), .B(n84), .Y(n332) );
  INVX3 U73 ( .A(n341), .Y(n308) );
  INVX3 U74 ( .A(a[15]), .Y(n295) );
  BUFX4 U75 ( .A(n334), .Y(n27) );
  INVXL U76 ( .A(n333), .Y(n142) );
  NAND2XL U77 ( .A(n266), .B(a[6]), .Y(n55) );
  AOI211XL U78 ( .A0(a[6]), .A1(n196), .B0(n170), .C0(n166), .Y(n127) );
  NAND2XL U79 ( .A(n194), .B(a[6]), .Y(n115) );
  INVX3 U80 ( .A(n271), .Y(n327) );
  OAI22X1 U81 ( .A0(n214), .A1(a[15]), .B0(n173), .B1(a[14]), .Y(n274) );
  NAND2X4 U82 ( .A(n193), .B(n345), .Y(n173) );
  INVX3 U83 ( .A(b[0]), .Y(n345) );
  NOR2X2 U84 ( .A(n345), .B(b[1]), .Y(n213) );
  INVX3 U85 ( .A(b[3]), .Y(n287) );
  NOR2X2 U86 ( .A(n28), .B(b[3]), .Y(n271) );
  NOR2X2 U87 ( .A(b[3]), .B(b[2]), .Y(n299) );
  NOR2X1 U88 ( .A(b[2]), .B(n248), .Y(n275) );
  AOI32XL U89 ( .A0(a[0]), .A1(b[2]), .A2(n214), .B0(n28), .B1(n317), .Y(n243)
         );
  AOI211X1 U90 ( .A0(b[3]), .A1(n228), .B0(n296), .C0(n255), .Y(n229) );
  AOI211X1 U91 ( .A0(b[3]), .A1(n256), .B0(n296), .C0(n255), .Y(n259) );
  AOI211X1 U92 ( .A0(n202), .A1(b[3]), .B0(n296), .C0(n201), .Y(n204) );
  CLKINVX1 U93 ( .A(cmd[0]), .Y(n62) );
  AOI211X1 U94 ( .A0(b[3]), .A1(n349), .B0(n296), .C0(n255), .Y(n185) );
  NOR3X1 U95 ( .A(b[2]), .B(n196), .C(n295), .Y(n247) );
  INVX4 U96 ( .A(b[2]), .Y(n28) );
  CLKINVX1 U97 ( .A(n309), .Y(n348) );
  AOI211X1 U98 ( .A0(n251), .A1(n341), .B0(n290), .C0(n250), .Y(n253) );
  OAI31XL U99 ( .A0(n80), .A1(n255), .A2(n79), .B0(n78), .Y(r[0]) );
  OAI31XL U100 ( .A0(n290), .A1(n209), .A2(n208), .B0(n207), .Y(r[2]) );
  NAND2XL U101 ( .A(cmd[2]), .B(cmd[0]), .Y(n69) );
  NOR2X4 U102 ( .A(cmd[2]), .B(cmd[1]), .Y(n59) );
  NOR3X1 U103 ( .A(n255), .B(n83), .C(n308), .Y(n309) );
  CLKINVX1 U104 ( .A(n301), .Y(n255) );
  OAI211X1 U105 ( .A0(n332), .A1(n233), .B0(n232), .C0(n231), .Y(r[3]) );
  CLKINVX1 U106 ( .A(n47), .Y(n232) );
  NAND2BX1 U107 ( .AN(n226), .B(n44), .Y(n45) );
  AND2X2 U108 ( .A(n227), .B(a[3]), .Y(n43) );
  AOI211X1 U109 ( .A0(n275), .A1(n223), .B0(n290), .C0(n222), .Y(n226) );
  OAI211X1 U110 ( .A0(a[5]), .A1(n216), .B0(n28), .C0(n215), .Y(n220) );
  OAI211X1 U111 ( .A0(n331), .A1(n332), .B0(n188), .C0(n187), .Y(r[1]) );
  AOI211X1 U112 ( .A0(\C4/DATA8_1 ), .A1(n59), .B0(n181), .C0(n39), .Y(n188)
         );
  AOI211X1 U113 ( .A0(n179), .A1(n340), .B0(n290), .C0(n178), .Y(n181) );
  OAI211X1 U114 ( .A0(n263), .A1(n332), .B0(n262), .C0(n261), .Y(r[5]) );
  CLKINVX1 U115 ( .A(n50), .Y(n262) );
  AOI211X1 U116 ( .A0(b[5]), .A1(n254), .B0(n253), .C0(n48), .Y(n49) );
  AND2X2 U117 ( .A(n252), .B(a[5]), .Y(n48) );
  OAI211X1 U118 ( .A0(n283), .A1(n284), .B0(n282), .C0(n55), .Y(n56) );
  AOI211X1 U119 ( .A0(n281), .A1(n316), .B0(n280), .C0(n279), .Y(n282) );
  AOI211X1 U120 ( .A0(b[3]), .A1(n278), .B0(n290), .C0(n277), .Y(n279) );
  AOI211X1 U121 ( .A0(n273), .A1(n271), .B0(n270), .C0(n269), .Y(n280) );
  AOI211X1 U122 ( .A0(n179), .A1(n74), .B0(n73), .C0(n290), .Y(n76) );
  CLKINVX1 U123 ( .A(n248), .Y(n179) );
  OAI211X1 U124 ( .A0(n332), .A1(n312), .B0(n70), .C0(n27), .Y(n77) );
  NAND4X1 U125 ( .A(n117), .B(n115), .C(n87), .D(n89), .Y(n236) );
  OAI211X1 U126 ( .A0(n306), .A1(n332), .B0(n305), .C0(n304), .Y(r[7]) );
  NOR3X1 U127 ( .A(n296), .B(n295), .C(n312), .Y(n302) );
  CLKINVX1 U128 ( .A(n53), .Y(n305) );
  AOI211X1 U129 ( .A0(b[7]), .A1(n294), .B0(n293), .C0(n51), .Y(n52) );
  AOI211X1 U130 ( .A0(n298), .A1(n291), .B0(n290), .C0(n289), .Y(n293) );
  AOI211X1 U131 ( .A0(a[8]), .A1(n213), .B0(n212), .C0(n211), .Y(n298) );
  NAND4X1 U132 ( .A(n323), .B(n322), .C(n321), .D(n57), .Y(n58) );
  NOR3X1 U133 ( .A(n313), .B(n312), .C(n333), .Y(n315) );
  OAI22X1 U134 ( .A0(b[2]), .A1(n237), .B0(n28), .B1(n241), .Y(n311) );
  AOI211X1 U135 ( .A0(n214), .A1(a[8]), .B0(n91), .C0(n63), .Y(n237) );
  CLKINVX1 U136 ( .A(n42), .Y(n207) );
  AOI211X1 U137 ( .A0(a[2]), .A1(n199), .B0(n205), .C0(n40), .Y(n41) );
  NOR2BX1 U138 ( .AN(n206), .B(n28), .Y(n40) );
  CLKINVX1 U139 ( .A(n332), .Y(n316) );
  NAND2X1 U140 ( .A(n235), .B(b[3]), .Y(n248) );
  OAI21X1 U141 ( .A0(n218), .A1(n285), .B0(n191), .Y(n272) );
  AOI211X1 U142 ( .A0(a[9]), .A1(n196), .B0(n190), .C0(n189), .Y(n191) );
  NOR2X1 U143 ( .A(n216), .B(n318), .Y(n189) );
  OAI211X1 U144 ( .A0(n349), .A1(n348), .B0(n347), .C0(n346), .Y(r[9]) );
  OAI211X1 U145 ( .A0(n345), .A1(n344), .B0(n343), .C0(n342), .Y(n346) );
  AOI211X1 U146 ( .A0(n341), .A1(n340), .B0(n339), .C0(n338), .Y(n343) );
  NOR2X1 U147 ( .A(n193), .B(n295), .Y(n168) );
  NOR2X1 U148 ( .A(b[1]), .B(n162), .Y(n169) );
  AOI211X1 U149 ( .A0(\C4/DATA8_9 ), .A1(n59), .B0(n336), .C0(n54), .Y(n347)
         );
  CLKINVX1 U150 ( .A(n299), .Y(n329) );
  NAND2X1 U151 ( .A(n161), .B(n28), .Y(n331) );
  NAND2X1 U152 ( .A(n257), .B(n28), .Y(n183) );
  NOR3X1 U153 ( .A(n167), .B(n166), .C(n165), .Y(n257) );
  OAI211X1 U154 ( .A0(n202), .A1(n348), .B0(n98), .C0(n97), .Y(r[10]) );
  OAI211X1 U155 ( .A0(n308), .A1(n197), .B0(n310), .C0(n344), .Y(n97) );
  AOI211X1 U156 ( .A0(\C4/DATA8_10 ), .A1(n59), .B0(n94), .C0(n31), .Y(n98) );
  NAND2X1 U157 ( .A(n142), .B(n203), .Y(n92) );
  AOI211X1 U158 ( .A0(a[12]), .A1(n194), .B0(n82), .C0(n81), .Y(n273) );
  NOR2X1 U159 ( .A(n173), .B(n210), .Y(n82) );
  OAI211X1 U160 ( .A0(n348), .A1(n228), .B0(n110), .C0(n109), .Y(r[11]) );
  OAI211X1 U161 ( .A0(n297), .A1(n198), .B0(n310), .C0(n221), .Y(n109) );
  AOI211X1 U162 ( .A0(\C4/DATA8_11 ), .A1(n59), .B0(n107), .C0(n32), .Y(n110)
         );
  NAND2X1 U163 ( .A(n28), .B(n154), .Y(n233) );
  CLKINVX1 U164 ( .A(n223), .Y(n297) );
  NOR2X1 U165 ( .A(n104), .B(n99), .Y(n223) );
  OAI211X1 U166 ( .A0(n348), .A1(n234), .B0(n124), .C0(n123), .Y(r[12]) );
  OAI211X1 U167 ( .A0(n314), .A1(n327), .B0(n122), .C0(n121), .Y(n123) );
  OAI211X1 U168 ( .A0(n131), .A1(n217), .B0(n118), .C0(n117), .Y(n317) );
  NAND2X1 U169 ( .A(n214), .B(a[4]), .Y(n117) );
  OAI211X1 U170 ( .A0(n218), .A1(n285), .B0(n116), .C0(n115), .Y(n314) );
  CLKINVX1 U171 ( .A(n35), .Y(n124) );
  AOI211X1 U172 ( .A0(b[12]), .A1(n114), .B0(n113), .C0(n33), .Y(n34) );
  AND2X2 U173 ( .A(n112), .B(a[12]), .Y(n33) );
  AOI211X1 U174 ( .A0(n241), .A1(n291), .B0(n111), .C0(n148), .Y(n113) );
  NAND2BX1 U175 ( .AN(n241), .B(n28), .Y(n234) );
  AOI211X1 U176 ( .A0(a[14]), .A1(n194), .B0(n65), .C0(n64), .Y(n241) );
  CLKINVX1 U177 ( .A(a[12]), .Y(n163) );
  NOR2X1 U178 ( .A(n217), .B(n295), .Y(n65) );
  AOI211X1 U179 ( .A0(\C4/DATA8_13 ), .A1(n59), .B0(n136), .C0(n36), .Y(n138)
         );
  OAI211X1 U180 ( .A0(n327), .A1(n328), .B0(n133), .C0(n132), .Y(n134) );
  OAI211X1 U181 ( .A0(n224), .A1(n216), .B0(n130), .C0(n172), .Y(n326) );
  NAND2X1 U182 ( .A(n214), .B(a[5]), .Y(n172) );
  NOR2X1 U183 ( .A(n173), .B(n325), .Y(n166) );
  NOR2X1 U184 ( .A(n216), .B(n285), .Y(n170) );
  NAND2X1 U185 ( .A(n193), .B(n28), .Y(n126) );
  NAND2X1 U186 ( .A(n28), .B(n184), .Y(n256) );
  OAI22X1 U187 ( .A0(b[0]), .A1(a[13]), .B0(n345), .B1(a[14]), .Y(n162) );
  CLKINVX1 U188 ( .A(b[4]), .Y(n235) );
  NOR2X1 U189 ( .A(n290), .B(n338), .Y(n310) );
  NOR2X1 U190 ( .A(n308), .B(b[2]), .Y(n291) );
  CLKINVX1 U191 ( .A(a[13]), .Y(n143) );
  AOI211X1 U192 ( .A0(n194), .A1(a[8]), .B0(n91), .C0(n90), .Y(n147) );
  NAND2X1 U193 ( .A(n196), .B(a[7]), .Y(n89) );
  NOR2X1 U194 ( .A(n218), .B(n325), .Y(n91) );
  AOI21X1 U195 ( .A0(n214), .A1(a[2]), .B0(n86), .Y(n140) );
  NAND2X1 U196 ( .A(n213), .B(a[1]), .Y(n85) );
  CLKINVX1 U197 ( .A(a[0]), .Y(n313) );
  AOI211X1 U198 ( .A0(a[4]), .A1(n194), .B0(n190), .C0(n88), .Y(n141) );
  NAND2X1 U199 ( .A(n213), .B(a[5]), .Y(n87) );
  NOR2X1 U200 ( .A(n173), .B(n264), .Y(n190) );
  NOR2X1 U201 ( .A(b[3]), .B(n296), .Y(n303) );
  AOI211X1 U202 ( .A0(a[5]), .A1(n194), .B0(n212), .C0(n102), .Y(n153) );
  CLKINVX1 U203 ( .A(a[6]), .Y(n264) );
  CLKINVX1 U204 ( .A(a[4]), .Y(n195) );
  NOR2X1 U205 ( .A(n173), .B(n285), .Y(n212) );
  CLKINVX1 U206 ( .A(a[7]), .Y(n285) );
  OAI211X1 U207 ( .A0(n131), .A1(n216), .B0(n101), .C0(n100), .Y(n154) );
  CLKINVX1 U208 ( .A(a[3]), .Y(n224) );
  CLKINVX1 U209 ( .A(a[1]), .Y(n131) );
  NAND2X1 U210 ( .A(n267), .B(n84), .Y(n333) );
  NOR2X1 U211 ( .A(b[4]), .B(n83), .Y(n267) );
  CLKINVX1 U212 ( .A(n152), .Y(n159) );
  NOR4X1 U213 ( .A(n104), .B(n103), .C(n167), .D(n171), .Y(n152) );
  NOR2X1 U214 ( .A(n217), .B(n318), .Y(n171) );
  CLKINVX1 U215 ( .A(a[8]), .Y(n318) );
  INVX3 U216 ( .A(n196), .Y(n217) );
  NOR2X2 U217 ( .A(n193), .B(n345), .Y(n196) );
  NOR2X1 U218 ( .A(n218), .B(n210), .Y(n167) );
  CLKINVX1 U219 ( .A(a[10]), .Y(n210) );
  INVX3 U220 ( .A(n213), .Y(n218) );
  NOR2X1 U221 ( .A(n216), .B(n325), .Y(n103) );
  CLKINVX1 U222 ( .A(a[9]), .Y(n325) );
  INVX3 U223 ( .A(n194), .Y(n216) );
  NOR2X2 U224 ( .A(n193), .B(b[0]), .Y(n194) );
  NOR2X1 U225 ( .A(n173), .B(n164), .Y(n104) );
  CLKINVX1 U226 ( .A(a[11]), .Y(n164) );
  AOI21X1 U227 ( .A0(\C4/DATA8_15 ), .A1(n59), .B0(n38), .Y(n160) );
  NAND3X1 U228 ( .A(n288), .B(n246), .C(n151), .Y(n37) );
  NOR2X1 U229 ( .A(n83), .B(n240), .Y(n151) );
  NAND2X1 U230 ( .A(b[4]), .B(b[3]), .Y(n246) );
  AOI21X1 U231 ( .A0(b[4]), .A1(n312), .B0(n295), .Y(n288) );
  NOR2X4 U232 ( .A(n29), .B(n62), .Y(\DP_OP_21J1_124_1250/n53 ) );
  NAND2X1 U233 ( .A(n214), .B(n28), .Y(n312) );
  NAND2X1 U234 ( .A(n242), .B(n238), .Y(n83) );
  CLKINVX1 U235 ( .A(b[5]), .Y(n238) );
  NOR4X1 U236 ( .A(b[13]), .B(b[8]), .C(n67), .D(n66), .Y(n242) );
  NOR3X1 U237 ( .A(n61), .B(n60), .C(n62), .Y(n301) );
  AND3X2 U238 ( .A(n61), .B(n62), .C(cmd[2]), .Y(n26) );
  NOR2X1 U239 ( .A(n62), .B(n324), .Y(n320) );
  CLKINVX1 U240 ( .A(n324), .Y(n265) );
  NAND2X2 U241 ( .A(n60), .B(cmd[1]), .Y(n324) );
  OAI2BB1X1 U242 ( .A0N(n59), .A1N(\C4/DATA8_3 ), .B0(n46), .Y(n47) );
  AOI2BB1X1 U243 ( .A0N(n225), .A1N(n287), .B0(n43), .Y(n44) );
  AO22X1 U244 ( .A0(n180), .A1(a[1]), .B0(n182), .B1(b[1]), .Y(n39) );
  NAND2XL U245 ( .A(b[2]), .B(n196), .Y(n177) );
  AOI211XL U246 ( .A0(n194), .A1(n224), .B0(b[2]), .C0(n174), .Y(n175) );
  OAI2BB1X1 U247 ( .A0N(n59), .A1N(\C4/DATA8_5 ), .B0(n49), .Y(n50) );
  AO21X1 U248 ( .A0(\C4/DATA8_6 ), .A1(n59), .B0(n56), .Y(r[6]) );
  AO22X1 U249 ( .A0(\C4/DATA8_0 ), .A1(n59), .B0(b[0]), .B1(n75), .Y(n30) );
  OAI2BB1X1 U250 ( .A0N(n59), .A1N(\C4/DATA8_7 ), .B0(n52), .Y(n53) );
  AO21X1 U251 ( .A0(\C4/DATA8_8 ), .A1(n59), .B0(n58), .Y(r[8]) );
  OAI2BB1X1 U252 ( .A0N(n59), .A1N(\C4/DATA8_2 ), .B0(n41), .Y(n42) );
  NAND2XL U253 ( .A(b[2]), .B(n341), .Y(n286) );
  AO22X1 U254 ( .A0(n337), .A1(b[9]), .B0(n335), .B1(a[9]), .Y(n54) );
  AO22X1 U255 ( .A0(n95), .A1(b[10]), .B0(n93), .B1(a[10]), .Y(n31) );
  AO22X1 U256 ( .A0(n108), .A1(b[11]), .B0(n106), .B1(a[11]), .Y(n32) );
  OAI2BB1X1 U257 ( .A0N(n59), .A1N(\C4/DATA8_12 ), .B0(n34), .Y(n35) );
  AO22X1 U258 ( .A0(n137), .A1(b[13]), .B0(n125), .B1(a[13]), .Y(n36) );
  OAI2BB1X1 U259 ( .A0N(b[15]), .A1N(n150), .B0(n37), .Y(n38) );
  NAND3XL U260 ( .A(cmd[2]), .B(cmd[1]), .C(n62), .Y(n240) );
  OAI22XL U261 ( .A0(n216), .A1(n210), .B0(n217), .B1(n164), .Y(n63) );
  OAI22XL U262 ( .A0(n218), .A1(n143), .B0(n173), .B1(n163), .Y(n64) );
  OR4X1 U263 ( .A(b[10]), .B(b[12]), .C(b[15]), .D(b[11]), .Y(n67) );
  OR4X1 U264 ( .A(b[14]), .B(b[6]), .C(b[9]), .D(b[7]), .Y(n66) );
  OAI21XL U265 ( .A0(n311), .A1(n287), .B0(n267), .Y(n80) );
  AOI222XL U266 ( .A0(n131), .A1(n213), .B0(b[1]), .B1(n192), .C0(n313), .C1(
        n214), .Y(n68) );
  OAI22XL U267 ( .A0(n68), .A1(n329), .B0(n327), .B1(n236), .Y(n79) );
  OAI22XL U268 ( .A0(b[0]), .A1(n26), .B0(n345), .B1(n265), .Y(n70) );
  NOR2X1 U269 ( .A(b[4]), .B(b[3]), .Y(n341) );
  AOI221XL U270 ( .A0(b[2]), .A1(n236), .B0(n28), .B1(n72), .C0(n308), .Y(n73)
         );
  OAI21XL U271 ( .A0(a[0]), .A1(n25), .B0(n27), .Y(n75) );
  OAI221XL U272 ( .A0(b[0]), .A1(a[14]), .B0(n345), .B1(a[15]), .C0(n193), .Y(
        n139) );
  OAI22XL U273 ( .A0(n217), .A1(n143), .B0(n218), .B1(n164), .Y(n81) );
  OR2X1 U274 ( .A(n273), .B(b[2]), .Y(n96) );
  OA21XL U275 ( .A0(n28), .A1(n139), .B0(n96), .Y(n202) );
  OAI221XL U276 ( .A0(a[10]), .A1(n25), .B0(n210), .B1(n324), .C0(n27), .Y(n95) );
  OAI21XL U277 ( .A0(n313), .A1(n216), .B0(n85), .Y(n86) );
  OAI21XL U278 ( .A0(n224), .A1(n217), .B0(n87), .Y(n88) );
  OAI21XL U279 ( .A0(n210), .A1(n173), .B0(n89), .Y(n90) );
  AOI222XL U280 ( .A0(n92), .A1(n332), .B0(n271), .B1(n141), .C0(n299), .C1(
        n147), .Y(n94) );
  OAI21XL U281 ( .A0(b[10]), .A1(n25), .B0(n27), .Y(n93) );
  OAI21XL U282 ( .A0(n28), .A1(n274), .B0(n96), .Y(n197) );
  OAI22XL U283 ( .A0(n162), .A1(n193), .B0(n218), .B1(n163), .Y(n99) );
  OAI221XL U284 ( .A0(a[11]), .A1(n25), .B0(n164), .B1(n324), .C0(n27), .Y(
        n108) );
  AOI2BB2X1 U285 ( .B0(n213), .B1(a[2]), .A0N(n173), .A1N(n224), .Y(n101) );
  OR2X1 U286 ( .A(n233), .B(n333), .Y(n105) );
  OAI22XL U287 ( .A0(n217), .A1(n195), .B0(n218), .B1(n264), .Y(n102) );
  AOI222XL U288 ( .A0(n105), .A1(n332), .B0(n271), .B1(n153), .C0(n299), .C1(
        n152), .Y(n107) );
  OAI21XL U289 ( .A0(b[11]), .A1(n25), .B0(n27), .Y(n106) );
  OAI21XL U290 ( .A0(n173), .A1(n295), .B0(n111), .Y(n221) );
  OAI221XL U291 ( .A0(a[12]), .A1(n25), .B0(n163), .B1(n324), .C0(n27), .Y(
        n114) );
  OAI21XL U292 ( .A0(b[12]), .A1(n25), .B0(n27), .Y(n112) );
  AOI2BB2X1 U293 ( .B0(n214), .B1(a[8]), .A0N(n217), .A1N(n244), .Y(n116) );
  OAI21XL U294 ( .A0(n243), .A1(n333), .B0(n332), .Y(n122) );
  OAI22XL U295 ( .A0(a[12]), .A1(n173), .B0(a[11]), .B1(n218), .Y(n120) );
  OAI22XL U296 ( .A0(a[10]), .A1(n216), .B0(a[9]), .B1(n217), .Y(n119) );
  OAI21XL U297 ( .A0(n120), .A1(n119), .B0(n299), .Y(n121) );
  OAI22XL U298 ( .A0(b[1]), .A1(n162), .B0(n295), .B1(n216), .Y(n184) );
  OAI221XL U299 ( .A0(a[13]), .A1(n25), .B0(n143), .B1(n324), .C0(n27), .Y(
        n137) );
  OAI21XL U300 ( .A0(b[13]), .A1(n25), .B0(n27), .Y(n125) );
  OAI2BB2XL U301 ( .B0(n162), .B1(n126), .A0N(a[15]), .A1N(n126), .Y(n249) );
  OAI22XL U302 ( .A0(n249), .A1(n308), .B0(n247), .B1(n235), .Y(n135) );
  OAI21XL U303 ( .A0(n218), .A1(n318), .B0(n127), .Y(n328) );
  OAI22XL U304 ( .A0(a[13]), .A1(n173), .B0(a[12]), .B1(n218), .Y(n129) );
  OAI22XL U305 ( .A0(a[10]), .A1(n217), .B0(a[11]), .B1(n216), .Y(n128) );
  OAI21XL U306 ( .A0(n129), .A1(n128), .B0(n299), .Y(n133) );
  AOI221XL U307 ( .A0(b[0]), .A1(n313), .B0(n345), .B1(n131), .C0(b[1]), .Y(
        n161) );
  OAI22XL U308 ( .A0(b[2]), .A1(n326), .B0(n28), .B1(n161), .Y(n263) );
  OAI21XL U309 ( .A0(n263), .A1(n333), .B0(n332), .Y(n132) );
  OAI31XL U310 ( .A0(n338), .A1(n339), .A2(n135), .B0(n134), .Y(n136) );
  OAI21XL U311 ( .A0(n348), .A1(n256), .B0(n138), .Y(r[13]) );
  OAI22XL U312 ( .A0(b[2]), .A1(n141), .B0(n28), .B1(n140), .Y(n281) );
  OAI21XL U313 ( .A0(n235), .A1(n193), .B0(n239), .Y(n278) );
  OAI22XL U314 ( .A0(b[15]), .A1(n25), .B0(n348), .B1(n312), .Y(n149) );
  OAI21XL U315 ( .A0(a[15]), .A1(n25), .B0(n27), .Y(n150) );
  AOI2BB2X1 U316 ( .B0(b[2]), .B1(n154), .A0N(b[2]), .A1N(n153), .Y(n306) );
  OAI21XL U317 ( .A0(n333), .A1(n306), .B0(n332), .Y(n158) );
  OAI22XL U318 ( .A0(a[15]), .A1(n173), .B0(a[14]), .B1(n218), .Y(n156) );
  OAI22XL U319 ( .A0(a[13]), .A1(n216), .B0(a[12]), .B1(n217), .Y(n155) );
  OAI21XL U320 ( .A0(n156), .A1(n155), .B0(n299), .Y(n157) );
  OAI21XL U321 ( .A0(a[1]), .A1(n25), .B0(n27), .Y(n182) );
  OAI22XL U322 ( .A0(n216), .A1(n164), .B0(n217), .B1(n163), .Y(n165) );
  OAI31XL U323 ( .A0(n169), .A1(n168), .A2(n28), .B0(n183), .Y(n340) );
  OAI22XL U324 ( .A0(a[1]), .A1(n173), .B0(a[2]), .B1(n218), .Y(n174) );
  OAI21XL U325 ( .A0(a[4]), .A1(n217), .B0(n175), .Y(n176) );
  OAI21XL U326 ( .A0(n245), .A1(n28), .B0(n176), .Y(n186) );
  OAI22XL U327 ( .A0(n308), .A1(n186), .B0(n246), .B1(n177), .Y(n178) );
  OAI221XL U328 ( .A0(b[1]), .A1(n25), .B0(n193), .B1(n324), .C0(n27), .Y(n180) );
  OAI21XL U329 ( .A0(n184), .A1(n28), .B0(n183), .Y(n349) );
  OAI21XL U330 ( .A0(b[3]), .A1(n186), .B0(n185), .Y(n187) );
  OAI22XL U331 ( .A0(n287), .A1(n344), .B0(n272), .B1(n286), .Y(n209) );
  AOI222XL U332 ( .A0(n244), .A1(n196), .B0(n195), .B1(n194), .C0(n193), .C1(
        n192), .Y(n200) );
  OAI22XL U333 ( .A0(n200), .A1(n198), .B0(n248), .B1(n197), .Y(n208) );
  OAI21XL U334 ( .A0(a[2]), .A1(n25), .B0(n27), .Y(n206) );
  OAI221XL U335 ( .A0(b[2]), .A1(n25), .B0(n28), .B1(n324), .C0(n27), .Y(n199)
         );
  OAI22XL U336 ( .A0(n200), .A1(n329), .B0(n327), .B1(n272), .Y(n201) );
  AO22X1 U337 ( .A0(n301), .A1(n204), .B0(n316), .B1(n203), .Y(n205) );
  OAI21XL U338 ( .A0(b[3]), .A1(n25), .B0(n27), .Y(n227) );
  OAI22XL U339 ( .A0(n216), .A1(n325), .B0(n217), .B1(n210), .Y(n211) );
  OAI22XL U340 ( .A0(a[4]), .A1(n218), .B0(a[6]), .B1(n217), .Y(n219) );
  OAI22XL U341 ( .A0(n298), .A1(n28), .B0(n220), .B1(n219), .Y(n230) );
  OAI22XL U342 ( .A0(n287), .A1(n221), .B0(n308), .B1(n230), .Y(n222) );
  AOI221XL U343 ( .A0(n265), .A1(a[3]), .B0(n26), .B1(n224), .C0(n320), .Y(
        n225) );
  OAI21XL U344 ( .A0(b[3]), .A1(n230), .B0(n229), .Y(n231) );
  OAI221XL U345 ( .A0(a[5]), .A1(n25), .B0(n244), .B1(n324), .C0(n27), .Y(n254) );
  OAI2BB2XL U346 ( .B0(b[2]), .B1(n260), .A0N(b[2]), .A1N(n257), .Y(n251) );
  OAI22XL U347 ( .A0(n249), .A1(n248), .B0(n247), .B1(n246), .Y(n250) );
  OAI21XL U348 ( .A0(b[5]), .A1(n25), .B0(n27), .Y(n252) );
  AOI221XL U349 ( .A0(n265), .A1(a[6]), .B0(n26), .B1(n264), .C0(n320), .Y(
        n284) );
  OAI21XL U350 ( .A0(b[6]), .A1(n25), .B0(n27), .Y(n266) );
  OAI21XL U351 ( .A0(n268), .A1(n287), .B0(n267), .Y(n270) );
  OAI21XL U352 ( .A0(n329), .A1(n272), .B0(n301), .Y(n269) );
  OAI2BB2XL U353 ( .B0(n28), .B1(n273), .A0N(n28), .A1N(n272), .Y(n276) );
  OAI2BB2XL U354 ( .B0(n308), .B1(n276), .A0N(n275), .A1N(n274), .Y(n277) );
  OAI221XL U355 ( .A0(a[7]), .A1(n25), .B0(n285), .B1(n324), .C0(n27), .Y(n294) );
  OAI22XL U356 ( .A0(n288), .A1(n287), .B0(n297), .B1(n286), .Y(n289) );
  OAI21XL U357 ( .A0(b[7]), .A1(n25), .B0(n27), .Y(n292) );
  AOI2BB2X1 U358 ( .B0(n299), .B1(n298), .A0N(n327), .A1N(n297), .Y(n300) );
  OAI21XL U359 ( .A0(b[8]), .A1(n25), .B0(n27), .Y(n307) );
  AOI222XL U360 ( .A0(n311), .A1(n310), .B0(n311), .B1(n309), .C0(n310), .C1(
        n308), .Y(n323) );
  OAI222XL U361 ( .A0(n317), .A1(n327), .B0(n316), .B1(n315), .C0(n329), .C1(
        n314), .Y(n322) );
  OAI22XL U362 ( .A0(a[8]), .A1(n25), .B0(n318), .B1(n324), .Y(n319) );
  OAI21XL U363 ( .A0(n320), .A1(n319), .B0(b[8]), .Y(n321) );
  OAI221XL U364 ( .A0(a[9]), .A1(n25), .B0(n325), .B1(n324), .C0(n27), .Y(n337) );
  OAI22XL U365 ( .A0(n329), .A1(n328), .B0(n327), .B1(n326), .Y(n330) );
  AOI221XL U366 ( .A0(n333), .A1(n332), .B0(n331), .B1(n332), .C0(n330), .Y(
        n336) );
  OAI21XL U367 ( .A0(b[9]), .A1(n25), .B0(n27), .Y(n335) );
endmodule


module EX_stage ( clk, rst, pipeline_reg_in, ex_op_dest, 
        \pipeline_reg_out[37]_BAR , \pipeline_reg_out[4] , 
        \pipeline_reg_out[3] , \pipeline_reg_out[2] , \pipeline_reg_out[1] , 
        \pipeline_reg_out[0] , \pipeline_reg_out[36]_BAR , 
        \pipeline_reg_out[35]_BAR , \pipeline_reg_out[34]_BAR , 
        \pipeline_reg_out[33]_BAR , \pipeline_reg_out[32]_BAR , 
        \pipeline_reg_out[31]_BAR , \pipeline_reg_out[30]_BAR , 
        \pipeline_reg_out[29]_BAR , \pipeline_reg_out[28]_BAR , 
        \pipeline_reg_out[27]_BAR , \pipeline_reg_out[26]_BAR , 
        \pipeline_reg_out[25]_BAR , \pipeline_reg_out[24]_BAR , 
        \pipeline_reg_out[23]_BAR , \pipeline_reg_out[22]_BAR , 
        \pipeline_reg_out[20]_BAR , \pipeline_reg_out[19]_BAR , 
        \pipeline_reg_out[18]_BAR , \pipeline_reg_out[17]_BAR , 
        \pipeline_reg_out[16]_BAR , \pipeline_reg_out[15]_BAR , 
        \pipeline_reg_out[14]_BAR , \pipeline_reg_out[13]_BAR , 
        \pipeline_reg_out[12]_BAR , \pipeline_reg_out[11]_BAR , 
        \pipeline_reg_out[10]_BAR , \pipeline_reg_out[9]_BAR , 
        \pipeline_reg_out[8]_BAR , \pipeline_reg_out[7]_BAR , 
        \pipeline_reg_out[6]_BAR , \pipeline_reg_out[5]_BAR , 
        \pipeline_reg_out[21]_BAR  );
  input [56:0] pipeline_reg_in;
  output [2:0] ex_op_dest;
  input clk, rst;
  output \pipeline_reg_out[37]_BAR , \pipeline_reg_out[4] ,
         \pipeline_reg_out[3] , \pipeline_reg_out[2] , \pipeline_reg_out[1] ,
         \pipeline_reg_out[0] , \pipeline_reg_out[36]_BAR ,
         \pipeline_reg_out[35]_BAR , \pipeline_reg_out[34]_BAR ,
         \pipeline_reg_out[33]_BAR , \pipeline_reg_out[32]_BAR ,
         \pipeline_reg_out[31]_BAR , \pipeline_reg_out[30]_BAR ,
         \pipeline_reg_out[29]_BAR , \pipeline_reg_out[28]_BAR ,
         \pipeline_reg_out[27]_BAR , \pipeline_reg_out[26]_BAR ,
         \pipeline_reg_out[25]_BAR , \pipeline_reg_out[24]_BAR ,
         \pipeline_reg_out[23]_BAR , \pipeline_reg_out[22]_BAR ,
         \pipeline_reg_out[20]_BAR , \pipeline_reg_out[19]_BAR ,
         \pipeline_reg_out[18]_BAR , \pipeline_reg_out[17]_BAR ,
         \pipeline_reg_out[16]_BAR , \pipeline_reg_out[15]_BAR ,
         \pipeline_reg_out[14]_BAR , \pipeline_reg_out[13]_BAR ,
         \pipeline_reg_out[12]_BAR , \pipeline_reg_out[11]_BAR ,
         \pipeline_reg_out[10]_BAR , \pipeline_reg_out[9]_BAR ,
         \pipeline_reg_out[8]_BAR , \pipeline_reg_out[7]_BAR ,
         \pipeline_reg_out[6]_BAR , \pipeline_reg_out[5]_BAR ,
         \pipeline_reg_out[21]_BAR ;
  wire   pipeline_reg_in_0, n1;
  wire   [37:0] pipeline_reg_out;
  wire   [15:0] ex_alu_result;
  assign pipeline_reg_in_0 = pipeline_reg_in[0];

  alu alu_inst ( .a(pipeline_reg_in[53:38]), .b(pipeline_reg_in[37:22]), .cmd(
        pipeline_reg_in[56:54]), .r(ex_alu_result) );
  DFFTRX1 \pipeline_reg_out_reg[4]  ( .D(pipeline_reg_in[4]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[4]) );
  DFFTRX1 \pipeline_reg_out_reg[0]  ( .D(pipeline_reg_in_0), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[0]) );
  DFFTRX1 \pipeline_reg_out_reg[21]  ( .D(pipeline_reg_in[21]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[21]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[5]  ( .D(pipeline_reg_in[5]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[5]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[37]  ( .D(ex_alu_result[15]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[37]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[36]  ( .D(ex_alu_result[14]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[36]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[35]  ( .D(ex_alu_result[13]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[35]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[34]  ( .D(ex_alu_result[12]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[34]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[20]  ( .D(pipeline_reg_in[20]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[20]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[19]  ( .D(pipeline_reg_in[19]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[19]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[18]  ( .D(pipeline_reg_in[18]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[18]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[17]  ( .D(pipeline_reg_in[17]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[17]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[16]  ( .D(pipeline_reg_in[16]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[16]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[15]  ( .D(pipeline_reg_in[15]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[15]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[14]  ( .D(pipeline_reg_in[14]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[14]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[13]  ( .D(pipeline_reg_in[13]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[13]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[12]  ( .D(pipeline_reg_in[12]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[12]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[11]  ( .D(pipeline_reg_in[11]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[11]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[10]  ( .D(pipeline_reg_in[10]), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[10]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[9]  ( .D(pipeline_reg_in[9]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[9]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[8]  ( .D(pipeline_reg_in[8]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[8]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[7]  ( .D(pipeline_reg_in[7]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[7]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[6]  ( .D(pipeline_reg_in[6]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[6]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[33]  ( .D(ex_alu_result[11]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[33]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[32]  ( .D(ex_alu_result[10]), .RN(n1), .CK(clk), .QN(\pipeline_reg_out[32]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[31]  ( .D(ex_alu_result[9]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[31]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[30]  ( .D(ex_alu_result[8]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[30]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[29]  ( .D(ex_alu_result[7]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[29]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[27]  ( .D(ex_alu_result[5]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[27]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[26]  ( .D(ex_alu_result[4]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[26]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[25]  ( .D(ex_alu_result[3]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[25]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[24]  ( .D(ex_alu_result[2]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[24]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[23]  ( .D(ex_alu_result[1]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[23]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[22]  ( .D(ex_alu_result[0]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[22]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[28]  ( .D(ex_alu_result[6]), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[28]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[3]  ( .D(pipeline_reg_in[3]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[3]) );
  DFFTRX1 \pipeline_reg_out_reg[2]  ( .D(pipeline_reg_in[2]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[2]) );
  DFFTRX1 \pipeline_reg_out_reg[1]  ( .D(pipeline_reg_in[1]), .RN(n1), .CK(clk), .Q(pipeline_reg_out[1]) );
  INVX6 U3 ( .A(rst), .Y(n1) );
  CLKBUFX3 U4 ( .A(pipeline_reg_in[2]), .Y(ex_op_dest[1]) );
  CLKBUFX3 U5 ( .A(pipeline_reg_in[1]), .Y(ex_op_dest[0]) );
  CLKBUFX3 U6 ( .A(pipeline_reg_in[3]), .Y(ex_op_dest[2]) );
endmodule


module ora ( clk, rst, \read_data[15] , \read_data[14] , \read_data[13] , 
        \read_data[12] , \read_data[11] , \read_data[10] , \read_data[9] , 
        \read_data[8]_BAR , \read_data[2] , \read_data[1] , \read_data[0] , 
        \read_data[7]_BAR , \read_data[6]_BAR , \read_data[5]_BAR , 
        \read_data[4]_BAR , \read_data[3]_BAR , \access_addr[15]_BAR , 
        \access_addr[14]_BAR , \access_addr[13]_BAR , \access_addr[12]_BAR , 
        \access_addr[11]_BAR , \access_addr[10]_BAR , \access_addr[9]_BAR , 
        \access_addr[8]_BAR , \access_addr[7]_BAR , \access_addr[6]_BAR , 
        \access_addr[5]_BAR , \access_addr[4]_BAR , \access_addr[3]_BAR , 
        \access_addr[2]_BAR , \access_addr[1]_BAR , \access_addr[0]_BAR , 
        \write_data[15]_BAR , \write_data[14]_BAR , \write_data[13]_BAR , 
        \write_data[12]_BAR , \write_data[11]_BAR , \write_data[10]_BAR , 
        \write_data[9]_BAR , \write_data[8]_BAR , \write_data[7]_BAR , 
        \write_data[6]_BAR , \write_data[5]_BAR , \write_data[4]_BAR , 
        \write_data[3]_BAR , \write_data[2]_BAR , \write_data[1]_BAR , 
        \write_data[0]_BAR , write_en_BAR );
  input clk, rst, \access_addr[15]_BAR , \access_addr[14]_BAR ,
         \access_addr[13]_BAR , \access_addr[12]_BAR , \access_addr[11]_BAR ,
         \access_addr[10]_BAR , \access_addr[9]_BAR , \access_addr[8]_BAR ,
         \access_addr[7]_BAR , \access_addr[6]_BAR , \access_addr[5]_BAR ,
         \access_addr[4]_BAR , \access_addr[3]_BAR , \access_addr[2]_BAR ,
         \access_addr[1]_BAR , \access_addr[0]_BAR , \write_data[15]_BAR ,
         \write_data[14]_BAR , \write_data[13]_BAR , \write_data[12]_BAR ,
         \write_data[11]_BAR , \write_data[10]_BAR , \write_data[9]_BAR ,
         \write_data[8]_BAR , \write_data[7]_BAR , \write_data[6]_BAR ,
         \write_data[5]_BAR , \write_data[4]_BAR , \write_data[3]_BAR ,
         \write_data[2]_BAR , \write_data[1]_BAR , \write_data[0]_BAR ,
         write_en_BAR;
  output \read_data[15] , \read_data[14] , \read_data[13] , \read_data[12] ,
         \read_data[11] , \read_data[10] , \read_data[9] , \read_data[8]_BAR ,
         \read_data[2] , \read_data[1] , \read_data[0] , \read_data[7]_BAR ,
         \read_data[6]_BAR , \read_data[5]_BAR , \read_data[4]_BAR ,
         \read_data[3]_BAR ;
  wire   write_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [15:0] access_addr;
  wire   [15:0] write_data;
  wire   [15:0] read_data;
  wire   [31:16] ram;
  wire   [31:0] lfsr;
  assign access_addr[15] = \access_addr[15]_BAR ;
  assign access_addr[14] = \access_addr[14]_BAR ;
  assign access_addr[13] = \access_addr[13]_BAR ;
  assign access_addr[12] = \access_addr[12]_BAR ;
  assign access_addr[11] = \access_addr[11]_BAR ;
  assign access_addr[10] = \access_addr[10]_BAR ;
  assign access_addr[9] = \access_addr[9]_BAR ;
  assign access_addr[8] = \access_addr[8]_BAR ;
  assign access_addr[7] = \access_addr[7]_BAR ;
  assign access_addr[6] = \access_addr[6]_BAR ;
  assign access_addr[5] = \access_addr[5]_BAR ;
  assign access_addr[4] = \access_addr[4]_BAR ;
  assign access_addr[3] = \access_addr[3]_BAR ;
  assign access_addr[2] = \access_addr[2]_BAR ;
  assign access_addr[1] = \access_addr[1]_BAR ;
  assign access_addr[0] = \access_addr[0]_BAR ;
  assign write_data[15] = \write_data[15]_BAR ;
  assign write_data[14] = \write_data[14]_BAR ;
  assign write_data[13] = \write_data[13]_BAR ;
  assign write_data[12] = \write_data[12]_BAR ;
  assign write_data[11] = \write_data[11]_BAR ;
  assign write_data[10] = \write_data[10]_BAR ;
  assign write_data[9] = \write_data[9]_BAR ;
  assign write_data[8] = \write_data[8]_BAR ;
  assign write_data[7] = \write_data[7]_BAR ;
  assign write_data[6] = \write_data[6]_BAR ;
  assign write_data[5] = \write_data[5]_BAR ;
  assign write_data[4] = \write_data[4]_BAR ;
  assign write_data[3] = \write_data[3]_BAR ;
  assign write_data[2] = \write_data[2]_BAR ;
  assign write_data[1] = \write_data[1]_BAR ;
  assign write_data[0] = \write_data[0]_BAR ;
  assign write_en = write_en_BAR;

  DFFRX1 \ram_reg[16]  ( .D(lfsr[16]), .CK(clk), .RN(n1), .Q(ram[16]) );
  DFFRX1 \ram_reg[17]  ( .D(lfsr[17]), .CK(clk), .RN(n1), .Q(ram[17]) );
  DFFRX1 \ram_reg[18]  ( .D(lfsr[18]), .CK(clk), .RN(n1), .Q(ram[18]) );
  DFFRX1 \ram_reg[19]  ( .D(lfsr[19]), .CK(clk), .RN(n1), .Q(ram[19]) );
  DFFRX1 \ram_reg[20]  ( .D(lfsr[20]), .CK(clk), .RN(n1), .Q(ram[20]) );
  DFFRX1 \ram_reg[22]  ( .D(lfsr[22]), .CK(clk), .RN(n1), .Q(ram[22]) );
  DFFRX1 \ram_reg[23]  ( .D(lfsr[23]), .CK(clk), .RN(n1), .Q(ram[23]) );
  DFFRX1 \ram_reg[24]  ( .D(lfsr[24]), .CK(clk), .RN(n1), .Q(ram[24]) );
  DFFRX1 \ram_reg[25]  ( .D(lfsr[25]), .CK(clk), .RN(n1), .Q(ram[25]) );
  DFFRX1 \ram_reg[26]  ( .D(lfsr[26]), .CK(clk), .RN(n1), .Q(ram[26]) );
  DFFRX1 \ram_reg[27]  ( .D(lfsr[27]), .CK(clk), .RN(n1), .Q(ram[27]) );
  DFFRX1 \ram_reg[28]  ( .D(lfsr[28]), .CK(clk), .RN(n1), .Q(ram[28]) );
  DFFRX1 \ram_reg[29]  ( .D(lfsr[29]), .CK(clk), .RN(n1), .Q(ram[29]) );
  DFFRX1 \ram_reg[30]  ( .D(lfsr[30]), .CK(clk), .RN(n1), .Q(ram[30]) );
  DFFRX1 \ram_reg[21]  ( .D(lfsr[21]), .CK(clk), .RN(n1), .Q(ram[21]) );
  DFFRX1 \ram_reg[12]  ( .D(lfsr[12]), .CK(clk), .RN(n1), .Q(read_data[12]) );
  DFFRX1 \ram_reg[13]  ( .D(lfsr[13]), .CK(clk), .RN(n1), .Q(read_data[13]) );
  DFFRX1 \ram_reg[14]  ( .D(lfsr[14]), .CK(clk), .RN(n1), .Q(read_data[14]) );
  DFFRX1 \ram_reg[15]  ( .D(lfsr[15]), .CK(clk), .RN(n1), .Q(read_data[15]) );
  DFFRX1 \ram_reg[31]  ( .D(lfsr[31]), .CK(clk), .RN(n1), .Q(ram[31]) );
  DFFRX1 \ram_reg[9]  ( .D(lfsr[9]), .CK(clk), .RN(n1), .Q(read_data[9]) );
  DFFRX1 \ram_reg[2]  ( .D(lfsr[2]), .CK(clk), .RN(n1), .Q(read_data[2]) );
  DFFRX1 \ram_reg[0]  ( .D(lfsr[0]), .CK(clk), .RN(n1), .Q(read_data[0]) );
  DFFRX1 \ram_reg[1]  ( .D(lfsr[1]), .CK(clk), .RN(n1), .Q(read_data[1]) );
  DFFRX1 \ram_reg[10]  ( .D(lfsr[10]), .CK(clk), .RN(n1), .Q(read_data[10]) );
  DFFRX1 \ram_reg[11]  ( .D(lfsr[11]), .CK(clk), .RN(n1), .Q(read_data[11]) );
  DFFRX1 \ram_reg[8]  ( .D(lfsr[8]), .CK(clk), .RN(n1), .Q(read_data[8]), .QN(
        \read_data[8]_BAR ) );
  DFFRX1 \ram_reg[7]  ( .D(lfsr[7]), .CK(clk), .RN(n1), .Q(read_data[7]), .QN(
        \read_data[7]_BAR ) );
  DFFRX1 \ram_reg[6]  ( .D(lfsr[6]), .CK(clk), .RN(n1), .Q(read_data[6]), .QN(
        \read_data[6]_BAR ) );
  DFFRX1 \ram_reg[5]  ( .D(lfsr[5]), .CK(clk), .RN(n1), .Q(read_data[5]), .QN(
        \read_data[5]_BAR ) );
  DFFRX1 \ram_reg[4]  ( .D(lfsr[4]), .CK(clk), .RN(n1), .Q(read_data[4]), .QN(
        \read_data[4]_BAR ) );
  DFFRX1 \ram_reg[3]  ( .D(lfsr[3]), .CK(clk), .RN(n1), .Q(read_data[3]), .QN(
        \read_data[3]_BAR ) );
  NOR2X1 U3 ( .A(n14), .B(write_data[15]), .Y(n2) );
  AOI2BB2X1 U4 ( .B0(read_data[14]), .B1(n2), .A0N(read_data[14]), .A1N(n2), 
        .Y(lfsr[15]) );
  NOR2X1 U5 ( .A(n14), .B(write_data[13]), .Y(n3) );
  AOI2BB2X1 U6 ( .B0(read_data[12]), .B1(n3), .A0N(read_data[12]), .A1N(n3), 
        .Y(lfsr[13]) );
  NOR2X1 U7 ( .A(n14), .B(access_addr[14]), .Y(n4) );
  AOI2BB2X1 U8 ( .B0(ram[29]), .B1(n4), .A0N(ram[29]), .A1N(n4), .Y(lfsr[30])
         );
  NOR2X1 U9 ( .A(n14), .B(access_addr[1]), .Y(n5) );
  AOI2BB2X1 U10 ( .B0(ram[16]), .B1(n5), .A0N(ram[16]), .A1N(n5), .Y(lfsr[17])
         );
  NOR2X1 U11 ( .A(n14), .B(write_data[5]), .Y(n6) );
  AOI2BB2X1 U12 ( .B0(read_data[4]), .B1(n6), .A0N(read_data[4]), .A1N(n6), 
        .Y(lfsr[5]) );
  NOR2X1 U13 ( .A(n14), .B(write_data[10]), .Y(n7) );
  AOI2BB2X1 U14 ( .B0(read_data[9]), .B1(n7), .A0N(read_data[9]), .A1N(n7), 
        .Y(lfsr[10]) );
  NOR2X1 U15 ( .A(n14), .B(write_data[14]), .Y(n8) );
  AOI2BB2X1 U16 ( .B0(read_data[13]), .B1(n8), .A0N(read_data[13]), .A1N(n8), 
        .Y(lfsr[14]) );
  NOR2X1 U17 ( .A(n14), .B(write_data[12]), .Y(n9) );
  AOI2BB2X1 U18 ( .B0(read_data[11]), .B1(n9), .A0N(read_data[11]), .A1N(n9), 
        .Y(lfsr[12]) );
  NOR2X1 U19 ( .A(n14), .B(access_addr[13]), .Y(n10) );
  AOI2BB2X1 U20 ( .B0(ram[28]), .B1(n10), .A0N(ram[28]), .A1N(n10), .Y(
        lfsr[29]) );
  NOR2X1 U21 ( .A(n14), .B(access_addr[8]), .Y(n11) );
  AOI2BB2X1 U22 ( .B0(ram[23]), .B1(n11), .A0N(ram[23]), .A1N(n11), .Y(
        lfsr[24]) );
  NOR2X1 U23 ( .A(n14), .B(access_addr[4]), .Y(n12) );
  AOI2BB2X1 U24 ( .B0(ram[19]), .B1(n12), .A0N(ram[19]), .A1N(n12), .Y(
        lfsr[20]) );
  NOR2X1 U25 ( .A(n14), .B(access_addr[0]), .Y(n13) );
  AOI2BB2X1 U26 ( .B0(read_data[15]), .B1(n13), .A0N(read_data[15]), .A1N(n13), 
        .Y(lfsr[16]) );
  CLKINVX1 U27 ( .A(write_en), .Y(n15) );
  INVX6 U28 ( .A(n15), .Y(n14) );
  INVXL U29 ( .A(access_addr[6]), .Y(n23) );
  CLKINVX6 U30 ( .A(rst), .Y(n1) );
  XOR2X1 U31 ( .A(ram[31]), .B(write_data[0]), .Y(n19) );
  INVX1 U32 ( .A(write_data[2]), .Y(n31) );
  INVX1 U33 ( .A(write_data[1]), .Y(n20) );
  OAI31XL U34 ( .A0(write_en), .A1(ram[27]), .A2(access_addr[12]), .B0(n29), 
        .Y(lfsr[28]) );
  OAI31XL U35 ( .A0(write_en), .A1(ram[24]), .A2(access_addr[9]), .B0(n26), 
        .Y(lfsr[25]) );
  OAI31XL U36 ( .A0(write_en), .A1(ram[25]), .A2(access_addr[10]), .B0(n27), 
        .Y(lfsr[26]) );
  OAI31XL U37 ( .A0(write_en), .A1(ram[17]), .A2(access_addr[2]), .B0(n17), 
        .Y(lfsr[18]) );
  OAI31XL U38 ( .A0(write_en), .A1(ram[26]), .A2(access_addr[11]), .B0(n28), 
        .Y(lfsr[27]) );
  OAI31XL U39 ( .A0(write_en), .A1(ram[22]), .A2(access_addr[7]), .B0(n25), 
        .Y(lfsr[23]) );
  OAI31XL U40 ( .A0(write_en), .A1(ram[20]), .A2(access_addr[5]), .B0(n22), 
        .Y(lfsr[21]) );
  OAI31XL U41 ( .A0(write_en), .A1(ram[18]), .A2(access_addr[3]), .B0(n18), 
        .Y(lfsr[19]) );
  OAI31XL U42 ( .A0(n14), .A1(read_data[10]), .A2(write_data[11]), .B0(n16), 
        .Y(lfsr[11]) );
  OAI31XL U43 ( .A0(n14), .A1(read_data[2]), .A2(write_data[3]), .B0(n36), .Y(
        lfsr[3]) );
  OAI31XL U44 ( .A0(n14), .A1(read_data[5]), .A2(write_data[6]), .B0(n38), .Y(
        lfsr[6]) );
  OAI31XL U45 ( .A0(n14), .A1(read_data[8]), .A2(write_data[9]), .B0(n41), .Y(
        lfsr[9]) );
  OAI31XL U46 ( .A0(n14), .A1(read_data[3]), .A2(write_data[4]), .B0(n37), .Y(
        lfsr[4]) );
  OAI31XL U47 ( .A0(n14), .A1(read_data[6]), .A2(write_data[7]), .B0(n39), .Y(
        lfsr[7]) );
  OAI31XL U48 ( .A0(n14), .A1(read_data[7]), .A2(write_data[8]), .B0(n40), .Y(
        lfsr[8]) );
  OAI31XL U49 ( .A0(n14), .A1(ram[30]), .A2(access_addr[15]), .B0(n35), .Y(
        lfsr[31]) );
  AOI221XL U50 ( .A0(n33), .A1(write_data[2]), .B0(n32), .B1(n31), .C0(n30), 
        .Y(n34) );
  AOI221XL U51 ( .A0(n33), .A1(access_addr[6]), .B0(n32), .B1(n23), .C0(n30), 
        .Y(n24) );
  AOI221XL U52 ( .A0(n33), .A1(write_data[1]), .B0(n32), .B1(n20), .C0(n30), 
        .Y(n21) );
  NOR2X1 U53 ( .A(n30), .B(n33), .Y(lfsr[0]) );
  NOR2X1 U54 ( .A(ram[31]), .B(n15), .Y(n30) );
  NOR2X1 U55 ( .A(n14), .B(n19), .Y(n32) );
  AND2X2 U56 ( .A(n19), .B(n15), .Y(n33) );
  OAI21XL U57 ( .A0(write_en), .A1(write_data[11]), .B0(read_data[10]), .Y(n16) );
  OAI21XL U58 ( .A0(n14), .A1(access_addr[2]), .B0(ram[17]), .Y(n17) );
  OAI21XL U59 ( .A0(n14), .A1(access_addr[3]), .B0(ram[18]), .Y(n18) );
  AOI2BB2X1 U60 ( .B0(read_data[0]), .B1(n21), .A0N(read_data[0]), .A1N(n21), 
        .Y(lfsr[1]) );
  OAI21XL U61 ( .A0(n14), .A1(access_addr[5]), .B0(ram[20]), .Y(n22) );
  AOI2BB2X1 U62 ( .B0(ram[21]), .B1(n24), .A0N(ram[21]), .A1N(n24), .Y(
        lfsr[22]) );
  OAI21XL U63 ( .A0(n14), .A1(access_addr[7]), .B0(ram[22]), .Y(n25) );
  OAI21XL U64 ( .A0(n14), .A1(access_addr[9]), .B0(ram[24]), .Y(n26) );
  OAI21XL U65 ( .A0(n14), .A1(access_addr[10]), .B0(ram[25]), .Y(n27) );
  OAI21XL U66 ( .A0(n14), .A1(access_addr[11]), .B0(ram[26]), .Y(n28) );
  OAI21XL U67 ( .A0(n14), .A1(access_addr[12]), .B0(ram[27]), .Y(n29) );
  AOI2BB2X1 U68 ( .B0(read_data[1]), .B1(n34), .A0N(read_data[1]), .A1N(n34), 
        .Y(lfsr[2]) );
  OAI21XL U69 ( .A0(write_en), .A1(access_addr[15]), .B0(ram[30]), .Y(n35) );
  OAI21XL U70 ( .A0(write_en), .A1(write_data[3]), .B0(read_data[2]), .Y(n36)
         );
  OAI21XL U71 ( .A0(write_en), .A1(write_data[4]), .B0(read_data[3]), .Y(n37)
         );
  OAI21XL U72 ( .A0(write_en), .A1(write_data[6]), .B0(read_data[5]), .Y(n38)
         );
  OAI21XL U73 ( .A0(write_en), .A1(write_data[7]), .B0(read_data[6]), .Y(n39)
         );
  OAI21XL U74 ( .A0(write_en), .A1(write_data[8]), .B0(read_data[7]), .Y(n40)
         );
  OAI21XL U75 ( .A0(write_en), .A1(write_data[9]), .B0(read_data[8]), .Y(n41)
         );
endmodule


module trcd ( clk, rst, \mem_read_data[15] , \mem_read_data[14] , 
        \mem_read_data[13] , \mem_read_data[12] , \mem_read_data[11] , 
        \mem_read_data[10] , \mem_read_data[9] , \mem_read_data[8]_BAR , 
        \mem_read_data[2] , \mem_read_data[1] , \mem_read_data[0] , 
        \mem_read_data[7]_BAR , \mem_read_data[6]_BAR , \mem_read_data[5]_BAR , 
        \mem_read_data[4]_BAR , \mem_read_data[3]_BAR , 
        \mem_access_addr[15]_BAR , \mem_access_addr[14]_BAR , 
        \mem_access_addr[13]_BAR , \mem_access_addr[12]_BAR , 
        \mem_access_addr[11]_BAR , \mem_access_addr[10]_BAR , 
        \mem_access_addr[9]_BAR , \mem_access_addr[8]_BAR , 
        \mem_access_addr[7]_BAR , \mem_access_addr[6]_BAR , 
        \mem_access_addr[5]_BAR , \mem_access_addr[4]_BAR , 
        \mem_access_addr[3]_BAR , \mem_access_addr[2]_BAR , 
        \mem_access_addr[1]_BAR , \mem_access_addr[0]_BAR , 
        \mem_write_data[15]_BAR , \mem_write_data[14]_BAR , 
        \mem_write_data[13]_BAR , \mem_write_data[12]_BAR , 
        \mem_write_data[11]_BAR , \mem_write_data[10]_BAR , 
        \mem_write_data[9]_BAR , \mem_write_data[8]_BAR , 
        \mem_write_data[7]_BAR , \mem_write_data[6]_BAR , 
        \mem_write_data[5]_BAR , \mem_write_data[4]_BAR , 
        \mem_write_data[3]_BAR , \mem_write_data[2]_BAR , 
        \mem_write_data[1]_BAR , \mem_write_data[0]_BAR , mem_write_en_BAR );
  input clk, rst, \mem_access_addr[15]_BAR , \mem_access_addr[14]_BAR ,
         \mem_access_addr[13]_BAR , \mem_access_addr[12]_BAR ,
         \mem_access_addr[11]_BAR , \mem_access_addr[10]_BAR ,
         \mem_access_addr[9]_BAR , \mem_access_addr[8]_BAR ,
         \mem_access_addr[7]_BAR , \mem_access_addr[6]_BAR ,
         \mem_access_addr[5]_BAR , \mem_access_addr[4]_BAR ,
         \mem_access_addr[3]_BAR , \mem_access_addr[2]_BAR ,
         \mem_access_addr[1]_BAR , \mem_access_addr[0]_BAR ,
         \mem_write_data[15]_BAR , \mem_write_data[14]_BAR ,
         \mem_write_data[13]_BAR , \mem_write_data[12]_BAR ,
         \mem_write_data[11]_BAR , \mem_write_data[10]_BAR ,
         \mem_write_data[9]_BAR , \mem_write_data[8]_BAR ,
         \mem_write_data[7]_BAR , \mem_write_data[6]_BAR ,
         \mem_write_data[5]_BAR , \mem_write_data[4]_BAR ,
         \mem_write_data[3]_BAR , \mem_write_data[2]_BAR ,
         \mem_write_data[1]_BAR , \mem_write_data[0]_BAR , mem_write_en_BAR;
  output \mem_read_data[15] , \mem_read_data[14] , \mem_read_data[13] ,
         \mem_read_data[12] , \mem_read_data[11] , \mem_read_data[10] ,
         \mem_read_data[9] , \mem_read_data[8]_BAR , \mem_read_data[2] ,
         \mem_read_data[1] , \mem_read_data[0] , \mem_read_data[7]_BAR ,
         \mem_read_data[6]_BAR , \mem_read_data[5]_BAR ,
         \mem_read_data[4]_BAR , \mem_read_data[3]_BAR ;
  wire   mem_write_en;
  wire   [15:0] mem_access_addr;
  wire   [15:0] mem_write_data;
  wire   [15:0] mem_read_data;
  assign mem_access_addr[15] = \mem_access_addr[15]_BAR ;
  assign mem_access_addr[14] = \mem_access_addr[14]_BAR ;
  assign mem_access_addr[13] = \mem_access_addr[13]_BAR ;
  assign mem_access_addr[12] = \mem_access_addr[12]_BAR ;
  assign mem_access_addr[11] = \mem_access_addr[11]_BAR ;
  assign mem_access_addr[10] = \mem_access_addr[10]_BAR ;
  assign mem_access_addr[9] = \mem_access_addr[9]_BAR ;
  assign mem_access_addr[8] = \mem_access_addr[8]_BAR ;
  assign mem_access_addr[7] = \mem_access_addr[7]_BAR ;
  assign mem_access_addr[6] = \mem_access_addr[6]_BAR ;
  assign mem_access_addr[5] = \mem_access_addr[5]_BAR ;
  assign mem_access_addr[4] = \mem_access_addr[4]_BAR ;
  assign mem_access_addr[3] = \mem_access_addr[3]_BAR ;
  assign mem_access_addr[2] = \mem_access_addr[2]_BAR ;
  assign mem_access_addr[1] = \mem_access_addr[1]_BAR ;
  assign mem_access_addr[0] = \mem_access_addr[0]_BAR ;
  assign mem_write_data[15] = \mem_write_data[15]_BAR ;
  assign mem_write_data[14] = \mem_write_data[14]_BAR ;
  assign mem_write_data[13] = \mem_write_data[13]_BAR ;
  assign mem_write_data[12] = \mem_write_data[12]_BAR ;
  assign mem_write_data[11] = \mem_write_data[11]_BAR ;
  assign mem_write_data[10] = \mem_write_data[10]_BAR ;
  assign mem_write_data[9] = \mem_write_data[9]_BAR ;
  assign mem_write_data[8] = \mem_write_data[8]_BAR ;
  assign mem_write_data[7] = \mem_write_data[7]_BAR ;
  assign mem_write_data[6] = \mem_write_data[6]_BAR ;
  assign mem_write_data[5] = \mem_write_data[5]_BAR ;
  assign mem_write_data[4] = \mem_write_data[4]_BAR ;
  assign mem_write_data[3] = \mem_write_data[3]_BAR ;
  assign mem_write_data[2] = \mem_write_data[2]_BAR ;
  assign mem_write_data[1] = \mem_write_data[1]_BAR ;
  assign mem_write_data[0] = \mem_write_data[0]_BAR ;
  assign mem_write_en = mem_write_en_BAR;
  assign \mem_read_data[8]_BAR  = mem_read_data[8];
  assign \mem_read_data[7]_BAR  = mem_read_data[7];
  assign \mem_read_data[6]_BAR  = mem_read_data[6];
  assign \mem_read_data[5]_BAR  = mem_read_data[5];
  assign \mem_read_data[4]_BAR  = mem_read_data[4];
  assign \mem_read_data[3]_BAR  = mem_read_data[3];

  ora ora ( .clk(clk), .rst(rst), .\read_data[15] (mem_read_data[15]), 
        .\read_data[14] (mem_read_data[14]), .\read_data[13] (
        mem_read_data[13]), .\read_data[12] (mem_read_data[12]), 
        .\read_data[11] (mem_read_data[11]), .\read_data[10] (
        mem_read_data[10]), .\read_data[9] (mem_read_data[9]), 
        .\read_data[8]_BAR (mem_read_data[8]), .\read_data[2] (
        mem_read_data[2]), .\read_data[1] (mem_read_data[1]), .\read_data[0] (
        mem_read_data[0]), .\read_data[7]_BAR (mem_read_data[7]), 
        .\read_data[6]_BAR (mem_read_data[6]), .\read_data[5]_BAR (
        mem_read_data[5]), .\read_data[4]_BAR (mem_read_data[4]), 
        .\read_data[3]_BAR (mem_read_data[3]), .\access_addr[15]_BAR (
        mem_access_addr[15]), .\access_addr[14]_BAR (mem_access_addr[14]), 
        .\access_addr[13]_BAR (mem_access_addr[13]), .\access_addr[12]_BAR (
        mem_access_addr[12]), .\access_addr[11]_BAR (mem_access_addr[11]), 
        .\access_addr[10]_BAR (mem_access_addr[10]), .\access_addr[9]_BAR (
        mem_access_addr[9]), .\access_addr[8]_BAR (mem_access_addr[8]), 
        .\access_addr[7]_BAR (mem_access_addr[7]), .\access_addr[6]_BAR (
        mem_access_addr[6]), .\access_addr[5]_BAR (mem_access_addr[5]), 
        .\access_addr[4]_BAR (mem_access_addr[4]), .\access_addr[3]_BAR (
        mem_access_addr[3]), .\access_addr[2]_BAR (mem_access_addr[2]), 
        .\access_addr[1]_BAR (mem_access_addr[1]), .\access_addr[0]_BAR (
        mem_access_addr[0]), .\write_data[15]_BAR (mem_write_data[15]), 
        .\write_data[14]_BAR (mem_write_data[14]), .\write_data[13]_BAR (
        mem_write_data[13]), .\write_data[12]_BAR (mem_write_data[12]), 
        .\write_data[11]_BAR (mem_write_data[11]), .\write_data[10]_BAR (
        mem_write_data[10]), .\write_data[9]_BAR (mem_write_data[9]), 
        .\write_data[8]_BAR (mem_write_data[8]), .\write_data[7]_BAR (
        mem_write_data[7]), .\write_data[6]_BAR (mem_write_data[6]), 
        .\write_data[5]_BAR (mem_write_data[5]), .\write_data[4]_BAR (
        mem_write_data[4]), .\write_data[3]_BAR (mem_write_data[3]), 
        .\write_data[2]_BAR (mem_write_data[2]), .\write_data[1]_BAR (
        mem_write_data[1]), .\write_data[0]_BAR (mem_write_data[0]), 
        .write_en_BAR(mem_write_en) );
endmodule


module MEM_stage ( clk, rst, irst_reg_data, mem_op_dest, mem_read_data, 
        \rand_data[15] , \rand_data[14] , \rand_data[13] , \rand_data[12] , 
        \rand_data[11] , \rand_data[10] , \rand_data[9] , \rand_data[8]_BAR , 
        \rand_data[2] , \rand_data[1] , \rand_data[0] , \rand_data[7]_BAR , 
        \rand_data[6]_BAR , \rand_data[5]_BAR , \rand_data[4]_BAR , 
        \rand_data[3]_BAR , \pipeline_reg_out[36] , \pipeline_reg_out[35] , 
        \pipeline_reg_out[34] , \pipeline_reg_out[33] , \pipeline_reg_out[32] , 
        \pipeline_reg_out[31] , \pipeline_reg_out[30] , \pipeline_reg_out[29] , 
        \pipeline_reg_out[28] , \pipeline_reg_out[27] , \pipeline_reg_out[26] , 
        \pipeline_reg_out[25] , \pipeline_reg_out[24] , \pipeline_reg_out[23] , 
        \pipeline_reg_out[22] , \pipeline_reg_out[20] , \pipeline_reg_out[19] , 
        \pipeline_reg_out[18] , \pipeline_reg_out[17] , \pipeline_reg_out[16] , 
        \pipeline_reg_out[15] , \pipeline_reg_out[14] , \pipeline_reg_out[13] , 
        \pipeline_reg_out[12] , \pipeline_reg_out[11] , \pipeline_reg_out[10] , 
        \pipeline_reg_out[9] , \pipeline_reg_out[8] , \pipeline_reg_out[7] , 
        \pipeline_reg_out[6] , \pipeline_reg_out[5] , 
        \pipeline_reg_out[4]_BAR , \pipeline_reg_out[0] , 
        \pipeline_reg_out[3]_BAR , \pipeline_reg_out[2]_BAR , 
        \pipeline_reg_out[1]_BAR , \ex_alu_result[15]_BAR , 
        \pipeline_reg_in[37]_BAR , \pipeline_reg_in[4] , \pipeline_reg_in[3] , 
        \pipeline_reg_in[2] , \pipeline_reg_in[1] , \pipeline_reg_in[0] , 
        \ex_alu_result[14]_BAR , \pipeline_reg_in[36]_BAR , 
        \ex_alu_result[13]_BAR , \pipeline_reg_in[35]_BAR , 
        \ex_alu_result[12]_BAR , \pipeline_reg_in[34]_BAR , 
        \ex_alu_result[11]_BAR , \pipeline_reg_in[33]_BAR , 
        \ex_alu_result[10]_BAR , \pipeline_reg_in[32]_BAR , 
        \ex_alu_result[9]_BAR , \pipeline_reg_in[31]_BAR , 
        \ex_alu_result[8]_BAR , \pipeline_reg_in[30]_BAR , 
        \ex_alu_result[7]_BAR , \pipeline_reg_in[29]_BAR , 
        \ex_alu_result[6]_BAR , \pipeline_reg_in[28]_BAR , 
        \ex_alu_result[5]_BAR , \pipeline_reg_in[27]_BAR , 
        \ex_alu_result[4]_BAR , \pipeline_reg_in[26]_BAR , 
        \ex_alu_result[3]_BAR , \pipeline_reg_in[25]_BAR , 
        \ex_alu_result[2]_BAR , \pipeline_reg_in[24]_BAR , 
        \ex_alu_result[1]_BAR , \pipeline_reg_in[23]_BAR , 
        \ex_alu_result[0]_BAR , \pipeline_reg_in[22]_BAR , 
        \mem_write_data[15]_BAR , \pipeline_reg_in[20]_BAR , 
        \mem_write_data[14]_BAR , \pipeline_reg_in[19]_BAR , 
        \mem_write_data[13]_BAR , \pipeline_reg_in[18]_BAR , 
        \mem_write_data[12]_BAR , \pipeline_reg_in[17]_BAR , 
        \mem_write_data[11]_BAR , \pipeline_reg_in[16]_BAR , 
        \mem_write_data[10]_BAR , \pipeline_reg_in[15]_BAR , 
        \mem_write_data[9]_BAR , \pipeline_reg_in[14]_BAR , 
        \mem_write_data[8]_BAR , \pipeline_reg_in[13]_BAR , 
        \mem_write_data[7]_BAR , \pipeline_reg_in[12]_BAR , 
        \mem_write_data[6]_BAR , \pipeline_reg_in[11]_BAR , 
        \mem_write_data[5]_BAR , \pipeline_reg_in[10]_BAR , 
        \mem_write_data[4]_BAR , \pipeline_reg_in[9]_BAR , 
        \mem_write_data[3]_BAR , \pipeline_reg_in[8]_BAR , 
        \mem_write_data[2]_BAR , \pipeline_reg_in[7]_BAR , 
        \mem_write_data[1]_BAR , \pipeline_reg_in[6]_BAR , 
        \mem_write_data[0]_BAR , \pipeline_reg_in[5]_BAR , mem_write_en_BAR, 
        \pipeline_reg_in[21]_BAR , \pipeline_reg_out[21]_BAR  );
  input [15:0] irst_reg_data;
  output [2:0] mem_op_dest;
  input [15:0] mem_read_data;
  input clk, rst, \pipeline_reg_in[37]_BAR , \pipeline_reg_in[4] ,
         \pipeline_reg_in[3] , \pipeline_reg_in[2] , \pipeline_reg_in[1] ,
         \pipeline_reg_in[0] , \pipeline_reg_in[36]_BAR ,
         \pipeline_reg_in[35]_BAR , \pipeline_reg_in[34]_BAR ,
         \pipeline_reg_in[33]_BAR , \pipeline_reg_in[32]_BAR ,
         \pipeline_reg_in[31]_BAR , \pipeline_reg_in[30]_BAR ,
         \pipeline_reg_in[29]_BAR , \pipeline_reg_in[28]_BAR ,
         \pipeline_reg_in[27]_BAR , \pipeline_reg_in[26]_BAR ,
         \pipeline_reg_in[25]_BAR , \pipeline_reg_in[24]_BAR ,
         \pipeline_reg_in[23]_BAR , \pipeline_reg_in[22]_BAR ,
         \pipeline_reg_in[20]_BAR , \pipeline_reg_in[19]_BAR ,
         \pipeline_reg_in[18]_BAR , \pipeline_reg_in[17]_BAR ,
         \pipeline_reg_in[16]_BAR , \pipeline_reg_in[15]_BAR ,
         \pipeline_reg_in[14]_BAR , \pipeline_reg_in[13]_BAR ,
         \pipeline_reg_in[12]_BAR , \pipeline_reg_in[11]_BAR ,
         \pipeline_reg_in[10]_BAR , \pipeline_reg_in[9]_BAR ,
         \pipeline_reg_in[8]_BAR , \pipeline_reg_in[7]_BAR ,
         \pipeline_reg_in[6]_BAR , \pipeline_reg_in[5]_BAR ,
         \pipeline_reg_in[21]_BAR ;
  output \rand_data[15] , \rand_data[14] , \rand_data[13] , \rand_data[12] ,
         \rand_data[11] , \rand_data[10] , \rand_data[9] , \rand_data[8]_BAR ,
         \rand_data[2] , \rand_data[1] , \rand_data[0] , \rand_data[7]_BAR ,
         \rand_data[6]_BAR , \rand_data[5]_BAR , \rand_data[4]_BAR ,
         \rand_data[3]_BAR , \pipeline_reg_out[36] , \pipeline_reg_out[35] ,
         \pipeline_reg_out[34] , \pipeline_reg_out[33] ,
         \pipeline_reg_out[32] , \pipeline_reg_out[31] ,
         \pipeline_reg_out[30] , \pipeline_reg_out[29] ,
         \pipeline_reg_out[28] , \pipeline_reg_out[27] ,
         \pipeline_reg_out[26] , \pipeline_reg_out[25] ,
         \pipeline_reg_out[24] , \pipeline_reg_out[23] ,
         \pipeline_reg_out[22] , \pipeline_reg_out[20] ,
         \pipeline_reg_out[19] , \pipeline_reg_out[18] ,
         \pipeline_reg_out[17] , \pipeline_reg_out[16] ,
         \pipeline_reg_out[15] , \pipeline_reg_out[14] ,
         \pipeline_reg_out[13] , \pipeline_reg_out[12] ,
         \pipeline_reg_out[11] , \pipeline_reg_out[10] , \pipeline_reg_out[9] ,
         \pipeline_reg_out[8] , \pipeline_reg_out[7] , \pipeline_reg_out[6] ,
         \pipeline_reg_out[5] , \pipeline_reg_out[4]_BAR ,
         \pipeline_reg_out[0] , \pipeline_reg_out[3]_BAR ,
         \pipeline_reg_out[2]_BAR , \pipeline_reg_out[1]_BAR ,
         \ex_alu_result[15]_BAR , \ex_alu_result[14]_BAR ,
         \ex_alu_result[13]_BAR , \ex_alu_result[12]_BAR ,
         \ex_alu_result[11]_BAR , \ex_alu_result[10]_BAR ,
         \ex_alu_result[9]_BAR , \ex_alu_result[8]_BAR ,
         \ex_alu_result[7]_BAR , \ex_alu_result[6]_BAR ,
         \ex_alu_result[5]_BAR , \ex_alu_result[4]_BAR ,
         \ex_alu_result[3]_BAR , \ex_alu_result[2]_BAR ,
         \ex_alu_result[1]_BAR , \ex_alu_result[0]_BAR ,
         \mem_write_data[15]_BAR , \mem_write_data[14]_BAR ,
         \mem_write_data[13]_BAR , \mem_write_data[12]_BAR ,
         \mem_write_data[11]_BAR , \mem_write_data[10]_BAR ,
         \mem_write_data[9]_BAR , \mem_write_data[8]_BAR ,
         \mem_write_data[7]_BAR , \mem_write_data[6]_BAR ,
         \mem_write_data[5]_BAR , \mem_write_data[4]_BAR ,
         \mem_write_data[3]_BAR , \mem_write_data[2]_BAR ,
         \mem_write_data[1]_BAR , \mem_write_data[0]_BAR , mem_write_en_BAR,
         \pipeline_reg_out[21]_BAR ;
  wire   n62, n63, n64, n65, \rand_data[8] , \rand_data[7] , \rand_data[6] ,
         \rand_data[5] , \rand_data[4] , \rand_data[3] , \pipeline_reg_in[21] ,
         pipeline_reg_in_4, pipeline_reg_in_0, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, n1, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57;
  wire   [36:0] pipeline_reg_out;
  wire   [15:0] ex_alu_result;
  wire   [15:0] mem_write_data;
  assign \rand_data[8]_BAR  = \rand_data[8] ;
  assign \rand_data[7]_BAR  = \rand_data[7] ;
  assign \rand_data[6]_BAR  = \rand_data[6] ;
  assign \rand_data[5]_BAR  = \rand_data[5] ;
  assign \rand_data[4]_BAR  = \rand_data[4] ;
  assign \rand_data[3]_BAR  = \rand_data[3] ;
  assign \pipeline_reg_in[21]  = \pipeline_reg_in[21]_BAR ;
  assign pipeline_reg_in_4 = \pipeline_reg_in[4] ;
  assign pipeline_reg_in_0 = \pipeline_reg_in[0] ;
  assign ex_alu_result[15] = \pipeline_reg_in[37]_BAR ;
  assign ex_alu_result[14] = \pipeline_reg_in[36]_BAR ;
  assign ex_alu_result[13] = \pipeline_reg_in[35]_BAR ;
  assign ex_alu_result[12] = \pipeline_reg_in[34]_BAR ;
  assign ex_alu_result[11] = \pipeline_reg_in[33]_BAR ;
  assign ex_alu_result[10] = \pipeline_reg_in[32]_BAR ;
  assign ex_alu_result[9] = \pipeline_reg_in[31]_BAR ;
  assign ex_alu_result[8] = \pipeline_reg_in[30]_BAR ;
  assign ex_alu_result[7] = \pipeline_reg_in[29]_BAR ;
  assign ex_alu_result[6] = \pipeline_reg_in[28]_BAR ;
  assign ex_alu_result[5] = \pipeline_reg_in[27]_BAR ;
  assign ex_alu_result[4] = \pipeline_reg_in[26]_BAR ;
  assign ex_alu_result[3] = \pipeline_reg_in[25]_BAR ;
  assign ex_alu_result[2] = \pipeline_reg_in[24]_BAR ;
  assign ex_alu_result[1] = \pipeline_reg_in[23]_BAR ;
  assign ex_alu_result[0] = \pipeline_reg_in[22]_BAR ;
  assign mem_write_data[15] = \pipeline_reg_in[20]_BAR ;
  assign mem_write_data[14] = \pipeline_reg_in[19]_BAR ;
  assign mem_write_data[13] = \pipeline_reg_in[18]_BAR ;
  assign mem_write_data[12] = \pipeline_reg_in[17]_BAR ;
  assign mem_write_data[11] = \pipeline_reg_in[16]_BAR ;
  assign mem_write_data[10] = \pipeline_reg_in[15]_BAR ;
  assign mem_write_data[9] = \pipeline_reg_in[14]_BAR ;
  assign mem_write_data[8] = \pipeline_reg_in[13]_BAR ;
  assign mem_write_data[7] = \pipeline_reg_in[12]_BAR ;
  assign mem_write_data[6] = \pipeline_reg_in[11]_BAR ;
  assign mem_write_data[5] = \pipeline_reg_in[10]_BAR ;
  assign mem_write_data[4] = \pipeline_reg_in[9]_BAR ;
  assign mem_write_data[3] = \pipeline_reg_in[8]_BAR ;
  assign mem_write_data[2] = \pipeline_reg_in[7]_BAR ;
  assign mem_write_data[1] = \pipeline_reg_in[6]_BAR ;
  assign mem_write_data[0] = \pipeline_reg_in[5]_BAR ;

  trcd trcd ( .clk(clk), .rst(rst), .\mem_read_data[15] (n62), 
        .\mem_read_data[14] (n63), .\mem_read_data[13] (n64), 
        .\mem_read_data[12] (n65), .\mem_read_data[11] (\rand_data[11] ), 
        .\mem_read_data[10] (\rand_data[10] ), .\mem_read_data[9] (
        \rand_data[9] ), .\mem_read_data[8]_BAR (\rand_data[8] ), 
        .\mem_read_data[2] (\rand_data[2] ), .\mem_read_data[1] (
        \rand_data[1] ), .\mem_read_data[0] (\rand_data[0] ), 
        .\mem_read_data[7]_BAR (\rand_data[7] ), .\mem_read_data[6]_BAR (
        \rand_data[6] ), .\mem_read_data[5]_BAR (\rand_data[5] ), 
        .\mem_read_data[4]_BAR (\rand_data[4] ), .\mem_read_data[3]_BAR (
        \rand_data[3] ), .\mem_access_addr[15]_BAR (ex_alu_result[15]), 
        .\mem_access_addr[14]_BAR (ex_alu_result[14]), 
        .\mem_access_addr[13]_BAR (ex_alu_result[13]), 
        .\mem_access_addr[12]_BAR (ex_alu_result[12]), 
        .\mem_access_addr[11]_BAR (ex_alu_result[11]), 
        .\mem_access_addr[10]_BAR (ex_alu_result[10]), 
        .\mem_access_addr[9]_BAR (ex_alu_result[9]), 
        .\mem_access_addr[8]_BAR (ex_alu_result[8]), 
        .\mem_access_addr[7]_BAR (ex_alu_result[7]), 
        .\mem_access_addr[6]_BAR (ex_alu_result[6]), 
        .\mem_access_addr[5]_BAR (ex_alu_result[5]), 
        .\mem_access_addr[4]_BAR (ex_alu_result[4]), 
        .\mem_access_addr[3]_BAR (ex_alu_result[3]), 
        .\mem_access_addr[2]_BAR (ex_alu_result[2]), 
        .\mem_access_addr[1]_BAR (ex_alu_result[1]), 
        .\mem_access_addr[0]_BAR (ex_alu_result[0]), 
        .\mem_write_data[15]_BAR (mem_write_data[15]), 
        .\mem_write_data[14]_BAR (mem_write_data[14]), 
        .\mem_write_data[13]_BAR (mem_write_data[13]), 
        .\mem_write_data[12]_BAR (mem_write_data[12]), 
        .\mem_write_data[11]_BAR (mem_write_data[11]), 
        .\mem_write_data[10]_BAR (mem_write_data[10]), 
        .\mem_write_data[9]_BAR (mem_write_data[9]), .\mem_write_data[8]_BAR (
        mem_write_data[8]), .\mem_write_data[7]_BAR (mem_write_data[7]), 
        .\mem_write_data[6]_BAR (mem_write_data[6]), .\mem_write_data[5]_BAR (
        mem_write_data[5]), .\mem_write_data[4]_BAR (mem_write_data[4]), 
        .\mem_write_data[3]_BAR (mem_write_data[3]), .\mem_write_data[2]_BAR (
        mem_write_data[2]), .\mem_write_data[1]_BAR (mem_write_data[1]), 
        .\mem_write_data[0]_BAR (mem_write_data[0]), .mem_write_en_BAR(
        mem_write_en_BAR) );
  DFFTRX1 \pipeline_reg_out_reg[4]  ( .D(pipeline_reg_in_4), .RN(n1), .CK(clk), 
        .QN(\pipeline_reg_out[4]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[3]  ( .D(\pipeline_reg_in[3] ), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[3]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[2]  ( .D(\pipeline_reg_in[2] ), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[2]_BAR ) );
  DFFTRX1 \pipeline_reg_out_reg[1]  ( .D(\pipeline_reg_in[1] ), .RN(n1), .CK(
        clk), .QN(\pipeline_reg_out[1]_BAR ) );
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
  DFFTRX1 \pipeline_reg_out_reg[36]  ( .D(n57), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[36]) );
  DFFTRX1 \pipeline_reg_out_reg[35]  ( .D(n56), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[35]) );
  DFFTRX1 \pipeline_reg_out_reg[34]  ( .D(n55), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[34]) );
  DFFTRX1 \pipeline_reg_out_reg[33]  ( .D(n54), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[33]) );
  DFFTRX1 \pipeline_reg_out_reg[32]  ( .D(n53), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[32]) );
  DFFTRX1 \pipeline_reg_out_reg[31]  ( .D(n52), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[31]) );
  DFFTRX1 \pipeline_reg_out_reg[30]  ( .D(n51), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[30]) );
  DFFTRX1 \pipeline_reg_out_reg[29]  ( .D(n50), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[29]) );
  DFFTRX1 \pipeline_reg_out_reg[28]  ( .D(n49), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[28]) );
  DFFTRX1 \pipeline_reg_out_reg[27]  ( .D(n48), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[27]) );
  DFFTRX1 \pipeline_reg_out_reg[26]  ( .D(n47), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[26]) );
  DFFTRX1 \pipeline_reg_out_reg[25]  ( .D(n46), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[25]) );
  DFFTRX1 \pipeline_reg_out_reg[24]  ( .D(n45), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[24]) );
  DFFTRX1 \pipeline_reg_out_reg[23]  ( .D(n44), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[23]) );
  DFFTRX1 \pipeline_reg_out_reg[22]  ( .D(n43), .RN(n1), .CK(clk), .Q(
        pipeline_reg_out[22]) );
  DFFTRX1 \pipeline_reg_out_reg[21]  ( .D(n42), .RN(n1), .CK(clk), .QN(
        \pipeline_reg_out[21]_BAR ) );
  DFFTRX4 \pipeline_reg_out_reg[0]  ( .D(pipeline_reg_in_0), .RN(n1), .CK(clk), 
        .Q(pipeline_reg_out[0]) );
  INVX3 U3 ( .A(n39), .Y(n41) );
  INVX1 U4 ( .A(ex_alu_result[3]), .Y(n45) );
  INVX1 U5 ( .A(ex_alu_result[0]), .Y(n42) );
  INVX1 U6 ( .A(ex_alu_result[5]), .Y(n47) );
  INVX1 U7 ( .A(ex_alu_result[4]), .Y(n46) );
  INVX1 U8 ( .A(ex_alu_result[7]), .Y(n49) );
  INVX1 U9 ( .A(ex_alu_result[8]), .Y(n50) );
  INVX1 U10 ( .A(ex_alu_result[9]), .Y(n51) );
  INVX1 U11 ( .A(ex_alu_result[1]), .Y(n43) );
  INVX1 U12 ( .A(ex_alu_result[2]), .Y(n44) );
  INVX1 U13 ( .A(ex_alu_result[6]), .Y(n48) );
  INVX1 U14 ( .A(ex_alu_result[10]), .Y(n52) );
  INVX1 U15 ( .A(ex_alu_result[11]), .Y(n53) );
  INVX1 U16 ( .A(ex_alu_result[12]), .Y(n54) );
  INVX1 U17 ( .A(ex_alu_result[13]), .Y(n55) );
  INVX1 U18 ( .A(ex_alu_result[14]), .Y(n56) );
  INVX1 U19 ( .A(ex_alu_result[15]), .Y(n57) );
  NAND2X2 U20 ( .A(irst_reg_data[15]), .B(n1), .Y(n39) );
  NOR2X4 U21 ( .A(rst), .B(irst_reg_data[15]), .Y(n40) );
  CLKBUFX3 U22 ( .A(\pipeline_reg_in[21] ), .Y(mem_write_en_BAR) );
  INVX3 U23 ( .A(rst), .Y(n1) );
  CLKBUFX3 U24 ( .A(mem_write_data[0]), .Y(\mem_write_data[0]_BAR ) );
  CLKBUFX3 U25 ( .A(ex_alu_result[14]), .Y(\ex_alu_result[14]_BAR ) );
  CLKBUFX3 U26 ( .A(ex_alu_result[15]), .Y(\ex_alu_result[15]_BAR ) );
  CLKBUFX3 U27 ( .A(ex_alu_result[13]), .Y(\ex_alu_result[13]_BAR ) );
  CLKBUFX3 U28 ( .A(ex_alu_result[12]), .Y(\ex_alu_result[12]_BAR ) );
  CLKBUFX3 U29 ( .A(mem_write_data[6]), .Y(\mem_write_data[6]_BAR ) );
  CLKBUFX3 U30 ( .A(mem_write_data[5]), .Y(\mem_write_data[5]_BAR ) );
  CLKBUFX3 U31 ( .A(mem_write_data[4]), .Y(\mem_write_data[4]_BAR ) );
  CLKBUFX3 U32 ( .A(mem_write_data[3]), .Y(\mem_write_data[3]_BAR ) );
  CLKBUFX3 U33 ( .A(mem_write_data[15]), .Y(\mem_write_data[15]_BAR ) );
  CLKBUFX3 U34 ( .A(mem_write_data[14]), .Y(\mem_write_data[14]_BAR ) );
  CLKBUFX3 U35 ( .A(mem_write_data[13]), .Y(\mem_write_data[13]_BAR ) );
  CLKBUFX3 U36 ( .A(mem_write_data[12]), .Y(\mem_write_data[12]_BAR ) );
  CLKBUFX3 U37 ( .A(mem_write_data[11]), .Y(\mem_write_data[11]_BAR ) );
  CLKBUFX3 U38 ( .A(mem_write_data[10]), .Y(\mem_write_data[10]_BAR ) );
  CLKBUFX3 U39 ( .A(mem_write_data[9]), .Y(\mem_write_data[9]_BAR ) );
  CLKBUFX3 U40 ( .A(mem_write_data[8]), .Y(\mem_write_data[8]_BAR ) );
  CLKBUFX3 U41 ( .A(mem_write_data[7]), .Y(\mem_write_data[7]_BAR ) );
  CLKBUFX3 U42 ( .A(mem_write_data[2]), .Y(\mem_write_data[2]_BAR ) );
  CLKBUFX3 U43 ( .A(mem_write_data[1]), .Y(\mem_write_data[1]_BAR ) );
  CLKBUFX3 U44 ( .A(ex_alu_result[0]), .Y(\ex_alu_result[0]_BAR ) );
  CLKBUFX3 U45 ( .A(ex_alu_result[5]), .Y(\ex_alu_result[5]_BAR ) );
  CLKBUFX3 U46 ( .A(ex_alu_result[11]), .Y(\ex_alu_result[11]_BAR ) );
  CLKBUFX3 U47 ( .A(ex_alu_result[9]), .Y(\ex_alu_result[9]_BAR ) );
  CLKBUFX3 U48 ( .A(ex_alu_result[8]), .Y(\ex_alu_result[8]_BAR ) );
  CLKBUFX3 U49 ( .A(ex_alu_result[7]), .Y(\ex_alu_result[7]_BAR ) );
  CLKBUFX3 U50 ( .A(ex_alu_result[10]), .Y(\ex_alu_result[10]_BAR ) );
  CLKBUFX3 U51 ( .A(ex_alu_result[3]), .Y(\ex_alu_result[3]_BAR ) );
  CLKBUFX3 U52 ( .A(ex_alu_result[2]), .Y(\ex_alu_result[2]_BAR ) );
  CLKBUFX3 U53 ( .A(ex_alu_result[1]), .Y(\ex_alu_result[1]_BAR ) );
  CLKBUFX3 U54 ( .A(ex_alu_result[4]), .Y(\ex_alu_result[4]_BAR ) );
  CLKBUFX3 U55 ( .A(ex_alu_result[6]), .Y(\ex_alu_result[6]_BAR ) );
  CLKBUFX3 U56 ( .A(\pipeline_reg_in[2] ), .Y(mem_op_dest[1]) );
  CLKBUFX3 U57 ( .A(\pipeline_reg_in[1] ), .Y(mem_op_dest[0]) );
  CLKBUFX3 U58 ( .A(\pipeline_reg_in[3] ), .Y(mem_op_dest[2]) );
  AO22X1 U59 ( .A0(n41), .A1(\rand_data[0] ), .B0(n40), .B1(mem_read_data[0]), 
        .Y(N27) );
  AO22X1 U60 ( .A0(n41), .A1(\rand_data[1] ), .B0(n40), .B1(mem_read_data[1]), 
        .Y(N28) );
  AO22X1 U61 ( .A0(n41), .A1(\rand_data[2] ), .B0(n40), .B1(mem_read_data[2]), 
        .Y(N29) );
  OAI2BB2XL U62 ( .B0(\rand_data[3] ), .B1(n39), .A0N(n40), .A1N(
        mem_read_data[3]), .Y(N30) );
  OAI2BB2XL U63 ( .B0(\rand_data[4] ), .B1(n39), .A0N(n40), .A1N(
        mem_read_data[4]), .Y(N31) );
  OAI2BB2XL U64 ( .B0(\rand_data[5] ), .B1(n39), .A0N(n40), .A1N(
        mem_read_data[5]), .Y(N32) );
  OAI2BB2XL U65 ( .B0(\rand_data[6] ), .B1(n39), .A0N(n40), .A1N(
        mem_read_data[6]), .Y(N33) );
  OAI2BB2XL U66 ( .B0(\rand_data[7] ), .B1(n39), .A0N(n40), .A1N(
        mem_read_data[7]), .Y(N34) );
  OAI2BB2XL U67 ( .B0(\rand_data[8] ), .B1(n39), .A0N(n40), .A1N(
        mem_read_data[8]), .Y(N35) );
  AO22X1 U68 ( .A0(n41), .A1(\rand_data[9] ), .B0(n40), .B1(mem_read_data[9]), 
        .Y(N36) );
  AO22X1 U69 ( .A0(n41), .A1(\rand_data[10] ), .B0(n40), .B1(mem_read_data[10]), .Y(N37) );
  AO22X1 U70 ( .A0(n41), .A1(\rand_data[11] ), .B0(n40), .B1(mem_read_data[11]), .Y(N38) );
  AO22X1 U71 ( .A0(n41), .A1(n65), .B0(n40), .B1(mem_read_data[12]), .Y(N39)
         );
  AO22X1 U72 ( .A0(n41), .A1(n64), .B0(n40), .B1(mem_read_data[13]), .Y(N40)
         );
  AO22X1 U73 ( .A0(n41), .A1(n63), .B0(n40), .B1(mem_read_data[14]), .Y(N41)
         );
  AO22X1 U74 ( .A0(n41), .A1(n62), .B0(n40), .B1(mem_read_data[15]), .Y(N42)
         );
endmodule


module WB_stage ( reg_write_data, reg_write_en_BAR, \pipeline_reg_in[36] , 
        \pipeline_reg_in[35] , \pipeline_reg_in[34] , \pipeline_reg_in[33] , 
        \pipeline_reg_in[32] , \pipeline_reg_in[31] , \pipeline_reg_in[30] , 
        \pipeline_reg_in[29] , \pipeline_reg_in[28] , \pipeline_reg_in[27] , 
        \pipeline_reg_in[26] , \pipeline_reg_in[25] , \pipeline_reg_in[24] , 
        \pipeline_reg_in[23] , \pipeline_reg_in[22] , \pipeline_reg_in[20] , 
        \pipeline_reg_in[19] , \pipeline_reg_in[18] , \pipeline_reg_in[17] , 
        \pipeline_reg_in[16] , \pipeline_reg_in[15] , \pipeline_reg_in[14] , 
        \pipeline_reg_in[13] , \pipeline_reg_in[12] , \pipeline_reg_in[11] , 
        \pipeline_reg_in[10] , \pipeline_reg_in[9] , \pipeline_reg_in[8] , 
        \pipeline_reg_in[7] , \pipeline_reg_in[6] , \pipeline_reg_in[5] , 
        \pipeline_reg_in[4]_BAR , \pipeline_reg_in[0] , 
        \reg_write_dest[2]_BAR , \wb_op_dest[2]_BAR , \pipeline_reg_in[3]_BAR , 
        \reg_write_dest[1]_BAR , \wb_op_dest[1]_BAR , \pipeline_reg_in[2]_BAR , 
        \reg_write_dest[0]_BAR , \wb_op_dest[0]_BAR , \pipeline_reg_in[1]_BAR , 
        \pipeline_reg_in[21]_BAR  );
  output [15:0] reg_write_data;
  input \pipeline_reg_in[36] , \pipeline_reg_in[35] , \pipeline_reg_in[34] ,
         \pipeline_reg_in[33] , \pipeline_reg_in[32] , \pipeline_reg_in[31] ,
         \pipeline_reg_in[30] , \pipeline_reg_in[29] , \pipeline_reg_in[28] ,
         \pipeline_reg_in[27] , \pipeline_reg_in[26] , \pipeline_reg_in[25] ,
         \pipeline_reg_in[24] , \pipeline_reg_in[23] , \pipeline_reg_in[22] ,
         \pipeline_reg_in[20] , \pipeline_reg_in[19] , \pipeline_reg_in[18] ,
         \pipeline_reg_in[17] , \pipeline_reg_in[16] , \pipeline_reg_in[15] ,
         \pipeline_reg_in[14] , \pipeline_reg_in[13] , \pipeline_reg_in[12] ,
         \pipeline_reg_in[11] , \pipeline_reg_in[10] , \pipeline_reg_in[9] ,
         \pipeline_reg_in[8] , \pipeline_reg_in[7] , \pipeline_reg_in[6] ,
         \pipeline_reg_in[5] , \pipeline_reg_in[4]_BAR , \pipeline_reg_in[0] ,
         \pipeline_reg_in[3]_BAR , \pipeline_reg_in[2]_BAR ,
         \pipeline_reg_in[1]_BAR , \pipeline_reg_in[21]_BAR ;
  output reg_write_en_BAR, \reg_write_dest[2]_BAR , \wb_op_dest[2]_BAR ,
         \reg_write_dest[1]_BAR , \wb_op_dest[1]_BAR , \reg_write_dest[0]_BAR ,
         \wb_op_dest[0]_BAR ;
  wire   pipeline_reg_in_0, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n16, n17, n18, n26;
  wire   [36:4] pipeline_reg_in;
  wire   [2:0] reg_write_dest;
  assign pipeline_reg_in[21] = \pipeline_reg_in[21]_BAR ;
  assign pipeline_reg_in[4] = \pipeline_reg_in[4]_BAR ;
  assign pipeline_reg_in_0 = \pipeline_reg_in[0] ;
  assign reg_write_dest[2] = \pipeline_reg_in[3]_BAR ;
  assign reg_write_dest[1] = \pipeline_reg_in[2]_BAR ;
  assign reg_write_dest[0] = \pipeline_reg_in[1]_BAR ;

  NOR2BX1 U1 ( .AN(pipeline_reg_in[5]), .B(n26), .Y(n18) );
  AOI22X1 U2 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[16]), .B0(n26), 
        .B1(pipeline_reg_in[32]), .Y(n31) );
  AOI22X1 U3 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[7]), .B0(n26), .B1(
        pipeline_reg_in[23]), .Y(n40) );
  AOI22X1 U4 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[10]), .B0(n26), 
        .B1(pipeline_reg_in[26]), .Y(n37) );
  AOI22X1 U5 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[14]), .B0(n26), 
        .B1(pipeline_reg_in[30]), .Y(n33) );
  AOI22X1 U6 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[17]), .B0(n26), 
        .B1(pipeline_reg_in[33]), .Y(n30) );
  AOI22X1 U7 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[12]), .B0(n26), 
        .B1(pipeline_reg_in[28]), .Y(n35) );
  AOI22X1 U8 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[8]), .B0(n26), .B1(
        pipeline_reg_in[24]), .Y(n39) );
  AOI22X1 U9 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[18]), .B0(n26), 
        .B1(pipeline_reg_in[34]), .Y(n29) );
  AOI22X1 U10 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[9]), .B0(n26), 
        .B1(pipeline_reg_in[25]), .Y(n38) );
  AOI22X1 U11 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[20]), .B0(n26), 
        .B1(pipeline_reg_in[36]), .Y(n27) );
  AOI22X1 U12 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[15]), .B0(n26), 
        .B1(pipeline_reg_in[31]), .Y(n32) );
  AOI22X1 U13 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[11]), .B0(n26), 
        .B1(pipeline_reg_in[27]), .Y(n36) );
  AOI22X1 U14 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[19]), .B0(n26), 
        .B1(pipeline_reg_in[35]), .Y(n28) );
  AOI22X1 U15 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[13]), .B0(n26), 
        .B1(pipeline_reg_in[29]), .Y(n34) );
  AOI22X1 U16 ( .A0(pipeline_reg_in_0), .A1(pipeline_reg_in[6]), .B0(n26), 
        .B1(pipeline_reg_in[22]), .Y(n41) );
  CLKBUFX2 U17 ( .A(reg_write_dest[2]), .Y(\reg_write_dest[2]_BAR ) );
  INVX12 U18 ( .A(n36), .Y(reg_write_data[6]) );
  INVX12 U19 ( .A(n35), .Y(reg_write_data[7]) );
  INVX12 U20 ( .A(n34), .Y(reg_write_data[8]) );
  INVX12 U21 ( .A(n33), .Y(reg_write_data[9]) );
  INVX12 U22 ( .A(n38), .Y(reg_write_data[4]) );
  INVX12 U23 ( .A(n28), .Y(reg_write_data[14]) );
  INVX12 U24 ( .A(n30), .Y(reg_write_data[12]) );
  INVX12 U25 ( .A(n29), .Y(reg_write_data[13]) );
  INVX12 U26 ( .A(n40), .Y(reg_write_data[2]) );
  INVX12 U27 ( .A(n27), .Y(reg_write_data[15]) );
  INVX12 U28 ( .A(n32), .Y(reg_write_data[10]) );
  INVX12 U29 ( .A(n31), .Y(reg_write_data[11]) );
  INVX12 U30 ( .A(n41), .Y(reg_write_data[1]) );
  INVX12 U31 ( .A(n39), .Y(reg_write_data[3]) );
  INVX12 U32 ( .A(n37), .Y(reg_write_data[5]) );
  INVX12 U33 ( .A(n16), .Y(reg_write_data[0]) );
  NOR2X1 U34 ( .A(pipeline_reg_in[21]), .B(pipeline_reg_in_0), .Y(n17) );
  NOR2X1 U35 ( .A(n17), .B(n18), .Y(n16) );
  INVX3 U36 ( .A(pipeline_reg_in_0), .Y(n26) );
  CLKBUFX3 U37 ( .A(pipeline_reg_in[4]), .Y(reg_write_en_BAR) );
  CLKBUFX3 U38 ( .A(reg_write_dest[0]), .Y(\reg_write_dest[0]_BAR ) );
  CLKBUFX3 U39 ( .A(reg_write_dest[1]), .Y(\reg_write_dest[1]_BAR ) );
  CLKBUFX3 U40 ( .A(reg_write_dest[1]), .Y(\wb_op_dest[1]_BAR ) );
  CLKBUFX3 U41 ( .A(reg_write_dest[0]), .Y(\wb_op_dest[0]_BAR ) );
  CLKBUFX3 U42 ( .A(reg_write_dest[2]), .Y(\wb_op_dest[2]_BAR ) );
endmodule


module hazard_detection_unit ( decoding_op_src2, ex_op_dest, mem_op_dest, 
        pipeline_stall_n, \wb_op_dest[2]_BAR , \wb_op_dest[1]_BAR , 
        \wb_op_dest[0]_BAR , \decoding_op_src1[2]_BAR , 
        \decoding_op_src1[1]_BAR , \decoding_op_src1[0]_BAR  );
  input [2:0] decoding_op_src2;
  input [2:0] ex_op_dest;
  input [2:0] mem_op_dest;
  input \wb_op_dest[2]_BAR , \wb_op_dest[1]_BAR , \wb_op_dest[0]_BAR ,
         \decoding_op_src1[2]_BAR , \decoding_op_src1[1]_BAR ,
         \decoding_op_src1[0]_BAR ;
  output pipeline_stall_n;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;
  wire   [2:0] decoding_op_src1;
  wire   [2:0] wb_op_dest;
  assign decoding_op_src1[2] = \decoding_op_src1[2]_BAR ;
  assign decoding_op_src1[1] = \decoding_op_src1[1]_BAR ;
  assign decoding_op_src1[0] = \decoding_op_src1[0]_BAR ;
  assign wb_op_dest[2] = \wb_op_dest[2]_BAR ;
  assign wb_op_dest[1] = \wb_op_dest[1]_BAR ;
  assign wb_op_dest[0] = \wb_op_dest[0]_BAR ;

  NOR2X6 U2 ( .A(n29), .B(n28), .Y(pipeline_stall_n) );
  CLKINVX1 U3 ( .A(decoding_op_src1[2]), .Y(n9) );
  CLKINVX1 U4 ( .A(decoding_op_src1[0]), .Y(n5) );
  CLKINVX1 U5 ( .A(decoding_op_src1[1]), .Y(n4) );
  AOI33X1 U6 ( .A0(n12), .A1(n11), .A2(n10), .B0(decoding_op_src1[1]), .B1(
        decoding_op_src1[2]), .B2(decoding_op_src1[0]), .Y(n29) );
  CLKINVX1 U7 ( .A(decoding_op_src2[1]), .Y(n24) );
  CLKINVX1 U8 ( .A(decoding_op_src2[0]), .Y(n23) );
  AOI33X1 U9 ( .A0(n27), .A1(n26), .A2(n25), .B0(n24), .B1(n23), .B2(n22), .Y(
        n28) );
  OAI221XL U10 ( .A0(ex_op_dest[2]), .A1(n22), .B0(n18), .B1(
        decoding_op_src2[2]), .C0(n17), .Y(n26) );
  AOI221XL U11 ( .A0(n23), .A1(ex_op_dest[0]), .B0(n24), .B1(ex_op_dest[1]), 
        .C0(n16), .Y(n17) );
  OAI221XL U12 ( .A0(mem_op_dest[2]), .A1(n22), .B0(n15), .B1(
        decoding_op_src2[2]), .C0(n14), .Y(n27) );
  AOI221XL U13 ( .A0(n23), .A1(mem_op_dest[0]), .B0(n24), .B1(mem_op_dest[1]), 
        .C0(n13), .Y(n14) );
  OAI221XL U14 ( .A0(wb_op_dest[2]), .A1(decoding_op_src2[2]), .B0(n21), .B1(
        n22), .C0(n20), .Y(n25) );
  CLKINVX1 U15 ( .A(decoding_op_src2[2]), .Y(n22) );
  AOI221XL U16 ( .A0(wb_op_dest[0]), .A1(decoding_op_src2[0]), .B0(
        decoding_op_src2[1]), .B1(wb_op_dest[1]), .C0(n19), .Y(n20) );
  OAI221XL U17 ( .A0(decoding_op_src1[2]), .A1(ex_op_dest[2]), .B0(n9), .B1(
        n18), .C0(n8), .Y(n10) );
  OAI221XL U18 ( .A0(wb_op_dest[2]), .A1(n9), .B0(n21), .B1(
        decoding_op_src1[2]), .C0(n6), .Y(n11) );
  AOI221XL U19 ( .A0(n5), .A1(wb_op_dest[0]), .B0(n4), .B1(wb_op_dest[1]), 
        .C0(n3), .Y(n6) );
  OAI221XL U20 ( .A0(decoding_op_src1[2]), .A1(mem_op_dest[2]), .B0(n9), .B1(
        n15), .C0(n2), .Y(n12) );
  CLKINVX1 U21 ( .A(ex_op_dest[2]), .Y(n18) );
  CLKINVX1 U22 ( .A(wb_op_dest[2]), .Y(n21) );
  CLKINVX1 U23 ( .A(mem_op_dest[2]), .Y(n15) );
  OAI22XL U24 ( .A0(decoding_op_src1[0]), .A1(mem_op_dest[0]), .B0(
        decoding_op_src1[1]), .B1(mem_op_dest[1]), .Y(n1) );
  AOI221XL U25 ( .A0(decoding_op_src1[0]), .A1(mem_op_dest[0]), .B0(
        mem_op_dest[1]), .B1(decoding_op_src1[1]), .C0(n1), .Y(n2) );
  OAI22XL U26 ( .A0(wb_op_dest[1]), .A1(n4), .B0(wb_op_dest[0]), .B1(n5), .Y(
        n3) );
  OAI22XL U27 ( .A0(decoding_op_src1[0]), .A1(ex_op_dest[0]), .B0(
        decoding_op_src1[1]), .B1(ex_op_dest[1]), .Y(n7) );
  AOI221XL U28 ( .A0(decoding_op_src1[0]), .A1(ex_op_dest[0]), .B0(
        ex_op_dest[1]), .B1(decoding_op_src1[1]), .C0(n7), .Y(n8) );
  OAI22XL U29 ( .A0(mem_op_dest[1]), .A1(n24), .B0(mem_op_dest[0]), .B1(n23), 
        .Y(n13) );
  OAI22XL U30 ( .A0(ex_op_dest[1]), .A1(n24), .B0(ex_op_dest[0]), .B1(n23), 
        .Y(n16) );
  OAI22XL U31 ( .A0(wb_op_dest[0]), .A1(decoding_op_src2[0]), .B0(
        wb_op_dest[1]), .B1(decoding_op_src2[1]), .Y(n19) );
endmodule


module mips_16_core_top ( clk, rst, irst_reg_data, irst_done, instruction, pc, 
        inst_write_en, inst_write_data, reg_read_data_1, reg_read_data_2, 
        reg_write_en, reg_write_dest, reg_write_data, reg_read_addr_1, 
        reg_read_addr_2, mem_read_data, mem_access_addr, mem_write_data, 
        mem_write_en );
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
  input clk, rst;
  output irst_done, inst_write_en, reg_write_en, mem_write_en;
  wire   n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         pipeline_stall_n, branch_taken;
  wire   [5:0] branch_offset_imm;
  wire   [15:0] rand_data;
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
        .pc(pc), .write_en_BAR(n76) );
  randomizer rand ( .inst({instruction[15:9], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, instruction[2:0]}), .\rand_data[15] (1'b0), .\rand_data[14] (
        1'b0), .\rand_data[13] (1'b0), .\rand_data[12] (1'b0), 
        .\rand_data[11] (rand_data[11]), .\rand_data[10] (rand_data[10]), 
        .\rand_data[9] (rand_data[9]), .\rand_data[8]_BAR (rand_data[8]), 
        .\rand_data[2] (rand_data[2]), .\rand_data[1] (rand_data[1]), 
        .\rand_data[0] (rand_data[0]), .\rand_inst[15] (inst_write_data[15]), 
        .\rand_inst[14] (inst_write_data[14]), .\rand_inst[13] (
        inst_write_data[13]), .\rand_inst[12] (inst_write_data[12]), 
        .\rand_inst[11] (inst_write_data[11]), .\rand_inst[10] (
        inst_write_data[10]), .\rand_inst[9] (n77), .\rand_inst[8]_BAR (n78), 
        .\rand_inst[2] (inst_write_data[2]), .\rand_inst[1] (
        inst_write_data[1]), .\rand_inst[0] (inst_write_data[0]), 
        .\rand_data[7]_BAR (rand_data[7]), .\rand_inst[7]_BAR (n79), 
        .\rand_data[6]_BAR (rand_data[6]), .\rand_inst[6]_BAR (n80), 
        .\rand_data[5]_BAR (rand_data[5]), .\rand_inst[5]_BAR (n81), 
        .\rand_data[4]_BAR (rand_data[4]), .\rand_inst[4]_BAR (n82), 
        .\rand_data[3]_BAR (rand_data[3]), .\rand_inst[3]_BAR (n83) );
  ID_stage ID_stage_inst ( .clk(clk), .rst(rst), .instruction_decode_en(
        pipeline_stall_n), .pipeline_reg_out(ID_pipeline_reg_out), 
        .instruction(instruction), .branch_offset_imm(branch_offset_imm), 
        .branch_taken(branch_taken), .reg_read_addr_2(reg_read_addr_2), 
        .reg_read_data_1(reg_read_data_1), .reg_read_data_2(reg_read_data_2), 
        .decoding_op_src2(decoding_op_src2), .\reg_read_addr_1[2]_BAR (n88), 
        .\decoding_op_src1[2]_BAR (decoding_op_src1[2]), 
        .\reg_read_addr_1[1]_BAR (n89), .\decoding_op_src1[1]_BAR (
        decoding_op_src1[1]), .\reg_read_addr_1[0]_BAR (n90), 
        .\decoding_op_src1[0]_BAR (decoding_op_src1[0]) );
  EX_stage EX_stage_inst ( .clk(clk), .rst(rst), .pipeline_reg_in(
        ID_pipeline_reg_out), .ex_op_dest(ex_op_dest), 
        .\pipeline_reg_out[37]_BAR (EX_pipeline_reg_out[37]), 
        .\pipeline_reg_out[4] (EX_pipeline_reg_out[4]), 
        .\pipeline_reg_out[3] (EX_pipeline_reg_out[3]), 
        .\pipeline_reg_out[2] (EX_pipeline_reg_out[2]), 
        .\pipeline_reg_out[1] (EX_pipeline_reg_out[1]), 
        .\pipeline_reg_out[0] (EX_pipeline_reg_out[0]), 
        .\pipeline_reg_out[36]_BAR (EX_pipeline_reg_out[36]), 
        .\pipeline_reg_out[35]_BAR (EX_pipeline_reg_out[35]), 
        .\pipeline_reg_out[34]_BAR (EX_pipeline_reg_out[34]), 
        .\pipeline_reg_out[33]_BAR (EX_pipeline_reg_out[33]), 
        .\pipeline_reg_out[32]_BAR (EX_pipeline_reg_out[32]), 
        .\pipeline_reg_out[31]_BAR (EX_pipeline_reg_out[31]), 
        .\pipeline_reg_out[30]_BAR (EX_pipeline_reg_out[30]), 
        .\pipeline_reg_out[29]_BAR (EX_pipeline_reg_out[29]), 
        .\pipeline_reg_out[28]_BAR (EX_pipeline_reg_out[28]), 
        .\pipeline_reg_out[27]_BAR (EX_pipeline_reg_out[27]), 
        .\pipeline_reg_out[26]_BAR (EX_pipeline_reg_out[26]), 
        .\pipeline_reg_out[25]_BAR (EX_pipeline_reg_out[25]), 
        .\pipeline_reg_out[24]_BAR (EX_pipeline_reg_out[24]), 
        .\pipeline_reg_out[23]_BAR (EX_pipeline_reg_out[23]), 
        .\pipeline_reg_out[22]_BAR (EX_pipeline_reg_out[22]), 
        .\pipeline_reg_out[20]_BAR (EX_pipeline_reg_out[20]), 
        .\pipeline_reg_out[19]_BAR (EX_pipeline_reg_out[19]), 
        .\pipeline_reg_out[18]_BAR (EX_pipeline_reg_out[18]), 
        .\pipeline_reg_out[17]_BAR (EX_pipeline_reg_out[17]), 
        .\pipeline_reg_out[16]_BAR (EX_pipeline_reg_out[16]), 
        .\pipeline_reg_out[15]_BAR (EX_pipeline_reg_out[15]), 
        .\pipeline_reg_out[14]_BAR (EX_pipeline_reg_out[14]), 
        .\pipeline_reg_out[13]_BAR (EX_pipeline_reg_out[13]), 
        .\pipeline_reg_out[12]_BAR (EX_pipeline_reg_out[12]), 
        .\pipeline_reg_out[11]_BAR (EX_pipeline_reg_out[11]), 
        .\pipeline_reg_out[10]_BAR (EX_pipeline_reg_out[10]), 
        .\pipeline_reg_out[9]_BAR (EX_pipeline_reg_out[9]), 
        .\pipeline_reg_out[8]_BAR (EX_pipeline_reg_out[8]), 
        .\pipeline_reg_out[7]_BAR (EX_pipeline_reg_out[7]), 
        .\pipeline_reg_out[6]_BAR (EX_pipeline_reg_out[6]), 
        .\pipeline_reg_out[5]_BAR (EX_pipeline_reg_out[5]), 
        .\pipeline_reg_out[21]_BAR (EX_pipeline_reg_out[21]) );
  MEM_stage MEM_stage_inst ( .clk(clk), .rst(rst), .irst_reg_data({
        irst_reg_data[15], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .mem_op_dest(mem_op_dest), 
        .mem_read_data(mem_read_data), .\rand_data[11] (rand_data[11]), 
        .\rand_data[10] (rand_data[10]), .\rand_data[9] (rand_data[9]), 
        .\rand_data[8]_BAR (rand_data[8]), .\rand_data[2] (rand_data[2]), 
        .\rand_data[1] (rand_data[1]), .\rand_data[0] (rand_data[0]), 
        .\rand_data[7]_BAR (rand_data[7]), .\rand_data[6]_BAR (rand_data[6]), 
        .\rand_data[5]_BAR (rand_data[5]), .\rand_data[4]_BAR (rand_data[4]), 
        .\rand_data[3]_BAR (rand_data[3]), .\pipeline_reg_out[36] (
        MEM_pipeline_reg_out[36]), .\pipeline_reg_out[35] (
        MEM_pipeline_reg_out[35]), .\pipeline_reg_out[34] (
        MEM_pipeline_reg_out[34]), .\pipeline_reg_out[33] (
        MEM_pipeline_reg_out[33]), .\pipeline_reg_out[32] (
        MEM_pipeline_reg_out[32]), .\pipeline_reg_out[31] (
        MEM_pipeline_reg_out[31]), .\pipeline_reg_out[30] (
        MEM_pipeline_reg_out[30]), .\pipeline_reg_out[29] (
        MEM_pipeline_reg_out[29]), .\pipeline_reg_out[28] (
        MEM_pipeline_reg_out[28]), .\pipeline_reg_out[27] (
        MEM_pipeline_reg_out[27]), .\pipeline_reg_out[26] (
        MEM_pipeline_reg_out[26]), .\pipeline_reg_out[25] (
        MEM_pipeline_reg_out[25]), .\pipeline_reg_out[24] (
        MEM_pipeline_reg_out[24]), .\pipeline_reg_out[23] (
        MEM_pipeline_reg_out[23]), .\pipeline_reg_out[22] (
        MEM_pipeline_reg_out[22]), .\pipeline_reg_out[20] (
        MEM_pipeline_reg_out[20]), .\pipeline_reg_out[19] (
        MEM_pipeline_reg_out[19]), .\pipeline_reg_out[18] (
        MEM_pipeline_reg_out[18]), .\pipeline_reg_out[17] (
        MEM_pipeline_reg_out[17]), .\pipeline_reg_out[16] (
        MEM_pipeline_reg_out[16]), .\pipeline_reg_out[15] (
        MEM_pipeline_reg_out[15]), .\pipeline_reg_out[14] (
        MEM_pipeline_reg_out[14]), .\pipeline_reg_out[13] (
        MEM_pipeline_reg_out[13]), .\pipeline_reg_out[12] (
        MEM_pipeline_reg_out[12]), .\pipeline_reg_out[11] (
        MEM_pipeline_reg_out[11]), .\pipeline_reg_out[10] (
        MEM_pipeline_reg_out[10]), .\pipeline_reg_out[9] (
        MEM_pipeline_reg_out[9]), .\pipeline_reg_out[8] (
        MEM_pipeline_reg_out[8]), .\pipeline_reg_out[7] (
        MEM_pipeline_reg_out[7]), .\pipeline_reg_out[6] (
        MEM_pipeline_reg_out[6]), .\pipeline_reg_out[5] (
        MEM_pipeline_reg_out[5]), .\pipeline_reg_out[4]_BAR (
        MEM_pipeline_reg_out[4]), .\pipeline_reg_out[0] (
        MEM_pipeline_reg_out[0]), .\pipeline_reg_out[3]_BAR (
        MEM_pipeline_reg_out[3]), .\pipeline_reg_out[2]_BAR (
        MEM_pipeline_reg_out[2]), .\pipeline_reg_out[1]_BAR (
        MEM_pipeline_reg_out[1]), .\ex_alu_result[15]_BAR (n91), 
        .\pipeline_reg_in[37]_BAR (EX_pipeline_reg_out[37]), 
        .\pipeline_reg_in[4] (EX_pipeline_reg_out[4]), .\pipeline_reg_in[3] (
        EX_pipeline_reg_out[3]), .\pipeline_reg_in[2] (EX_pipeline_reg_out[2]), 
        .\pipeline_reg_in[1] (EX_pipeline_reg_out[1]), .\pipeline_reg_in[0] (
        EX_pipeline_reg_out[0]), .\ex_alu_result[14]_BAR (n92), 
        .\pipeline_reg_in[36]_BAR (EX_pipeline_reg_out[36]), 
        .\ex_alu_result[13]_BAR (n93), .\pipeline_reg_in[35]_BAR (
        EX_pipeline_reg_out[35]), .\ex_alu_result[12]_BAR (n94), 
        .\pipeline_reg_in[34]_BAR (EX_pipeline_reg_out[34]), 
        .\ex_alu_result[11]_BAR (n95), .\pipeline_reg_in[33]_BAR (
        EX_pipeline_reg_out[33]), .\ex_alu_result[10]_BAR (n96), 
        .\pipeline_reg_in[32]_BAR (EX_pipeline_reg_out[32]), 
        .\ex_alu_result[9]_BAR (n97), .\pipeline_reg_in[31]_BAR (
        EX_pipeline_reg_out[31]), .\ex_alu_result[8]_BAR (n98), 
        .\pipeline_reg_in[30]_BAR (EX_pipeline_reg_out[30]), 
        .\ex_alu_result[7]_BAR (n99), .\pipeline_reg_in[29]_BAR (
        EX_pipeline_reg_out[29]), .\ex_alu_result[6]_BAR (n100), 
        .\pipeline_reg_in[28]_BAR (EX_pipeline_reg_out[28]), 
        .\ex_alu_result[5]_BAR (n101), .\pipeline_reg_in[27]_BAR (
        EX_pipeline_reg_out[27]), .\ex_alu_result[4]_BAR (n102), 
        .\pipeline_reg_in[26]_BAR (EX_pipeline_reg_out[26]), 
        .\ex_alu_result[3]_BAR (n103), .\pipeline_reg_in[25]_BAR (
        EX_pipeline_reg_out[25]), .\ex_alu_result[2]_BAR (n104), 
        .\pipeline_reg_in[24]_BAR (EX_pipeline_reg_out[24]), 
        .\ex_alu_result[1]_BAR (n105), .\pipeline_reg_in[23]_BAR (
        EX_pipeline_reg_out[23]), .\ex_alu_result[0]_BAR (n106), 
        .\pipeline_reg_in[22]_BAR (EX_pipeline_reg_out[22]), 
        .\mem_write_data[15]_BAR (n107), .\pipeline_reg_in[20]_BAR (
        EX_pipeline_reg_out[20]), .\mem_write_data[14]_BAR (n108), 
        .\pipeline_reg_in[19]_BAR (EX_pipeline_reg_out[19]), 
        .\mem_write_data[13]_BAR (n109), .\pipeline_reg_in[18]_BAR (
        EX_pipeline_reg_out[18]), .\mem_write_data[12]_BAR (n110), 
        .\pipeline_reg_in[17]_BAR (EX_pipeline_reg_out[17]), 
        .\mem_write_data[11]_BAR (n111), .\pipeline_reg_in[16]_BAR (
        EX_pipeline_reg_out[16]), .\mem_write_data[10]_BAR (n112), 
        .\pipeline_reg_in[15]_BAR (EX_pipeline_reg_out[15]), 
        .\mem_write_data[9]_BAR (n113), .\pipeline_reg_in[14]_BAR (
        EX_pipeline_reg_out[14]), .\mem_write_data[8]_BAR (n114), 
        .\pipeline_reg_in[13]_BAR (EX_pipeline_reg_out[13]), 
        .\mem_write_data[7]_BAR (n115), .\pipeline_reg_in[12]_BAR (
        EX_pipeline_reg_out[12]), .\mem_write_data[6]_BAR (n116), 
        .\pipeline_reg_in[11]_BAR (EX_pipeline_reg_out[11]), 
        .\mem_write_data[5]_BAR (n117), .\pipeline_reg_in[10]_BAR (
        EX_pipeline_reg_out[10]), .\mem_write_data[4]_BAR (n118), 
        .\pipeline_reg_in[9]_BAR (EX_pipeline_reg_out[9]), 
        .\mem_write_data[3]_BAR (n119), .\pipeline_reg_in[8]_BAR (
        EX_pipeline_reg_out[8]), .\mem_write_data[2]_BAR (n120), 
        .\pipeline_reg_in[7]_BAR (EX_pipeline_reg_out[7]), 
        .\mem_write_data[1]_BAR (n121), .\pipeline_reg_in[6]_BAR (
        EX_pipeline_reg_out[6]), .\mem_write_data[0]_BAR (n122), 
        .\pipeline_reg_in[5]_BAR (EX_pipeline_reg_out[5]), .mem_write_en_BAR(
        n123), .\pipeline_reg_in[21]_BAR (EX_pipeline_reg_out[21]), 
        .\pipeline_reg_out[21]_BAR (MEM_pipeline_reg_out[21]) );
  WB_stage WB_stage_inst ( .reg_write_data(reg_write_data), .reg_write_en_BAR(
        n84), .\pipeline_reg_in[36] (MEM_pipeline_reg_out[36]), 
        .\pipeline_reg_in[35] (MEM_pipeline_reg_out[35]), 
        .\pipeline_reg_in[34] (MEM_pipeline_reg_out[34]), 
        .\pipeline_reg_in[33] (MEM_pipeline_reg_out[33]), 
        .\pipeline_reg_in[32] (MEM_pipeline_reg_out[32]), 
        .\pipeline_reg_in[31] (MEM_pipeline_reg_out[31]), 
        .\pipeline_reg_in[30] (MEM_pipeline_reg_out[30]), 
        .\pipeline_reg_in[29] (MEM_pipeline_reg_out[29]), 
        .\pipeline_reg_in[28] (MEM_pipeline_reg_out[28]), 
        .\pipeline_reg_in[27] (MEM_pipeline_reg_out[27]), 
        .\pipeline_reg_in[26] (MEM_pipeline_reg_out[26]), 
        .\pipeline_reg_in[25] (MEM_pipeline_reg_out[25]), 
        .\pipeline_reg_in[24] (MEM_pipeline_reg_out[24]), 
        .\pipeline_reg_in[23] (MEM_pipeline_reg_out[23]), 
        .\pipeline_reg_in[22] (MEM_pipeline_reg_out[22]), 
        .\pipeline_reg_in[20] (MEM_pipeline_reg_out[20]), 
        .\pipeline_reg_in[19] (MEM_pipeline_reg_out[19]), 
        .\pipeline_reg_in[18] (MEM_pipeline_reg_out[18]), 
        .\pipeline_reg_in[17] (MEM_pipeline_reg_out[17]), 
        .\pipeline_reg_in[16] (MEM_pipeline_reg_out[16]), 
        .\pipeline_reg_in[15] (MEM_pipeline_reg_out[15]), 
        .\pipeline_reg_in[14] (MEM_pipeline_reg_out[14]), 
        .\pipeline_reg_in[13] (MEM_pipeline_reg_out[13]), 
        .\pipeline_reg_in[12] (MEM_pipeline_reg_out[12]), 
        .\pipeline_reg_in[11] (MEM_pipeline_reg_out[11]), 
        .\pipeline_reg_in[10] (MEM_pipeline_reg_out[10]), 
        .\pipeline_reg_in[9] (MEM_pipeline_reg_out[9]), .\pipeline_reg_in[8] (
        MEM_pipeline_reg_out[8]), .\pipeline_reg_in[7] (
        MEM_pipeline_reg_out[7]), .\pipeline_reg_in[6] (
        MEM_pipeline_reg_out[6]), .\pipeline_reg_in[5] (
        MEM_pipeline_reg_out[5]), .\pipeline_reg_in[4]_BAR (
        MEM_pipeline_reg_out[4]), .\pipeline_reg_in[0] (
        MEM_pipeline_reg_out[0]), .\reg_write_dest[2]_BAR (n85), 
        .\wb_op_dest[2]_BAR (wb_op_dest[2]), .\pipeline_reg_in[3]_BAR (
        MEM_pipeline_reg_out[3]), .\reg_write_dest[1]_BAR (n86), 
        .\wb_op_dest[1]_BAR (wb_op_dest[1]), .\pipeline_reg_in[2]_BAR (
        MEM_pipeline_reg_out[2]), .\reg_write_dest[0]_BAR (n87), 
        .\wb_op_dest[0]_BAR (wb_op_dest[0]), .\pipeline_reg_in[1]_BAR (
        MEM_pipeline_reg_out[1]), .\pipeline_reg_in[21]_BAR (
        MEM_pipeline_reg_out[21]) );
  hazard_detection_unit hazard_detection_unit_inst ( .decoding_op_src2(
        decoding_op_src2), .ex_op_dest(ex_op_dest), .mem_op_dest(mem_op_dest), 
        .pipeline_stall_n(pipeline_stall_n), .\wb_op_dest[2]_BAR (
        wb_op_dest[2]), .\wb_op_dest[1]_BAR (wb_op_dest[1]), 
        .\wb_op_dest[0]_BAR (wb_op_dest[0]), .\decoding_op_src1[2]_BAR (
        decoding_op_src1[2]), .\decoding_op_src1[1]_BAR (decoding_op_src1[1]), 
        .\decoding_op_src1[0]_BAR (decoding_op_src1[0]) );
  INVX12 U1 ( .A(n123), .Y(mem_write_en) );
  INVX12 U2 ( .A(n84), .Y(reg_write_en) );
  INVX12 U3 ( .A(n81), .Y(inst_write_data[5]) );
  INVX12 U4 ( .A(n82), .Y(inst_write_data[4]) );
  INVX12 U5 ( .A(n80), .Y(inst_write_data[6]) );
  INVX12 U6 ( .A(n79), .Y(inst_write_data[7]) );
  INVX12 U7 ( .A(n83), .Y(inst_write_data[3]) );
  INVX12 U8 ( .A(n78), .Y(inst_write_data[8]) );
  INVX12 U9 ( .A(n87), .Y(reg_write_dest[0]) );
  INVX12 U10 ( .A(n85), .Y(reg_write_dest[2]) );
  INVX12 U11 ( .A(n86), .Y(reg_write_dest[1]) );
  INVX12 U12 ( .A(n122), .Y(mem_write_data[0]) );
  INVX12 U13 ( .A(n92), .Y(mem_access_addr[14]) );
  INVX12 U14 ( .A(n91), .Y(mem_access_addr[15]) );
  INVX12 U15 ( .A(n93), .Y(mem_access_addr[13]) );
  INVX12 U16 ( .A(n94), .Y(mem_access_addr[12]) );
  INVX12 U17 ( .A(n116), .Y(mem_write_data[6]) );
  INVX12 U18 ( .A(n117), .Y(mem_write_data[5]) );
  INVX12 U19 ( .A(n118), .Y(mem_write_data[4]) );
  INVX12 U20 ( .A(n119), .Y(mem_write_data[3]) );
  INVX12 U21 ( .A(n107), .Y(mem_write_data[15]) );
  INVX12 U22 ( .A(n108), .Y(mem_write_data[14]) );
  INVX12 U23 ( .A(n109), .Y(mem_write_data[13]) );
  INVX12 U24 ( .A(n110), .Y(mem_write_data[12]) );
  INVX12 U25 ( .A(n111), .Y(mem_write_data[11]) );
  INVX12 U26 ( .A(n112), .Y(mem_write_data[10]) );
  INVX12 U27 ( .A(n113), .Y(mem_write_data[9]) );
  INVX12 U28 ( .A(n114), .Y(mem_write_data[8]) );
  INVX12 U29 ( .A(n115), .Y(mem_write_data[7]) );
  INVX12 U30 ( .A(n120), .Y(mem_write_data[2]) );
  INVX12 U31 ( .A(n121), .Y(mem_write_data[1]) );
  INVX12 U32 ( .A(n106), .Y(mem_access_addr[0]) );
  INVX12 U33 ( .A(n101), .Y(mem_access_addr[5]) );
  INVX12 U34 ( .A(n95), .Y(mem_access_addr[11]) );
  INVX12 U35 ( .A(n97), .Y(mem_access_addr[9]) );
  INVX12 U36 ( .A(n98), .Y(mem_access_addr[8]) );
  INVX12 U37 ( .A(n99), .Y(mem_access_addr[7]) );
  INVX12 U38 ( .A(n96), .Y(mem_access_addr[10]) );
  INVX12 U39 ( .A(n103), .Y(mem_access_addr[3]) );
  INVX12 U40 ( .A(n104), .Y(mem_access_addr[2]) );
  INVX12 U41 ( .A(n105), .Y(mem_access_addr[1]) );
  INVX12 U42 ( .A(n102), .Y(mem_access_addr[4]) );
  INVX12 U43 ( .A(n100), .Y(mem_access_addr[6]) );
  INVX12 U44 ( .A(n88), .Y(reg_read_addr_1[2]) );
  INVX12 U45 ( .A(n89), .Y(reg_read_addr_1[1]) );
  INVX12 U46 ( .A(n90), .Y(reg_read_addr_1[0]) );
  INVX12 U47 ( .A(n76), .Y(inst_write_en) );
  BUFX12 U48 ( .A(n77), .Y(inst_write_data[9]) );
endmodule

