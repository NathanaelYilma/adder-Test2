`timescale 1ns / 1ps

module rca #(parameter N=32) ( //N lets me change the bit width
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic cin,
    output logic [N-1:0] s,
    output logic cout
    );
    
    logic [N:0] carrys;
    assign carrys[0] = cin;

// the loop creates N full adders and connects them one after another
    genvar i;
    generate
        for (i=0; i<N; i=i+1) begin // so like this goes from bit 0 to bit N-1
            fulladder fa_inst( // then each bit gets its own full adder
                .a(a[i]), // one bit from input a
                .b(b[i]), // another one bit from input b
                .cin(carrys[i]), // then the carry coming from the previuos bit
                .s(s[i]), // sums it
                .cout(carrys[i+1]) // then carries it out and goes into the next adder
                );
            
        end
    endgenerate

    assign cout = carrys[N];
    
endmodule