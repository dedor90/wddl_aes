module wddl_or ( A, A_n, B, B_n, Y, Y_n );
    input A, A_n;
    input B, B_n;
    output Y, Y_n;

    assign Y = A | B;
    assign Y_n = A_n & B_n;
endmodule

