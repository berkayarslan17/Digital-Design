module memory
(
    input logic clk ,reset,
	 input logic we,
	 input  logic  [4:0] waddr,addr,
	 input  logic [31:0] wbdata,
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data
);


logic [0:63] mem [0:31];
logic [4:0] rs1reg;
logic [4:0] rs2reg;
logic [31:0] rs1_datareg;
logic [31:0] rs2_datareg;

integer i;
always_ff @(posedge clk)
    if (!reset) for (i=0; i<64; i=i+1) mem[i] <= 32'b0;
    else if (we) mem[waddr] <= wbdata;

assign rs1_data = mem[addr];
assign rs2_data = mem[addr];




initial begin
    $readmemh("fib20.mem", mem);
end



assign rs1_datareg = mem[rs1reg];
assign rs2_datareg = mem[rs2reg];


endmodule