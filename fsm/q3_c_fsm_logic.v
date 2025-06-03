module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
	parameter s0=0,s1=1,s2=2,s3=3,s4=4;
    reg [2:0] ns;
    always@(*)
        begin
            case(y)
                s0:ns<=x?s1:s0;
                s1:ns<=x?s4:s1;
                s2:ns<=x?s1:s2;
                s3:ns<=x?s2:s1;
                s4:ns<=x?s4:s3;
                default:
                    ns<=s0;
            endcase
        end
    
    assign z=(y==s4|y==s3);
    assign Y0=ns[0];
endmodule

