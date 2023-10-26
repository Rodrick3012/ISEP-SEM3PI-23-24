select fatorproducao,count(*) as quantidade
from operacaofatorproducao
WHERE data BETWEEN '01-jan-2010' AND '01-jan-2023'
group by fatorproducao;