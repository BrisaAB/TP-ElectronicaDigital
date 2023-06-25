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
//------------------------------------------------
//            declaro las variables
//------------------------------------------------
//variables para preparar las entradas y salidas
wire[3:0] BTN_inversados, boton_db, boton_tick;
reg[3:0] c = 4'b0000;

localparam 
    cero = 1'b0;

//Variables para la logica de estados
/*
localparam [1:0]
    cargarNumerador = 2'b00,
    cargarDenominador = 2'b01,
    realizarDivision = 2'b10,
    mostrarResto = 2'b11;
reg[1:0] state;
reg[1:0] next_state;*/
reg[3:0] num;//, den,resultado;
//------------------------------------------------
//            preparo las entradas
//------------------------------------------------
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
always@(posedge clk)begin
     contador_ud numerador(
                .clk(clk),
                .reset(cero),
                .up(boton_tick[1]),
                .down(boton_tick[2]),
                .count(num)
            );
        c = num;
end

/*
//------------------------------------------------
//            logica de estados
//------------------------------------------------
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= cargarNumerador; //valor de estado inicial
        next_state <= cargarNumerador; //valor inicial del siguiente estado
    end
    else begin
    state <= next_state;
    //En este caso se podria hacer con la linea de abajo,
    //pero en general se trabaja con el case dependiendo de los
    //estados.
    //count <= count+2;

    case(state)
        cargarNumerador: begin
            contador_ud numerador(
                .clk(clk),
                .reset(cero),
                .up(boton_tick[1]),
                .down(boton_tick[2]),
                .count(num)
            );
            if(boton_tick[0])
                next_state = cargarDenominador;
            else
                next_state = cargarNumerador;
        end
        cargarDenominador: begin
                  contador_ud denominador(
                .clk(clk),
                .reset(cero),
                .up(boton_tick[1]),
                .down(boton_tick[2]),
                .count(num)
            );
                if(boton_tick[0])
                    next_state = realizarDivision;
                else
                    next_state = cargarDenominador;
        end
        realizarDivision: begin
        end
        mostrarResto: begin
        end
        default: begin
        end
            
    endcase
    end
end
*/
assign LEDS[0] = c[0];
assign LEDS[1] = c[1];
assign LEDS[2] = c[2];
assign LEDS[3] = c[3];

endmodule