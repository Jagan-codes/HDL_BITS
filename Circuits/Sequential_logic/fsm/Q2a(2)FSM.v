module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter a=0,b=1,c=2,d=3;
    reg [1:0]s,ns;
    always@(posedge clk)
        begin
            if(~resetn)
                s<=a;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                a:ns<=r[1]?b:(~r[1]&&r[2])?c:(~r[1]&&~r[2]&r[3])?d:a;
                b:ns<=~r[1]?a:b;
                c:ns<=~r[2]?a:c;
                d:ns<=~r[3]?a:d;
                default:
                    ns<=a;
            endcase
        end
    assign g={(s==d),(s==c),(s==b)};
                
endmodule
