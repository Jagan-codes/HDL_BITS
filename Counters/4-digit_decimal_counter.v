module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output  [15:0] q);
    assign ena[1]=(q[3:0]==4'd9);
    assign ena[2]=(ena[1]&&q[7:4]==4'd9);
    assign ena[3]=(ena[2]&&q[11:8]==4'd9);
    
    bcd c1(clk,reset,1'b1,q[3:0]);
    bcd c2(clk,reset,ena[1],q[7:4]);
    bcd c3(clk,reset,ena[2],q[11:8]);
    bcd c4(clk,reset,ena[3],q[15:12]);
    

endmodule
module bcd(
    input clk,rst,ena,
    output [3:0]q);
    always@(posedge clk)
        begin
            if(rst)
                q<=4'd0;
            else if(ena)
                begin
                    if(q==4'd9)
                        q<=4'd0;
                    else
                        q<=q+1;
                end
        end
endmodule
            
                    
