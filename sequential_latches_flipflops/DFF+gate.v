module top_module (
    input clk,
    input in, 
    output out);
    wire d;
    always@(posedge clk)
        begin
            out<=d;
        end
    assign d=in^out;

endmodule
