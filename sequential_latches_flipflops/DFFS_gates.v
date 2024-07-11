module top_module (
    input clk,
    input x,
    output z
); 
    wire d1,d2,d3;
    reg q1=0,q2=0,q3=0;
    assign d1=x^q1;
    assign d2=x&~q2;
    assign d3=x|~q3;
    dff s1(clk,d1,q1);
    dff s2(clk,d2,q2);
    dff s3(clk,d3,q3);
    
    assign z=~(q1|q2|q3);
endmodule
    
module dff(input clk,input d,output reg q);
        always@(posedge clk)
             begin
                 q<=d;
             end
    endmodule
    
    