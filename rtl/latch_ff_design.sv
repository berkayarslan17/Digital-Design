/*	lab4_g61_p1.sv
 *
 *	Hazirlayan:
 *		Berkay Arslan
 *		
 *
 *
 *		elm235_lab4_problem1
 *		HDL kullanarak Latch, Rising-edge triggered Flip-Flop ve Falling-edge triggered Flip-Flop olusturulmasi
 *
 */
 
 
module lab4_g61_p1(input logic clk, input logic d, output logic q1, output logic q2, output logic q3);
 
	always_latch
	begin
		if (clk) q1 <= d;
	end
	
	always_ff @(posedge clk)
	begin
		q2 <= d;
	end
		
	always_ff @(negedge clk)
	begin
		q3 <= d;
	end
		
endmodule
