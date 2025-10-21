module cla #(parameter N = 32) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic cin,
    output logic [N-1:0] s,
    output logic cout
    );
    
    logic [N/4:0] carry_wires;
    assign carry_wires[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N/4; i = i + 1) begin
            cla_4bit my_cla_block(
                .a(a[4*i+3 : 4*i]),
                .b(b[4*i+3 : 4*i]),
                .cin(carry_wires[i]),
                .s(s[4*i+3 : 4*i]),
                .cout(carry_wires[i+1])
                );
                
        end
    endgenerate

    assign cout = carry_wires[N/4];
    
endmodule