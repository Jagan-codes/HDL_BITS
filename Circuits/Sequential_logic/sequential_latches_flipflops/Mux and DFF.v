module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    wire w1;
    always@(posedge clk)
        begin
            Q<=w1;
        end
    assign w1=L?r_in:q_in;
endmodule
    
