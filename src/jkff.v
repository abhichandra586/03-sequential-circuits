module jkff(
    input wire clk,
    input wire reset,
    input wire j,
    input wire k,
    output reg q
);

always@(posedge clk or posedge reset)
begin
    if(reset)
    q <= 1'b0;
    else begin
        case({j,k})
        2'b00: q <= q;
        2'b01: q <= 1'b0;
        2'b10: q <= 1'b1;
        2'b11: q <= ~q;
        endcase

    end
end
endmodule