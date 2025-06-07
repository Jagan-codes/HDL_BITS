module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter LEFT=0,RIGHT=1,FALL_L=2,FALL_R=3;
    reg [1:0] ns,s;
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                s<=LEFT;
            else
                s<=ns;
        end
    always@(*)
        begin
            case(s)
                LEFT:ns<=(~ground)?FALL_L:(bump_left)?RIGHT:LEFT;
                RIGHT:ns<=(~ground)?FALL_R:(bump_right)?LEFT:RIGHT;
                FALL_L:ns<=(ground)?LEFT:FALL_L;
                FALL_R:ns<=(ground)?RIGHT:FALL_R;
                default:
                    ns<=LEFT;
            endcase
        end
    assign walk_left=(s==LEFT);
    assign walk_right=(s==RIGHT);
    assign aaah=(s==FALL_L||s==FALL_R);
                
endmodule
