/**
 * @filename		aes_addroundkey.sv 
 *
 * @brief     	        xor for addroundkey operation  	
 *
 * @author		Adil Sadik <sadik.adil@gmail.com> 
 *
 * @dependencies	aes_xor.sv	
 */

module aes_addroundkey_wddl (clk, ld_r, 
        text_in_r,
        text_in,r_n,
        w0, w1, w2, w3,
        w0_n, w1_n, w2_n, w3_n,

		sa00, sa01, sa02, sa03,	sa10, sa11, sa12, sa13,
		sa20, sa21, sa22, sa23, sa30, sa31, sa32, sa33,       
		sa00_next, sa01_next, sa02_next, sa03_next,
		sa10_next, sa11_next, sa12_next, sa13_next,
		sa20_next, sa21_next, sa22_next, sa23_next,
		sa30_next, sa31_next, sa32_next, sa33_next,

        sa00_n, sa01_n, sa02_n, sa03_n,	sa10_n, sa11_n, sa12_n, sa13_n,
		sa20_n, sa21_n, sa22_n, sa23_n, sa30_n, sa31_n, sa32_n, sa33_n,       
		sa00_next_n, sa01_next_n, sa02_next_n, sa03_next_n,
		sa10_next_n, sa11_next_n, sa12_next_n, sa13_next_n,
		sa20_next_n, sa21_next_n, sa22_next_n, sa23_next_n,
		sa30_next_n, sa31_next_n, sa32_next_n, sa33_next_n);



input		clk;
input		ld_r;

input[127:0]	text_in_r;
input[127:0]    text_in_r_n;

input[31:0]	w0, w1, w2, w3;
input[31:0] w0_n, w1_n, w2_n, w3_n;

output	[7:0]	sa00, sa01, sa02, sa03;
output	[7:0]	sa10, sa11, sa12, sa13;
output	[7:0]	sa20, sa21, sa22, sa23;
output	[7:0]	sa30, sa31, sa32, sa33;

output	[7:0]	sa00_n, sa01_n, sa02_n, sa03_n;
output	[7:0]	sa10_n, sa11_n, sa12_n, sa13_n;
output	[7:0]	sa20_n, sa21_n, sa22_n, sa23_n;
output	[7:0]	sa30_n, sa31_n, sa32_n, sa33_n;

input	[7:0]	sa00_next, sa01_next, sa02_next, sa03_next;
input	[7:0]	sa10_next, sa11_next, sa12_next, sa13_next;
input	[7:0]	sa20_next, sa21_next, sa22_next, sa23_next;
input	[7:0]	sa30_next, sa31_next, sa32_next, sa33_next;

input	[7:0]	sa00_next_n, sa01_next_n, sa02_next_n, sa03_next_n;
input	[7:0]	sa10_next_n, sa11_next_n, sa12_next_n, sa13_next_n;
input	[7:0]	sa20_next_n, sa21_next_n, sa22_next_n, sa23_next_n;
input	[7:0]	sa30_next_n, sa31_next_n, sa32_next_n, sa33_next_n;


aes_xor_wddl ux33(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[007:000]), .text_in_n(text_in_r_n[007:000]), .w_i (w3[07:00]), .w_i_n (w3_n[07:00]), .sa_i(sa33_next), .sa_o(sa33), .sa_i_n(sa33_next_n), .sa_o_n(sa33_n) );
aes_xor_wddl ux23(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[015:008]), .text_in_n(text_in_r_n[015:008]), .w_i (w3[15:08]), .w_i_n (w3_n[15:08]), .sa_i(sa23_next), .sa_o(sa23), .sa_i_n(sa23_next_n), .sa_o_n(sa23_n) );
aes_xor_wddl ux13(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[023:016]), .text_in_n(text_in_r_n[023:016]), .w_i (w3[23:16]), .w_i_n (w3_n[23:16]), .sa_i(sa13_next), .sa_o(sa13), .sa_i_n(sa13_next_n), .sa_o_n(sa13_n) );
aes_xor_wddl ux03(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[031:024]), .text_in_n(text_in_r_n[031:024]), .w_i (w3[31:24]), .w_i_n (w3_n[31:24]), .sa_i(sa03_next), .sa_o(sa03), .sa_i_n(sa03_next_n), .sa_o_n(sa03_n) );
aes_xor_wddl ux32(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[039:032]), .text_in_n(text_in_r_n[039:032]), .w_i (w2[07:00]), .w_i_n (w2_n[07:00]), .sa_i(sa32_next), .sa_o(sa32), .sa_i_n(sa32_next_n), .sa_o_n(sa32_n) );
aes_xor_wddl ux22(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[047:040]), .text_in_n(text_in_r_n[047:040]), .w_i (w2[15:08]), .w_i_n (w2_n[15:08]), .sa_i(sa22_next), .sa_o(sa22), .sa_i_n(sa22_next_n), .sa_o_n(sa22_n) );
aes_xor_wddl ux12(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[055:048]), .text_in_n(text_in_r_n[055:048]), .w_i (w2[23:16]), .w_i_n (w2_n[23:16]), .sa_i(sa12_next), .sa_o(sa12), .sa_i_n(sa12_next_n), .sa_o_n(sa12_n) );
aes_xor_wddl ux02(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[063:056]), .text_in_n(text_in_r_n[063:056]), .w_i (w2[31:24]), .w_i_n (w2_n[31:24]), .sa_i(sa02_next), .sa_o(sa02), .sa_i_n(sa02_next_n), .sa_o_n(sa02_n) );
aes_xor_wddl ux31(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[071:064]), .text_in_n(text_in_r_n[071:064]), .w_i (w1[07:00]), .w_i_n (w1_n[07:00]), .sa_i(sa31_next), .sa_o(sa31), .sa_i_n(sa31_next_n), .sa_o_n(sa31_n) );
aes_xor_wddl ux21(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[079:072]), .text_in_n(text_in_r_n[079:072]), .w_i (w1[15:08]), .w_i_n (w1_n[15:08]), .sa_i(sa21_next), .sa_o(sa21), .sa_i_n(sa21_next_n), .sa_o_n(sa21_n) );
aes_xor_wddl ux11(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[087:080]), .text_in_n(text_in_r_n[087:080]), .w_i (w1[23:16]), .w_i_n (w1_n[23:16]), .sa_i(sa11_next), .sa_o(sa11), .sa_i_n(sa11_next_n), .sa_o_n(sa11_n) );
aes_xor_wddl ux01(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[095:088]), .text_in_n(text_in_r_n[095:088]), .w_i (w1[31:24]), .w_i_n (w1_n[31:24]), .sa_i(sa01_next), .sa_o(sa01), .sa_i_n(sa01_next_n), .sa_o_n(sa01_n) );
aes_xor_wddl ux30(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[103:096]), .text_in_n(text_in_r_n[103:096]), .w_i (w0[07:00]), .w_i_n (w0_n[07:00]), .sa_i(sa30_next), .sa_o(sa30), .sa_i_n(sa30_next_n), .sa_o_n(sa30_n) );
aes_xor_wddl ux20(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[111:104]), .text_in_n(text_in_r_n[111:104]), .w_i (w0[15:08]), .w_i_n (w0_n[15:08]), .sa_i(sa20_next), .sa_o(sa20), .sa_i_n(sa20_next_n), .sa_o_n(sa20_n) );
aes_xor_wddl ux10(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[119:112]), .text_in_n(text_in_r_n[119:112]), .w_i (w0[23:16]), .w_i_n (w0_n[23:16]), .sa_i(sa10_next), .sa_o(sa10), .sa_i_n(sa10_next_n), .sa_o_n(sa10_n) );
aes_xor_wddl ux00(.clk(clk), .ld_r (ld_r), .text_in(text_in_r[127:120]), .text_in_n(text_in_r_n[127:120]), .w_i (w0[31:24]), .w_i_n (w0_n[31:24]), .sa_i(sa00_next), .sa_o(sa00), .sa_i_n(sa00_next_n), .sa_o_n(sa00_n) );

endmodule
