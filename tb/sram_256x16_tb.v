`timescale 1ns/1ps

module sram_256x16_tb;

reg clk;
reg we;
reg [7:0] address;
reg [15:0] data_in;
wire [15:0] data_out;

sram_256x16 uut(
    .clk(clk),
    .we(we),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("sram_256x16.vcd");
    $dumpvars(0,sram_256x16_tb);

    $monitor("Time=%0t,we=%b,address=%d,data_in=%h,data_out=%h",$time,we,address,data_in,data_out);

    we=1; address=8'd0;   data_in=16'hABCD; #10;
    we=1; address=8'd1;   data_in=16'h1234; #10;
    we=1; address=8'd2;   data_in=16'hBEEF; #10;
    we=1; address=8'd255; data_in=16'hFFFF; #10;

    we=0; address=8'd0;   data_in=16'h0000; #10;
    we=0; address=8'd1;   data_in=16'h0000; #10;
    we=0; address=8'd2;   data_in=16'h0000; #10;
    we=0; address=8'd255; data_in=16'h0000; #10;

    we=1; address=8'd0;   data_in=16'h9999; #10;
    we=0; address=8'd0;   data_in=16'h0000; #10;

    we=0; address=8'd1;   #10;
    we=0; address=8'd2;   #10;

    $finish;

end
endmodule