module tb_execute ();
logic [31:0] rs1_data,rs2_data;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func;
logic [31:0] sonuc;
logic pc_update;
logic we;
logic hata;

Execute exe(.rs1_data(rs1_data),.rs2_data(rs2_data),.imm(imm),.opcode(opcode),.func(func),
.sonuc(sonuc),.pc_update(pc_update),.we(we),.hata(hata));



 always 
begin 
	func = 4'b0000; #20;
	func = 4'b1101; #20;
	func = 4'b0111; #20;
	func = 4'b0110; #20;
	func = 4'b0001; #20;
	func = 4'b0101; #20;
end

 initial 
begin 
	rs1_data = 32'd16;#5;
	rs2_data = 32'd8; #5;
	imm = 32'd128;	  #5;
	opcode = 7'b0001111; #200;
	opcode = 7'b0000111; #200;
	opcode = 7'b0000011; #200;
	opcode = 7'b0000001; #200;
	$stop; #1500;         
end

endmodule
