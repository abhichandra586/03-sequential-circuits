module tff(
    input wire clk,
    input wire reset,
    input wire t,
    output reg q
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    q <= 1'b0;
    else if(t)
    q <= ~q;
    else
    q <= q;

end
endmodule