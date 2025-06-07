module top_module (
    input clk,
    input d,
    output q
);
    reg t1,t2;
    always@(posedge clk)
        t1<=d;
    always@(negedge clk)
        t2<=d;
    
    always@(clk)
        begin
            if(clk)
                q<=t1;
            else
                q<=t2;
        end
endmodule
