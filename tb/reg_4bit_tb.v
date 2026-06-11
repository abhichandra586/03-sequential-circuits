`timescale 1ns/1ps

module reg_4bit_tb;

reg clk;
reg reset;
reg [3:0] d;
wire [3:0] q;

reg_4bit uut(
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

    $dumpfile("reg_4bit.vcd");
    $dumpvars(0,reg_4bit_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,d=%b,q=%b",$time,clk,reset,d,q);

    reset = 1; d=4'b0000; #12;
    reset = 0;d=4'b1010; #10;
    d = 4'b1100; #10;
    d = 4'b1111; #10;
    d = 4'b0011; #10;
    reset = 1; #3;
    reset = 0; d = 4'b0101; #10;
    d = 4'b1001; #10;

    $finish;

end
endmodule