/* tb_memory.sv
 */

`timescale 1ns/1ps

module tb_lab7_g61_p2 ();

    logic clk, reset;
    logic we;
    logic [2:0] waddr, addr;
	logic [31:0] wbdata;
    logic [4:0] rs1;
	logic [4:0] rs2;
    logic [31:0] rs1_data;
	logic [31:0] rs2_data;

    lab7_g61_p2 dut0(clk, reset, we, waddr, wbdata, rs1, rs2, rs1_data, rs2_data);

    always begin
        clk <= 0; #5; clk <= 1; #5;
    end

    // sadece oku
    initial
    begin
        we = 0; reset = 0; wbdata = 32'b0;
        rs1 = 3'b000; # 10;
        rs1 = 3'b001; # 10;
        rs1 = 3'b010; # 10;
        rs1 = 3'b011; # 10;
        rs1 = 3'b100; # 10;
        rs1 = 3'b101; # 10;
        rs1 = 3'b110; # 10;
        rs1 = 3'b111; # 100;
        $stop;
    end
	
	initial
    begin
        we = 0; reset = 0; wbdata = 32'b0;
        rs2 = 3'b000; # 10;
        rs2 = 3'b001; # 10;
        rs2 = 3'b010; # 10;
        rs2 = 3'b011; # 10;
        rs2 = 3'b100; # 10;
        rs2 = 3'b101; # 10;
        rs2 = 3'b110; # 10;
        rs2 = 3'b111; # 100;
        $stop;
    end
endmodule