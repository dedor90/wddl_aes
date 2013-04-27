//TODO needs work

module  wddl_xor6

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
,d5_p_in
,d5_n_in

,d_p_out
,d_n_out
);

parameter WIDTH      = 1;

input   [WIDTH-1 : 0]   d0_p_in, d0_n_in;
input   [WIDTH-1 : 0]   d1_p_in, d1_n_in;
input   [WIDTH-1 : 0]   d2_p_in, d2_n_in;
input   [WIDTH-1 : 0]   d3_p_in, d3_n_in;
output  [WIDTH-1 : 0]   d_p_out, d_n_out;

wire    [WIDTH-1 : 0]   da_p_w, da_n_w,


wddl_xor5 #(WIDTH)  5_XOR
(
 .d0_p_in   ( d0_p_in   )
,.d0_n_in   ( d0_n_in   )
,.d1_p_in   ( d1_p_in   )
,.d1_n_in   ( d1_n_in   )
,.d2_p_in   ( d2_p_in   )
,.d2_n_in   ( d2_n_in   )
,.d3_p_in   ( d3_p_in   )
,.d3_n_in   ( d3_n_in   )
,.d4_p_in   ( d4_p_in   )
,.d4_n_in   ( d4_n_in   )

,.d_p_out   ( da_p_w    )
,.d_n_out   ( da_n_w    )

);

wddl_xor2 #(WIDTH)    U_XOR_B
(
 .d0_p_in   ( da_p_in   )
,.d0_n_in   ( da_n_in   )
,.d1_p_in   ( d5_p_in   )
,.d1_n_in   ( d5_n_in   )
,.d_p_out   ( d_p_out    )
,.d_n_out   ( d_n_out    )
);



endmodule
