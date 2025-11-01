`timescale 1ns / 1ps
`include "priority.v"

module tb_pe256_selfchecking();

    reg  [255:0] tb_d;
    wire [7:0]   tb_q;
    wire         tb_v;

    integer error_count;
    reg [7:0] expected_q;
    integer i;

    pe256_from_64 dut (
        .d(tb_d),
        .q(tb_q),
        .v(tb_v)
    );

    // CORRECTED FUNCTION FOR VERILOG-2001
    function [7:0] get_expected_q(input [255:0] d);
        integer i;
        begin : find_bit_block // Named block for disable
            get_expected_q = 8'b0; // Default value if no bit is set
            for (i = 255; i >= 0; i = i - 1) begin
                if (d[i] == 1'b1) begin
                    get_expected_q = i; // Assign return value to function name
                    disable find_bit_block; // Exit the loop and function
                end
            end
        end
    endfunction

    initial begin
        $dumpfile("pe256.vcd");
        $dumpvars(0, tb_pe256_selfchecking);
        error_count = 0;
        
        tb_d = 256'b0;
        #10;
        if (tb_v !== 1'b0) begin
            $display("FAIL: All-zero input, but valid signal is high.");
            error_count = error_count + 1;
        end

        for (i = 0; i < 256; i = i + 1) begin
            tb_d = 0;
            tb_d[i] = 1'b1;
            expected_q = i;
            #10;
            if (tb_q !== expected_q || tb_v !== 1'b1) begin
                $display("FAIL: Input bit %0d | Expected: %0d | Got: %0d", i, expected_q, tb_q);
                error_count = error_count + 1;
            end
        end

        tb_d = 0;
        tb_d[123] = 1'b1;
        tb_d[200] = 1'b1;
        tb_d[5]   = 1'b1;
        expected_q = 200;
        #10;
        if (tb_q !== expected_q) begin
            $display("FAIL: Multi-bit test | Expected: %0d | Got: %0d", expected_q, tb_q);
            error_count = error_count + 1;
        end

        for (i = 0; i < 20; i = i + 1) begin
            tb_d = {$random, $random, $random, $random, $random, $random, $random, $random};
            expected_q = get_expected_q(tb_d);
            #10;
            if (tb_q !== expected_q) begin
                $display("FAIL: Random test | Input: %h | Expected: %0d | Got: %0d", tb_d, expected_q, tb_q);
                error_count = error_count + 1;
            end
        end

        #20;
        if (error_count == 0) begin
            $display("SUCCESS: All tests passed!");
        end else begin
            $display("FAILURE: %0d errors found.", error_count);
        end

        $finish;
    end

endmodule
