module lab5_g61_p1
(
	input logic clk, reset, en,
	input logic [4:0] psc,
	output logic [4:0] counter,
	output logic tick
);

always_ff @(posedge clk, negedge reset)
begin
if(!reset || tick)
counter <= 5'b0;

else if (en)
counter <= counter + 1'b1;
end

assign tick = (counter == psc) ? 1'b1 : 1'b0;

endmodule

