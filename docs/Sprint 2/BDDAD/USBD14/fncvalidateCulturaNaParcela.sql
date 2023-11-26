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

--Teste com uma cultura válida na parcela:
DECLARE
result BOOLEAN;
BEGIN
    result := fncvalidateCulturaNaParcela('Campo da bouça', 1);
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 1: ' || CASE WHEN result THEN 'Sucesso' ELSE 'Falha' END);
END;
/

--Teste com uma cultura inválida na parcela:
DECLARE
result BOOLEAN;
BEGIN
    result := fncvalidateCulturaNaParcela('Campo da bouça',11);
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 2: ' || CASE WHEN result THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

--Teste com uma parcela inexistente:
DECLARE
result BOOLEAN;
BEGIN
    result := fncvalidateCulturaNaParcela('ParcelaInexistente', 1);
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 3: ' || CASE WHEN result THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/