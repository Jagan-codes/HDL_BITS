module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]cout_;
    bcd_fadd(a[3:0],b[3:0],cin,cout_[0],sum[3:0]);
    bcd_fadd(a[7:4],b[7:4],cout_[0],cout_[1],sum[7:4]);
    bcd_fadd(a[11:8],b[11:8],cout_[1],cout_[2],sum[11:8]);
    bcd_fadd(a[15:12],b[15:12],cout_[2],cout_[3],sum[15:12]);
    assign cout=cout_[3];

endmodule
