/* lab3_g61_p2.sv
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Çonkur
 * 
 *  Notlar:
 * ELM235 2020 Bahar Lab3 - Problem 2
 * Basit bir devrede gecikme simulasyonu
 *
 */
 `timescale 1ns/1ps
module lab3_g61_p2
 (
	input logic a, b,
   output logic y
 );
	logic n1;
	assign #3 n1 = ~a;
	assign #5 y = n1 & b;
	
endmodule
 
 