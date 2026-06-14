`timescale 1ns/1ps

module piso_8bit_tb;

reg clk;
reg reset;
reg load;
reg [7:0] pin;
wire sout;

piso_8bit uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .pin(pin),
    .sout(sout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("piso_8bit.vcd");
    $dumpvars(0,piso_8bit_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,load=%b,pin=%b,sout=%b",$time,clk,reset,load,pin,sout);

    reset=1; load=0; pin=8'b00000000; #10;
    reset=0; load=1; pin=8'b10110100; #10;
    load=0; #10;
    load=0; #10;
    load=0; #10;
    load=0; #10;
    load=0; #10;
    load=0; #10;
    load=0; #10;
    load=0; #10;

    $finish;

end
endmodule