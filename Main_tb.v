`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
module main_tb();
  parameter DURATION = 300;


  reg clk = 0;
  always #0.5 clk = ~clk;
  reg reset;
  reg [3:0] BOTONES;
  wire [3:0] LEDS;

  main2_0 UUT (
      .clk(clk),
      .reset(reset),
      .BTN(BOTONES),
      .LEDS(LEDS)
  );



  initial begin
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, main_tb);
      reset= 1;
      #1
      BOTONES[0] = 0;
      BOTONES[1] = 0;
      BOTONES[2] = 0;
      BOTONES[3] = 0;
      reset = 0;
      #10
      BOTONES[0] = 1;

      #10
      BOTONES[0] = 0;

      #15
      BOTONES[0] = 1;

      #10
      BOTONES[0] = 0;
      #15
      BOTONES[0] = 1;

      #10
      BOTONES[0] = 0;
      
      #10
      BOTONES[0] = 1;

      //Numerador
    
    #(DURATION) $display("End of simulation");
    $finish;
  end
endmodule