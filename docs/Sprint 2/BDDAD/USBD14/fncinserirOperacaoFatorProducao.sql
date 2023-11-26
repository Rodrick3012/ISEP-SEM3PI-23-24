create or replace NONEDITIONABLE PROCEDURE pcdinserirOperacaoFatorProducao(
    dataAtual date,
    data1 operacao.data%type,
    quantidade1 operacao.quantidade%type,
    parcela1 operacao.parcela%type,
    fatorproducao fatorproducao.designacao%type,
    cultura1 culturaoperacao.cultura%type,
    tipoOperacao operacao.tipoOperacao%type,
    unidade1 operacao.unidade%TYPE

)
IS
    -- Variável booleana para armazenar os resultados das validações
    var_boolean BOOLEAN;
    var_id_inserted number;

BEGIN
    -- Verificar se a data não está no futuro
    var_boolean := fncverificarDataNaoEstaNoFuturo(dataAtual,data1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Data Válida!!!');
END IF;

    -- Verificar se a quantidade é valida
    var_boolean := fncverificarquantidadevalida(quantidade1, cultura1,parcela1,unidade1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Quantidade Válida!!!');
END IF;

    if  cultura1 > 1 then
        -- Verificar se a cultura está na parcela
        var_boolean := fncvalidateCulturaNaParcela(parcela1, cultura1);
        IF var_boolean THEN
            DBMS_OUTPUT.PUT_LINE('Cultura e parcela Válidos!!!');
END IF;
end if;

INSERT INTO operacaofatorproducao (parcela, tipoOperacao, fatorproducao,modo,data, quantidade, unidade)
VALUES (parcela1, tipoOperacao, fatorproducao,2,data1, quantidade1, unidade1)
    RETURNING id INTO var_id_inserted;

if  cultura1 > 1 then
        INSERT INTO culturaoperacao(cultura,operacao)
        VALUES (cultura1,var_id_inserted);
end if;

    DBMS_OUTPUT.PUT_LINE('Inserção bem-sucedida: ' || SQL%ROWCOUNT || ' linha(s) inserida(s).');
commit;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Inserção mal-sucedida devido a um erro inesperado.');
rollback;
END;