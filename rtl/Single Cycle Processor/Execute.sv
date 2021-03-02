module Execute (
input logic [31:0] rs1_data,rs2_data,
input logic [31:0] imm,
input logic [6:0] opcode,
input logic [3:0] func,
output logic [31:0] sonuc, 
output logic pc_update, 
output logic we, 
output logic hata 
);

always_comb
begin
	{hata, pc_update, we, sonuc} = 35'b0;
	if (opcode==7'b0000001) begin //R
		hata = 0;
		pc_update = 0;
		we = 1;
		if (func==4'b0000) //ADD
			sonuc = $signed(rs1_data) + $signed(rs2_data);
		else if (func==4'b1000) //SUB
			sonuc = $signed(rs1_data) - $signed(rs2_data);
		else if (func==4'b0111) //AND
			sonuc = $signed(rs1_data) & $signed(rs2_data);
		else if (func==4'b0110) //OR
			sonuc = $signed(rs1_data)| $signed(rs2_data);
		else if (func==4'b0100) //EOR
			sonuc = $signed(rs1_data)^ $signed(rs2_data);
		else if (func==4'b0001) //LSL
			sonuc = $signed(rs1_data) << $signed(rs2_data);
		else if (func==4'b0101) //LSR
			sonuc = $signed(rs1_data) >> $signed(rs2_data);
		else if (func==4'b1101) //ASR
			sonuc = $signed(rs1_data) >>> $signed(rs2_data);
		else
			sonuc = 32'b0;
		end

	else if (opcode==7'b0000011) begin //I
		hata = 0;
		we = 1;
		pc_update = 0;
		if (func==4'b0000) //ADDI
			sonuc = $signed(rs1_data) + $signed(imm);
		else if (func==4'b0111) //ANDI
			sonuc = $signed(rs1_data) & $signed(imm);
		else if (func==4'b0110)//ORI
			sonuc = $signed(rs1_data) | $signed(imm);
		else if (func==4'b0100) //EORI
			sonuc = $signed(rs1_data) ^ $signed(imm);
		else if (func==4'b0001) //LSLI
			sonuc = $signed(rs1_data) << $signed(imm);
		else if (func==4'b0101) //LSRI
			sonuc = $signed(rs1_data) >> $signed(imm);
		else
			sonuc = 32'b0;
		end
	else if (opcode==7'b0000111) begin //U
		hata = 0;
		we = 1;
		pc_update =0;
		sonuc = {12'b0,imm[19:0]};
		end
	else if (opcode==7'b0001111) begin //B
		hata = 0;
		we = 0;
		if (func==4'b0011)//B
			pc_update = 1;
		else if(func==4'b0000)//BEQ
			pc_update = ($signed(rs1_data)==$signed(rs2_data))?1:0;

		else if (func==4'b0001)//BNE
			pc_update = ($signed(rs1_data)!=$signed(rs2_data))?1:0;

		else if (func==4'b0100)//BLT
			pc_update = ($signed(rs1_data)<$signed(rs2_data))?1:0;

		else if (func==4'b0101)//BGE
			pc_update = ($signed(rs1_data)>=$signed(rs2_data))?1:0;

		else if (func==4'b0101)//BLTU
			pc_update = ($unsigned(rs1_data)<$unsigned(rs2_data))?1:0;

		else if (func==4'b0111)//BGEU
			pc_update = ($unsigned(rs1_data)>=$unsigned(rs2_data))?1:0;
		else
			sonuc = 32'b0;
		end
	
	else begin
		pc_update = 1'bz;
		hata = 1'bz;
		we = 1'bz;
		sonuc = 32'dz;
	end
end
endmodule