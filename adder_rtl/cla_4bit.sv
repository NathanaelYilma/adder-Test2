`timescale 1ns / 1ps

module cla_4bit(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic cin,
    output logic [3:0] s,
    output logic cout
    );
    
    logic [3:0] p, g; //p is propagate and g is generate
    logic [4:0] c;

    assign c[0] = cin;

    // this figures out which bits to generate or to pass a carry.
    assign p = a|b;
    assign g = a&b;

    // these just carries for each bit so like
    assign c[1] = g[0] | (p[0] & c[0]); // carries into bit 1
    assign c[2] = g[1] | (p[1] & c[1]); // then carries into bit 2
    assign c[3] = g[2] | (p[2] & c[2]); // bit 3
    assign c[4] = g[3] | (p[3] & c[3]); // then to bit 4

    assign s = (a ^ b) ^ c[3:0]; // just sums the bits
    assign cout = c[4];
    
    
endmodule