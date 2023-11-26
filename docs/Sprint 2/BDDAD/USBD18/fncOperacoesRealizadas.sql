create or replace function fncOperacoesRealizadas
(parcelaDada operacao.parcela%type, dataAtual operacao.data%type, dataInicio operacao.data%type,
 dataFim operacao.data%type) return sys_refcursor
    is
    listOperacoes sys_refcursor;
    validacao boolean;
    dataInvalida exception;
begin
    validacao := fncverificardatanaoestanofuturo(dataAtual, dataInicio, dataFim);
    if validacao then
        open listOperacoes for
            select data, nvl(cultura, ' ') cultura, parcela, tipoOperacao
            from (select operacao.data,
                         operacao.parcela,
                         cultura.planta cultura,
                         tipoOperacao.tipooperacao
                  from operacao
                           inner join parcela on parcela.designacao = operacao.parcela
                           left join culturaoperacao co on co.operacao = operacao.id
                           left join cultura on cultura.id = co.cultura
                           inner join tipoOperacao on tipoOperacao.id = operacao.tipoOperacao

                  union all

                  select operacaoFatorProducao.data,
                         operacaoFatorProducao.parcela,
                         cultura.planta cultura,
                         tipoOperacao.tipoOperacao
                  from operacaoFatorProducao
                           inner join parcela on parcela.designacao = operacaoFatorProducao.parcela
                           left join culturaoperacaofatorproducao cofp on cofp.operacaofatorproducao = operacaofatorproducao.id
                           left join cultura on cultura.id = cofp.cultura
                           inner join tipoOperacao on tipoOperacao.id = operacaoFatorProducao.tipoOperacao

                  union all

                  select cast(operacaoRega.horario as date) data,
                         operacaoRega.parcela,
                         cultura.planta cultura,
                         'Rega'
                  from operacaoRega
                           inner join parcela on parcela.designacao = operacaoRega.parcela
                           left join cultura on cultura.id = operacaorega.cultura)
            where parcela like parcelaDada
              and data between dataInicio and dataFim
            group by tipoOperacao, data, parcela, cultura
            order by data, tipoOperacao;
        return (listOperacoes);
    else
        raise dataInvalida;
    end if;
exception
    when dataInvalida then
        raise_application_error(-20001, 'Data inválida');
end;


-- Bloco an�nimo para demonstra��o
set serveroutput on;

declare
    listOperacoes sys_refcursor;
    dataOperacao operacao.data%type;
    culturaOperacao cultura.planta%type;
    var_tipoOperacao tipoOperacao.tipoOperacao%type;
    parcelaOperacao operacao.parcela%type := 'Campo novo';
    dataAtual operacao.data%type := to_date('29/11/2023', 'DD/MM/YYYY');
    dataInicio operacao.data%type := to_date('01/07/2023', 'DD/MM/YYYY');
    dataFim operacao.data%type := to_date('02/10/2023', 'DD/MM/YYYY');
begin
    listOperacoes := fncoperacoesrealizadas(parcelaOperacao, dataAtual, dataInicio, dataFim);
    loop
        fetch listOperacoes into dataOperacao, culturaOperacao, parcelaOperacao, var_tipoOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line(to_char(dataOperacao, 'DD/MM/YYYY') || ' operação de ' || var_tipoOperacao || ', ' || culturaOperacao);
    end loop;
end;