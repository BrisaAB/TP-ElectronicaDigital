module divisor(
    input wire clk,
    input wire comienzo,
    input wire rst,
    input wire [3:0] numerador,
    input wire [3:0] denominador,
    output reg [3:0] resultado,
    output reg [3:0] resto,
    output reg hecho
);

// Variables internas
reg [1:0] estado, sig_estado;
reg [3:0] numerador_aux;
reg rst_aux = 1;

localparam [1:0]
    E0 = 2'b00,
    E1 = 2'b01,
    E2 = 2'b10,
    E3 = 2'b11;


always @(posedge clk or posedge rst) begin
    begin
        if(rst) //vamos al estado 0
            estado = E0;
        else
            estado = sig_estado;
    end
end
always @(posedge clk or posedge rst) begin
    if (comienzo) begin
      rst_aux = 0;
    end
    if (rst | rst_aux) begin
        estado = E0;
        numerador_aux <= numerador;
        resultado <= 4'b0000;
        resto <= 4'b0000;
        hecho <= 1'b0;
    end 
    else begin
        case (estado)
            E0: begin //Validacion inicial
                if (denominador == 4'b0000) begin
                    sig_estado = E3; //finalizes
                end
                else begin
                    sig_estado = E1; //validar iterativa
                end
            end
            E1: begin //validacion iterativa
                if (denominador > numerador_aux) begin //si la division esta terminando
                    sig_estado = E3; //finalizes
                end
                else begin
                    sig_estado = E2; //operation
                end
            end
            E2: begin //operation
                numerador_aux <= numerador_aux - denominador;
                resultado <= resultado + 1; //actualizar numero de interacion
                sig_estado = E1; //validacion iterativa
            end
            E3: begin //finalizes
                resto = numerador_aux;
                hecho = 1'b1;
            end
        endcase
    end
end

endmodule
