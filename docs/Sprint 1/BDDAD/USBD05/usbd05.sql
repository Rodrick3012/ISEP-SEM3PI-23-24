select parcela,plantacao.nomecomum,plantacao.variedade,plantacao.produto,sum(quantidade) as quantidade , unidade.unidade
from operacao
inner join plantacao on operacao.plantacao=plantacao.id
inner join tipooperacao on tipooperacao.id=operacao.tipooperacao
inner join unidade on operacao.unidade=unidade.id
where parcela like 'Lameiro da ponte'
    and tipooperacao.tipooperacao like 'Colheita'
    and data between '7-jan-2021' and '18-oct-2022'
group by parcela,plantacao.nomecomum,plantacao.variedade,plantacao.produto,unidade.unidade;
