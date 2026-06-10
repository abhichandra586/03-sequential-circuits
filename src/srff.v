module srff(
    input wire clk,
    input wire reset,
    input wire s,
    input wire r,
    output reg q
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    q <= 1'b0;
    else begin
        case({s,r})
        2'b00: q <= q;
        2'b01: q <= 1'b0;
        2'b10: q <= 1'b1;
        2'b11: q <= 1'bx;
        endcase
end
end
endmodule