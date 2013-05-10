module  wddl_xor3_32
(
 d0_p_in
,d0_n_in
,d1_p_in
,d1_n_in
,d2_p_in
,d2_n_in
,d_p_out
,d_n_out
);

input   [31 : 0]   d0_p_in, d0_n_in;
input   [31 : 0]   d1_p_in, d1_n_in;
input   [31 : 0]   d2_p_in, d2_n_in;
output  [31 : 0]   d_p_out, d_n_out;

wire    [31 : 0]   dt_p_w, dt_n_w;


wddl_xor2_32    U_XOR_T_32
(
 .d0_p_in   ( d0_p_in   )
,.d0_n_in   ( d0_n_in   )
,.d1_p_in   ( d1_p_in   )
,.d1_n_in   ( d1_n_in   )
,.d_p_out   ( dt_p_w    )
,.d_n_out   ( dt_n_w    )
);

wddl_xor2_32  U_XOR_32
(
 .d0_p_in   ( dt_p_w    )
,.d0_n_in   ( dt_n_w    )
,.d1_p_in   ( d2_p_in   )
,.d1_n_in   ( d2_n_in   )
,.d_p_out   ( d_p_out   )
,.d_n_out   ( d_n_out   )
);


endmodule

