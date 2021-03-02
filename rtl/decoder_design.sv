/* lab3_g61_p4.sv
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Çonkur
 * 
 *  Notlar:
 * ELM235 2020 Bahar Lab3 - Problem 4
 * cozucu tasarimi
 *
 */
 `timescale 1ns/1ps
module lab3_g61_p4
(
	input logic [7:0] data,
   output logic [3:0] segments
);
 
	assign segments = 
	 data[7] ? 4'b0000 :
	(data[6] ? 4'b0100 :
	(data[5] ? 4'b0001 :
	(data[4] ? 4'b0101 :
	(data[3] ? 4'b0011 :
	(data[2] ? 4'b0111 :
	(data[1] ? 4'b0010 :
	 data[0] == 4'b0110))))));
	 
endmodule

