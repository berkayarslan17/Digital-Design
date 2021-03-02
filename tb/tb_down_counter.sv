`timescale 1ns/1ps
module tb_lab5_g61_p2();

logic clk, en, reset;
logic [4:0] psc;
logic tick, done;
logic [15:0] reload, cnt;

lab5_g61_p2 dut1(.clk(clk), .reset(reset), .reload(reload), .done(done), .cnt(cnt), .en(en),  .tick(tick), .psc(psc));

initial begin

psc <= 5'b00111;
reload <= 16'h000A;
#1500;
reload <= 16'h0007;
end


initial begin

en = 1; reset = 1; #5;
reset = 0;  en = 0;
#1500;
en = 1; reset = 1; #5;
end


always begin

clk = 0; #3;
clk = 1; #3;
end

initial begin
#3000; $stop;
end



endmodule
