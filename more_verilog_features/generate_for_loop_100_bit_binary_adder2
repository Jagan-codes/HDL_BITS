module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar i;
    generate
        fa (a[0],b[0],cin,sum[0],cout[0]);
        for(i=1;i<100;i++)
            begin:fa_inst
                fa(.a(a[i]),.b(b[i]),.cin(cout[i-1]),.sum(sum[i]),.cout(cout[i]));
            end
    endgenerate
            
                

endmodule
module fa(input a,b,cin,output sum,cout);
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(a&cin);
endmodule