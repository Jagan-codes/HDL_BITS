module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter s1=0,s1s2=1,s2s3=2,s3=3;
    reg[1:0] st,ns,ls;
    always@(posedge clk)
        begin
            if(reset)
                begin
                    st<=s1;
                    ls<=s1;
                end
            else
                begin
                    st<=ns;
                    ls<=st;
                end
        end
    
    always@(*)
        begin
            case(st)
                s1:ns=s[1]?s1s2:s1;
                s1s2:ns=~s[1]?s1:s[2]?s2s3:s1s2;
                s2s3:ns=~s[2]?s1s2:~s[3]?s2s3:s3;
                s3:ns=~s[3]?s2s3:s3;
            endcase
        end
    assign fr1=(st==s1||st==s1s2||st==s2s3);
    assign fr2=(st==s1||st==s1s2);
    assign fr3=(st==s1);
    
    always@(*)
        begin
            if(ls>st||st==s1)
                dfr=1;
            else if(ls<st)
                dfr=0;
            else
                dfr=dfr;
        end
            

endmodule
