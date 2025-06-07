module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    always@(posedge clk)
        begin
            if(reset|(ena&&ss==8'h59))
                ss<=8'h00;
            else
                begin
                    if(ena&&ss[3:0]==4'd9)
                        begin
                            ss[3:0]<=4'd0;
                        end
                    else
                        begin
                            if(ena)
                                ss[3:0]<=ss[3:0]+1;
                            else
                                ss<=ss;
                        end
                    if(ena&&ss[3:0]==4'h9)
                        ss[7:4]<=ss[7:4]+1;
                    else
                        ss[7:4]<=ss[7:4];
                    
                end
        end
    
    always@(posedge clk)
        begin
            if(reset|(ena&&mm==8'h59&&ss==8'h59))
                mm<=8'h00;
            else
                begin
                    if(ena&&ss==8'h59)
                        mm[3:0]<=mm[3:0]+1;
                    if(ena&&mm[3:0]==4'h9&&ss==8'h59)
                        begin
                            mm[3:0]<=4'd0;
                            mm[7:4]<=mm[7:4]+1;
                        end
                    
                end
        end
    
    always@(posedge clk)
        begin
            if(reset)
                begin
                    hh<=8'h12;
                    pm<=0;
                end
            else 
                begin
                    if(ena&&hh==8'h11&&mm==8'h59&&ss==8'h59)
                        begin
                            hh<=8'h12;
                            pm<=~pm;
                        end
                    else 
                        if(ena&&mm==8'h59&&ss==8'h59)
                            begin
                                if(hh==8'h12)
                                    hh<=8'h01;
                                else 
                                    if(hh[3:0]==4'h9) begin
                                        hh[7:4]<=hh[7:4]+1;
                                        hh[3:0]<=4'h0;
                                    end
                                else
                                    hh[3:0]<=hh[3:0]+1;
                            end
                end
        end
endmodule
