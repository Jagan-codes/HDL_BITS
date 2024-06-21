module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cin1,co,c2;
    assign cin1=1'b0;
    wire [31:0] sumu;
    add16 m1(a[15:0] ,b [15:0] ,cin1,sumu [15:0] ,co);
    add16 m2(a [31:16] ,b [31:16] ,co,sumu [31:16],c2);
    assign sum=sumu;
    
endmodule
