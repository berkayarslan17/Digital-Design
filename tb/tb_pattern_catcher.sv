`timescale 1ns/1ps
module tb_lab6_g61_p1();

logic clk, reset, A, Y;

lab6_g61_p1 dut0(.clk(clk), .reset(reset), .A(A), .Y(Y));

always begin

clk = 0; #5;
clk = 1; #5;
end

initial begin
reset = 1; #5;
reset = 0;
A = 1; #10; A = 0; #10; A = 1; #10; A = 1; #10; A = 1; #10; A = 1; #10; A = 1; #10;
A = 0; #10; A = 1; #10; A = 1; #10; A = 0; #10; A = 0; #10; A = 0; #10; A = 0; #10;
end

initial begin
#1500;
$stop;
end;

endmodule
