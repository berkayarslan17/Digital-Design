
    `timescale 1ns / 1ps


    module tb_lab3_g61_p5();


     // Inputs

     reg [1:0] s;

     reg [7:0] d0;

     reg [7:0] d1;

     reg [7:0] d2;

     reg [7:0] d3;

     // Outputs

     wire [7:0] y;

     

     //temporary variable

     reg [1:0] count = 2'd0;

     

     // Instantiate the Unit Under Test (UUT)

     lab3_g61_p5 uut (

      .y(y), 

      .s(s), 

      .d0(d0), 

      .d1(d1), 

      .d2(d2), 

      .d3(d3)

     );


     initial begin

      // Initialize Inputs

      s  = 0;

      d0 = 0;

      d1 = 0;

      d2 = 0;

      d3 = 0;


      // Wait 100 ns for global reset to finish

      #100;

            

      // Add stimulus here

      s  = 3'd0;

      d0 = 8'd0;

      d1 = 8'd1;

      d2 = 8'd2;

      d3 = 8'd3;


      //Selection input generation

      for (count = 0; count < 8; count = count + 1'b1)

      begin

       s = count;

       #20;

      end

     end      

    endmodule

