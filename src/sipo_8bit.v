module sipo_8bit(
    input wire clk,
    input wire reset,
    input wire sin,
    output wire [7:0] pout
);

wire [8:0] s;

assign s[0]=sin;
assign pout=s[8:1];

genvar i;

generate
    for(i=0;i<=7;i=i+1)
    begin : dff_stage
    dff_async inst(
        .clk(clk),
        .reset(reset),
        .d(s[i]),
        .q(s[i+1])
    );
    end
endgenerate

endmodule