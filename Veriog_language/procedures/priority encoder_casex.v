// synthesis verilog_input_version verilog_2001
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [3:0] pos  );
    always@(*)
        begin
            casex(in)
                8'bxxxxxxx1:pos=3'd0;
                8'bxxxxxx1x:pos=3'd1;
                8'bxxxxx1xx:pos=3'd2;
                8'bxxxx1xxx:pos=3'd3;
                8'bxxx1xxxx:pos=3'd4;
                8'bxx1xxxxx:pos=3'd5;
                8'bx1xxxxxx:pos=3'd6;
                8'b1xxxxxxx:pos=3'd7;
                default: pos=3'd0;
            endcase
        end
                
endmodule
