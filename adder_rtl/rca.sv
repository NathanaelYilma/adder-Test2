module rca #(parameter N=32) (
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    input  logic cin,
    output logic [N-1:0] s,
    output logic cout
    );
    
    logic [N:0] carrys;
    assign carrys[0] = cin;

    genvar i;
    generate
        for (i=0; i<N; i=i+1) begin
            fulladder fa_inst(
                .a(a[i]),
                .b(b[i]),
                .cin(carrys[i]),
                .s(s[i]),
                .cout(carrys[i+1])
                );
            
        end
    endgenerate

    assign cout = carrys[N];
    
endmodule