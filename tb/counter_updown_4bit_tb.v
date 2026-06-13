`timescale 1ns/1ps

module counter_updown_4bit_tb;

reg clk;
reg reset;
reg enable;
reg dir;
wire [3:0] count;

counter_updown_4bit uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .dir(dir),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("counter_updown_4bit.vcd");
    $dumpvars(0,counter_updown_4bit_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,enable=%b,dir=%b,count=%b",$time,clk,reset,enable,dir,count);

    reset=1; enable=0; dir=1; #12;
    reset=0; enable=1; dir=1; #50;
    dir=0; #60;
    enable=0; #20;
    enable=1; dir=1; #20;
    reset=1; #5;
    reset=0; #20;

    $finish;

end
endmodule