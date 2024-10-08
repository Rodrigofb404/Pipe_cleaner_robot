module avanco (
    input avancar, clockc3, reset,
    input [0:2] orientacao,
    output reg [0:2] acao
);

    reg [0:2] state;

// Parâmetros dos estados
parameter parado = 3'b000,
          acaoN = 3'b001,
          acaoO = 3'b010,
          acaoL = 3'b011,
          acaoS = 3'b100;

initial begin
    state = parado;
  acao = 3'b000;
end

always @(posedge clockc3 or posedge reset) begin
$display("avancar = %b",avancar);
    if (reset) begin
        state = parado;
    end else if (avancar) begin
        case (orientacao)
            3'b001: state = acaoN;
            3'b010: state = acaoO;
            3'b011: state = acaoL;
            3'b100: state = acaoS;
            default: state = parado;
        endcase
    end else begin
      state = parado;
    end
    acao <= state;

end

endmodule