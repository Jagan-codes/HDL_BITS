module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    parameter snt=0,wnt=1,wt=2,st=3;
    reg [1:0]s,ns;
    reg [1:0]cnt;
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                s<=wnt;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            if(train_valid)
                case(s)
                snt:ns=train_taken?wnt:snt;
                wnt:ns=train_taken?wt:snt;
                wt:ns=train_taken?st:wnt;
                st:ns=train_taken?st:wt;
                    default:
                        ns=s;
                endcase
            else
                ns=s;
        end
    assign state=s;
                    

endmodule
