SELECT fatorproducao,count(*) AS quantidade
FROM operacaofatorproducao
WHERE data BETWEEN '01-jan-2010' AND '01-jan-2023'
GROUP BY fatorproducao;