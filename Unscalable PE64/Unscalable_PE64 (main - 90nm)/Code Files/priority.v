module pe64_if_else (
    input  wire [63:0] d,
    output reg  [5:0]  q,
    output wire        v
);
    always @(*) begin
        if      (d[63]) q = 6'd63;
        else if (d[62]) q = 6'd62;
        else if (d[61]) q = 6'd61;
        else if (d[60]) q = 6'd60;
        else if (d[59]) q = 6'd59;
        else if (d[58]) q = 6'd58;
        else if (d[57]) q = 6'd57;
        else if (d[56]) q = 6'd56;
        else if (d[55]) q = 6'd55;
        else if (d[54]) q = 6'd54;
        else if (d[53]) q = 6'd53;
        else if (d[52]) q = 6'd52;
        else if (d[51]) q = 6'd51;
        else if (d[50]) q = 6'd50;
        else if (d[49]) q = 6'd49;
        else if (d[48]) q = 6'd48;
        else if (d[47]) q = 6'd47;
        else if (d[46]) q = 6'd46;
        else if (d[45]) q = 6'd45;
        else if (d[44]) q = 6'd44;
        else if (d[43]) q = 6'd43;
        else if (d[42]) q = 6'd42;
        else if (d[41]) q = 6'd41;
        else if (d[40]) q = 6'd40;
        else if (d[39]) q = 6'd39;
        else if (d[38]) q = 6'd38;
        else if (d[37]) q = 6'd37;
        else if (d[36]) q = 6'd36;
        else if (d[35]) q = 6'd35;
        else if (d[34]) q = 6'd34;
        else if (d[33]) q = 6'd33;
        else if (d[32]) q = 6'd32;
        else if (d[31]) q = 6'd31;
        else if (d[30]) q = 6'd30;
        else if (d[29]) q = 6'd29;
        else if (d[28]) q = 6'd28;
        else if (d[27]) q = 6'd27;
        else if (d[26]) q = 6'd26;
        else if (d[25]) q = 6'd25;
        else if (d[24]) q = 6'd24;
        else if (d[23]) q = 6'd23;
        else if (d[22]) q = 6'd22;
        else if (d[21]) q = 6'd21;
        else if (d[20]) q = 6'd20;
        else if (d[19]) q = 6'd19;
        else if (d[18]) q = 6'd18;
        else if (d[17]) q = 6'd17;
        else if (d[16]) q = 6'd16;
        else if (d[15]) q = 6'd15;
        else if (d[14]) q = 6'd14;
        else if (d[13]) q = 6'd13;
        else if (d[12]) q = 6'd12;
        else if (d[11]) q = 6'd11;
        else if (d[10]) q = 6'd10;
        else if (d[9])  q = 6'd9;
        else if (d[8])  q = 6'd8;
        else if (d[7])  q = 6'd7;
        else if (d[6])  q = 6'd6;
        else if (d[5])  q = 6'd5;
        else if (d[4])  q = 6'd4;
        else if (d[3])  q = 6'd3;
        else if (d[2])  q = 6'd2;
        else if (d[1])  q = 6'd1;
        else if (d[0])  q = 6'd0;
        else            q = 6'd0;
    end
    
    assign v = |d;
endmodule


module pe256_from_64 (
    input  wire [255:0] d,
    output reg  [7:0]   q,
    output wire         v
);

    wire [5:0] q0, q1, q2, q3;
    wire       v0, v1, v2, v3;

    pe64_if_else pe3 ( .d(d[255:192]), .q(q3), .v(v3) );
    pe64_if_else pe2 ( .d(d[191:128]), .q(q2), .v(v2) );
    pe64_if_else pe1 ( .d(d[127:64]),  .q(q1), .v(v1) );
    pe64_if_else pe0 ( .d(d[63:0]),    .q(q0), .v(v0) );

    always @(*) begin
        if (v3) begin
            q = {2'b11, q3};
        end
        else if (v2) begin
            q = {2'b10, q2};
        end
        else if (v1) begin
            q = {2'b01, q1};
        end
        else begin
            q = {2'b00, q0};
        end
    end

    assign v = v3 | v2 | v1 | v0;

endmodule
