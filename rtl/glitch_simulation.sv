/* lab3_g61_p3.sv
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Çonkur
 * 
 *  Notlar:
 * ELM235 2020 Bahar Lab3 - Problem 3
 * Glitch Simulasyonu
 *
 */
 `timescale 1ns/1ps
module lab3_g61_p3
(
	input logic a, b, c, d,
   output logic x
);
 
	logic n1, n2, n3, n4;
	
	assign #2 n1 = ~b;
	assign #2 n2 = a & n1 & c;
	assign #2 n3 = ~c;
	assign #2 n4 = n3 & d;
	assign #2 x = n2 | n4;
	
	
endmodule

