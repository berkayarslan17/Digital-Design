module Arslan_Conkur_Processor
(
	input logic clk, reset,
	input logic [31:0] komut, // decode
	output logic [31:0] pc, // fetch
	output logic hata // decode
);

logic hata_execute, hata_decode;

lab8_g61_p1 uut0(.clk(clk), .reset(reset), .pc(pc));

decode uut1(.komut(komut), .clk(clk), .reset(reset), .hata(hata_decode));

Execute uut2(.rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .opcode(opcode)
, .func(func), .sonuc(sonuc), .pc_update(pc_update), .we(we), .hata(hata_execute));

assign hata = hata_decode | hata_execute; 

endmodule
