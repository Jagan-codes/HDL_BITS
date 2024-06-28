module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] sumu,sumu2;
    wire c1,c2,c3,c4;
    add16 ins1(a[15:0],b[15:0],1'b0,sumu[15:0],c1);
    add16 ins2(a[31:16],b[31:16],c1,sumu[31:16],c2);
    add16 ins3(a[15:0],~b[15:0],1'b1,sumu2[15:0],c3);
    add16 ins4(a[31:16],~b[31:16],c3,sumu2[31:16],c4);
    always@(*)
        begin
            if(sub)
                sum=sumu2;
            else
                sum=sumu;
        end
    
    
    
endmodule
