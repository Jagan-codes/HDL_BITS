module top_module (
    input clk,
    input a,
    output [3:0] q );
    always@(posedge clk)
        begin
            if(a)
                q<=4'd4;
            else if(q==4'd6)
                q<=4'd0;
            else
                q<=q+1;
        end
    

endmodule
