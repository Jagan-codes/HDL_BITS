module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0]sr;
    always@(posedge clk)
        begin
            if(enable)
                sr<={sr[6:0],S};
            else 
                sr<=sr;
        end
    always@(*)
        begin
            case({A,B,C})
                    3'b000:Z=sr[0];
                    3'b001:Z=sr[1];
                    3'b010:Z=sr[2];
                    3'b011:Z=sr[3];
                    3'b100:Z=sr[4];
                    3'b101:Z=sr[5];
                    3'b110:Z=sr[6];
                    3'b111:Z=sr[7];
            endcase
        end
    
                     
            
        
endmodule
