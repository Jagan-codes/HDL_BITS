module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        case (state)
            LEFT:next_state<=bump_left?RIGHT:LEFT;
            RIGHT:next_state<=bump_right?LEFT:RIGHT;
            default:
                next_state<=-state;
        endcase
        
        // State transition logic
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
        // State flip-flops with asynchronous reset
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
