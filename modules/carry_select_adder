module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c1,co,c11,c12,co1,co2;
    wire [31:0] sum1;
    assign c1=1'b0;
    assign c11=1'b0;
    assign c12=1'b1;
    add16 ins1(a[15:0],b[15:0],c1,sum[15:0],co);
    add16 ins2(a[31:16],b[31:16],c11,sum1[15:0],co1);
    add16 ins3(a[31:16],b[31:16],c12,sum1[31:16],co2);
    always@(*)
        begin 
            if(co)
                sum[31:16]=sum1[31:16];
            else
                sum[31:16]=sum1[15:0];
        end
    
               
endmodule
