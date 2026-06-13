`timescale 1ns/1ps

module counter_bcd_tb;

reg clk;
reg reset;
reg enable;
wire [3:0] count;

counter_bcd uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("counter_bcd.vcd");
    $dumpvars(0,counter_bcd_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,enable=%b,count=%b",$time,clk,reset,enable,count);

    reset=1; enable=0; #12;
    reset=0; enable=1; #110;
    enable=0; #20;
    enable=1; #20;
    reset=1; #5;
    reset=0; #20;

    $finish;

end
endmodule