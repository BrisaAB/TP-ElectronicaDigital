`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
module db_fsm_tb;
parameter DURATION = 50;


reg clk = 0;
always #0.5 clk = ~clk;
reg reset;
reg senial;
wire salidita;


db_fsm UUT (
    .clk(clk),
    .reset(reset),
    .sw(senial),
    .db(salidita)
);



initial begin
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, db_fsm_tb);
    reset= 1;
    #1
    senial = 0;
    reset = 0;
    #7
    senial = 1;

    #3
    senial = 0;

    #4
    senial = 1;

    #2
    senial = 0;
    #2
    senial = 1;

    #3
    senial = 0;
    
    #5
    senial = 1;

    //Numerador
   
   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule