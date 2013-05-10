module  wddl_xor5_32
(
 d0_p_in
,d0_n_in
,d1_p_in
,d1_n_in
,d2_p_in
,d2_n_in
,d3_p_in
,d3_n_in
,d4_p_in
,d4_n_in
,d_p_out
,d_n_out
);


input   [31 : 0]   d0_p_in, d0_n_in;
input   [31 : 0]   d1_p_in, d1_n_in;
input   [31 : 0]   d2_p_in, d2_n_in;
input   [31 : 0]   d3_p_in, d3_n_in;
input   [31 : 0]   d4_p_in, d4_n_in;
output  [31 : 0]   d_p_out, d_n_out;

wire    [31 : 0]   da_p_w, da_n_w;



wddl_xor4_32  U_XOR_A_32
(
 .d0_p_in   ( d0_p_in   )
,.d0_n_in   ( d0_n_in   )
,.d1_p_in   ( d1_p_in   )
,.d1_n_in   ( d1_n_in   )
,.d2_p_in   ( d2_p_in   )
,.d2_n_in   ( d2_n_in   )
,.d3_p_in   ( d3_p_in   )
,.d3_n_in   ( d3_n_in   )

,.d_p_out   ( da_p_w    )
,.d_n_out   ( da_n_w    )

);


wddl_xor2_32   U_XOR_B_32
(
 .d0_p_in   ( da_p_w   )
,.d0_n_in   ( da_n_w   )
,.d1_p_in   ( d4_p_in   )
,.d1_n_in   ( d4_n_in   )
,.d_p_out   ( d_p_out    )
,.d_n_out   ( d_n_out    )
);


endmodule
