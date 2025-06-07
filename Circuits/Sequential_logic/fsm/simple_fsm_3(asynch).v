module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    parameter a=1,b=2,c=3,d=4;
    reg [2:0]s,ns;
    // State transition logic
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
    

    // State flip-flops with asynchronous reset
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                s<=a;
            else
                s<=ns;
        end
    

    // Output logic
    assign out=(s==d)?1:0;

endmodule
