// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always@(*)
        begin
            casex(in)
                4'bxxx1:pos=2'd0;
                4'bxx1x:pos=2'd1;
                4'bx1xx:pos=2'd2;
                4'b1xxx:pos=2'd3;
                default: pos=2'd0;
            endcase
        end
                
endmodule
