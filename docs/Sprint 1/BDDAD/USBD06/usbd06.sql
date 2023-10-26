select parcela,classificacao.classificacao,count (fatorproducao) as aplicações
from operacaofatorproducao
inner join fatorproducao on operacaofatorproducao.fatorproducao=fatorproducao.designacao
inner join classificacao on  classificacao.id=fatorproducao.classificacao
where data between '02-oct-2010' and '02-may-2021'
group by parcela,classificacao.classificacao;