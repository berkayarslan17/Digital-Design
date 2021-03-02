`timescale 1ns/1ps
module tb_lab5_g61_p1();

logic clk, en, reset;
logic [4:0] psc;
logic [15:0] reload;

lab5_g61_p1 dut0(.clk(clk), .reset(reset), .en(en), .psc(psc), .tick(tick), .counter(counter));

always begin

clk = 0; #5;
clk = 1; #5;
end

initial begin

en = 0; reset = 0; #20;
reset = 1; #20; en = 1;
end

initial begin

psc <= 5'h1;
reload <= 16'hA;
#1000;
$stop;
end

endmodule
