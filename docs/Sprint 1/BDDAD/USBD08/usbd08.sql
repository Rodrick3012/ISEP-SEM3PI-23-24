select fatorproducao
from operacaofatorproducao
WHERE data BETWEEN '01-jan-2010' AND '01-jan-2023'
having count(*)= (select max(count(*))
    			from operacaofatorproducao
    			where data between '01-jan-2010' AND '01-jan-2023'
    			group by fatorproducao)
group by fatorproducao;