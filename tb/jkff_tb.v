`timescale 1ns/1ps

module jkff_tb;

reg clk;
reg reset;
reg j;
reg k;
wire q;

jkff uut(
    .clk(clk),
    .reset(reset),
    .j(j),
    .k(k),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("jkff.vcd");
    $dumpvars(0,jkff_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,j=%b,k=%b,q=%b",$time,clk,reset,j,k,q);

    reset=1; j=0; k=0; #10;
    reset=0; #10;

    j=0; k=0; #10;
    j=0; k=1; #10;
    j=1; k=0; #10;
    j=1; k=1; #10;
    j=1; k=1; #10;
    j=0; k=1; #10;
    j=1; k=0; #10;
    j=0; k=0; #10;

    reset=1; j=1; k=1; #10;
    reset=0; #10;

    $finish;

end
endmodule