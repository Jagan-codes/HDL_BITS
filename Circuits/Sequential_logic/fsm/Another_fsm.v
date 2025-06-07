module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter a=0,b=1,b1=2,b2=3,b3=4,c=5,c1=6,one=7,zero=8;
    reg [3:0] s,ns;
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
                a:ns<=b;
                b:ns<=b1;
                b1:ns<=x?b2:b1;
                b2:ns<=~x?b3:b2;
                b3:ns<=x?c:b1;
                c:ns<=y?one:c1;
                c1:ns<=y?one:zero;
                one:ns<=one;
                zero:ns<=zero;
                default:
                    ns<=a;
            endcase
        end
    
    assign f=(s==b);
    assign g=(s==c||s==c1||s==one);
                

endmodule
