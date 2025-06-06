module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
    
    assign next_state[0]=(state[0]|state[1]|state[2]|state[3]|state[4]|state[7]|state[8]|state[9])&&(~in);
    assign next_state[1]=(state[0]|state[8]|state[9])&&(in);
    assign next_state[2]=(state[1]&&in);
    assign next_state[3]=(state[2]&&in);
    assign next_state[4]=(state[3]&&in);
    assign next_state[5]=(state[4]&&in);
    assign next_state[6]=(state[5]&&in);
    assign next_state[7]=(state[6]|state[7])&&in;
    assign next_state[8]=(state[5]&&~in);
    assign next_state[9]=(state[6]&&~in);
    
    assign out1=(state[8]|state[9]);
    assign out2=(state[9]|state[7]);

endmodule
