module top_module(
    input clk,
    input in,
    input reset,
    output out); //
   parameter a=0,b=1,c=2,d=3;
    reg [1:0] s,ns;
    always@(*)
        begin
            case(s)
                a:ns<=in?b:a;
                b:ns<=in?b:c;
                c:ns<=in?d:a;
                d:ns<=in?b:c;
                default:
                    ns<=a;
            endcase
        end
    
    // State transition logic

    always@(posedge clk)
        begin
            if(reset)
                s<=a;
            else
                s<=ns;
        end
    
    
    // State flip-flops with synchronous reset
  
    assign out=(s==d)?1:0;
    // Output logic

endmodule
