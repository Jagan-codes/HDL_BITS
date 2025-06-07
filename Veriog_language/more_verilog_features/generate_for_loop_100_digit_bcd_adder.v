module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire cout_[399:0];
    
    bcd_fadd(a[3:0],b[3:0],cin,cout_[0],sum[3:0]);
    generate
        genvar i;
        for(i=4;i<400;i=i+4)
            begin:bcd_fadd_in
                bcd_fadd(a[i+3:i],b[i+3:i],cout_[i-4],cout_[i],sum[i+3:i]);
            end
    endgenerate
    assign cout=cout_[400-4];

endmodule
