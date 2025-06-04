module top_module (
    input clock,
    input a,
    output p,
    output q );
    always@(clock)
        begin
            if(clock)
                p<=a;
            else
                q<=p;
        end
endmodule
