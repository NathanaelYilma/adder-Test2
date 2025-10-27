`timescale 1ns / 1ps

module tb_adders;

    reg cin_in; // carry input used for all the adders

    //input and output signals for all the 8,16,32,64 bit adders
    reg [7:0] a_in8, b_in8;
    wire [7:0] s_rca8, s_cla8, s_pref8;   
    wire c_rca8, c_cla8, c_pref8;

    reg [15:0] a_in16, b_in16;
    wire [15:0] s_rca16, s_cla16, s_pref16;  
    wire c_rca16, c_cla16, c_pref16;

    reg [31:0] a_in32, b_in32;
    wire [31:0] s_rca32, s_cla32, s_pref32;  
    wire c_rca32, c_cla32, c_pref32;

    reg [63:0] a_in64, b_in64;
    wire [63:0] s_rca64, s_cla64, s_pref64;  
    wire c_rca64, c_cla64, c_pref64;



    // connects the different types of bits of each adder then displays them down below
    rca #(.N(8)) rca8 (.a(a_in8), .b(b_in8), .cin(cin_in), .s(s_rca8), .cout(c_rca8));
    cla #(.N(8)) cla8 (.a(a_in8), .b(b_in8), .cin(cin_in), .s(s_cla8), .cout(c_cla8));
    prefix #(.N(8)) pref8 (.a(a_in8), .b(b_in8), .cin(cin_in), .s(s_pref8), .cout(c_pref8));


    rca #(.N(16)) rca16 (.a(a_in16), .b(b_in16), .cin(cin_in), .s(s_rca16), .cout(c_rca16));
    cla #(.N(16)) cla16 (.a(a_in16), .b(b_in16), .cin(cin_in), .s(s_cla16), .cout(c_cla16));
    prefix #(.N(16)) pref16(.a(a_in16), .b(b_in16), .cin(cin_in), .s(s_pref16), .cout(c_pref16));


    rca #(.N(32)) rca32 (.a(a_in32), .b(b_in32), .cin(cin_in), .s(s_rca32), .cout(c_rca32));
    cla #(.N(32)) cla32 (.a(a_in32), .b(b_in32), .cin(cin_in), .s(s_cla32), .cout(c_cla32));
    prefix #(.N(32)) pref32(.a(a_in32), .b(b_in32), .cin(cin_in), .s(s_pref32), .cout(c_pref32));


    rca #(.N(64)) rca64 (.a(a_in64), .b(b_in64), .cin(cin_in), .s(s_rca64), .cout(c_rca64));
    cla #(.N(64)) cla64 (.a(a_in64), .b(b_in64), .cin(cin_in), .s(s_cla64), .cout(c_cla64));
    prefix #(.N(64)) pref64(.a(a_in64), .b(b_in64), .cin(cin_in), .s(s_pref64), .cout(c_pref64));

    always @* begin
end

    initial begin
    // basically sets everything to 0 at the start
    cin_in = 0;
    
    a_in8 = 0;
    b_in8 = 0;
    a_in16 = 0;
    b_in16 = 0;
    a_in32 = 0;
    b_in32 = 0;
    a_in64 = 0;
    b_in64 = 0;
    
    #10; // first test
    a_in8 = 120;
    b_in8 = 80;
    a_in16 = 23000;
    b_in16 = 17000;
    a_in32 = 900000;
    b_in32 = 100000;
    a_in64 = 7000000;
    b_in64 = 80000000;
    
    #10; // second test
    a_in8 = 150;
    b_in8 = 100;
    a_in16 = 40000;
    b_in16 = 2000;
    a_in32 = 1200000000;
    b_in32 = 300000000;
    a_in64 = 1500000000;
    b_in64 = 500000000;
    
    #10; // third test
    a_in8 = 200;
    b_in8 = 50;
    a_in16 = 30000;
    b_in16 = 30000;
    a_in32 = 2000000000;
    b_in32 = 100000000;
    a_in64 = 2000000000;
    b_in64 = 2000000000;
    
    // this is the display for all the adders which just shows all the additions for each
    #10;
    $display("--- Results at time %0t ---", $time);
    
    $display("8 bit RCA: %0d + %0d = %0d (Cout=%b)", a_in8, b_in8, s_rca8, c_rca8);
    $display("8 bit CLA: %0d + %0d = %0d (Cout=%b)", a_in8, b_in8, s_cla8, c_cla8);
    $display("8 bit Prefix: %0d + %0d = %0d (Cout=%b)\n", a_in8, b_in8, s_pref8, c_pref8);


    $display("16 bit RCA: %0d + %0d = %0d (Cout=%b)", a_in16, b_in16, s_rca16, c_rca16);
    $display("16 bit CLA: %0d + %0d = %0d (Cout=%b)", a_in16, b_in16, s_cla16, c_cla16);
    $display("16 bit Prefix: %0d + %0d = %0d (Cout=%b)\n", a_in16, b_in16, s_pref16, c_pref16);


    $display("32 bit RCA: %0d + %0d = %0d (Cout=%b)", a_in32, b_in32, s_rca32, c_rca32);
    $display("32 bit CLA: %0d + %0d = %0d (Cout=%b)", a_in32, b_in32, s_cla32, c_cla32);
    $display("32 bit Prefix: %0d + %0d = %0d (Cout=%b)\n", a_in32, b_in32, s_pref32, c_pref32);


    $display("64 bit RCA: %0d + %0d = %0d (Cout=%b)", a_in64, b_in64, s_rca64, c_rca64);
    $display("64 bit CLA: %0d + %0d = %0d (Cout=%b)", a_in64, b_in64, s_cla64, c_cla64);
    $display("64 bit Prefix: %0d + %0d = %0d (Cout=%b)\n", a_in64, b_in64, s_pref64, c_pref64);

    $display("All the adders simulated");
    
    #10;
    $finish;
    
end

endmodule
