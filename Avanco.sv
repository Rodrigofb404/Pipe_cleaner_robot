module avanco (
    input avancar, 
    input clockc3, 
    input reset, 
    input remover,
    input [0:2] orientacao,
    output reg [0:2] acao
);

    reg [0:2] state;
reg[0:2] k;
    // Parâmetros dos estados
    parameter parado = 3'b000,
              acaoN = 3'b001,
              acaoO = 3'b010,
              acaoL = 3'b011,
              acaoS = 3'b100,
              limpar = 3'b101;

    initial begin
        state = parado;
        acao = 3'b000;
	k=0;
    end

    always @(posedge clockc3 or posedge reset) begin

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
        end else if (remover) begin
		if(k<2)begin
		k=k+1;
		state = parado;
	$display("valor de k = %b",k);
		end else begin
           	state = limpar;
		k=0;
		end
        end else begin
            state = parado;
        end
        acao <= state;
$display("avancar:%b remover:%b",avancar,remover);
    end

endmodule

