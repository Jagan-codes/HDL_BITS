module top_module (input x, input y, output z);
wire o1,o2,o3,o4;
    A i1(x,y,o1);
    B i2(x,y,o2);
    A i3(x,y,o3);
    B i4(x,y,o4);
    
    assign z=(o1|o2)^(o3&o4);
    
    
endmodule
module A(input x,y,output z);
    assign z=(x^y)&x;
endmodule
    
module B(input x,y,output z);
    assign z=~(x^y);
endmodule
