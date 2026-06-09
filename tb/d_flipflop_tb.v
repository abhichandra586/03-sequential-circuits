`timescale 1ns/1ps

module d_flipflop_tb;

reg clk;
reg d;
wire q;

d_flipflop uut(
    .clk(clk),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("d_flipflop.vcd");
    $dumpvars(0,d_flipflop_tb);

    $monitor("Time-%0t,clk=%b,d=%b,q=%b",$time,clk,d,q);

    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    $finish;

end
endmodule