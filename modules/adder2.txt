module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] su1,su2;
    wire cin,cout,c1;
    assign cin=1'b0;
    add16 ins1(a [15:0] ,b[15:0] ,cin,su1 [15:0] ,cout);
    add16 ins2(a [31:16] ,b[31:16] , cout, su2[15:0] ,c1);
    assign sum={su2,su1};
endmodule

module add1 ( input a, input b, input cin, output sum, output cout );
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(a&cin);
// Full adder module here

endmodule
