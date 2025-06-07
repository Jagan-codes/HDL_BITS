module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter LEFT=0,RIGHT=1,FALL_L=2,FALL_R=3,DIG_R=4,DIG_L=5;
    reg [2:0]ns,s;
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                s<=LEFT;
            else
                s<=ns;
        end
    
    always@(*)
        begin
            case(s)
                LEFT:ns<=(~ground)?FALL_L:(dig)?DIG_L:(bump_left)?RIGHT:LEFT;
                RIGHT:ns<=(~ground)?FALL_R:(dig)?DIG_R:(bump_right)?LEFT:RIGHT;
                FALL_L:ns<=(ground)?LEFT:FALL_L;
                FALL_R:ns<=(ground)?RIGHT:FALL_R;
                DIG_L:ns<=(~ground)?FALL_L:DIG_L;
                DIG_R:ns<=(~ground)?FALL_R:DIG_R;
                default:
                    ns<=LEFT;
            endcase
        end
    assign walk_left=(s==LEFT);
    assign walk_right=(s==RIGHT);
    assign aaah=(s==FALL_L||s==FALL_R);
    assign digging=(s==DIG_R||s==DIG_L);
endmodule
