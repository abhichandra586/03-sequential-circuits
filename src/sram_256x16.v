module sram_256x16(
    input wire clk,
    input wire we,
    input wire [7:0] address,
    input wire [15:0] data_in,
    output wire [15:0] data_out
);

reg [15:0] mem [0:255];

always @(posedge clk) begin
    if(we) mem[address] <= data_in;
end

assign data_out=mem[address];
endmodule