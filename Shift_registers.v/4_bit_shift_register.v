module top_module(
    input clk,
    input areset,  // async act+++ive-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                q<=4'd0;
            else if(load)
                q<=data;
            else if(ena)
                q<={1'b0,q[3:1]};
            else
                q<=q;
        end
                

endmodule
