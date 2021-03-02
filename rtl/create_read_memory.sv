/* 
 * lab7_g61_p2.sv
 * Notlar:    
 * ELM235 2020 Bahar Lab7 - Problem 2
 *  Hafiza olusturma ve okuma
 * Hazirlayanlar:
 * Berkay Arslan
 * Furkan Conkur
 */
module lab7_g61_p2
(
	input logic clk ,reset,
	//Yazma Portları
	input logic we,
	input logic [4:0] waddr,
	input logic [31:0] wbdata,
	//Okuma Portları
	input logic [4:0] rs1,
	input logic [4:0] rs2,
	output logic [31:0] rs1_data,
	output logic [31:0] rs2_data
);

logic wereg;
logic [4:0] waddrreg;
logic [31:0] wbdatareg;
logic [4:0] rs1reg;
logic [4:0] rs2reg;
logic [31:0] rs1_datareg;
logic [31:0] rs2_datareg;


generate

always_ff @(posedge clk) begin
wereg <= we;
waddrreg <= waddr;
wbdatareg <= wbdata;
rs1reg <= rs1;
rs2reg <= rs2;
rs1_data <= rs1_datareg;
rs2_data <= rs2_datareg;
end

endgenerate

logic [31:0] mem [0:31];

initial begin
	$readmemh("reg_image.mem", mem);
end
//Write Portu
always_ff @(posedge clk)
	if(wereg) mem[waddrreg] <= wbdatareg;


//Read Portu
assign rs1_datareg = mem[rs1reg];
assign rs2_datareg = mem[rs2reg];

endmodule
