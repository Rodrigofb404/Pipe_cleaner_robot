module TopLevelModule(
    input wire clock,
    input wire reset,
    input wire under
);

    // Sinais internos
    wire c1, c2, c3, c4;
    wire head, left;
    wire avancar, girar, remover;
    wire barreira;  // Sinal barreira declarado como wire interno
    wire [2:0] orientacao;
    wire [2:0] acao;

    // Instanciação do módulo LMapa
    LMapa UUT_LMapa (
        .clockc1(c1),
        .acao(acao),
        .orientacao(orientacao),
        .reset(reset),
        .head(head),
        .left(left),
        .barreira(barreira)  // Conectando o sinal barreira
    );

    // Instanciação do módulo divisorclock
    divisorclock UUT_divisorclock ( 
        .clock(clock),
        .c1(c1), 
        .c2(c2), 
        .c3(c3), 
        .c4(c4) 
    );

    // Instanciação do módulo orientacao
    orientacao UUT_orientacao ( 
        .girar(girar), 
        .clockc3(c2), 
        .reset(reset),
        .orientacao(orientacao)
    );

    // Instanciação do módulo Sensores
    Sensores UUT_Sensores (
        .head(head),
        .left(left),
        .clockc2(c3),
        .reset(reset),
        .under(under),
        .barreira(barreira),  // Conectando o sinal barreira corretamente
        .avancar(avancar),
        .girar(girar),
        .remover(remover)
    );

    // Instanciação do módulo avanco
    avanco UUT_avanco (
        .avancar(avancar), 
        .clockc3(c2), 
        .reset(reset),
        .orientacao(orientacao),
        .remover(remover),
        .acao(acao)
    );

endmodule
