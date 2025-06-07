module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter idle=0,s0=1,s1=2;
    reg [1:0]s,ns;
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                s<=idle;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                idle:ns<=x?s0:idle;
                s0:ns<=s1;
                s1:ns<=s1;
                default:
                    ns=idle;
            endcase
        end
    
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                 z<=0;
            else
                case(ns)
                    idle:z<=0;
                    s0:z<=1;
                    s1:z<=~x;
                endcase
        end
    

endmodule
