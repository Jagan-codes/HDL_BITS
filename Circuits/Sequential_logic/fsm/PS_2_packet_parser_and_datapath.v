module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    parameter b1=0,b2=1,b3=2,Done=3;
    reg [1:0] ns,s;
    always@(posedge clk)
        begin
            if(reset)
                s<=b1;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                b1:ns=in[3]?b2:b1;
                b2:ns=b3;
                b3:ns=Done;
                Done:ns=in[3]?b2:b1;
                default:
                    ns=b1;
            endcase
        end
    assign done=(s==Done);
    // FSM from fsm_ps2
    reg [23:0] data;
    always@(posedge clk)
        begin
            if(reset)
                data<=24'd0;
            else 
                begin
                    data[23:16]=data[15:8];
                    data[15:8]=data[7:0];
                    data[7:0]=in;
                end
        end
    
    assign out_bytes=Done?data:24'd0;
    // New: Datapath to store incoming bytes.

endmodule
