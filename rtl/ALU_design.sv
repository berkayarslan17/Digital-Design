`timescale 1ns/1ps

module lab4_g61_p3 (
input logic [31:0]a, b,
input logic [3:0] op,
output logic [32:0] s,
output logic n, z, v, c,
output logic hata
);
     
logic carry_in;



parameter  [3:0] ADDT = 4'b0000, // Addition
                 SUBT = 4'b1000, // Subtraction
                 SLFL = 4'b0001, // Shift Left Logical
				 SCMP = 4'b0010, // S Compare
				 UCMP = 4'b0011, // U Compare
				 XOR  = 4'b0100, // XOR Gate
				 SRTL = 4'b0101, // Shift Right Logical
				 SRTA = 4'b1101, // Shift Right Arithmetic
				 OR   = 4'b0110, // OR Gate
				 AND  = 4'b0111; // AND Gate
always @(*)
	begin
	
	hata = 1'b0;
	n = 1'b0;
	z = 1'b0;
	v = 1'b0;
	c = 1'b0;
	hata = 1'b0;
	carry_in = 1'b0;
	
	case (op)
	
	ADDT: begin
	 
	   s = a + b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = (a & b) | (b & carry_in) | (a & carry_in) ? 1 : 0;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;
      end

     SUBT: begin

       s = a - b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = (a & b) | (b & carry_in) | (a & carry_in) ? 1 : 0;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;

      end
	  
	 SLFL: begin
	 
	   s = a << b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = (a & b) | (b & carry_in) | (a & carry_in) ? 1 : 0;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;
	  
	  end
	  
	 SCMP: begin
	  
	   s = $signed(a) > $signed(b) ? 32'd1 : 32'd0;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = 1'bx;
	   v = 1'bx;
	   
	   end
	  
	 UCMP: begin
	  
	   s = $signed(a) > $signed(b) ? 32'd1 : 32'd0;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = 1'bx;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;
	 
	 end
	 
	 XOR: begin
	   
	   s = a ^ b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = 1'bx;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;
	   
	 end

	 SRTL: begin
	 
	   s = a >> b;
	   n = 1'bx;
	   z = (s == 0) ? 1 : 0;
	   c = (a & b) | (b & carry_in) | (a & carry_in) ? 1 : 0;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;	 
	   
	  end
	  
	 SRTA: begin
	 
	   s = a >>> b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = (a & b) | (b & carry_in) | (a & carry_in) ? 1 : 0;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;	 
	   
	  end
	  
		
      OR: begin

	   s = a | b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = 1'bx;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;	 
	   
	  end
	  
	  AND: begin
	  
	   s = a & b;
	   n = (s[31] == 1) ? 1 : 0;
	   z = (s == 0) ? 1 : 0;
	   c = 1'bx;
	   v = (a[31] == b[31] && a[31] != s[31]) ? 1 : 0;
	   
	  end
	 
	default: begin
	  
	  hata = 1'b1;
	  s = 32'dx;
	  n = 1'bx;
	  z = 1'bx;
	  c = 1'bx;
	  v = 1'bx;
	  end
	  
	
	
	endcase
	
	end

endmodule