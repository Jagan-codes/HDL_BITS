module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
     parameter s=0,s1=1,s11=2,s110=3,b0=4,b1=5,b2=6,b3=7,Count=8,Wait=9;
    reg [3:0]ns,st;
    reg [13:0]cnt_delay;
    reg [3:0]delay;
    reg done_counting=0;
    always@(posedge clk)
        begin
            if(reset)
                st<=s;
            else
                st<=ns;
        end
    
    always@(*)
        begin
            case(st)
                s:ns=data?s1:s;
                s1:ns=data?s11:s;
                s11:ns=data?s11:s110;
                s110:ns=data?b0:s;
                b0:ns=b1;
                b1:ns=b2;
                b2:ns=b3;
                b3:ns=Count;
                Count:ns=done_counting?Wait:Count;
                Wait:ns=ack?s:Wait;
                default:
                    ns=st;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                delay<=4'd0;
            else
                case(st)
                b0:delay[3]<=data;
                b1:delay[2]<=data;
                b2:delay[1]<=data;
                b3:delay[0]<=data;
                    default:
                        delay<=delay;
                endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                cnt_delay<=14'd0;
            else
                case(st)
                    Count:cnt_delay<=cnt_delay+1;
                    default:
                        cnt_delay<=14'd0;
                endcase
        end
    assign done_counting=(cnt_delay==(delay+1)*1000-1);
    assign count=delay-cnt_delay/1000;
    assign counting=(st==Count);
    assign done=(st==Wait);

endmodule
