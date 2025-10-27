`timescale 1ns / 1ps

module pg_combine(
    input logic p_in1, g_in1,
    input logic p_in2, g_in2,
    output logic p_out, g_out
    );
    
    assign p_out = p_in1 & p_in2;
    // this just makse it if generate 2 or if generate 1 and propagate 2 passes on makes a carry adder
    assign g_out = g_in1 | (p_in1 & g_in2);
    
endmodule