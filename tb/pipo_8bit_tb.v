`timescale 1ns/1ps

module pipo_8bit_tb;

reg clk;
reg reset;
reg load;
reg [7:0] pin;
wire [7:0] pout;

pipo_8bit uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .pin(pin),
    .pout(pout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("pipo_8bit.vcd");
    $dumpvars(0,pipo_8bit_tb);

    $monitor("Time=%0t,clk=%b,reset=%b,load=%b,pin=%b,pout=%b",$time,clk,reset,load,pin,pout);

    reset=1; load=0; pin=8'b00000000; #10;
    reset=0; load=1; pin=8'b10110100; #10;
    load=0; #10;
    load=0; #10;
    load=1; pin=8'b11001010; #10;
    load=0; #10;
    load=0; #10;
    reset=1; #10;
    reset=0; load=0; #10;

    $finish;

end
endmodule