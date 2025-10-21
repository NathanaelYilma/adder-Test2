`timescale 1ns / 1ps

module cla #(parameter N = 32) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic cin,
    output logic [N-1:0] s,
    output logic cout
    );
    
    logic [N/4:0] carry_wires; // carry_wires keeps track of the carry between each of the 4 bit blocks
    assign carry_wires[0] = cin;

// Story time. So the bug I had here before:
// I forgot to connect the carry_wires[i+1] properly in the generate loop so only the
// first 4 bit block worked and the rest were stuck at 0.
// easy fix i just chained each 4 bit block to the next one below so now it passes the carry through correctly now.

    genvar i; // this generates multiple 4 bit cla blocks to build the full ader
    generate
        for (i = 0; i < N/4; i = i + 1) begin
            cla_4bit my_cla_block( //here each 4 bit CLA handles its own small chunks of bits
                .a(a[4*i+3 : 4*i]),
                .b(b[4*i+3 : 4*i]),
                .cin(carry_wires[i]),
                .s(s[4*i+3 : 4*i]),
                .cout(carry_wires[i+1])
                );
                
        end
    endgenerate

    assign cout = carry_wires[N/4]; // the final carry out from the last 4 bit block
    
endmodule