
/* lab3_g61_p4.sv
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Çonkur
 * 
 *  Notlar:
 * ELM235 2020 Bahar Lab3 - Problem 4
 * cozucu tasarimi simulasyonu
 *
 */
 `timescale 1ns/1ps
module tb_lab3_g61_p4();

	reg  [7:0] data;
	wire [3:0] segments;
 	
	lab3_g61_p4 uut(.data(data), .segments(segments));
	
	initial begin
	
	data = 0;
	
	#10;

	data = 4'b0000;	#10;
	data = 4'b0100;	#10;
	data = 4'b1100;	#10;
	data = 4'b1000;	#10;
	data = 4'b0001;	#10;
	data = 4'b0101;	#10;
	data = 4'b1101;	#10;
	data = 4'b1001;	#10;
	data = 4'b0011;	#10;
	data = 4'b0111;	#10;
	data = 4'b1111;	#10;
	data = 4'b1011;	#10;
	data = 4'b0010;	#10;
	data = 4'b0110;	#10;
	data = 4'b1110;	#10;
	data = 4'b1010;	#10;

	end

endmodule