SELECT classificacao.classificacao,count(*) AS quantidade
FROM operacaofatorproducao
inner join fatorproducao on operacaofatorproducao.fatorproducao=fatorproducao.designacao
inner join classificacao on classificacao.id=fatorproducao.classificacao
WHERE data BETWEEN '01-jan-2010' AND '01-jan-2023'
GROUP BY classificacao.classificacao;