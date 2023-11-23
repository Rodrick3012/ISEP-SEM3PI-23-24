--procedimento para inserir a operação
create or replace NONEDITIONABLE PROCEDURE pcdinserirOperacao(
    dataAtual date,
    tipoOperacao operacao.tipoOperacao%type,
    data1 operacao.data%type,
    quantidade1 operacao.quantidade%type,
    cultura1 culturaoperacao.cultura%type,
    parcela1 operacao.parcela%type,
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

    -- Verificar se a cultura está na parcela
    var_boolean := fncvalidateCulturaNaParcela(parcela1, cultura1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Cultura e parcela Válidos!!!');
    END IF;

    -- Inserir os dados na tabela
    INSERT INTO operacao (parcela, tipoOperacao, data, quantidade, unidade)
    VALUES (parcela1, tipoOperacao, data1, quantidade1, unidade1)
    RETURNING id INTO var_id_inserted;

    INSERT INTO culturaoperacao(cultura,operacao)
    VALUES (cultura1,var_id_inserted);


    DBMS_OUTPUT.PUT_LINE('Inserção bem-sucedida: ' || SQL%ROWCOUNT || ' linha(s) inserida(s).');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Inserção mal-sucedida devido a um erro inesperado.');
END;




--funcao validacao data/datas
create or replace NONEDITIONABLE FUNCTION fncverificarDataNaoEstaNoFuturo(dataAtual date,data1 date,
                                                                          data2 date DEFAULT NULL)
    RETURN BOOLEAN
    IS
    var_boolean BOOLEAN;
BEGIN

    IF data1 <= dataAtual AND (data2 IS NULL OR data1 <= data2) THEN
        var_boolean := TRUE;
    ELSE
        raise_application_error(-20001, 'Data inválida');
    END IF;

    RETURN var_boolean;
END;




--funcao validacao cultura/parcela
create or replace NONEDITIONABLE FUNCTION fncvalidateCulturaNaParcela(parcela1 parcela.designacao%type, culturaId cultura.id%type) return boolean
    is var_boolean boolean;
var_quantidade number;

BEGIN
    select count(*) into var_quantidade
    from ParcelaCultura
    where parcelaCultura.parcela = parcela1 AND parcelaCultura.cultura = culturaId;


    if var_quantidade > 0 then
        return true;
    else
        raise_application_error(-20001, 'Cultura/Parcela inválido');
        return false;
    end if;
End;
