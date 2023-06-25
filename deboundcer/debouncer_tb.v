//-------------------------------------------------------------------
//-- Testbench
//-- DEBOUNCER DE 1 BIT
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module db_fsm_tb();

    //-- Simulation time: 1us (10 * 100ns)
    parameter DURATION = 300;

    //-- Clock signal. It is not used in this simulation
    reg clk = 0;
    always #0.5 clk = ~clk;

    // a ports
    reg test_reset;
    reg test_sw;
    wire test_db;

    //-- Instantiate the unit to test
    db_fsm UUT(
             .clk(clk),
             .reset(test_reset),
             .sw(test_sw),
             .db(test_db)
           );

    initial begin

        //-- File were to store the simulation results
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, db_fsm_tb);

        test_reset = 1;

        #1
        test_reset = 0;

        #1
        test_sw = 1;

        #20
        test_sw = 0;


        #20
        test_sw = 1;
        
        #20
        test_sw = 0;

        #(DURATION) $display("End of simulation");
        $finish;
    end

endmodule
