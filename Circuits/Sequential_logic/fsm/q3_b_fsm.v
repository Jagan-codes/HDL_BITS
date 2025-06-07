module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter s1=1,s2=2,s3=3,s4=4,s5=5;
    reg [2:0] s,ns;
    always@(*)
        begin
            case(s)
                s1:ns<=x?s2:s1;
                s2:ns<=x?s5:s2;
                s3:ns<=x?s2:s3;
                s4:ns<=x?s3:s2;
                s5:ns<=x?s5:s4;
                default:
                    ns<=s1;
            endcase
        end
    
    always@(posedge clk)
        begin
            if(reset)
                s<=s1;
            else
                s<=ns;
        end
    
    assign z=(s==s5|s==s4)?1:0;

endmodule
