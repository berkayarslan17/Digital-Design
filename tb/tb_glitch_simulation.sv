/* tb_lab3_g61_p3.sv
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
module tb_lab3_g61_p3();

	logic a, b, c, d, x;

	lab3_g61_p3 dut(a, b, c, d, x);
	
	initial begin
	
	a = 0; b = 0; c = 0; d = 0; #10;
	d = 1;		     	    	#10;
	c = 1;		     	    	#10;
	b = 1;		     	    	#10;
	a = 1;			    		#10;
	a = 0; b = 0; d = 0;   	    #10;
	a = 1; 	     	    	    #10;
	b = 1;		     	    	#10;
	a = 0; b = 1; c = 0; d = 0; #10;
	d = 1;			    		#10;
	a = 1;			    		#10;
	a = 0; c = 1; d = 0;	    #10;
	a = 1; b = 0; c = 0; 	    #10;
	b = 1;			    		#10;
	b = 0; d = 1; c = 1;		#10;
	c = 0;				    	#10;
end
	
endmodule

