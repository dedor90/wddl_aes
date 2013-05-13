module wddl_inv ( A, A_n, Y, Y_n );
    input A, A_n;
    output Y, Y_n;

    assign Y = ~A;
    assign Y_n = ~A_n;
    
endmodule
