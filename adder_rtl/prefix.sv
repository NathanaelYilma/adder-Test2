module prefix #(parameter N = 32) (
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    input  logic cin,
    output logic [N-1:0] s,
    output logic cout
    );
    
    
    logic [$clog2(N):0][N-1:0] p_stage, g_stage;
    logic [N:0] c;
    assign p_stage[0] = a|b;
    assign g_stage[0] = a&b;
    
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
                end else begin
                    assign p_stage[stage+1][bit_num] = p_stage[stage][bit_num];
                    assign g_stage[stage+1][bit_num] = g_stage[stage][bit_num];
                end
            end
        end
        
    endgenerate
assign c[0] = cin;
    genvar k;
    generate
       for (k = 0; k < N; k = k + 1) begin

          assign c[k+1] = g_stage[$clog2(N)][k] | (p_stage[$clog2(N)][k] & cin);
       end
    endgenerate
    assign s = (a^b)^c[N-1:0];
    assign cout = c[N];
    
endmodule