`timescale 1ns / 1ps
// ====================================================================
// Standard 4-bit Priority Encoder (PE4)
// (Base module, no changes needed)
// ====================================================================
module pe4 (
    input  wire [3:0] d,
    output wire [1:0] q,
    output wire       v
);
    assign q[1] = d[3] | d[2];
    assign q[0] = d[3] | (d[1] & ~d[2]);
    assign v = |d;
endmodule

// ====================================================================
// 16-bit Priority Encoder (PE16)
// (Replaced 'case' block with a 4:1 MUX)
// ====================================================================
module pe16 (
    input  wire [15:0] d,
    output wire [3:0]  q,
    output wire        v
);
    wire [3:0] row_status;
    wire [1:0] row_index;
    wire [1:0] col_index;
    wire       row_valid;
    wire [3:0] selected_row; // Changed from reg to wire

    assign row_status[0] = |d[3:0];
    assign row_status[1] = |d[7:4];
    assign row_status[2] = |d[11:8];
    assign row_status[3] = |d[15:12];

    pe4 row_pe (
        .d(row_status),
        .q(row_index),
        .v(row_valid)
    );

    // MUX-based selection for selected_row (4:1 MUX, 4-bits wide)
    // S[1:0] = row_index
    // I0 = d[3:0], I1 = d[7:4], I2 = d[11:8], I3 = d[15:12]
    assign selected_row = (row_index == 2'b00) ? d[3:0]    :
                          (row_index == 2'b01) ? d[7:4]    :
                          (row_index == 2'b10) ? d[11:8]   :
                          (row_index == 2'b11) ? d[15:12]  : 4'b0000; // Default case

    pe4 col_pe (
        .d(selected_row),
        .q(col_index),
        .v() // valid bit is not needed here
    );

    assign q = {row_index, col_index};
    assign v = row_valid;
endmodule

// ====================================================================
// 64-bit Priority Encoder (PE64_standard)
// (Replaced 16-input 'case' with a two-stage 4:1 MUX tree)
// ====================================================================
module pe64_standard (
    input  wire [63:0] d,
    output wire [5:0]  q,
    output wire        v
);
    wire [15:0] row_status;
    wire [3:0]  selected_row; // Changed from reg to wire
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

    // 16:1 MUX for selected_row using two stages of 4:1 MUXes (4 bits wide each)
    wire [3:0] mux_stage1_out0; // Group 0: d[15:0] selected by row_index[1:0]
    wire [3:0] mux_stage1_out1; // Group 1: d[31:16] selected by row_index[1:0]
    wire [3:0] mux_stage1_out2; // Group 2: d[47:32] selected by row_index[1:0]
    wire [3:0] mux_stage1_out3; // Group 3: d[63:48] selected by row_index[1:0]

    // --- Stage 1 MUXes (Select lines S[1:0] = row_index[1:0]) ---
    // MUX 0
    assign mux_stage1_out0 = (row_index[1:0] == 2'b00) ? d[3:0]    :
                             (row_index[1:0] == 2'b01) ? d[7:4]    :
                             (row_index[1:0] == 2'b10) ? d[11:8]   : d[15:12];
    // MUX 1
    assign mux_stage1_out1 = (row_index[1:0] == 2'b00) ? d[19:16]  :
                             (row_index[1:0] == 2'b01) ? d[23:20]  :
                             (row_index[1:0] == 2'b10) ? d[27:24]  : d[31:28];
    // MUX 2
    assign mux_stage1_out2 = (row_index[1:0] == 2'b00) ? d[35:32]  :
                             (row_index[1:0] == 2'b01) ? d[39:36]  :
                             (row_index[1:0] == 2'b10) ? d[43:40]  : d[47:44];
    // MUX 3
    assign mux_stage1_out3 = (row_index[1:0] == 2'b00) ? d[51:48]  :
                             (row_index[1:0] == 2'b01) ? d[55:52]  :
                             (row_index[1:0] == 2'b10) ? d[59:56]  : d[63:60];

    // --- Stage 2 MUX (Select lines S[1:0] = row_index[3:2]) ---
    assign selected_row = (row_index[3:2] == 2'b00) ? mux_stage1_out0 :
                          (row_index[3:2] == 2'b01) ? mux_stage1_out1 :
                          (row_index[3:2] == 2'b10) ? mux_stage1_out2 :
                          (row_index[3:2] == 2'b11) ? mux_stage1_out3 : 4'b0000;

    pe4 col_pe (
        .d(selected_row),
        .q(col_index),
        .v()
    );

    assign q = {row_index, col_index};
    assign v = row_valid;
endmodule

// ====================================================================
// 64-bit Priority Encoder (PE64_lookahead)
// (Replaced 'casex' with a 16:1 MUX tree selected by row_index)
// ====================================================================
module pe64_lookahead (
    input  wire [63:0] d,
    output wire [5:0]  q,
    output wire        v
);
    wire [15:0] dor;
    wire [3:0]  row_index;
    wire [3:0]  column_data; // Changed from reg+wire to single wire
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

    // The 'casex' block is replaced by a standard 16:1 MUX (as a 4:1 MUX tree)
    // that uses the pre-computed 'row_index' as its select signal.
    // This maintains the original priority logic, which is now fully
    // encapsulated within the 'pe16 row_encoder'.

    wire [3:0] mux_stage1_out0;
    wire [3:0] mux_stage1_out1;
    wire [3:0] mux_stage1_out2;
    wire [3:0] mux_stage1_out3;

    // --- Stage 1 MUXes (Select lines S[1:0] = row_index[1:0]) ---
    assign mux_stage1_out0 = (row_index[1:0] == 2'b00) ? d[3:0]    :
                             (row_index[1:0] == 2'b01) ? d[7:4]    :
                             (row_index[1:0] == 2'b10) ? d[11:8]   : d[15:12];

    assign mux_stage1_out1 = (row_index[1:0] == 2'b00) ? d[19:16]  :
                             (row_index[1:0] == 2'b01) ? d[23:20]  :
                             (row_index[1:0] == 2'b10) ? d[27:24]  : d[31:28];

    assign mux_stage1_out2 = (row_index[1:0] == 2'b00) ? d[35:32]  :
                             (row_index[1:0] == 2'b01) ? d[39:36]  :
                             (row_index[1:0] == 2'b10) ? d[43:40]  : d[47:44];

    assign mux_stage1_out3 = (row_index[1:0] == 2'b00) ? d[51:48]  :
                             (row_index[1:0] == 2'b01) ? d[55:52]  :
                             (row_index[1:0] == 2'b10) ? d[59:56]  : d[63:60];

    // --- Stage 2 MUX (Select lines S[1:0] = row_index[3:2]) ---
    assign column_data = (row_index[3:2] == 2'b00) ? mux_stage1_out0 :
                         (row_index[3:2] == 2'b01) ? mux_stage1_out1 :
                         (row_index[3:2] == 2'b10) ? mux_stage1_out2 :
                         (row_index[3:2] == 2'b11) ? mux_stage1_out3 : 4'b0000;

    pe4 col_encoder (
        .d(column_data),
        .q(col_index),
        .v()
    );

    assign q = {row_index, col_index};
    assign v = row_valid;
endmodule

// ====================================================================
// 256-bit Priority Encoder (PE256_scalable)
// (Original code already uses the 4:1 MUX conditional operator)
// ====================================================================
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

    // This is the 4:1 MUX (64-bits wide) for block selection.
    // This structure is correct for synthesis.
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
