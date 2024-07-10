module top_module ( );
reg clk=0;
    dut ou(clk);
    initial begin 
        forever 
            #5 clk=~clk;
    end
        
endmodule
