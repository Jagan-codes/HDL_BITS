module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    parameter id=0,st=1,data=2,stop=3,Wait=4;
    reg [2:0] s,ns;
    reg [3:0] cnt;
    reg [8:0]d_in;
    reg tem,isd;
    
    always@(posedge clk)
        begin
            if(reset)
                s<=id;
            else
                s<=ns;
        end
    always@(*)
        begin
            case(s)
                id:ns=in?id:st;
                st:ns=data;
                data:
                    begin
                        if(cnt==4'd9)
                            ns<=in?stop:Wait;
                        else
                            ns<=data;
                    end
                stop:ns=in?id:st;
                Wait:ns=in?id:Wait;
                default:
                    ns=id;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                begin
                    done<=0;
                    out_byte=8'd0;
                    cnt<=4'd0;
                end
            else
                begin
                    case(ns)
                        id:begin
                            done<=0;
                            out_byte<=8'd0;
                            cnt<=4'd0;
                        end
                        st:begin
                            done<=0;
                            out_byte<=8'd0;
                            cnt<=4'd0;
                        end
                        data:begin
                            done<=0;
                            out_byte<=8'd0;
                            cnt<=cnt+1;
                            d_in[cnt]<=in;
                        end
                        stop:begin
                            done<=tem?1:0;
                            out_byte<=tem?d_in:8'd0;
                            cnt<=4'd0;
                        end
                        Wait:begin
                            done<=0;
                            out_byte<=8'd0;
                            cnt<=4'd0;
                        end
                    endcase
                end
        end
    assign isd=(ns==st);
    parity p1(clk,isd,in,tem);
            
    
    // Modify FSM and datapath from Fsm_serialdata

    // New: Add parity checking.

endmodule
