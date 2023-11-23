create or replace NONEDITIONABLE PROCEDURE inserirOperacao(
    dataAtual date,
    tipoOperacao operacao.tipoOperacao%type,
    data1 operacao.data%type,
    quantidade1 operacao.quantidade%type,
    cultura1 culturaoperacao.cultura%type,
    parcela1 operacao.parcela%type,
    unidade1 operacao.unidade%TYPE,
    operacao_id OUT operacao.id%TYPE -- Define an OUT parameter to capture the ID


)
IS
    -- Variável booleana para armazenar os resultados das validações
    var_boolean BOOLEAN;

BEGIN
    -- Verificar se a data não está no futuro
    var_boolean := verificarDataNaoEstaNoFuturo(dataAtual,data1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Data Válida!!!');
END IF;

    -- Verificar se a quantidade é valida
    var_boolean := verificarquantidadevalida(quantidade1, cultura1,unidade1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Quantidade Válida!!!');
END IF;

    -- Verificar se a cultura está na parcela
    var_boolean := validateCulturaNaParcela(parcela1, cultura1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Cultura e parcela Válidos!!!');
END IF;

    -- Inserir os dados na tabela
INSERT INTO operacao (parcela, tipoOperacao, data, quantidade, unidade)
VALUES (parcela1, tipoOperacao, data1, quantidade1, unidade1)
    RETURNING id INTO operacao_id;

INSERT INTO culturaoperacao(cultura,operacao)
VALUES (cultura1,operacao_id);


DBMS_OUTPUT.PUT_LINE('Inserção bem-sucedida: ' || SQL%ROWCOUNT || ' linha(s) inserida(s).');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Inserção mal-sucedida devido a um erro inesperado.');
END;

