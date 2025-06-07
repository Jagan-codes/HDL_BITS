module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter a=0,b=1,c=2,d=3,e=4;
    reg [2:0]ns,s;
    always@(posedge clk)
        begin
            if(reset)
                s<=a;
            else
                s<=ns;
        end
    always@(*)
        begin
            case(s)
                a:ns=data?b:a;
                b:ns=data?c:a;
                c:ns=~data?d:c;
                d:ns=data?e:a;
                e:ns=e;
                default:
                    ns=s;
            endcase
        end
    assign start_shifting=(s==e);
    
endmodule
