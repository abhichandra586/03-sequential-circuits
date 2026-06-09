`timescale 1ns/1ps

module tff_tb;

reg clk;
reg reset;
reg t;
wire q;

tff uut(
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("tff.vcd");
    $dumpvars(0,tff_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,t=%b,q=%b",$time,clk,reset,t,q);

    reset = 1; t = 0; #7;
    reset = 0; #8;
    t = 0; #10;
    t = 1; #30; t = 0; #20;
    t = 1; #20;
    reset = 1; #5;
    reset = 0; #20;

    $finish;

end
endmodule