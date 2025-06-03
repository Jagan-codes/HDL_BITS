module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    parameter a=0,b=1,c=2,d=3,e=4,f=5;
    reg [2:0]s,ns;
    always@(*)
        begin
            case(s)
                a:ns<=w?a:b;
                b:ns<=w?d:c;
                c:ns<=w?d:e;
                d:ns<=w?a:f;
                e:ns<=w?d:e;
                f:ns<=w?d:c;
                default:
                    ns<=a;
            endcase
        end
    
    always@(posedge clk)
        begin
            if(reset)
                s<=a;
            else
                s<=ns;
        end
    
    assign z=(s==e|s==f);
    

endmodule
