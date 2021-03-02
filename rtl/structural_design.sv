/* lab3_g61_p5.sv
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Çonkur
 * 
 *  Notlar:
 * ELM235 2020 Bahar Lab3 - Problem 5
 * Yapısal Tasarım (Structural Design)
 *
 */
module mux2
(
	input logic [7:0] d0, d1,
	input logic s,
   output logic [7:0] y
);

	assign y = s ? d1 : d0;
endmodule

module lab3_g61_p5
(
	input logic [7:0] d0, d1, d2, d3,
	input logic [1:0]s,
   output logic [7:0] y
);

	logic[7:0] low, high;
	
	mux2 lowmux(d0, d1, s[0], low);
	mux2 highmux(d2, d3, s[0], high);
	mux2 finalmux(low, high, s[1], y);
endmodule

