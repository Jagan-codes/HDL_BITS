module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    wire w1,w2,w3;
    MUXDFF m1(KEY[0],KEY[2],KEY[1],SW[3],KEY[3],LEDR[3]);
    MUXDFF m2(KEY[0],KEY[2],KEY[1],SW[2],LEDR[3],LEDR[2]);
    MUXDFF m3(KEY[0],KEY[2],KEY[1],SW[1],LEDR[2],LEDR[1]);
    MUXDFF m4(KEY[0],KEY[2],KEY[1],SW[0],LEDR[1],LEDR[0]);
endmodule

module MUXDFF (
   input clk,l,e,r,w,
   output reg q);
    wire w1;
    always@(posedge clk)
        begin
            q<=w1;
        end
    assign w1=l?r:(e?w:q);
    

endmodule
