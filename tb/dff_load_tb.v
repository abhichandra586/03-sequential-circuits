`timescale 1ns/1ps

module dff_load_tb;

reg clk;
reg reset;
reg load;
reg d;
wire q;

dff_load uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dff_load.vcd");
    $dumpvars(0,dff_load_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,load=%b,d=%b,q=%b",$time,clk,reset,load,d,q);

    reset=1; load=0; d=0; #10;
    reset=0; load=1; d=1; #10;
    load=0; d=0; #10;
    load=1; d=0; #10;
    load=0; d=1; #10;
    load=1; d=1; #10;
    reset=1; load=1; d=1; #10;
    reset=0; #10;

    $finish;

end
endmodule