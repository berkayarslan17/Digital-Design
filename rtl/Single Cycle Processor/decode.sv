module decode(
input logic clk,reset,
input logic we ,
input logic [31:0] rd_data,
input logic [31:0] komut,
output logic [6:0] opcode,
output logic [3:0] func,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [31:0] rs1_data, 
output logic [31:0] rs2_data, 
output logic [4:0] rd,
output logic [31:0] imm,
output logic hata
);

assign opcode=komut[6:0];

memory uut0(.clk(clk),.reset(reset),.rs1_data(rs1_data),.rs2_data(rs2_data),.rs1(rs1),
.rs2(rs2),.we(we),.wbdata(rd_data),.waddr(rd)); 

always_comb
begin
	{hata, rs1, rs2, rd, imm, func} = 51'b0;
    if(7'b0000001==komut[6:0]) //R
        begin 
           rs1=komut[19:15];
           rs2=komut[24:20];
            rd=komut[11:7];
            imm=32'b0;
            func={komut[30],komut[14],komut[13],komut[12]};
    end

 

    else if (7'b0000011==komut[6:0])// I
        begin
		      rs1=komut[19:15];
            rd=komut[11:7];
            func={1'b0,komut[14],komut[13],komut[12]}; 
            imm[11:0]=komut[31:20];
            imm[31:12]=20'b0;
            rs2=5'b0;
        
    end
    else if (7'b0000111==komut[6:0])//U
        begin
            rs1=komut[19:15];
            rs2=5'b0;
            rd=komut[11:7];
            imm[20:0]=komut[31:12];
            imm[31:21]=12'b0;
            func=4'b0;    
        
    end

 

    else if (7'b0001111==komut[6:0])//B
        begin
            rs1=komut[19:15];
            rs2=komut[24:20];
            func={1'b0,komut[14],komut[13],komut[12]};
            rd=5'b0;
            imm={19'b0,komut[31:25],komut[11:7],1'b0};
            
        end
    
    else begin
        hata=1;
        rs1=32'b0;
        rs2=32'b0;
        rd=32'b0;
        func=4'b0;
        imm=32'b0;
        end

 

end
 
endmodule 