module lab6_g61_p2(
input logic clk,reset,
input logic [4:0] D,
input logic baslat,
output logic Y,
output logic mesgul
);

typedef enum {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
statetype state,nextstate;

always_ff @(posedge clk)
if(reset)
state<= S0;
else state<=nextstate;


always_comb begin 

case (state)

S0: if(baslat) nextstate = S1;
	else
		nextstate = S0;

S1: if(!baslat) nextstate = S2;
	else
		nextstate = S1;

S2: if(!baslat) nextstate = S3;
	else
		nextstate = S2;

S3:  if(!baslat) nextstate = S4;
	else
		nextstate = S3;

S4: if(!baslat) nextstate = S5;
	else
		nextstate = S4;

S5: if(!baslat) nextstate = S6;
	else
		nextstate = S5;

S6: if(!baslat) nextstate = S7;
	else
		nextstate = S6;

S7: if(!baslat) nextstate = S0;
	else
		nextstate = S0;

default : nextstate= S0;
endcase

end


always @(*) begin
if (state == S0)
begin
	mesgul = 0;
	Y = 1;
end

else if (state == S1)
begin
	Y = 0;
	mesgul = 1;
end

else if (state == S2)
begin
	mesgul = 1;
	Y = D[0];
end
else if (state == S3)
begin
mesgul = 1;
	Y = D[1];
end
else if (state == S4)
begin
	mesgul = 1;
	Y = D[2];
end
else if (state == S5)
begin
	mesgul = 1;
	Y = D[3];
end
else if (state == S6)
begin
	mesgul = 1;
	Y = D[4];
end
else if (state == S7)
begin
	mesgul = 1;
	Y = 1;
end
else
begin
	mesgul = 0;
	Y = 1;
end
end 
endmodule