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
/

--Teste com uma quantidade válida para uma cultura com tipo de planta "Permanente":
DECLARE
result1 BOOLEAN;
BEGIN
    result1 := fncverificarQuantidadeValida(5, 28, 'Lameiro da ponte', 1);
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 1: ' || CASE WHEN result1 THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/


--Teste com uma quantidade inválida para uma cultura com tipo de planta "Permanente":
DECLARE
result1 BOOLEAN;
BEGIN
    result1 := fncverificarQuantidadeValida(300, 28, 'Lameiro da ponte', 1);
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 2: ' || CASE WHEN result1 THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

--Teste com uma quantidade válida para uma cultura com ha e "Temporaria":
DECLARE
result1 BOOLEAN;
    quantidade_val NUMBER := 0.1; -- Declare uma variável com o valor desejado
BEGIN
    result1 := fncverificarQuantidadeValida(quantidade_val, 18, 'Horta nova', 4);
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 3: ' || CASE WHEN result1 THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

