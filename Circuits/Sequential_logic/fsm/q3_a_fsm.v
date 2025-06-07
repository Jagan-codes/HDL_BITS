module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A=0,B=1;
    reg state,next_state;
    reg [1:0]b1_c,w_c;
    always@(posedge clk)
        begin
            if(reset)
                state<=A;
            else
                state<=next_state;
        end
    
    always@(*)
        begin
            case(state)
                A:next_state<=s?B:A;
                B:next_state<=B;
                default:
                    next_state<=A;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                w_c<=2'd0;
            else if(w_c==2'd2)
                w_c<=2'd0;
            else if(state==B)
                w_c<=w_c+1;
        end
    always@(posedge clk)
        begin
            if(reset)
                b1_c<=0;
            else if(w_c==2'd0&&w==0)
                b1_c<=0;
            else if(w_c==2'd0&&w==1)
                b1_c<=1;
            else if(state==B&&w==1)
                b1_c<=b1_c+1;
        end
    assign z=(b1_c==2'd2&&w_c==2'd0&&state==B);
endmodule
