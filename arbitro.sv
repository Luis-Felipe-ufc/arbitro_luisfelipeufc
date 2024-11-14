`timescale 1ns/10ps
module conta_votos (V, R);
  input logic [2:0] V;
  output logic [3:0] R;
  
  wire xor_out_V1_V0, and_out_V2_xor, inv_out_V2, and_out_inv_V2_V1_V0;
  wire and_out_inv_V2_xor, inv_out_V1, inv_out_V0, and_out_V2_inv_V1_inv_V0;

//Bit R[3] - Todos os bits em nível alto (V[2] & V[1] & V[0])
AND3X1HVT TT_R3 ( .A(V[2]), .B(V[1]), .C(V[0]), .Y(R[3]));

//Bit R[2] - Exatamente dois bits em nível alto
XOR2X1HVT XOR_V1_V0 ( .A(V[1]), .B(V[0]), .Y(xor_out_V1_V0));
AND2X1HVT AND_V2_XOR ( .A(V[2]), .B(xor_out_V1_V0), .Y(and_out_V2_xor));
INVX1HVT INV_V2 ( .A(V[2]), .Y(inv_out_V2));
AND3X1HVT AND_INV_V2_V1_V0 ( .A(inv_out_V2), .B(V[1]), .C(V[0]), .Y(and_out_inv_V2_V1_V0));
OR2X1HVT OR_R2 ( .A(and_out_inv_V2_V1_V0), .B(and_out_V2_xor), .Y(R[2]));

//Bit R[1] - Exatamente um bit em nível alto
AND2X1HVT AND_INV_V2_XOR ( .A(inv_out_V2), .B(xor_out_V1_V0), .Y(and_out_inv_V2_xor));
INVX1HVT INV_V1 ( .A(V[1]), .Y(inv_out_V1));
INVX1HVT INV_V0 ( .A(V[0]), .Y(inv_out_V0));
AND3X1HVT AND_V2_INV_V1_INV_V0 ( .A(V[2]), .B(inv_out_V1), .C(inv_out_V0), .Y(and_out_V2_inv_V1_inv_V0));
OR2X1HVT OR_R1 ( .A(and_out_inv_V2_xor), .B(and_out_V2_inv_V1_inv_V0), .Y(R[1]));

//Bit R[0] - Nenhum bit em nível alto (NOR de todos os bits)
NOR3X1HVT NOR_R0( .A(V[2]), .B(V[1]), .C(V[0]), .Y(R[0]));

endmodule
