module tb_lab6_g61_p2 ();

logic clk,reset,Y,mesgul,baslat;
logic [4:0] D;


lab6_g61_p2 uut0(.clk(clk),.reset(reset),.Y(Y),.mesgul(mesgul),.baslat(baslat),.D(D));


initial begin
D = 5'b01010;
end

always begin 
clk = 0; #5;
clk = 1; #5;
end

initial begin 
baslat = 0;#5;
baslat = 1;#5;
baslat = 0;
end

initial begin
reset = 1;#3;
reset = 0;
end


initial begin
#1500;
$stop;
end

endmodule