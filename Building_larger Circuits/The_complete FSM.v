module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter s=0,s1=1,s11=2,s110=3,b0=4,b1=5,b2=6,b3=7,count=8,Wait=9;
    reg [3:0]ns,st;
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
                s:ns<=data?s1:s;
                s1:ns<=data?s11:s;
                s11:ns<=data?s11:s110;
                s110:ns<=data?b0:s;
                b0:ns<=b1;
                b1:ns<=b2;
                b2:ns<=b3;
                b3:ns<=count;
                count:ns<=done_counting?Wait:count;
                Wait:ns<=ack?s:Wait;
                default:
                    ns<=st;
            endcase
        end
    assign done=(st==Wait);
    assign counting=(st==count);
    assign shift_ena=(st==b0|st==b1||st==b2||st==b3);
        
                
endmodule
