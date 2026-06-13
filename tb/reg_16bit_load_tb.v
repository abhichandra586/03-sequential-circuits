`timescale 1ns/1ps

module reg_16bit_load_tb;

reg clk;
reg reset;
reg load;
reg [15:0] d;
wire [15:0] q;

reg_16bit_load uut(
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

    $dumpfile("reg_16bit_load.vcd");
    $dumpvars(0,reg_16bit_load_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,load=%b,d=%b,q=%b",$time,clk,reset,load,d,q);

    reset=1; load=0; d=16'h0000; #12;
    reset=0; d=16'h1234; load=1; #10;
    d=16'hABCD; load=1; #10;
    load=0; d=16'hFFFF; #10;
    load=1; #10;
    reset=1; #5;
    reset=0; d=16'h55AA; load=1; #10;

    $finish;

end
endmodule