module piso_8bit(
    input wire clk,
    input wire reset,
    input wire load,
    input wire [7:0] pin,
    output wire sout
);

reg [7:0] q;

always @(posedge clk or posedge reset) begin
    if(reset)
        q <= 8'b0;
    else if(load)
        q <= pin;
    else
        q <= {1'b0, q[7:1]};
end

assign sout = q[0];

endmodule