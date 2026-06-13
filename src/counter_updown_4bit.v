module counter_updown_4bit(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire dir,
    output reg [3:0] count
);

always@(posedge clk or posedge reset)
begin
    if(reset) count <= 'b0000;
    else if(enable) begin
        if(dir) count <= count+1;
        else count <= count-1;
    end
    else count <= count;
end
endmodule