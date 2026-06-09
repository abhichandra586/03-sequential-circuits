`timescale 1ns/1ps

module dff_async_tb;

reg clk;
reg reset;
reg d;
wire q;

dff_async uut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dff_async.vcd");
    $dumpvars(0,dff_async_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,d=%b,q=%b",$time,clk,reset,d,q);

    reset = 1; d = 0; #7;
    reset = 0; #3;
    d = 1; #10;
    d = 0; #10;
    d = 1; #4;
    reset = 1; #6;
    reset = 0; #10;

    $finish;

end
endmodule