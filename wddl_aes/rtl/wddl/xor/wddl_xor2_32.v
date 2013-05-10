module  wddl_xor2_32
(
 d0_p_in
,d0_n_in
,d1_p_in
,d1_n_in
,d_p_out
,d_n_out
);

input[31:0]   d0_p_in, d0_n_in;
input[31:0]   d1_p_in, d1_n_in;
output[31:0]   d_p_out, d_n_out;


assign  d_p_out = (d0_n_in & d1_p_in) | (d0_p_in & d1_n_in);
assign  d_n_out = (d0_p_in | d1_n_in) & (d0_n_in | d1_p_in);

endmodule

