select operacao.parcela, tipooperacao.tipooperacao ,count(operacao.tipooperacao)  as quantidade
from operacao
inner join tipooperacao on operacao.tipooperacao = tipooperacao.id
    where data between '01-jan-2015' and '01-jan-2019'
group by operacao.parcela, tipooperacao.tipooperacao
union
select operacaofatorproducao.parcela, 'Fertilização' ,count(*)
from operacaofatorproducao
        where data between '01-jan-2015' and '01-jan-2019'
group by operacaofatorproducao.parcela
order by parcela;