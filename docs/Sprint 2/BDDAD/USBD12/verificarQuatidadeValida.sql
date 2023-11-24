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

