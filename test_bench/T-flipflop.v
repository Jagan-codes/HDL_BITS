module top_module ();
    reg clk,reset,t;
    wire q;
    tff uut(.clk(clk),.reset(reset),.t(t),.q(q));
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    initial begin
        reset=1'b1;
        #10;
        reset=1'b0;
        t=1'b1;
    end
   
                
endmodule
