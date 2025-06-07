module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter st=1,b1=2,b2=3,b3=4,b4=5,b5=6,b6=7,b7=8,b8=9,stop=10,done0=11,done1=12;
    reg[3:0] s,ns;
    
    always@(posedge clk)
        begin
            if(reset)
                s<=st;
            else
                s<=ns;
        end
    always@(*)
        begin
            case(s)
                st:ns=~in?b1:st;
                b1:ns=b2;
                b2:ns=b3;
                b3:ns=b4;
                b4:ns=b5;
                b5:ns=b6;
                b6:ns=b7;
                b7:ns=b8;
                b8:ns=stop;
                stop:ns=in?done0:done1;
                done0:ns=in?st:b1;
                done1:ns=in?st:done1;
                default:
                    ns=st;
            endcase
        end
    assign done=(s==done0);
endmodule
