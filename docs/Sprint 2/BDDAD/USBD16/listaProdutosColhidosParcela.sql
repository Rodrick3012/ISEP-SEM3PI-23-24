create or replace FUNCTION fnclistaProdutosColhidosParcela(
    dataAtual date,
    v_dataInicial operacao.data%type,
    v_dataFinal operacao.data%type,
    parcela1 operacao.parcela%type
) RETURN sys_refCursor
IS
    v_cursor sys_refCursor;
    v_verificarData BOOLEAN;
    excecaoData EXCEPTION;
BEGIN
    -- Validar data inicial
    v_verificarData := fncverificarDataNaoEstaNoFuturo(dataAtual,v_dataInicial);

    IF v_verificarData THEN
        OPEN v_cursor FOR
SELECT cultura.planta, produto.produto, planta.especie
FROM operacao
         INNER JOIN culturaoperacao ON culturaoperacao.operacao = operacao.id
         INNER JOIN cultura ON cultura.id = culturaoperacao.cultura
         INNER JOIN plantaProduto ON plantaProduto.planta = cultura.planta
         INNER JOIN produto ON produto.id = plantaProduto.produto
         INNER JOIN planta ON planta.variedade = cultura.planta
WHERE
        operacao.tipoOperacao = 7
  AND operacao.parcela = parcela1
  AND operacao.data BETWEEN v_dataInicial AND v_dataFinal
GROUP BY
    cultura.planta,produto.produto,planta.especie;
RETURN v_cursor;
END IF;
EXCEPTION
    WHEN others THEN
        -- Lidar com a exceção, se necessário
        DBMS_OUTPUT.PUT_LINE('Exceção de Data: ' || SQLERRM);
END;

--Bloco anónimo--
DECLARE
v_produto produto.produto%TYPE;
    v_planta planta.variedade%TYPE;
    v_especie planta.especie%TYPE;
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := fncListaProdutosColhidosParcela(
        TO_DATE('2023-11-26', 'YYYY-MM-DD'),
        TO_DATE('2023-05-20', 'YYYY-MM-DD'),
        TO_DATE('2023-11-06', 'YYYY-MM-DD'),
        'Campo novo'
    );

LOOP
FETCH v_cursor INTO v_planta, v_produto, v_especie;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('1-' || v_produto || ' 2-' || v_planta || ' 3-' || v_especie);
END LOOP;

CLOSE v_cursor;
END;
/