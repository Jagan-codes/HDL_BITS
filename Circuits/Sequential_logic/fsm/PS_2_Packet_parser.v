module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter b1=0,b2=1,b3=2,Done=3;
    reg [1:0] ns,s;
    always@(posedge clk)
        begin
            if(reset)
                s<=b1;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                b1:ns=in[3]?b2:b1;
                b2:ns=b3;
                b3:ns=Done;
                Done:ns=in[3]?b2:b1;
                default:
                    ns=b1;
            endcase
        end
    assign done=(s==Done);
                
    // State transition logic (combinational)

    // State flip-flops (sequential)
 
    // Output logic

endmodule
