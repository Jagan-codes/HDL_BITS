module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter s1=0,s2=1,s3=2;
    reg [1:0] s,ns;
    always@(posedge clk or negedge aresetn)
        begin
            if(~aresetn)
                s<=s1;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                s1:ns<=x?s2:s1;
                s2:ns<=x?s2:s3;
                s3:ns<=x?s2:s1;
                default:
                    ns<=s1;
            endcase
        end
    
    assign z=(s==s3&&x)?1:0;
    
            
endmodule
