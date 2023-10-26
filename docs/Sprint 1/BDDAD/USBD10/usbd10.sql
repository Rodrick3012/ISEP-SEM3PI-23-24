select parcela
from operacao
inner join tipooperacao on tipooperacao.id=operacao.tipooperacao
where lower(tipooperacao.tipooperacao) like lower('Rega')and
		data BETWEEN '01-jan-2010' AND '01-jan-2023'
having count(*)= (select max(count(*))
    			from operacao
    			inner join tipooperacao on tipooperacao.id=operacao.tipooperacao
				where lower(tipooperacao.tipooperacao) like lower('Rega')and
    			data between '01-jan-2010' AND '01-jan-2023'
    			group by parcela)
group by parcela;