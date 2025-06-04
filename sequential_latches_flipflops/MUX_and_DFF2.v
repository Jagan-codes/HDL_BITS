module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire d,w1;
    always@(posedge clk)
        begin
            Q<=d;
        end
    assign d=L?R:w1;
    assign w1=E?w:Q;
endmodule
