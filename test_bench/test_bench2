module top_module();
    reg clk,in;
    reg [2:0] s;
    wire out;
    q7 dut(clk,in,s,out);
   
    initial begin
         clk=0;
        forever #5 clk=~clk;
    end
    initial begin
        in=0;
        #20;
        in=1;
        #10;
        in=0;
        #10;
        in=1;
        #30;
        in=0;
    end
    initial begin
        s=3'h2;
        #10;
        s=3'h6;
        #10;
        s=3'h2;
        #10;
        s=3'h7;
        #10;
        s=3'h0;
    end
        
        
endmodule
