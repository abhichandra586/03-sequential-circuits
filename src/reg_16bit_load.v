module reg_16bit_load(
    input wire clk,
    input wire reset,
    input wire load,
    input wire [15:0] d,
    output wire [15:0] q
);

genvar i;

generate
    for(i=0;i<=15;i=i+1)
    begin : reg_16bit_load_stage
    dff_load inst(
        .clk(clk),
        .reset(reset),
        .load(load),
        .d(d[i]),
        .q(q[i])
    );
    end
endgenerate
endmodule