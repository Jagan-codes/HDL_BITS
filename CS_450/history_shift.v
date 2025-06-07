module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);

    reg [31:0]IH;
    assign predict_history=IH;
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                IH<=32'd0;
            else if(train_mispredicted)
                IH<={train_history[30:0],train_taken};
            else if(predict_valid)
                IH<={IH[30:0],predict_taken};
            
        end
                
                
endmodule
