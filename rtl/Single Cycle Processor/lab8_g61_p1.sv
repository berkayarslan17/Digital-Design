module lab8_g61_p1 
(
	input logic clk, reset,
	output logic [31:0] pc,	//execute dan gelen pc güncellemeleri
	input logic pc_update,	//execute pc_update sinyaline baglanacak
	input logic [31:0] pc_new	//execute sonic sinyaline baglanacak
);

logic [31:0] pcreg;

always_ff @(posedge clk, negedge reset) begin

	pc <= pcreg; 
	
	if(reset == 0)
		pcreg <= 32'd0;

	else if (pc_update)
		pcreg <= pc_new;
		
	else 
		pcreg <= pcreg + 32'd4;
		
			
end

endmodule

