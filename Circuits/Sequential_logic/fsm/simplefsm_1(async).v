// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=0,B=1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state<=B;
        end
        else
            begin
                present_state<=next_state;
            end
    end
                
        always@(*)          
        begin
            case (present_state)
                // Fill in state transition logic
                A:
                    if(in)
                        begin
                         	next_state<=A;
                        end
                   else
                       begin
                            next_state<=B;
                       end
                B:
                    if(in)
                        begin
                             next_state<=B;
                        end
                    else
                        begin
                             next_state<=A;
                        end
                
            endcase
        end

            // State flip-flops
            always@( present_state) 
                begin

                case (present_state)
                    A:
                        out=1'b0;
                    B:
                        out=1'b1;
            endcase
        end
    

endmodule
