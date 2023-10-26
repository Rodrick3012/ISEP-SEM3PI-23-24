/*us05 Como Gestor Agrícola, pretendo saber a quantidade de produtos colhidos numa dada
parcela, para cada produto, num dado intervalo de tempo*/
select parcela,plantacao.nomecomum,plantacao.variedade,count(*) as quantidade
from operacao
inner join plantacao on operacao.plantacao=plantacao.id
inner join tipooperacao on tipooperacao.id=operacao.tipooperacao
where parcela like 'Lameiro da ponte'
    and tipooperacao.tipooperacao like 'Colheita'
    and data between '7-jan-2022' and '18-oct-2022'
group by parcela,plantacao.nomecomum,plantacao.variedade;