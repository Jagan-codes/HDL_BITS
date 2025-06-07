module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]d;
    always@(posedge clk)
        begin
            d<=in;
            pedge=(~d&in);
        end

endmodule
