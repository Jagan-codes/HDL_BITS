module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,error=9,flag_j=7,Flag=8,discard=6;
    reg [3:0]s,ns;
    always@(posedge clk)
        begin
            if(reset)
                s<=s0;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                s0:ns=in?s1:s0;
                s1:ns=in?s2:s0;
                s2:ns=in?s3:s0;
                s3:ns=in?s4:s0;
                s4:ns=in?s5:s0;
                s5:ns=in?flag_j:discard;
                discard:ns=in?s1:s0;
                flag_j:ns=in?error:Flag;
                Flag:ns=in?s1:s0;
                error:ns=in?error:s0;
                default:
                    ns=s;
            endcase
        end
    
    assign disc=(s==discard);
    assign flag=(s==Flag);
    assign err=(s==error);
endmodule
