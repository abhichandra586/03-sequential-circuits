`timescale 1ns/1ps

module srff_tb;

reg clk;
reg reset;
reg s;
reg r;
wire q;

srff uut(
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    
    $dumpfile("srff.vcd");
    $dumpvars(0,srff_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,s=%b,r=%b,q=%b",$time,clk,reset,s,r,q);

    reset=1; s=0; r=0; #10;
    reset=0; #10;

    s=0; r=0; #10;
    s=1; r=0; #10;
    s=0; r=0; #10;
    s=0; r=1; #10;
    s=0; r=0; #10;
    s=1; r=0; #10;
    s=1; r=1; #10;
    s=0; r=0; #10;

    reset=1; s=1; r=0; #10;
    reset=0; #10;

    $finish;

end
endmodule