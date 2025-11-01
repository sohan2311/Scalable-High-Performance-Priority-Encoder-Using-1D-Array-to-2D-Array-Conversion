
module pe4 (
    input  wire [3:0] d,
    output wire [1:0] q,
    output wire       v
);
    assign q[1] = d[3] | d[2];
    assign q[0] = d[3] | (d[1] & ~d[2]);
    assign v = |d;
endmodule

module pe16 (
    input  wire [15:0] d,
    output wire [3:0]  q,
    output wire        v
);
    wire [3:0] row_status;
    reg  [3:0] selected_row;
    wire [1:0] row_index;
    wire [1:0] col_index;
    wire       row_valid;

    assign row_status[0] = |d[3:0];
    assign row_status[1] = |d[7:4];
    assign row_status[2] = |d[11:8];
    assign row_status[3] = |d[15:12];

    pe4 row_pe (
        .d(row_status),
        .q(row_index),
        .v(row_valid)
    );

    always @(*) begin
        case (row_index)
            2'b00: selected_row = d[3:0];
            2'b01: selected_row = d[7:4];
            2'b10: selected_row = d[11:8];
            2'b11: selected_row = d[15:12];
            default: selected_row = 4'b0000;
        endcase
    end

    pe4 col_pe (
        .d(selected_row),
        .q(col_index),
        .v()
    );

    assign q = {row_index, col_index};
    assign v = row_valid;
endmodule

module pe64_standard (
    input  wire [63:0] d,
    output wire [5:0]  q,
    output wire        v
);
    wire [15:0] row_status;
    reg  [3:0]  selected_row;
    wire [3:0]  row_index;
    wire [1:0]  col_index;
    wire        row_valid;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : row_logic
            assign row_status[i] = |d[(i*4)+3 : i*4];
        end
    endgenerate

    pe16 row_pe (
        .d(row_status),
        .q(row_index),
        .v(row_valid)
    );

    always @(*) begin
        case (row_index)
            4'h0: selected_row = d[3:0];   4'h1: selected_row = d[7:4];
            4'h2: selected_row = d[11:8];  4'h3: selected_row = d[15:12];
            4'h4: selected_row = d[19:16]; 4'h5: selected_row = d[23:20];
            4'h6: selected_row = d[27:24]; 4'h7: selected_row = d[31:28];
            4'h8: selected_row = d[35:32]; 4'h9: selected_row = d[39:36];
            4'hA: selected_row = d[43:40]; 4'hB: selected_row = d[47:44];
            4'hC: selected_row = d[51:48]; 4'hD: selected_row = d[55:52];
            4'hE: selected_row = d[59:56]; 4'hF: selected_row = d[63:60];
            default: selected_row = 4'b0000;
        endcase
    end

    pe4 col_pe (
        .d(selected_row),
        .q(col_index),
        .v()
    );

    assign q = {row_index, col_index};
    assign v = row_valid;
endmodule

module pe64_lookahead (
    input  wire [63:0] d,
    output wire [5:0]  q,
    output wire        v
);
    wire [15:0] dor;
    wire [3:0]  row_index;
    wire [3:0]  column_data;
    wire [1:0]  col_index;
    wire        row_valid;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : row_or_logic
            assign dor[i] = |d[(i*4)+3 : i*4];
        end
    endgenerate

    pe16 row_encoder (
        .d(dor),
        .q(row_index),
        .v(row_valid)
    );

    reg [3:0] column_data_reg;
    always @(*) begin
        casex(dor)
            16'b1xxxxxxxxxxxxxxx: column_data_reg = d[63:60];
            16'b01xxxxxxxxxxxxxx: column_data_reg = d[59:56];
            16'b001xxxxxxxxxxxxx: column_data_reg = d[55:52];
            16'b0001xxxxxxxxxxxx: column_data_reg = d[51:48];
            16'b00001xxxxxxxxxxx: column_data_reg = d[47:44];
            16'b000001xxxxxxxxxx: column_data_reg = d[43:40];
            16'b0000001xxxxxxxxx: column_data_reg = d[39:36];
            16'b00000001xxxxxxxx: column_data_reg = d[35:32];
            16'b000000001xxxxxxx: column_data_reg = d[31:28];
            16'b0000000001xxxxxx: column_data_reg = d[27:24];
            16'b00000000001xxxxx: column_data_reg = d[23:20];
            16'b000000000001xxxx: column_data_reg = d[19:16];
            16'b0000000000001xxx: column_data_reg = d[15:12];
            16'b00000000000001xx: column_data_reg = d[11:8];
            16'b000000000000001x: column_data_reg = d[7:4];
            16'b0000000000000001: column_data_reg = d[3:0];
            default:              column_data_reg = 4'b0;
        endcase
    end

    assign column_data = column_data_reg;

    pe4 col_encoder (
        .d(column_data),
        .q(col_index),
        .v()
    );

    assign q = {row_index, col_index};
    assign v = row_valid;
endmodule

module pe256_scalable (
    input  wire [255:0] d,
    output wire [7:0]   q,
    output wire         v
);
    wire [3:0] block_status;
    wire [1:0] block_index;
    wire [5:0] internal_index;
    wire       block_valid, internal_valid;

    assign block_status[0] = |d[63:0];
    assign block_status[1] = |d[127:64];
    assign block_status[2] = |d[191:128];
    assign block_status[3] = |d[255:192];

    pe4 block_selector (
        .d(block_status),
        .q(block_index),
        .v(block_valid)
    );

    wire [63:0] selected_block;
    assign selected_block = (block_index == 2'b00) ? d[63:0]     :
                            (block_index == 2'b01) ? d[127:64]   :
                            (block_index == 2'b10) ? d[191:128]  :
                            (block_index == 2'b11) ? d[255:192]  : 64'b0;

    pe64_lookahead internal_pe (
        .d(selected_block),
        .q(internal_index),
        .v(internal_valid)
    );

    assign q = {block_index, internal_index};
    assign v = block_valid;
endmodule
