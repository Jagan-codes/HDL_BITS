module top_module (
    input [3:1] y,
    input w,
    output Y2);

    parameter a=0,b=1,c=2,d=3,e=4,f=5;
    reg [2:0] ns;
    always@(*)
        begin
            case(y)
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
    
    assign Y2=ns[1];
                
        
endmodule
