`timescale 1ns/1ps
module tb_lab8_g61_p1_v2();
logic clk,reset,we;
logic pc_update;
logic [31:0] pc_new;
logic [31:0] pc;
logic [31:0] komut;

lab8_g61_p1 uut0(.clk,.reset(reset),.pc(pc),.pc_update(pc_update),.pc_new(pc_new));

 initial
begin 
	reset = 0; #5;
	reset = 1;
end

 initial
begin
	pc = 32'd100; #20;
	pc = 32'd50;  #20;
	pc = 32'd25;  #20;
$stop;
end

 always
begin
	clk <= 0;#5;
	clk <= 1;#5;
end 

hafiza umm (.clk(clk),.reset(reset),.we(we),.addr(pc));

module hafiza (
input logic clk,reset,
input logic we,
input logic [31:0] waddr,addr,
output logic [31:0] komut
);
logic [0:63] mem [0:31];
assign addr = pc[29:0];

initial begin 
$readmemb("fib20.mem",mem);
end

assign addr = {2'b0,pc[29:0]};
assign komut = mem[addr/4];
endmodule

endmodule
