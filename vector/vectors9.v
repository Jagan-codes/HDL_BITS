1:
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
assign outv=vec;
    assign o0=vec[0];
    assign o1=vec[1];
    assign o2=vec[2];
    
endmodule
2:
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_lo=in[7:0];
    assign out_hi=in[15:8];
endmodule

3:
module top_module( 
    input [31:0] in,
    output [31:0] out );//
    assign out[7:0]=in[31:24];
    assign out[15:8]=in[23:16];
    assign out[23:16]=in[15:8];
    assign out[31:24]=in[7:0];


endmodule
4:
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise=a|b;
    assign out_or_logical=a||b;
    assign out_not[2:0]=~a;
    assign out_not[5:3]=~b;
    

endmodule
5:
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
assign out_and=&in;
    assign out_or=|in;
    assign out_xor=^in;
endmodule

