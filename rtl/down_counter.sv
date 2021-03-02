module lab5_g61_p1
(
	input logic clk, reset, en,
	input logic [4:0] psc,
	output logic [4:0] counter,
	output logic tick
);

always_ff @(posedge clk, negedge reset)
begin
if(!reset)
counter <= 5'b0;

else if (en)
counter <= counter + 1'b1;
end

assign tick = (counter == psc) ? 1'b1 : 1'b0;

endmodule

module lab5_g61_p2
(
	input logic clk, reset, en,
	input logic [4:0] psc,
	input logic [15:0] reload,
	output logic [15:0] cnt,
	output logic done, tick
);

lab5_g61_p1 udd(.clk(clk), .reset(reset), .en(en), .psc(psc), .tick(tick));

always_ff @(posedge clk, negedge reset, posedge en, negedge cnt)
begin
	done <= 0;
	if(!reset)
		cnt <= 16'b0;

	else if(en)
		if(tick)
			cnt <= cnt - 1'b1;

	else if(!cnt)
	begin
	done <= 1;
	cnt <= reload;
	end
end

endmodule
