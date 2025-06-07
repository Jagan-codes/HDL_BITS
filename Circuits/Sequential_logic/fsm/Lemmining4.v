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
    parameter L=0,R=1,F_L=2,F_R=3,D_L=4,D_R=5,SPLAT=6;
    reg [2:0]s,ns;
    reg [7:0] fc;
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                begin
                    s<=L;
                    fc<=8'd0;
                end
            else
                begin
                    s<=ns;
                    if(s==F_L||s==F_R)
                        fc<=fc+1;
                    else
                        fc<=0;
                end
            
        end
    
    always@(*)
        begin
            case(s)
                
                L:
                    begin
                        ns<=(~ground)?F_L:(dig)?D_L:(bump_left)?R:L;
                        
                    end
                R:
                    begin
                        ns<=(~ground)?F_R:(dig)?D_R:(bump_right)?L:R;
                        
                    end
                F_L:
                    begin
                        ns<=(fc>=8'd20&&ground)?SPLAT:(ground)?L:F_L;
                       
                    end
                F_R:
                    begin
                        ns<=(fc>=8'd20&&ground)?SPLAT:(ground)?R:F_R;
                        
                    end
                D_L:ns<=(~ground)?F_L:D_L;
                D_R:ns<=(~ground)?F_R:D_R;
                SPLAT:ns<=SPLAT;
                default:
                    begin
                        ns<=L;
                       
                    end
            endcase
        end
    
    assign {walk_left,walk_right}={(s==L),(s==R)};
    assign aaah=(s==F_L||s==F_R);
    assign digging=(s==D_L||s==D_R);
                
            
endmodule
