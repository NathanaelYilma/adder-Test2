`timescale 1ns / 1ps

module tb_adders;

reg [63:0] a_in, b_in;
reg cin_in;

wire [7:0] s_rca8, s_cla8, s_pref8;
wire c_rca8, c_cla8, c_pref8;

wire [15:0] s_rca16, s_cla16, s_pref16;
wire c_rca16, c_cla16, c_pref16;

wire [31:0] s_rca32, s_cla32, s_pref32;
wire c_rca32, c_cla32, c_pref32;

wire [63:0] s_rca64, s_cla64, s_pref64;
wire c_rca64, c_cla64, c_pref64;

// 8 bis
rca #(.N(8)) rca8 (.a(a_in[7:0]), .b(b_in[7:0]), .cin(cin_in), .s(s_rca8), .cout(c_rca8));
cla #(.N(8)) cla8 (.a(a_in[7:0]), .b(b_in[7:0]), .cin(cin_in), .s(s_cla8), .cout(c_cla8));
prefix #(.N(8)) pref8 (.a(a_in[7:0]), .b(b_in[7:0]), .cin(cin_in), .s(s_pref8), .cout(c_pref8));

// 16 bits
rca #(.N(16)) rca16 (.a(a_in[15:0]), .b(b_in[15:0]), .cin(cin_in), .s(s_rca16), .cout(c_rca16));
cla #(.N(16)) cla16 (.a(a_in[15:0]), .b(b_in[15:0]), .cin(cin_in), .s(s_cla16), .cout(c_cla16));
prefix #(.N(16)) pref16 (.a(a_in[15:0]), .b(b_in[15:0]), .cin(cin_in), .s(s_pref16), .cout(c_pref16));

// 32 bits
rca #(.N(32)) rca32 (.a(a_in[31:0]), .b(b_in[31:0]), .cin(cin_in), .s(s_rca32), .cout(c_rca32));
cla #(.N(32)) cla32 (.a(a_in[31:0]), .b(b_in[31:0]), .cin(cin_in), .s(s_cla32), .cout(c_cla32));
prefix #(.N(32)) pref32 (.a(a_in[31:0]), .b(b_in[31:0]), .cin(cin_in), .s(s_pref32), .cout(c_pref32));

// 64 bits
rca #(.N(64)) rca64 (.a(a_in[63:0]), .b(b_in[63:0]), .cin(cin_in), .s(s_rca64), .cout(c_rca64));
cla #(.N(64)) cla64 (.a(a_in[63:0]), .b(b_in[63:0]), .cin(cin_in), .s(s_cla64), .cout(c_cla64));
prefix #(.N(64)) pref64 (.a(a_in[63:0]), .b(b_in[63:0]), .cin(cin_in), .s(s_pref64), .cout(c_pref64));

initial begin
    $dumpfile("tb_adders.vcd");
    $dumpvars(0, tb_adders);
end


task show_result8;
    reg [8:0] expected_sum;
    begin
        expected_sum = a_in[7:0] + b_in[7:0] + cin_in;
        $display("8 bit  a=%h b=%h cin=%b | rca s=%h c=%b | cla s=%h c=%b | pref s=%h c=%b | output=%h",
                 a_in[7:0], b_in[7:0], cin_in,
                 s_rca8, c_rca8, s_cla8, c_cla8, s_pref8, c_pref8, expected_sum);
        if (s_rca8===expected_sum[7:0] && c_rca8===expected_sum[8] && s_cla8===expected_sum[7:0] && c_cla8===expected_sum[8] && s_pref8===expected_sum[7:0] && c_pref8===expected_sum[8]) $display("8 Pass"); else $display("8 Fail");
    end
endtask


task show_result16;
    reg [16:0] expected_sum;
    begin
        expected_sum = a_in[15:0] + b_in[15:0] + cin_in;
        $display("16 bit a=%h b=%h cin=%b | rca s=%h c=%b | cla s=%h c=%b | pref s=%h c=%b | output=%h",
                 a_in[15:0], b_in[15:0], cin_in,
                 s_rca16, c_rca16, s_cla16, c_cla16, s_pref16, c_pref16, expected_sum);
        if (s_rca16===expected_sum[15:0] && c_rca16===expected_sum[16] && s_cla16===expected_sum[15:0] && c_cla16===expected_sum[16] && s_pref16===expected_sum[15:0] && c_pref16===expected_sum[16]) $display("16 Pass"); else $display("16 Fail");
    end
endtask


task show_result32;
    reg [32:0] expected_sum;
    begin
        expected_sum = a_in[31:0] + b_in[31:0] + cin_in;
        $display("32 bit a=%h b=%h cin=%b | rca s=%h c=%b | cla s=%h c=%b | pref s=%h c=%b | output=%h",
                 a_in[31:0], b_in[31:0], cin_in,
                 s_rca32, c_rca32, s_cla32, c_cla32, s_pref32, c_pref32, expected_sum);
        if (s_rca32===expected_sum[31:0] && c_rca32===expected_sum[32] && s_cla32===expected_sum[31:0] && c_cla32===expected_sum[32] && s_pref32===expected_sum[31:0] && c_pref32===expected_sum[32]) $display("32 Pass"); else $display("32 Fail");
    end
endtask


task show_result64;
    reg [64:0] expected_sum;
    begin
        expected_sum = a_in[63:0] + b_in[63:0] + cin_in;
        $display("64 bit a=%h b=%h cin=%b | rca s=%h c=%b | cla s=%h c=%b | pref s=%h c=%b | output=%h",
                 a_in[63:0], b_in[63:0], cin_in,
                 s_rca64, c_rca64, s_cla64, c_cla64, s_pref64, c_pref64, expected_sum);
        if (s_rca64===expected_sum[63:0] && c_rca64===expected_sum[64] && s_cla64===expected_sum[63:0] && c_cla64===expected_sum[64] && s_pref64===expected_sum[63:0] && c_pref64===expected_sum[64]) $display("64 Pass"); else $display("64 Fail");
    end
endtask


initial begin
    $display("starting all adders tests");

    $display("\n---8 bit");
    a_in = 0; b_in = 0; cin_in = 0; #10; show_result8();
    a_in = 1; b_in = 1; cin_in = 0; #10; show_result8();
    a_in = 8'hFF; b_in = 1; cin_in = 0; #10; show_result8();
    a_in = 8'hA5; b_in = 8'h3C; cin_in = 1; #10; show_result8();



    $display("\n---16 bit");
    a_in = 0; b_in = 0; cin_in = 0; #10; show_result16();
    a_in = 1; b_in = 1; cin_in = 0; #10; show_result16();
    a_in = 16'hFFFF; b_in = 1; cin_in = 0; #10; show_result16();
    a_in = 16'hA5A5; b_in = 16'h3C3C; cin_in = 1; #10; show_result16();



    $display("\n---32 bit");
    a_in = 0; b_in = 0; cin_in = 0; #10; show_result32();
    a_in = 1; b_in = 1; cin_in = 0; #10; show_result32();
    a_in = 32'hFFFFFFFF; b_in = 1; cin_in = 0; #10; show_result32();
    a_in = 32'hA5A5A5A5; b_in = 32'h3C3C3C3C; cin_in = 1; #10; show_result32();



    $display("\n---64 bit");
    a_in = 0; b_in = 0; cin_in = 0; #10; show_result64();
    a_in = 1; b_in = 1; cin_in = 0; #10; show_result64();
    a_in = 64'hFFFFFFFFFFFFFFFF; b_in = 1; cin_in = 0; #10; show_result64();
    a_in = 64'hA5A5A5A5A5A5A5A5; b_in = 64'h3C3C3C3C3C3C3C3C; cin_in = 1; #10; show_result64();



    $display("\n testing done");
    #100;
    $finish;
    
end

endmodule
