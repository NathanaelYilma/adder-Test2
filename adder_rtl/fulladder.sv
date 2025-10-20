`timescale 1ns / 1ps

// just a simple 1 bit full adder module
module fulladder(
    input logic a,
    input logic b,
    input logic cin,
    output logic s,
    output logic cout
    );
    
    assign s = a^b^cin;
    assign cout = (a & b)|(a & cin)|(b & cin); // Carry out (cout) carries if two or more inputs are 1
    
endmodule