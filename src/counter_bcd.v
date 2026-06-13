module counter_bcd(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] count
);

always@(posedge clk or posedge reset)
begin
    if(reset) count <= 4'b0000;
    else begin
        if(enable) begin
            if(count==9) count <= 4'b0000;
            else count <= count+1;
        end
        else count <= count;
    end
end
endmodule