module reg_4bit(
    input wire clk,
    input wire reset,
    input wire [3:0] d,
    output wire [3:0] q
);

genvar i;

generate
    for(i=0;i<4;i=i+1)
    begin : reg_gen
    dff_async inst(
        .clk(clk),
        .reset(reset),
        .d(d[i]),
        .q(q[i])
    );

    end
    
endgenerate
endmodule