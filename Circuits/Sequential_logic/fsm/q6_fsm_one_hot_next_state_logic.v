module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    parameter [6:1] A=6'b000001,B=6'b000010,C=6'b000100,D=6'b001000,E=6'b010000,F=6'b100000;
    reg [6:1]ns;
    /*always@(*)
        begin
            case(y)
                A:ns<=w?A:B;
                B:ns<=w?D:C;
                C:ns<=w?D:E;
                D:ns<=w?A:F;
                E:ns<=w?D:E;
                F:ns<=w?D:C;
                default:
                    ns<=A;
            endcase
        end
    assign Y4=ns[4];
    assign Y2=ns[2];*/
    assign Y4=y[2]&&w||y[3]&&w||y[5]&&w||y[6]&&w;
    assign Y2=y[1]&&~w;

endmodule
