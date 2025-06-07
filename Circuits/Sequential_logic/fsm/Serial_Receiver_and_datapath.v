module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
      parameter st=1,b1=2,b2=3,b3=4,b4=5,b5=6,b6=7,b7=8,b8=9,stop=10,done0=11,done1=12;
    reg[3:0] s,ns;
    reg [7:0]data;
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
    always@(posedge clk)
        begin
            if(reset)
                data<=8'd0;
            else
                case(s)
                b1:data[0]=in;
                b2:data[1]=in;
                b3:data[2]=in;
                b4:data[3]=in;
                b5:data[4]=in;
                b6:data[5]=in;
                b7:data[6]=in;
                b8:data[7]=in;
                endcase
        end
    assign out_byte=(s==done0)?data:out_byte;
    // Use FSM from Fsm_serial

    // New: Datapath to latch input bits.

endmodule
