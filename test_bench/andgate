module top_module();
    reg [1:0] in;
    wire out;
    andgate dut(.in(in),.out(out));
initial begin
    in[1]=0;in[0]=0;#10;
    in[1]=0;in[0]=1;#10;
    in[1]=1;in[0]=0;#10;
    in[1]=1;in[0]=1;
end
endmodule
