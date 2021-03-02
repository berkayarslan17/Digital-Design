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
module tb_lab3_g61_p2();
 
	logic a, b, y;
	
	
	lab3_g61_p2 dut(a, b, y);

	initial begin
		a = 0; b = 0; #10;
		b = 1;	      #10;
		a = 1;	      #10;
		b = 0;	      #10;
	end
	
endmodule
 
 
