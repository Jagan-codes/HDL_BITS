1:
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    assign {w,x,y,z} = {a,b,c,d,e,f,1'b1,1'b1};

endmodule
2:
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out[0]=in[7];
    assign out[1]=in[6];
    assign out[2]=in[5];
    assign out[3]=in[4];
    assign out[4]=in[3];
    assign out[5]=in[2];
    assign out[6]=in[1];
    assign out[7]=in[0];

endmodule
3:
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = {24{in[7]} , in };

endmodule

4:
module top_module (
	input a, b, c, d, e,
	output [24:0] out
);

	wire [24:0] top, bottom;
	assign top    = { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} };
	assign bottom = {5{a,b,c,d,e}};
	assign out = ~top ^ bottom;	// Bitwise XNOR

	// This could be done on one line:
	// assign out = ~{ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} } ^ {5{a,b,c,d,e}};
	
endmodule


