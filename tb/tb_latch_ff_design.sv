/*	tb_lab4_g61_p1.sv
 *
 *	Hazirlayan:
 *		Furkan Conkur
 *		Berkay Arslan
 *
 * README:
 *		202004018_elm235_lab4_problem1
 *		HDL kullanarak Latch, Rising-edge triggered Flip-Flop ve Falling-edge triggered Flip-Flop olusturulmu? devrenin testbench dosyasi
 *
 */
 
`timescale 1ns/1ps
 
module tb_lab4_g61_p1();

	logic clk, d;
	logic q1, q2, q3;
	
	lab4_g61_p1 uut0(.clk(clk), .d(d), .q1(q1), .q2(q2), .q3(q3));
	
	always
	begin
		clk = 0; #10;
		clk = 1; #10;
	end
	
	initial begin
		d = 0; #7;
		d = 1; #5; 
		d = 0; #2;
		d = 1; #4; 
		d = 0; #3; 
		d = 1; #3;
		d = 0; #2; 
		d = 1; #2; 
		d = 0; #4;
		d = 1; #2; 
		d = 0; #2; 
		d = 1; #6;
		d = 0; #10;
		
		$stop;
	end
	
endmodule
