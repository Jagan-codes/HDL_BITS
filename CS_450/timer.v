module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output reg tc
);
    reg [9:0]icn;
    always@(posedge clk)
        begin
            //tc<=0;
            if(load)
                icn<=data;
            else if(~load&&icn==0)
                icn=9'd0;
                
            else 
                icn<=icn-1;
                
        end
          
    assign tc=(icn==0);
            
                

endmodule
