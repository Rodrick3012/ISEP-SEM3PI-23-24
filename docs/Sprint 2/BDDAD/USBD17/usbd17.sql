create or replace NONEDITIONABLE function fncOperacoesFatorProducaoRealizadas
    (parcelaDada operacao.parcela%type, dataInicio operacao.data%type,
        dataFim operacao.data%type) return sys_refcursor
is
    listOperacoes sys_refcursor;
    validacao boolean;
    dataInvalida exception;
begin
    validacao := verificardatanaoestanofuturo(datainicio);
    validacao := verificardatanaoestanofuturo(dataInicio, dataFim);
    if validacao then
        open listOperacoes for
select operacaoFatorProducao.id, operacaoFatorProducao.parcela, operacaoFatorProducao.tipoOperacao,
       operacaoFatorProducao.data, operacaoFatorProducao.quantidade, operacaoFatorProducao.fatorProducao, substanciaFatorProducao.substancia
from operacaoFatorProducao
         inner join parcela on parcela.designacao = operacaoFatorProducao.parcela
         inner join tipooperacao on tipooperacao.id = operacaoFatorProducao.tipooperacao
         inner join fatorproducao on fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         inner join substanciaFatorProducao on substanciaFatorProducao.fatorProducao = operacaoFatorProducao.fatorProducao
where operacaoFatorProducao.parcela like parcelaDada
  and operacaoFatorProducao.data between dataInicio and dataFim;

return (listOperacoes);
else
        raise dataInvalida;
end if;
exception
        when dataInvalida then
            raise_application_error(-20001, 'Data inválida');
end;
