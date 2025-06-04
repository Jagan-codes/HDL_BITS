module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0] sr;
    always@(posedge clk)
        begin
            if(!resetn)
                sr<=4'd0;
            else
                sr<={sr[2:0],in};
        end
    assign out=sr[3];
endmodule
