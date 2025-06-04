module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    sr s1(KEY[0],SW[0],KEY[1],LEDR[2],LEDR[0]);
    sr s2(KEY[0],SW[1],KEY[1],LEDR[0],LEDR[1]);
    sr s3(KEY[0],SW[2],KEY[1],LEDR[1]^LEDR[2],LEDR[2]);

endmodule
module sr(
    input clk,r,l,qin,
    output reg q);
    always@(posedge clk)
        begin
            q<=l?r:qin;
        end
    
endmodule
            
