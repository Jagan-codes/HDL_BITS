module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire a1,a2,a3,a4;
    assign a1=p2a&p2b;
    assign a2=p2c&p2d;
    assign p2y=a1|a2;
    assign a3=p1c&p1a&p1b;
    assign a4=p1d&p1e&p1f;
    assign p1y=a3|a4;
endmodule
