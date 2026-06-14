`timescale 1ns/1ps

module sipo_8bit_tb;

reg clk;
reg reset;
reg sin;
wire [7:0] pout;

sipo_8bit uut(
    .clk(clk),
    .reset(reset),
    .sin(sin),
    .pout(pout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    
    $dumpfile("sipo_8bit.vcd");
    $dumpvars(0,sipo_8bit_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,sin=%b,pout=%b",$time,clk,reset,sin,pout);

    reset=1; #10; reset=0;
    sin=1; #10;
    sin=1; #10;
    sin=0; #10;
    sin=0; #10;
    sin=1; #10;
    sin=0; #10;
    sin=1; #10;
    sin=0; #10;


    $finish;
end
endmodule