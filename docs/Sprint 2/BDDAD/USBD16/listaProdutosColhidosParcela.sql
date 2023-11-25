create or replace NONEDITIONABLE FUNCTION fnclistaProdutosColhidosParcela(
    dataAtual date,
    dataInicial operacao.data%type,
    dataFinal operacao.data%type,
    parcela1 operacao.parcela%type
) RETURN sys_refCursor
IS
    v_cursor sys_refCursor;
    v_verificarData BOOLEAN;
    excecaoData EXCEPTION;
BEGIN
    -- Validar data inicial
    v_verificarData := fncverificarDataNaoEstaNoFuturo(dataAtual,dataInicial);

    IF v_verificarData THEN
        OPEN v_cursor FOR
SELECT
    plantaProduto.produto,
    plantaProduto.planta
FROM
    operacao
        inner join culturaoperacao cp ON cp.operacao = operacao.id
        INNER JOIN cultura ON cultura.id = cp.cultura
        INNER JOIN planta ON planta.variedade = cultura.planta
        INNER JOIN plantaProduto ON plantaProduto.planta = planta.variedade
WHERE
        operacao.tipoOperacao = 7
  AND operacao.parcela = parcela1
  AND operacao.data BETWEEN dataInicial AND dataFinal
GROUP BY
    plantaProduto.produto, plantaProduto.planta;

RETURN v_cursor;
END IF;
EXCEPTION
    WHEN others THEN
        -- Lidar com a exceção, se necessário
        DBMS_OUTPUT.PUT_LINE('Exceção de Data: ' || SQLERRM);
END;