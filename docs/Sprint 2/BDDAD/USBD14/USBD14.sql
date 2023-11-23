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

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Inserção mal-sucedida devido a um erro inesperado.');
END;



create FUNCTION fncverificarDataNaoEstaNoFuturo(dataAtual date,data1 date,
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


create FUNCTION fncverificarQuantidadeValida(quantidade operacao.quantidade%type, idCultura cultura.id%type, parcela1 parcela.designacao%type, unidade1 operacao.unidade%TYPE) RETURN BOOLEAN
    IS
    var_boolean BOOLEAN;
    var_area NUMBER;
    var_unidade varchar(5);
    var_tipoplanta varchar(20);
    var_quantidadeplantada NUMBER;

BEGIN

    SELECT area  into var_area
    FROM parcela
    where parcela.designacao=parcela1;

    if idCultura > 0 then
        SELECT tipoplanta.tipoplanta into var_tipoplanta
        FROM cultura
                 inner join planta on planta.variedade=cultura.planta
                 inner join tipoplanta on tipoplanta.id = planta.tipoplanta
        where cultura.id=idcultura;

        SELECT cultura.quantidade into var_quantidadeplantada
        FROM cultura
        where cultura.id=idcultura;
    end if;

    select unidade into var_unidade
    from unidade
    where unidade.id=unidade1;


    if var_unidade = 'ha' then
        IF quantidade <= var_area THEN
            var_boolean := TRUE;
        ELSE
            var_boolean := FALSE;
            raise_application_error(-20001, 'quantidade inválida');
        END IF;

    else
        if var_tipoplanta = 'Permanente' then
            if  var_unidade = 'un' then
                IF quantidade <= var_quantidadeplantada THEN
                    var_boolean := TRUE;
                ELSE
                    var_boolean := FALSE;
                    raise_application_error(-20001, 'quantidade inválida');
                END IF;
            end if;
        else
            var_boolean := true;
        end if;
    end if;

    RETURN var_boolean;

END;



create FUNCTION fncvalidateCulturaNaParcela(parcela1 parcela.designacao%type, culturaId cultura.id%type) return boolean
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
    end if;
End;




