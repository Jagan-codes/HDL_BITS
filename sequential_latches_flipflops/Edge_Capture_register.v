module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [32:0]t;
    always@(posedge clk)
        begin
            t<=in;
            if(reset)
                out<=32'd0;
            else
                out<=(t&~in)|out;
        end

endmodule
