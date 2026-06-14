module pipo_8bit(
    input wire clk,
    input wire reset,
    input wire load,
    input wire [7:0] pin,
    output reg [7:0] pout
);

always @(posedge clk or posedge reset) begin
    if(reset)
        pout <= 8'b0;
    else if(load)
        pout <= pin;
    else
        pout <= pout;
end

endmodule