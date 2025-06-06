module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    parameter A=0,B=1;
    reg s,ns;
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                s<=A;
            else
                s<=ns;
        end
    always@(*)
        begin
            case(s)
                A:ns=x?B:A;
                B:ns=B;
                default:
                    ns<=A;
            endcase
        end
    always@(*)
        begin
            case(s)
                A:z=x?1:0;
                B:z=x?0:1;
            endcase
        end
            

endmodule
