/* 
 * lab7_g61_p1.sv
 * Notlar:    
 * ELM235 2020 Bahar Lab7 - Problem 1 
 *  Komut ayırıcı
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Conkur
 */

module lab7_g61_p1
(
	input logic clk, reset,
	input logic [31:0] komut,
	output logic [6:0] opcode,
	output logic [3:0] aluop,
	output logic [4:0] rs1,
	output logic [4:0] rs2,
	output logic [31:0] rs1_data,
	output logic [31:0] rs2_data,
	output logic [4:0] rd,
	output logic [31:0] imm,
	output logic hata
);


logic [31:0] komutreg;
logic [6:0] opcodereg;
logic [3:0] aluopreg;
logic [4:0] rs1reg;
logic [4:0] rs2reg;
logic [31:0] rs1_datareg;
logic [31:0] rs2_datareg;
logic [4:0] rdreg;
logic [31:0] immreg;
logic hatareg;

generate

always_ff @(posedge clk) begin
komutreg <= komut;
opcode <= opcodereg;
rs1 <= rs1reg;
rs2 <= rs2reg;
rs1_data <= rs1_datareg;
rs2_data <= rs2_datareg;
rd <= rdreg;
imm <= immreg;
hata <= hatareg;
aluop <= aluopreg;
end

endgenerate

parameter  [6:0] R = 4'b0000001, 
                 I = 4'b0000011, 
                 U = 4'b0000111, 
				 B = 4'b0001111;
				 
assign rs1_datareg = 0;
assign rs2_datareg = 0;



always @(*) begin

hatareg = 0;

case (opcode)

R: begin
rs2reg = komutreg[24:20];
rs1reg = komutreg[19:15];
aluopreg = komutreg[30] + komutreg[14:12];
rdreg = komutreg[11:7];
opcodereg = komutreg[6:0];
immreg = 32'd0;
end

I: begin
rs1reg = komutreg[19:15];
aluopreg = {1'b0, komutreg[14:12]};
rdreg = komutreg[11:7];
opcodereg = komutreg[6:0];
immreg = {20'b0, komutreg[31:20]};
rs2reg = 5'b0;
end

U: begin
rdreg = komutreg[11:7];
opcodereg = komutreg[6:0];
immreg = {12'b0, komutreg[31:12]};
rs1reg = 5'b0;
rs2reg = 5'b0;
aluopreg = 4'b0;
end

B: begin
rs2reg = komutreg[24:20];
rs1reg = komutreg[19:15];
aluopreg = {1'b0, komutreg[14:12]};
immreg = {19'b0, komutreg[31:25], komutreg[11:7], 1'b0};
opcodereg = komutreg[6:0];
rdreg = 5'b0;
end

default: begin
hatareg = 1;
rs2reg = komutreg[24:20];
rs1reg = komutreg[19:15];
aluopreg = {1'b0, komutreg[14:12]};
immreg = {19'b0, komutreg[31:25], komutreg[11:7], 1'b0};
opcodereg = komutreg[6:0];
rdreg = 5'b0;
end
endcase
end
endmodule