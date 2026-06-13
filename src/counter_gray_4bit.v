module counter_gray_4bit(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] count
);

reg [3:0] bcd_count;

always @(posedge clk or posedge reset)
begin
    if(reset) bcd_count<=4'b0000;
    else begin
        if(enable) bcd_count<=bcd_count+1;
        else bcd_count<=bcd_count;
    end
end

always @(*) begin
    count = bcd_count^(bcd_count >> 1);
end
endmodule