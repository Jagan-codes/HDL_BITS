module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out=(~c&~b)|(~d&~a)|(a&~b&d)|(b&c&d);

endmodule
