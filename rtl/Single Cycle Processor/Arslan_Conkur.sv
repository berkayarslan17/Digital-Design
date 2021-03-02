module Arslan_Conkur
(
	input logic clk, reset,
	input logic [31:0] komut, // decode
	output logic [31:0] pc, // fetch
	output logic hata // decode
);



lab8_g61_p1 uut0(.clk(clk), .reset(reset), .pc(pc));

decode uut1(.komut(komut), .clk(clk), .reset(reset), .hata(hata));


endmodule
