module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    wire [511:0] a,b;
    assign a={1'b0,q[511:1]};
    assign b={q[511:0],1'b0};
    always@(posedge clk)
        begin
            if(load)
                q<=data;
            else
                q<=(q&~b)|(~a&b)|(~q&a&b);
        end
                
endmodule
