`timescale 1ns/1ps
module tb_lab8_g61_p1_v1();
logic clk,reset,we;
logic pc_update;
logic [31:0] pc_new;
logic [31:0] pc;

lab8_g61_p1 uut0(.clk,.reset(reset),.pc(pc),.pc_update(pc_update),.pc_new(pc_new));

 always
begin
	clk = 0;#5;
	clk = 1;#5;
end 

 initial
begin
	pc_new = 32'd5;
	pc_update = 0; #50;
	pc_update = 1; #50;
	pc_update = 0; #50;
	pc_update = 1; #50;
	we = 0;  
$stop; #200;
end

 initial
begin 
	reset = 0; #5;
	reset = 1;
end

endmodule
