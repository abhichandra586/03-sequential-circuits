`timescale 1ns/1ps

module siso_8bit_tb;

reg clk;
reg reset;
reg sin;
wire sout;

siso_8bit uut(
    .clk(clk),
    .reset(reset),
    .sin(sin),
    .sout(sout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    
    $dumpfile("siso_8bit.vcd");
    $dumpvars(0,siso_8bit_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,sin=%b,sout=%b",$time,clk,reset,sin,sout);

    reset=1; #10; reset=0;
    sin=1; #10;
    sin=1; #10;
    sin=0; #10;
    sin=0; #10;
    sin=1; #10;
    sin=0; #10;
    sin=1; #10;
    sin=0; #10;
    sin=0; #10;
    sin=0; #10;
    sin=0; #10;
    sin=0; #10;
    sin=0; #10;
    sin=0; #10;
    sin=0; #10;

    $finish;
end
endmodule