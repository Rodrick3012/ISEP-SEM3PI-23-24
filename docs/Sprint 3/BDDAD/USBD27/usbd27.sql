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