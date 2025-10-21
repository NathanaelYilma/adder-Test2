`timescale 1ns / 1ps

module tb_adders;

parameter N = 32;

reg [N-1:0] a_in, b_in;
reg cin_in;
wire [N-1:0] s_out;
wire cout_out;

cla #(.N(N)) uut (
    .a(a_in), 
    .b(b_in), 
    .cin(cin_in), 
    .s(s_out), 
    .cout(cout_out)
);


initial begin
    $dumpfile("tb_adders.vcd");
    $dumpvars(0, tb_adders);
    
    $display("Starting initial testbench...");
    

    a_in = 0; b_in = 0; cin_in = 0;
    #10;
    $display("a=%h, b=%h, cin=%b -> s=%h, cout=%b", a_in, b_in, cin_in, s_out, cout_out);

    a_in = 1; b_in = 1; cin_in = 0;
    #10;
    $display("a=%h, b=%h, cin=%b -> s=%h, cout=%b", a_in, b_in, cin_in, s_out, cout_out);
    
    a_in = 32'hFFFFFFFF; b_in = 1; cin_in = 0;
    #10;
    $display("a=%h, b=%h, cin=%b -> s=%h, cout=%b", a_in, b_in, cin_in, s_out, cout_out);

    a_in = 32'hA5A5A5A5; b_in = 32'h3C3C3C3C; cin_in = 1;
    #10;
    $display("a=%h, b=%h, cin=%b -> s=%h, cout=%b", a_in, b_in, cin_in, s_out, cout_out);

    $display("Test finished.");
    #100;
    $finish;

end


endmodule