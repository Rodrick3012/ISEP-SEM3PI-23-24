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
