module LMapa (
   input clockc1,
   input [0:2] acao,
   input [0:2] orientacao,
   input reset,
   output reg barreira,
   output reg [0:3] head,
   output reg [0:3] left
);

  reg [0:79] Mapa [0:9]; // 80 colunas e 10 linhas
  reg [0:7] Linha_Robo;
  reg [0:7] Coluna_Robo;
  reg [0:3] head_aux;
  reg [0:3] left_aux;
 reg [0:3] valor ;

  initial begin
    Linha_Robo = 8'd9;
    Coluna_Robo = 8'd68;
    $readmemh("Mapa.txt", Mapa);
    print_mapa();
  end

  // Task para imprimir o mapa
  task print_mapa;
    integer i;
    begin
      $display("Mapas:");
      for (i = 0; i < 10; i = i + 1) begin
        $write("%h\n", Mapa[i]);
      end
    end
  endtask

  always @(posedge clockc1 or posedge reset) begin
    if (reset) begin
      head <= 0;
      left <= 0;
      barreira <= 0;
    end else if (acao == 3'b101) begin
      case (orientacao)
        3'b001 : begin
          if (Mapa[Linha_Robo-1][Coluna_Robo +: 4] > 2) begin
            Mapa[Linha_Robo-1][Coluna_Robo +: 4] = Mapa[Linha_Robo-1][Coluna_Robo +: 4] - 1;
	  end else 
            Mapa[Linha_Robo-1][Coluna_Robo +: 4] = 0;
        end
        3'b010 : begin
          if (Mapa[Linha_Robo][Coluna_Robo-4 +: 4] > 2)
            Mapa[Linha_Robo][Coluna_Robo-4 +: 4] = Mapa[Linha_Robo][Coluna_Robo-4 +: 4] - 1;
          else 
            Mapa[Linha_Robo][Coluna_Robo-4 +: 4] = 0;
        end 
        3'b011 : begin
          if (Mapa[Linha_Robo][Coluna_Robo+4 +: 4] > 2)
            Mapa[Linha_Robo][Coluna_Robo+4 +: 4] = Mapa[Linha_Robo][Coluna_Robo+4 +: 4] - 1;
          else 
            Mapa[Linha_Robo][Coluna_Robo+4 +: 4] = 0;
        end
        3'b100 : begin
          if (Mapa[Linha_Robo+1][Coluna_Robo +: 4] > 2)
            Mapa[Linha_Robo+1][Coluna_Robo +: 4] = Mapa[Linha_Robo+1][Coluna_Robo +: 4] - 1;
          else 
            Mapa[Linha_Robo+1][Coluna_Robo +: 4] = 0;
        end
      endcase
    end else if (acao != 3'b000) begin
      case (acao)
        3'b001 : Linha_Robo = Linha_Robo - 1; // Norte
        3'b010 : Coluna_Robo = Coluna_Robo - 4; // Oeste
        3'b011 : Coluna_Robo = Coluna_Robo + 4; // Leste
        3'b100 : Linha_Robo = Linha_Robo + 1; // Sul
        default: ; // Sem ação
      endcase
    end

    case (orientacao) // EXISTE &{} que as condições estão erradas !
// Terminar de por as condições para o head
// Terminar o coisa q poode ser wire 
// TErminar de por limpeza lembrando que são 3 clocks por limpeza


      3'b001: begin // Norte
        if (Linha_Robo > 0 && Coluna_Robo > 3) begin
          head_aux = Mapa[Linha_Robo-1][Coluna_Robo +: 4];
	  left_aux = Mapa[Linha_Robo][Coluna_Robo-4 +: 4];
	end else if (Linha_Robo == 0 && Coluna_Robo == 0)begin
	  head_aux = 1;
	  left_aux = 1;
	end else if (Linha_Robo > 0)begin
	  head_aux = Mapa[Linha_Robo-1][Coluna_Robo +: 4];
	  left_aux = 1;
	end else begin
          head_aux = 1;
	  left_aux = Mapa[Linha_Robo][Coluna_Robo-4 +: 4];
	end
      end
      3'b010: begin
        if (Linha_Robo < 9 && Coluna_Robo > 3) begin
          head_aux = Mapa[Linha_Robo][Coluna_Robo-4 +: 4];
	  left_aux = Mapa[Linha_Robo+1][Coluna_Robo +: 4];
	end else if (Linha_Robo == 9 && Coluna_Robo == 0)begin
	  head_aux = 1;
	  left_aux = 1;
	end else if (Linha_Robo < 9 )begin
	  head_aux = 1;
	  left_aux = Mapa[Linha_Robo+1][Coluna_Robo +: 4];
	end else begin
          head_aux = Mapa[Linha_Robo][Coluna_Robo-4 +: 4];
	  left_aux = 1;
	end
      end
      3'b011: begin
        if (Linha_Robo > 0 && Coluna_Robo < 77) begin
          head_aux = Mapa[Linha_Robo][Coluna_Robo+4 +: 4];
	  left_aux = Mapa[Linha_Robo-1][Coluna_Robo +: 4];
	end else if (Linha_Robo == 0 && Coluna_Robo == 77)begin
	  head_aux = 1;
	  left_aux = 1;
	end else if (Linha_Robo > 0 )begin
	  head_aux = 1;
	  left_aux = Mapa[Linha_Robo-1][Coluna_Robo +: 4];
	end else begin
          head_aux = Mapa[Linha_Robo][Coluna_Robo+4 +: 4];
	  left_aux = 1;
	end
     end
      3'b100: begin
        if (Linha_Robo < 9 && Coluna_Robo < 77) begin
          head_aux = Mapa[Linha_Robo+1][Coluna_Robo +: 4];
	  left_aux = Mapa[Linha_Robo][Coluna_Robo+4 +: 4];
	end else if (Linha_Robo == 9 && Coluna_Robo == 77)begin
	  head_aux = 1;
	  left_aux = 1;
	end else if (Linha_Robo < 9)begin
	  head_aux = Mapa[Linha_Robo+1][Coluna_Robo +: 4];
	  left_aux = 1;
	end else begin
          head_aux = 1;
	  left_aux = Mapa[Linha_Robo][Coluna_Robo+4 +: 4];
	end
      end
      default: begin
        head <= 0;
        left <= 0;
      end
    endcase

if (head_aux > 1) begin

head <= 0;
barreira <= 1;
$display("chegou aqui");
end else begin

head <= head_aux;
barreira <=0;

end

if( left_aux>1) begin
left<=0;
end else begin
left<=left_aux;
end

    Mapa[Linha_Robo][Coluna_Robo +: 4] = 4'b1111;
    print_mapa();
    Mapa[Linha_Robo][Coluna_Robo +: 4] = 4'b0000;
    //$display("head aux:%b e left_aux:%b barreira:%b",head_aux,left_aux,barreira);
    $display("testes acao :%b Orientacao: %b Linha_Robo: %d, Coluna_Robo: %d ", acao, orientacao, Linha_Robo, Coluna_Robo);
  end
endmodule

