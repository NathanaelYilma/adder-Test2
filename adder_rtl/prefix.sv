`timescale 1ns / 1ps

module prefix #(parameter N = 32) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic cin,
    output logic [N-1:0] s,
    output logic cout
    );
    
    //p_stage and g_stage hold all the propageate and gernate signals
    logic [$clog2(N):0][N-1:0] p_stage, g_stage;
    logic [N:0] c; // c just keeps track of all the carry bits from cin and cout
    
    assign p_stage[0] = a|b;
    assign g_stage[0] = a&b;
    
    
    // each stage doubles how far the carry can travel
    genvar stage, bit_num;
    generate
        for (stage = 0; stage < $clog2(N); stage = stage + 1) begin
            for (bit_num = 0; bit_num < N; bit_num = bit_num + 1) begin
                if (bit_num >= (1 << stage)) begin
                    pg_combine block_inst(
                        .p_in1(p_stage[stage][bit_num]),
                        .g_in1(g_stage[stage][bit_num]),
                        .p_in2(p_stage[stage][bit_num - (1 << stage)]),
                        .g_in2(g_stage[stage][bit_num - (1 << stage)]),
                        .p_out(p_stage[stage+1][bit_num]),
                        .g_out(g_stage[stage+1][bit_num])
                        );
                        
                end 
                
                //if not then just copies the previous stages values
                else begin
                    assign p_stage[stage+1][bit_num] = p_stage[stage][bit_num];
                    assign g_stage[stage+1][bit_num] = g_stage[stage][bit_num];
                end
            end
        end
        
    endgenerate
    
assign c[0] = cin;
    
    // goes through every bit and calculates its carry
    genvar k;
    generate
       for (k = 0; k < N; k = k + 1) begin
          // carry at bit k+1 happens if this bit generates one or if it just passes one that started from the first cin
          assign c[k+1] = g_stage[$clog2(N)][k] | (p_stage[$clog2(N)][k] & cin);
       end
    endgenerate
    
    
    assign s = (a^b)^c[N-1:0];
    assign cout = c[N];
    
endmodule
