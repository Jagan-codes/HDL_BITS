module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg [2:0]cn;
    always@(posedge clk)
        begin
            if(reset)
                begin
                    cn<=3'd0;
                    shift_ena<=1;
                end
            else if(shift_ena==1&&cn==3'd3)
                begin
                    shift_ena<=0;
                end
            else
                cn<=cn+1;
        end
            
                
endmodule
