`include "inversor/inv.v"
`include "contador_ud/contador_ud_p.v"
`include "deboundcer/db_fsm.v"
`include "edge/edge_detect_gate.v"

module main2_0(
    input wire clk,
    input wire reset,
    input wire [3:0] BTN,
    output wire [3:0] LEDS
);
//declaro las variables
wire[3:0] BTN_inversados, boton_db, boton_tick;
reg[3:0] c;
localparam 
    cero = 1'b0;

//Invierto la senial de los botones
inv inversador(
    .in(BTN),
    .out(BTN_inversados)
);

db_fsm boton1(
    .clk(clk),
    .reset(cero),
    .sw(BTN_inversados[0]),
    .db(boton_db[0])
);
db_fsm boton2(
    .clk(clk),
    .reset(cero),
    .sw(BTN_inversados[1]),
    .db(boton_db[1])
);
db_fsm boton3(
    .clk(clk),
    .reset(cero),
    .sw(BTN_inversados[2]),
    .db(boton_db[2])
);
db_fsm boton4(
    .clk(clk),
    .reset(cero),
    .sw(BTN_inversados[3]),
    .db(boton_db[3])
);

edge_detect_gate eboton1(
    .clk(clk),
    .reset(cero),
    .level(boton_db[0]),
    .tick(boton_tick[0])
);

edge_detect_gate eboton2(
    .clk(clk),
    .reset(cero),
    .level(boton_db[1]),
    .tick(boton_tick[1])
);
edge_detect_gate eboton3(
    .clk(clk),
    .reset(cero),
    .level(boton_db[2]),
    .tick(boton_tick[2])
);
edge_detect_gate eboton4(
    .clk(clk),
    .reset(cero),
    .level(boton_db[3]),
    .tick(boton_tick[3])
);
always @*
    c <= boton_tick;
assign LEDS = c;

endmodule