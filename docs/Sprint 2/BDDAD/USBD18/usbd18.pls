create or replace function getOperacoesRealizadas
    (parcelaDada operacao.parcela%type, tipoOperacaoPedida tipoOperacao.tipoOperacao%type,
        dataInicio operacao.data%type, dataFim operacao.data%type) return sys_refcursor
is
    listOperacoes sys_refcursor;
begin
    open listOperacoes for
        select operacao.id, operacao.parcela, tipoOperacao.tipoOperacao, operacao.data, operacao.quantidade
            from operacao
            inner join parcela on parcela.designacao = operacao.parcela
            inner join tipooperacao on tipoOperacao.id = operacao.tipoOperacao
        where operacao.parcela like parcelaDada
            and tipoOperacao.tipoOperacao like tipoOperacaoPedida
            and operacao.data between dataInicio and dataFim

        union

        select operacaoFatorProducao.id, operacaoFatorProducao.parcela, tipoOperacao.tipoOperacao,
            operacaoFatorProducao.data, operacaoFatorProducao.quantidade
        from operacaoFatorProducao
            inner join parcela on parcela.designacao = operacao.parcela
            inner join fatorProducao on fatorProducao.designacao = operacaoFatorProducao.fatorProducao
            inner join tipoOperacao on tipoOperacao.id = operacaoFatorProducao.tipoOperacao
        where operacaoFatorProducao.parcela like parcelaDada
            and tipoOperacao.tipoOperacao like tipoOperacaoPedida
            and operacaoFatorProducao.data between dataInicio and dataFim
    return (listOperacoes);
end;