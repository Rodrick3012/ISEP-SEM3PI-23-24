--USBD14 - Como Gestor Agrícola, quero registar uma operação de aplicacão de fator de produção

--Parametros - data, quantidade, parcela, modo, fatorProducao, cultura, tipoOperacao

CREATE OR REPLACE PROCEDURE inserirOperacaoAplicacaoFatorProducao(
    data1 operacaoFatorProducao.data%type,
    quantidade1 operacaoFatorProducao.quantidade%type,
    parcela1 operacaoFatorProducao.parcela%type,
    fp operacaoFatorProducao.fatorProducao%type,
    cultura1 operacaoFatorProducao.cultura%type,
    tipoOp operacaoFatorProducao.tipoOperacao%type
)
IS
    var_boolean BOOLEAN;
BEGIN
    var_boolean := verificarDataNaoEstaNoFuturo(data1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Data Válida!!! ' );
END IF;

    var_boolean := verificarQuantidadeValida(quantidade1, cultura1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Quantidade Válida!!! ' );
END IF;

    var_boolean := validateCulturaNaParcela(parcela1, cultura1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Cultura e parcela Válidos!!!');
END IF;

    var_boolean := validateFatorProducao(fp);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Fator de Produção válido!!!');
END IF;

    var_boolean := validateOperacao(tipoOp);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Tipo de Operação válido!!!');
END IF;

INSERT INTO operacaoFatorProducao(data, quantidade, parcela, modo, fatorproducao, cultura, tipooperacao)
VALUES (data1, quantidade1, parcela1, 2, fp, cultura1, tipoOp);

DBMS_OUTPUT.PUT_LINE('Inserção bem-sucedida: ' || SQL%ROWCOUNT || ' linha(s) inserida(s).');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Inserção mal-sucedida devido a um erro inesperado.');
END;
/



CREATE OR REPLACE FUNCTION validateFatorProducao(fp fatorproducao.designacao%type) RETURN BOOLEAN
IS
    v_count INT;
BEGIN
SELECT COUNT(*) INTO v_count
FROM fatorProducao
WHERE fatorProducao.designacao = fp;

IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Fator de produção inválido');
ELSE
        RETURN TRUE;
END IF;
END;
/


-- Função para validar tipo de operação
CREATE OR REPLACE FUNCTION validateOperacao(op tipoOperacao.id%type) RETURN BOOLEAN
IS
    v_count INT;
BEGIN
SELECT COUNT(*) INTO v_count
FROM tipoOperacao
WHERE tipoOperacao.id = op;

IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operação inválida');
ELSE
        RETURN TRUE;
END IF;
END validateOperacao;
/