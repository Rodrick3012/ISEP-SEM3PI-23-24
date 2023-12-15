create or replace trigger trg_ProibidoAlterarApagarLogs
before update or delete
on logoperacoes
declare
    proibidoAlterarApagarLogs exception;
begin
    raise proibidoAlterarApagarLogs;
exception
    when proibidoAlterarApagarLogs then
        raise_application_error(-20001, 'Não é possível alterar ou apagar as logs');
end;
/

-- Bloco anónimo para teste da ativação do trigger numa alteração

update logoperacoes
set tipoalteracao = 2
where idoperacao = 23;

-- Bloco anónimo para teste da ativação do trigger quando apaga um registo

delete from logoperacoes
where idoperacao = 23;