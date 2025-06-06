module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    reg [5:0]ns;
    
    assign ns[0]=~w?y[0]|y[3]:1'b0;
    assign ns[1]=w?y[0]:1'b0;
    assign ns[2]=w?y[1]|y[5]:0;
    assign ns[3]=~w?y[1]|y[2]|y[4]|y[5]:0;
    assign ns[4]=w?y[3]|y[4]:0;
    assign ns[5]=w?y[3]:0;
    
    assign Y1=ns[1];
    assign Y3=ns[3];

endmodule
