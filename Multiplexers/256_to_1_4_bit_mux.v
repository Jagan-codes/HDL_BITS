module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    assign out=in[sel*4+:4]//in[start+:width] which is if sel =0 0*4=0,[0+:4]then count from 0 to 4 0,1,2,3 therefore [3:0]
        //or assign out=in[sel*4+3-:4]//similar to + it counts from backwards if sel=0 [3-:4] becomes 3,2,1,0 now[3:0]
        
        
endmodule
