INSERT INTO tipoplanta (tipoplanta) values ('Permanente');
INSERT INTO tipoplanta (tipoplanta) values ('Temporária');
insert into tipoAlteracao (tipoalteracao) values ('criacao');
insert into tipoAlteracao (tipoalteracao) values ('anulacao');
Insert into Produto (produto) select ('Ameixa') FROM dual where not exists( Select id From produto Where  produto = 'Ameixa');
Insert into TipoPeriodo(TipoPeriodo) select ('dataPoda') FROM dual where not exists( Select id From TipoPeriodo Where  TipoPeriodo = 'dataPoda');
Insert into TipoPeriodo(TipoPeriodo) select ('dataFloração') FROM dual where not exists( Select id From TipoPeriodo Where  TipoPeriodo = 'dataFloração');
Insert into TipoPeriodo(TipoPeriodo) select ('dataColheita') FROM dual where not exists( Select id From TipoPeriodo Where  TipoPeriodo = 'dataColheita');
INSERT INTO especie(designacao,tipoplantaid) values ('Prunus domestica', (select id from tipoplanta where tipoplanta='Permanente'));
INSERT INTO especie(designacao,tipoplantaid) values ('Prunus armeniaca', (select id from tipoplanta where tipoplanta='Permanente'));
INSERT INTO especie(designacao,tipoplantaid) values ('Malus domestica', (select id from tipoplanta where tipoplanta='Permanente'));
INSERT INTO especie(designacao,tipoplantaid) values ('Pyrus pyrifolia', (select id from tipoplanta where tipoplanta='Permanente'));
INSERT INTO especie(designacao,tipoplantaid) values ('Daucus carota subsp. Sativus', (select id from tipoplanta where tipoplanta='Temporária'));
INSERT INTO especie(designacao,tipoplantaid) values ('Lupinus albus', (select id from tipoplanta where tipoplanta='Temporária'));
INSERT INTO especie(designacao,tipoplantaid) values ('Zea mays', (select id from tipoplanta where tipoplanta='Temporária'));
INSERT INTO especie(designacao,tipoplantaid) values ('Brassica rapa', (select id from tipoplanta where tipoplanta='Temporária'));
INSERT INTO especie(designacao,tipoplantaid) values ('Olea europaea', (select id from tipoplanta where tipoplanta='Permanente'));
INSERT INTO especie(designacao,tipoplantaid) values ('Vitis vinifera', (select id from tipoplanta where tipoplanta='Permanente'));
INSERT INTO especie(designacao,tipoplantaid) values ('Lupinus luteus', (select id from tipoplanta where tipoplanta='Temporária'));
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'RAINHA CLAUDIA CARANGUEJEIRA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'PRESIDENT');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'STANLEY');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'ANGELENO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'BLACK BEAUTY');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'BLACK STAR');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'BLACK GOLD');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'BLACK DIAMOND');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'BLACK AMBER');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'BLACK SPLENDOR');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'FORTUNA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'FRIAR');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'EL DORADO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'ELEPHANT HEART');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'GOLDEN JAPAN');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'HARRY PITCHON');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'LAETITIA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'METLEY');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'MIRABELLE DE NANCY');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'QUEEN ROSE');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'RED BEAUT');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'SANTA ROSA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'SHIRO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'SUNGOLD');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'WILSON PERFECTION');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus domestica'),'Ameixoeira', 'AUTUMN GIANT');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus armeniaca'),'Damasqueiro', 'BULIDA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus armeniaca'),'Damasqueiro', 'CANINO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus armeniaca'),'Damasqueiro', 'LIABAUD');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus armeniaca'),'Damasqueiro', 'MAILLOT JAUNE');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Prunus armeniaca'),'Damasqueiro', 'POLONAIS');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'AKANE');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'BELGOLDEN');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'BRAVO DE ESMOLFE');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'CASA NOVA DE ALCOBAÇA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'EROVAN');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'FUJI');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'GRANNY SMITH');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'GOLDEN DELICIOUS');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'HI-EARLY');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'JONAGORED');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'LYSGOLDEN');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'MUTSU');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'PORTA DA LOJA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'REINETTE OU CANADA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'REINETTE OU GRAND FAY');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'RISCADINHA DE PALMELA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'ROYAL GALA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'REDCHIEF');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'STARKING');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'SUMMER RED');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'WELLSPUR DELICIOUS');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'NOIVA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'OLHO ABERTO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'CAMOESA ROSA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'MALÁPIO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'GRONHO DOCE');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'PÉ DE BOI ');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'PINOVA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'PARDO LINDO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'PIPO DE BASTO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'PRIMA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'QUERINA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'VISTA BELLA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'GOLDEN SMOOTHEE');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'GOLDEN SUPREMA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'GLOSTER 69');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Malus domestica'),'Macieira', 'FREEDOM');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Pyrus pyrifolia'),'Pera Nashi', 'SNINSEIKI');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Pyrus pyrifolia'),'Pera Nashi', 'KUMOI');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Pyrus pyrifolia'),'Pera Nashi', 'HOSUI');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Pyrus pyrifolia'),'Pera Nashi', 'NIJISSEIKI');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Carson Hybrid');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Red Cored Chantenay');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Danvers Half Long');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Imperator 58');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Sugarsnax Hybrid');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Nelson Hybrid');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Daucus carota subsp. Sativus'),'Cenoura', 'Scarlet Nantes');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Lupinus luteus'),'Tremoço', 'Amarelo');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Lupinus albus'),'Tremoço', 'Branco');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Zea mays'),'Milho', 'MAS 24.C');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Zea mays'),'Milho', 'Doce Golden Bantam');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Brassica rapa'),'Nabo greleiro', 'Senhora Conceição');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'COBRANÇOSA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'ARBEQUINA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'HOJIBLANCA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'NEGRINHA DO FREIXO');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'PICUAL');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'MAÇANILHA');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'CONSERVA DE ELVAS');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Olea europaea'),'Oliveira', 'Galega ');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Brassica rapa'),'Nabo', 'S. Cosme');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Vitis vinifera'),'Videira', 'Dona Maria');
INSERT INTO planta (especieid, nomeComum, variedade) VALUES ((select id from especie where designacao like  'Vitis vinifera'),'Videira', 'Cardinal');




Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'RAINHA CLAUDIA CARANGUEJEIRA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'RAINHA CLAUDIA CARANGUEJEIRA%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'RAINHA CLAUDIA CARANGUEJEIRA%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'RAINHA CLAUDIA CARANGUEJEIRA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'PRESIDENT%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'PRESIDENT%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'PRESIDENT%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'PRESIDENT'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'STANLEY%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'STANLEY%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'STANLEY%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'STANLEY'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'ANGELENO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'ANGELENO%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'ANGELENO%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'ANGELENO'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK BEAUTY%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK BEAUTY%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK BEAUTY%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'BLACK BEAUTY'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK STAR%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK STAR%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK STAR%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'BLACK STAR'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK GOLD%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK GOLD%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK GOLD%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'BLACK GOLD'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK DIAMOND%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK DIAMOND%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK DIAMOND%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'BLACK DIAMOND'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK AMBER%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK AMBER%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK AMBER%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'BLACK AMBER'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK SPLENDOR%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK SPLENDOR%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'BLACK SPLENDOR%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'BLACK SPLENDOR'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'FORTUNA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'FORTUNA%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'FORTUNA%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'FORTUNA'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'FRIAR%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'FRIAR%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'FRIAR%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'FRIAR'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'EL DORADO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'EL DORADO%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'EL DORADO%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'EL DORADO'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'ELEPHANT HEART%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'ELEPHANT HEART%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'ELEPHANT HEART%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'ELEPHANT HEART'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'GOLDEN JAPAN%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'GOLDEN JAPAN%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'GOLDEN JAPAN%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'GOLDEN JAPAN'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'HARRY PITCHON%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'HARRY PITCHON%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'HARRY PITCHON%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'HARRY PITCHON'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'LAETITIA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'LAETITIA%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'LAETITIA%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'LAETITIA'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'METLEY%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'METLEY%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'METLEY%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'METLEY'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'MIRABELLE DE NANCY%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'MIRABELLE DE NANCY%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'MIRABELLE DE NANCY%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'MIRABELLE DE NANCY'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'QUEEN ROSE%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'QUEEN ROSE%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'QUEEN ROSE%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'QUEEN ROSE'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'RED BEAUT%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'RED BEAUT%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'RED BEAUT%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'RED BEAUT'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SANTA ROSA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SANTA ROSA%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SANTA ROSA%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'SANTA ROSA'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SHIRO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SHIRO%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SHIRO%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'SHIRO'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SUNGOLD%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SUNGOLD%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'SUNGOLD%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'SUNGOLD'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'WILSON PERFECTION%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'WILSON PERFECTION%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'WILSON PERFECTION%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'WILSON PERFECTION'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'AUTUMN GIANT%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'AUTUMN GIANT%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Ameixoeira' and variedade like 'AUTUMN GIANT%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Ameixa'),(select id from planta where variedade like 'AUTUMN GIANT'));
Insert into Produto (produto) select ('Damasco') FROM dual where not exists( select id from produto Where  produto = 'Damasco');
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'BULIDA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'BULIDA%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'BULIDA%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Damasco'),(select id from planta where variedade like 'BULIDA'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'CANINO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'CANINO%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'CANINO%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Damasco'),(select id from planta where variedade like 'CANINO'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'LIABAUD%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'LIABAUD%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'LIABAUD%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Damasco'),(select id from planta where variedade like 'LIABAUD'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'MAILLOT JAUNE%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'MAILLOT JAUNE%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'MAILLOT JAUNE%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Damasco'),(select id from planta where variedade like 'MAILLOT JAUNE'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'POLONAIS%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'POLONAIS%'),'Fevereiro a março',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Damasqueiro' and variedade like 'POLONAIS%'),'Julho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Damasco'),(select id from planta where variedade like 'POLONAIS'));
Insert into Produto (produto) select ('Maçã') FROM dual where not exists( select id from produto Where  produto = 'Maçã');
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'AKANE%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'AKANE%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'AKANE%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'AKANE'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'BELGOLDEN%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'BELGOLDEN%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'BELGOLDEN%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'BELGOLDEN'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'BRAVO DE ESMOLFE%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'BRAVO DE ESMOLFE%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'BRAVO DE ESMOLFE%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'BRAVO DE ESMOLFE'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'CASA NOVA DE ALCOBAÇA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'CASA NOVA DE ALCOBAÇA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'CASA NOVA DE ALCOBAÇA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'CASA NOVA DE ALCOBAÇA'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'EROVAN%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'EROVAN%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'EROVAN%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'EROVAN'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'FUJI%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'FUJI%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'FUJI%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'FUJI'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GRANNY SMITH%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GRANNY SMITH%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GRANNY SMITH%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'GRANNY SMITH'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN DELICIOUS%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN DELICIOUS%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN DELICIOUS%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'GOLDEN DELICIOUS'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'HI-EARLY%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'HI-EARLY%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'HI-EARLY%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'HI-EARLY'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'JONAGORED%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'JONAGORED%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'JONAGORED%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'JONAGORED'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'LYSGOLDEN%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'LYSGOLDEN%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'LYSGOLDEN%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'LYSGOLDEN'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'MUTSU%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'MUTSU%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'MUTSU%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'MUTSU'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PORTA DA LOJA%'),'Janeiro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PORTA DA LOJA%'),'Abril a maio',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PORTA DA LOJA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'PORTA DA LOJA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REINETTE OU CANADA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REINETTE OU CANADA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REINETTE OU CANADA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'REINETTE OU CANADA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REINETTE OU GRAND FAY%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REINETTE OU GRAND FAY%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REINETTE OU GRAND FAY%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'REINETTE OU GRAND FAY'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'RISCADINHA DE PALMELA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'RISCADINHA DE PALMELA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'RISCADINHA DE PALMELA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'RISCADINHA DE PALMELA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'ROYAL GALA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'ROYAL GALA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'ROYAL GALA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'ROYAL GALA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REDCHIEF%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REDCHIEF%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'REDCHIEF%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'REDCHIEF'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'STARKING%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'STARKING%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'STARKING%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'STARKING'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'SUMMER RED%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'SUMMER RED%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'SUMMER RED%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'SUMMER RED'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'WELLSPUR DELICIOUS%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'WELLSPUR DELICIOUS%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'WELLSPUR DELICIOUS%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'WELLSPUR DELICIOUS'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'NOIVA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'NOIVA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'NOIVA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'NOIVA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'OLHO ABERTO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'OLHO ABERTO%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'OLHO ABERTO%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'OLHO ABERTO'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'CAMOESA ROSA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'CAMOESA ROSA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'CAMOESA ROSA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'CAMOESA ROSA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'MALÁPIO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'MALÁPIO%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'MALÁPIO%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'MALÁPIO'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GRONHO DOCE%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GRONHO DOCE%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GRONHO DOCE%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'GRONHO DOCE'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PÉ DE BOI %'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PÉ DE BOI %'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PÉ DE BOI %'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'PÉ DE BOI '));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PINOVA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PINOVA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PINOVA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'PINOVA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PARDO LINDO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PARDO LINDO%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PARDO LINDO%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'PARDO LINDO'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PIPO DE BASTO%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PIPO DE BASTO%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PIPO DE BASTO%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'PIPO DE BASTO'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PRIMA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PRIMA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'PRIMA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'PRIMA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'QUERINA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'QUERINA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'QUERINA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'QUERINA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'VISTA BELLA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'VISTA BELLA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'VISTA BELLA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'VISTA BELLA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN SMOOTHEE%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN SMOOTHEE%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN SMOOTHEE%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'GOLDEN SMOOTHEE'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN SUPREMA%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN SUPREMA%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GOLDEN SUPREMA%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'GOLDEN SUPREMA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GLOSTER 69%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GLOSTER 69%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'GLOSTER 69%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'GLOSTER 69'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'FREEDOM%'),'Novembro a dezembro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'FREEDOM%'),'Março a abril',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Macieira' and variedade like 'FREEDOM%'),'Agosto a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Maçã'),(select id from planta where variedade like 'FREEDOM'));
Insert into Produto (produto) select ('Peras Nashi') FROM dual where not exists( select id from produto Where  produto = 'Peras Nashi');

Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Peras Nashi'),(select id from planta where variedade like 'SNINSEIKI'));

Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Peras Nashi'),(select id from planta where variedade like 'KUMOI'));

Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Peras Nashi'),(select id from planta where variedade like 'HOSUI'));

Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Peras Nashi'),(select id from planta where variedade like 'NIJISSEIKI'));
Insert into Produto (produto) select ('Cenoura') FROM dual where not exists( select id from produto Where  produto = 'Cenoura');
Insert into tipoplanta(tipoplanta) select ('Temporária') FROM dual where not exists( select id from tipoplanta Where  tipoplanta = 'Temporária');

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Carson Hybrid%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Carson Hybrid'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Red Cored Chantenay%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Red Cored Chantenay'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Danvers Half Long%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Danvers Half Long'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Imperator 58%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Imperator 58'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Sugarsnax Hybrid%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Sugarsnax Hybrid'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Nelson Hybrid%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Nelson Hybrid'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Cenoura' and variedade like 'Scarlet Nantes%'),'80 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Cenoura'),(select id from planta where variedade like 'Scarlet Nantes'));
Insert into Produto (produto) select ('Tremoço') FROM dual where not exists( select id from produto Where  produto = 'Tremoço');

Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Tremoço'),(select id from planta where variedade like 'Amarelo'));

Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Tremoço'),(select id from planta where variedade like 'Branco'));
Insert into Produto (produto) select ('Milho') FROM dual where not exists( select id from produto Where  produto = 'Milho');
Insert into TipoPeriodo(TipoPeriodo) select ('dataSementeira') FROM dual where not exists( select id from TipoPeriodo Where  TipoPeriodo = 'dataSementeira');

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Milho' and variedade like 'MAS 24.C%'),'Abril a junho',(select id from TipoPeriodo where TipoPeriodo like 'dataSementeira')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Milho' and variedade like 'MAS 24.C%'),'Julho a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Milho'),(select id from planta where variedade like 'MAS 24.C'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Milho' and variedade like 'Doce Golden Bantam%'),'Abril a junho',(select id from TipoPeriodo where TipoPeriodo like 'dataSementeira')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Milho' and variedade like 'Doce Golden Bantam%'),'Julho a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Milho'),(select id from planta where variedade like 'Doce Golden Bantam'));
Insert into Produto (produto) select ('Nabo Greleiro') FROM dual where not exists( select id from produto Where  produto = 'Nabo Greleiro');

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Nabo greleiro' and variedade like 'Senhora Conceição%'),'Março a setembro',(select id from TipoPeriodo where TipoPeriodo like 'dataSementeira')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Nabo greleiro' and variedade like 'Senhora Conceição%'),'Junho a fevereiro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Nabo Greleiro'),(select id from planta where variedade like 'Senhora Conceição'));
Insert into Produto (produto) select ('Azeitona') FROM dual where not exists( select id from produto Where  produto = 'Azeitona');

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'COBRANÇOSA%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'COBRANÇOSA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'ARBEQUINA%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'ARBEQUINA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'HOJIBLANCA%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'HOJIBLANCA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'NEGRINHA DO FREIXO%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'NEGRINHA DO FREIXO'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'PICUAL%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'PICUAL'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'MAÇANILHA%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'MAÇANILHA'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'CONSERVA DE ELVAS%'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'CONSERVA DE ELVAS'));

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Oliveira' and variedade like 'Galega %'),'Outubro a novembro',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Azeitona'),(select id from planta where variedade like 'Galega '));
Insert into Produto (produto) select ('Nabo') FROM dual where not exists( select id from produto Where  produto = 'Nabo');

Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Nabo' and variedade like 'S. Cosme%'),'Fevereiro a abril, agosto a outubro',(select id from TipoPeriodo where TipoPeriodo like 'dataSementeira')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Nabo' and variedade like 'S. Cosme%'),'90 dias',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Nabo'),(select id from planta where variedade like 'S. Cosme'));
Insert into Produto (produto) select ('Uva') FROM dual where not exists( select id from produto Where  produto = 'Uva');
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Videira' and variedade like 'Dona Maria%'),'Dezembro a janeiro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Videira' and variedade like 'Dona Maria%'),'Maio',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Videira' and variedade like 'Dona Maria%'),'Junho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Uva'),(select id from planta where variedade like 'Dona Maria'));
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Videira' and variedade like 'Cardinal%'),'Dezembro a janeiro',(select id from TipoPeriodo where TipoPeriodo like 'dataPoda')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Videira' and variedade like 'Cardinal%'),'Maio',(select id from TipoPeriodo where TipoPeriodo like 'dataFloração')) ;
Insert Into Periodo (planta,Periodo,tipo) values ((select id from planta where nomecomum like 'Videira' and variedade like 'Cardinal%'),'Junho a agosto',(select id from TipoPeriodo where TipoPeriodo like 'dataColheita')) ;
Insert into plantaProduto (produto,planta) values ((select id from produto where produto like 'Uva'),(select id from planta where variedade like 'Cardinal'));


Insert into fabricante(fabricante) select ('ASCENZA') FROM dual where not exists( select id from fabricante Where  fabricante = 'ASCENZA');
Insert into formulacao(formulacao) select ('Pó molhável') FROM dual where not exists( select id from formulacao Where  formulacao = 'Pó molhável');
Insert into classificacao(classificacao) select ('Fitofármaco') FROM dual where not exists( select id from classificacao Where  classificacao = 'Fitofármaco');
Insert into objetivo(objetivo) select ('Fungicida') FROM dual where not exists( select id from objetivo Where  objetivo = 'Fungicida');
Insert into  substancia (substancia) select ('CU') FROM dual where not exists( select id from substancia Where  substancia = 'CU');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Calda Bordalesa ASCENZA', (select id from fabricante where fabricante='ASCENZA'), (select id from formulacao where formulacao='Pó molhável'), (select id from classificacao where classificacao='Fitofármaco'), (select id from objetivo where objetivo='Fungicida'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'CU'),(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),0.2);
Insert into fabricante(fabricante) select ('Bayer') FROM dual where not exists( select id from fabricante Where  fabricante = 'Bayer');
Insert into  substancia (substancia) select ('S') FROM dual where not exists( select id from substancia Where  substancia = 'S');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Enxofre Bayer 80 WG', (select id from fabricante where fabricante='Bayer'), (select id from formulacao where formulacao='Pó molhável'), (select id from classificacao where classificacao='Fitofármaco'), (select id from objetivo where objetivo='Fungicida'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'S'),(select designacao from fatorproducao where designacao like 'Enxofre Bayer 80 WG'),0.8);
Insert into fabricante(fabricante) select ('K+S') FROM dual where not exists( select id from fabricante Where  fabricante = 'K+S');
Insert into formulacao(formulacao) select ('Granulado') FROM dual where not exists( select id from formulacao Where  formulacao = 'Granulado');
Insert into classificacao(classificacao) select ('Adubo') FROM dual where not exists( select id from classificacao Where  classificacao = 'Adubo');
Insert into objetivo(objetivo) select ('Adubo solo') FROM dual where not exists( select id from objetivo Where  objetivo = 'Adubo solo');
Insert into  substancia (substancia) select ('K') FROM dual where not exists( select id from substancia Where  substancia = 'K');
Insert into  substancia (substancia) select ('Mg') FROM dual where not exists( select id from substancia Where  substancia = 'Mg');
Insert into  substancia (substancia) select ('S') FROM dual where not exists( select id from substancia Where  substancia = 'S');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Patentkali', (select id from fabricante where fabricante='K+S'), (select id from formulacao where formulacao='Granulado'), (select id from classificacao where classificacao='Adubo'), (select id from objetivo where objetivo='Adubo solo'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'K'),(select designacao from fatorproducao where designacao like 'Patentkali'),0.249);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Mg'),(select designacao from fatorproducao where designacao like 'Patentkali'),0.06);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'S'),(select designacao from fatorproducao where designacao like 'Patentkali'),0.176);
Insert into  substancia (substancia) select ('Mg') FROM dual where not exists( select id from substancia Where  substancia = 'Mg');
Insert into  substancia (substancia) select ('S') FROM dual where not exists( select id from substancia Where  substancia = 'S');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('ESTA Kieserit', (select id from fabricante where fabricante='K+S'), (select id from formulacao where formulacao='Granulado'), (select id from classificacao where classificacao='Adubo'), (select id from objetivo where objetivo='Adubo solo'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Mg'),(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),0.151);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'S'),(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),0.208);
Insert into objetivo(objetivo) select ('Adubo foliar+Fertirrega') FROM dual where not exists( select id from objetivo Where  objetivo = 'Adubo foliar+Fertirrega');
Insert into  substancia (substancia) select ('Mg') FROM dual where not exists( select id from substancia Where  substancia = 'Mg');
Insert into  substancia (substancia) select ('S') FROM dual where not exists( select id from substancia Where  substancia = 'S');
Insert into  substancia (substancia) select ('B') FROM dual where not exists( select id from substancia Where  substancia = 'B');
Insert into  substancia (substancia) select ('Mn') FROM dual where not exists( select id from substancia Where  substancia = 'Mn');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('EPSO Microtop', (select id from fabricante where fabricante='K+S'), (select id from formulacao where formulacao='Granulado'), (select id from classificacao where classificacao='Adubo'), (select id from objetivo where objetivo='Adubo foliar+Fertirrega'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Mg'),(select designacao from fatorproducao where designacao like 'EPSO Microtop'),0.09);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'S'),(select designacao from fatorproducao where designacao like 'EPSO Microtop'),0.124);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'B'),(select designacao from fatorproducao where designacao like 'EPSO Microtop'),0.009);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Mn'),(select designacao from fatorproducao where designacao like 'EPSO Microtop'),0.01);
Insert into objetivo(objetivo) select ('Adubo foliar') FROM dual where not exists( select id from objetivo Where  objetivo = 'Adubo foliar');
Insert into  substancia (substancia) select ('Mg') FROM dual where not exists( select id from substancia Where  substancia = 'Mg');
Insert into  substancia (substancia) select ('S') FROM dual where not exists( select id from substancia Where  substancia = 'S');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('EPSO Top', (select id from fabricante where fabricante='K+S'), (select id from formulacao where formulacao='Granulado'), (select id from classificacao where classificacao='Adubo'), (select id from objetivo where objetivo='Adubo foliar'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Mg'),(select designacao from fatorproducao where designacao like 'EPSO Top'),0.096);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'S'),(select designacao from fatorproducao where designacao like 'EPSO Top'),0.13);
Insert into fabricante(fabricante) select ('Biocal') FROM dual where not exists( select id from fabricante Where  fabricante = 'Biocal');
Insert into classificacao(classificacao) select ('Corretor') FROM dual where not exists( select id from classificacao Where  classificacao = 'Corretor');
Insert into objetivo(objetivo) select ('Correção solo') FROM dual where not exists( select id from objetivo Where  objetivo = 'Correção solo');
Insert into  substancia (substancia) select ('CaCO3') FROM dual where not exists( select id from substancia Where  substancia = 'CaCO3');
Insert into  substancia (substancia) select ('MgCO3') FROM dual where not exists( select id from substancia Where  substancia = 'MgCO3');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Biocal CaCo3', (select id from fabricante where fabricante='Biocal'), (select id from formulacao where formulacao='Granulado'), (select id from classificacao where classificacao='Corretor'), (select id from objetivo where objetivo='Correção solo'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'CaCO3'),(select designacao from fatorproducao where designacao like 'Biocal CaCo3'),0.882);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'MgCO3'),(select designacao from fatorproducao where designacao like 'Biocal CaCo3'),0.019);
Insert into formulacao(formulacao) select ('Pó') FROM dual where not exists( select id from formulacao Where  formulacao = 'Pó');
Insert into  substancia (substancia) select ('CaCO3') FROM dual where not exists( select id from substancia Where  substancia = 'CaCO3');
Insert into  substancia (substancia) select ('MgCO3') FROM dual where not exists( select id from substancia Where  substancia = 'MgCO3');
Insert into  substancia (substancia) select ('MgO') FROM dual where not exists( select id from substancia Where  substancia = 'MgO');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Biocal Composto', (select id from fabricante where fabricante='Biocal'), (select id from formulacao where formulacao='Pó'), (select id from classificacao where classificacao='Corretor'), (select id from objetivo where objetivo='Correção solo'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'CaCO3'),(select designacao from fatorproducao where designacao like 'Biocal Composto'),0.717);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'MgCO3'),(select designacao from fatorproducao where designacao like 'Biocal Composto'),0.148);
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'MgO'),(select designacao from fatorproducao where designacao like 'Biocal Composto'),0.079);
Insert into formulacao(formulacao) select ('Líquido') FROM dual where not exists( select id from formulacao Where  formulacao = 'Líquido');
Insert into  substancia (substancia) select ('Bacillus pumilus') FROM dual where not exists( select id from substancia Where  substancia = 'Bacillus pumilus');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Sonata', (select id from fabricante where fabricante='Bayer'), (select id from formulacao where formulacao='Líquido'), (select id from classificacao where classificacao='Fitofármaco'), (select id from objetivo where objetivo='Fungicida'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Bacillus pumilus'),(select designacao from fatorproducao where designacao like 'Sonata'),0.9774);
Insert into formulacao(formulacao) select ('Emulsão de óleo em água') FROM dual where not exists( select id from formulacao Where  formulacao = 'Emulsão de óleo em água');
Insert into objetivo(objetivo) select ('Insecticida') FROM dual where not exists( select id from objetivo Where  objetivo = 'Insecticida');
Insert into  substancia (substancia) select ('Ácidos gordos (na forma de sais de potássio)') FROM dual where not exists( select id from substancia Where  substancia = 'Ácidos gordos (na forma de sais de potássio)');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('FLiPPER', (select id from fabricante where fabricante='Bayer'), (select id from formulacao where formulacao='Emulsão de óleo em água'), (select id from classificacao where classificacao='Fitofármaco'), (select id from objetivo where objetivo='Insecticida'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Ácidos gordos (na forma de sais de potássio)'),(select designacao from fatorproducao where designacao like 'FLiPPER'),0.478);
Insert into  substancia (substancia) select ('Terpenóides') FROM dual where not exists( select id from substancia Where  substancia = 'Terpenóides');
INSERT INTO FatorProducao (designacao, fabricante, formulacao, classificacao, objetivo) VALUES ('Requiem Prime', (select id from fabricante where fabricante='Bayer'), (select id from formulacao where formulacao='Líquido'), (select id from classificacao where classificacao='Fitofármaco'), (select id from objetivo where objetivo='Insecticida'));
Insert into  SubstanciaFatorProducao (substancia,fatorproducao,percentagem) values ((select id from substancia where substancia like 'Terpenóides'),(select designacao from fatorproducao where designacao like 'Requiem Prime'),0.1442);
INSERT INTO Parcela (designacao, area) VALUES ('Campo da bouça', 1.2);
INSERT INTO Parcela (designacao, area) VALUES ('Campo grande', 3.0);
INSERT INTO Parcela (designacao, area) VALUES ('Campo do poço', 1.5);
INSERT INTO Parcela (designacao, area) VALUES ('Lameiro da ponte', 0.8);
INSERT INTO Parcela (designacao, area) VALUES ('Lameiro do moinho', 1.1);
INSERT INTO Parcela (designacao, area) VALUES ('Horta nova', 0.3);
INSERT INTO Parcela (designacao, area) VALUES ('Vinha', 2.0);
Insert into modo(modo) select ('Foliar') FROM dual where not exists( select id from modo Where  modo = 'Foliar');
Insert into modo(modo) select ('Aplicação') FROM dual where not exists( select id from modo Where  modo = 'Aplicação');
Insert into modo(modo) select ('Solo') FROM dual where not exists( select id from modo Where  modo = 'Solo');
INSERT INTO unidade (designacao) values ('un');
INSERT INTO unidade (designacao) values ('ha');
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo da bouça')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')), TO_DATE('10-10-2020', 'DD-MM-YYYY'), TO_DATE('30-03-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-10-2020', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')),(select id from unidade where designacao like 'ha'),1.1);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo da bouça')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Milho Doce Golden Bantam%')), TO_DATE('10-04-2021', 'DD-MM-YYYY'), TO_DATE('12-08-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-04-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Milho Doce Golden Bantam%')),(select id from unidade where designacao like 'ha'),0.9);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo da bouça')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')), TO_DATE('03-10-2021', 'DD-MM-YYYY'), TO_DATE('05-04-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('03-10-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')),(select id from unidade where designacao like 'ha'),1.1);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo da bouça')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Milho Doce Golden Bantam%')), TO_DATE('15-04-2022', 'DD-MM-YYYY'), TO_DATE('21-08-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('15-04-2022', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Milho Doce Golden Bantam%')),(select id from unidade where designacao like 'ha'),0.9);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo do poço')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Milho MAS 24.C%')), TO_DATE('05-04-2020', 'DD-MM-YYYY'), TO_DATE('20-08-2020', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('05-04-2020', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Milho MAS 24.C%')),(select id from unidade where designacao like 'ha'),1.2);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo do poço')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')), TO_DATE('12-10-2020', 'DD-MM-YYYY'), TO_DATE('15-03-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('12-10-2020', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')),(select id from unidade where designacao like 'ha'),1.3);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo do poço')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Milho MAS 24.C%')), TO_DATE('03-04-2021', 'DD-MM-YYYY'), TO_DATE('25-08-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('03-04-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Milho MAS 24.C%')),(select id from unidade where designacao like 'ha'),1.2);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo do poço')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')), TO_DATE('06-10-2021', 'DD-MM-YYYY'), TO_DATE('19-03-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('06-10-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')),(select id from unidade where designacao like 'ha'),1.3);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo do poço')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Milho MAS 24.C%')), TO_DATE('08-04-2022', 'DD-MM-YYYY'), TO_DATE('18-08-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('08-04-2022', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Milho MAS 24.C%')),(select id from unidade where designacao like 'ha'),1.2);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo do poço')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')), TO_DATE('12-10-2022', 'DD-MM-YYYY'), TO_DATE('20-03-2023', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('12-10-2022', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Tremoço Amarelo%')),(select id from unidade where designacao like 'ha'),1.3);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo grande')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Oliveira Galega%')), TO_DATE('06-10-2016', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('06-10-2016', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Oliveira Galega%')),(select id from unidade where designacao like 'un'),30);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Campo grande')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Oliveira Picual%')), TO_DATE('10-10-2016', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-10-2016', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Oliveira Picual%')),(select id from unidade where designacao like 'un'),20);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Cenoura Scarlet Nantes%')), TO_DATE('10-03-2020', 'DD-MM-YYYY'), TO_DATE('15-05-2020', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-03-2020', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Cenoura Scarlet Nantes%')),(select id from unidade where designacao like 'ha'),0.15);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Cenoura Nelson Hybrid%')), TO_DATE('02-06-2020', 'DD-MM-YYYY'), TO_DATE('08-09-2020', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('02-06-2020', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Cenoura Nelson Hybrid%')),(select id from unidade where designacao like 'ha'),0.1);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Nabo S. Cosme%')), TO_DATE('20-09-2020', 'DD-MM-YYYY'), TO_DATE('10-01-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('20-09-2020', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Nabo S. Cosme%')),(select id from unidade where designacao like 'ha'),0.2);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Sugarsnax Hybrid%')), TO_DATE('10-03-2021', 'DD-MM-YYYY'), TO_DATE('15-05-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-03-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Sugarsnax Hybrid%')),(select id from unidade where designacao like 'ha'),0.15);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Danvers Half Long%')), TO_DATE('02-06-2021', 'DD-MM-YYYY'), TO_DATE('08-09-2021', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('02-06-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Danvers Half Long%')),(select id from unidade where designacao like 'ha'),0.1);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Nabo S. Cosme%')), TO_DATE('20-09-2021', 'DD-MM-YYYY'), TO_DATE('10-01-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('20-09-2021', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Nabo S. Cosme%')),(select id from unidade where designacao like 'ha'),0.2);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Sugarsnax Hybrid%')), TO_DATE('06-03-2022', 'DD-MM-YYYY'), TO_DATE('16-05-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('06-03-2022', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Sugarsnax Hybrid%')),(select id from unidade where designacao like 'ha'),0.15);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Cenoura Nelson Hybrid%')), TO_DATE('30-05-2022', 'DD-MM-YYYY'), TO_DATE('05-09-2022', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('30-05-2022', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Cenoura Nelson Hybrid%')),(select id from unidade where designacao like 'ha'),0.15);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Horta Nova')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Nabo greleiro Senhora Conceição%')), TO_DATE('20-09-2022', 'DD-MM-YYYY'), TO_DATE('14-01-2023', 'DD-MM-YYYY'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('20-09-2022', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Nabo greleiro Senhora Conceição%')),(select id from unidade where designacao like 'ha'),0.25);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Lameiro da ponte')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Macieira Jonagored%')), TO_DATE('07-01-2017', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('07-01-2017', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Macieira Jonagored%')),(select id from unidade where designacao like 'un'),90);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Lameiro da ponte')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Macieira Fuji%')), TO_DATE('08-01-2017', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('08-01-2017', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Macieira Fuji%')),(select id from unidade where designacao like 'un'),60);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Lameiro da ponte')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Macieira Royal Gala%')), TO_DATE('08-01-2017', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('08-01-2017', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Macieira Royal Gala%')),(select id from unidade where designacao like 'un'),40);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Lameiro da ponte')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Macieira Royal Gala%')), TO_DATE('10-12-2018', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-12-2018', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Macieira Royal Gala%')),(select id from unidade where designacao like 'un'),30);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Vinha')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Videira Dona Maria%')), TO_DATE('10-01-2018', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('10-01-2018', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Videira Dona Maria%')),(select id from unidade where designacao like 'un'),500);
INSERT INTO Cultura (parcela,planta, dataInicial, dataFinal) VALUES ((select designacao from Parcela where lower(designacao) like lower('Vinha')),(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL END AS result from planta where lower(nomecomum || ' ' || variedade) like lower('%Videira Cardinal%')), TO_DATE('11-01-2018', 'DD-MM-YYYY'), '');
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('11-01-2018', 'DD-MM-YYYY') and lower(nomecomum || ' ' || variedade) like lower('%Videira Cardinal%')),(select id from unidade where designacao like 'un'),700);
Insert into Operacao (anulada,data) values (0,To_Date('6-10-2016', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-10-2016', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-1-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('8-1-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('8-1-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('4-11-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('4-11-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-12-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-12-2017', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-1-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('8-1-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('8-1-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-1-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('11-1-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-2-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-2-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-2-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('17-11-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('17-11-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-12-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('16-12-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2018', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-1-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('8-1-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('8-1-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-2-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-2-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-2-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-11-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-11-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('16-12-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2019', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-3-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('30-3-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-5-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-5-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('2-6-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-8-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('28-8-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-9-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-9-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-10-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-11-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-11-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-11-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('16-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2020', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('4-1-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-3-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('14-3-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('30-3-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-4-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('2-5-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('2-5-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('2-5-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-5-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-5-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('2-6-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-7-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-7-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-8-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('24-8-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('25-8-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('28-8-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-9-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-9-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-9-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-9-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('23-9-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-10-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('3-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('17-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('17-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('28-11-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('3-12-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('16-12-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2021', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('4-1-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-3-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('19-3-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-4-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-4-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-5-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('13-5-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('13-5-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('13-5-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-5-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('30-5-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-7-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-7-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-8-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-8-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('17-8-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-8-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-8-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('24-8-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('5-9-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-9-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('11-9-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-9-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-9-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('17-10-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('6-11-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-11-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('10-11-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-11-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-11-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('15-11-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('4-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('7-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('11-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('11-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('16-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('18-12-2022', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('12-1-2023', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('14-1-2023', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2023', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-1-2023', 'DD-MM-YYYY'));
Insert into Operacao (anulada,data) values (0,To_Date('20-3-2023', 'DD-MM-YYYY'));
Insert into Plantacao (id,cultura,quantidade) values (1,11, 30);
Insert into Plantacao (id,cultura,quantidade) values (2,12, 20);
Insert into Plantacao (id,cultura,quantidade) values (3,22, 90);
Insert into Plantacao (id,cultura,quantidade) values (4,23, 60);
Insert into Plantacao (id,cultura,quantidade) values (5,24, 40);
Insert into Poda (id,cultura,quantidade) values (6,11, 30);
Insert into Poda (id,cultura,quantidade) values (7,12, 20);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (8,(select designacao from fatorproducao where designacao like 'Patentkali'),15,(select designacao from parcela where designacao like 'Campo grande'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (9,(select designacao from fatorproducao where designacao like 'Patentkali'),10,(select designacao from parcela where designacao like 'Campo grande'));
Insert into Poda (id,cultura,quantidade) values (10,22, 90);
Insert into Poda (id,cultura,quantidade) values (11,23, 60);
Insert into Poda (id,cultura,quantidade) values (12,24, 40);
Insert into Plantacao (id,cultura,quantidade) values (13,26, 500);
Insert into Plantacao (id,cultura,quantidade) values (14,27, 700);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (15,(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (16,(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),6,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (17,(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),5,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into Poda (id,cultura,quantidade) values (18,11, 30);
Insert into Poda (id,cultura,quantidade) values (19,12, 20);
Insert into Plantacao (id,cultura,quantidade) values (20,25, 30);
Insert into Poda (id,cultura,quantidade) values (21,26, 500);
Insert into Poda (id,cultura,quantidade) values (22,27, 700);
Insert into Poda (id,cultura,quantidade) values (23,22, 90);
Insert into Poda (id,cultura,quantidade) values (24,23, 60);
Insert into Poda (id,cultura,quantidade) values (25,25, 40);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (26,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),2,(select designacao from parcela where designacao like 'Vinha'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (27,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),2.5,(select designacao from parcela where designacao like 'Vinha'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (28,(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (29,(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),5,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (30,(select designacao from fatorproducao where designacao like 'ESTA Kieserit'),7,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into Poda (id,cultura,quantidade) values (31,11, 30);
Insert into Poda (id,cultura,quantidade) values (32,12, 20);
Insert into Poda (id,cultura,quantidade) values (33,26, 500);
Insert into Poda (id,cultura,quantidade) values (34,27, 700);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (35,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),2,(select designacao from parcela where designacao like 'Vinha'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (36,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),2.5,(select designacao from parcela where designacao like 'Vinha'));
Insert into Semeadura (id,cultura,area,quantidade) values (37,13,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=13), 0.9);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (38,(select designacao from fatorproducao where designacao like 'Biocal Composto'),600,(select designacao from parcela where designacao like 'Campo do poço'));
Insert into Colheita (id,cultura,quantidade) values (39,13, 2200);
Insert into Colheita (id,cultura,quantidade) values (40,13, 1400);
Insert into Semeadura (id,cultura,area,quantidade) values (41,14,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=14), 0.6);
Insert into Colheita (id,cultura,quantidade) values (42,5, 3300);
Insert into Colheita (id,cultura,quantidade) values (43,14, 600);
Insert into Colheita (id,cultura,quantidade) values (44,14, 1800);
Insert into Semeadura (id,cultura,area,quantidade) values (45,15,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=15), 0.6);
Insert into Semeadura (id,cultura,area,quantidade) values (46,1,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=1), 36);
Insert into Poda (id,cultura,quantidade) values (47,11, 30);
Insert into Poda (id,cultura,quantidade) values (48,12, 20);
Insert into Colheita (id,cultura,quantidade) values (49,15, 600);
Insert into Poda (id,cultura,quantidade) values (50,25, 70);
Insert into Poda (id,cultura,quantidade) values (51,22, 50);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (52,(select designacao from fatorproducao where designacao like 'Patentkali'),10,(select designacao from parcela where designacao like 'Campo grande'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (53,(select designacao from fatorproducao where designacao like 'Patentkali'),7,(select designacao from parcela where designacao like 'Campo grande'));
Insert into Poda (id,cultura,quantidade) values (54,22, 40);
Insert into Poda (id,cultura,quantidade) values (55,23, 60);
Insert into Poda (id,cultura,quantidade) values (56,26, 500);
Insert into Colheita (id,cultura,quantidade) values (57,15, 2500);
Insert into Poda (id,cultura,quantidade) values (58,27, 700);
Insert into Colheita (id,cultura,quantidade) values (59,15, 2900);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (60,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),2,(select designacao from parcela where designacao like 'Vinha'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (61,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),2.5,(select designacao from parcela where designacao like 'Vinha'));
Insert into Semeadura (id,cultura,area,quantidade) values (62,16,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=16), 0.9);
Insert into IncorporacaoSolo (id,cultura,area) values (63,1,1.3);
Insert into IncorporacaoSolo (id,cultura,area) values (64,1,1.3);
Insert into Semeadura (id,cultura,area,quantidade) values (65,2,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=2), 30);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (66,(select designacao from fatorproducao where designacao like 'EPSO Microtop'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (67,(select designacao from fatorproducao where designacao like 'EPSO Microtop'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (68,(select designacao from fatorproducao where designacao like 'EPSO Microtop'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into Colheita (id,cultura,quantidade) values (69,16, 2200);
Insert into Colheita (id,cultura,quantidade) values (70,16, 1400);
Insert into Semeadura (id,cultura,area,quantidade) values (71,17,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=17), 0.6);
Insert into Colheita (id,cultura,quantidade) values (72,26, 300);
Insert into Colheita (id,cultura,quantidade) values (73,26, 400);
Insert into Colheita (id,cultura,quantidade) values (74,2, 3300);
Insert into Colheita (id,cultura,quantidade) values (75,25, 900);
Insert into Colheita (id,cultura,quantidade) values (76,7, 3300);
Insert into Colheita (id,cultura,quantidade) values (77,17, 600);
Insert into Colheita (id,cultura,quantidade) values (78,25, 800);
Insert into Colheita (id,cultura,quantidade) values (79,17, 1800);
Insert into Colheita (id,cultura,quantidade) values (80,22, 800);
Insert into Semeadura (id,cultura,area,quantidade) values (81,18,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=18), 0.6);
Insert into Colheita (id,cultura,quantidade) values (82,22, 1200);
Insert into Colheita (id,cultura,quantidade) values (83,23, 950);
Insert into Colheita (id,cultura,quantidade) values (84,23, 750);
Insert into Colheita (id,cultura,quantidade) values (85,11, 210);
Insert into Colheita (id,cultura,quantidade) values (86,12, 120);
Insert into Colheita (id,cultura,quantidade) values (87,18, 600);
Insert into Poda (id,cultura,quantidade) values (88,11, 30);
Insert into Poda (id,cultura,quantidade) values (89,12, 20);
Insert into Poda (id,cultura,quantidade) values (90,25, 70);
Insert into Poda (id,cultura,quantidade) values (91,22, 90);
Insert into Poda (id,cultura,quantidade) values (92,26, 500);
Insert into Poda (id,cultura,quantidade) values (93,23, 60);
Insert into Colheita (id,cultura,quantidade) values (94,18, 2500);
Insert into Poda (id,cultura,quantidade) values (95,27, 700);
Insert into Colheita (id,cultura,quantidade) values (96,18, 2900);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (97,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),3,(select designacao from parcela where designacao like 'Vinha'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (98,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),3.5,(select designacao from parcela where designacao like 'Vinha'));
Insert into Semeadura (id,cultura,area,quantidade) values (99,19,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=19), 0.9);
Insert into IncorporacaoSolo (id,cultura,area) values (100,3,1.3);
Insert into IncorporacaoSolo (id,cultura,area) values (101,3,1.3);
Insert into Semeadura (id,cultura,area,quantidade) values (102,4,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=4), 30);
Insert into Colheita (id,cultura,quantidade) values (103,19, 2250);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (104,(select designacao from fatorproducao where designacao like 'EPSO Microtop'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (105,(select designacao from fatorproducao where designacao like 'EPSO Microtop'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (106,(select designacao from fatorproducao where designacao like 'EPSO Microtop'),10,(select designacao from parcela where designacao like 'Lameiro da ponte'));
Insert into Colheita (id,cultura,quantidade) values (107,19, 1300);
Insert into Semeadura (id,cultura,area,quantidade) values (108,20,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=20), 0.6);
Insert into Colheita (id,cultura,quantidade) values (109,26, 600);
Insert into Colheita (id,cultura,quantidade) values (110,26, 500);
Insert into Colheita (id,cultura,quantidade) values (111,27, 1200);
Insert into Colheita (id,cultura,quantidade) values (112,27, 600);
Insert into Colheita (id,cultura,quantidade) values (113,4, 3500);
Insert into Colheita (id,cultura,quantidade) values (114,9, 3300);
Insert into Colheita (id,cultura,quantidade) values (115,25, 950);
Insert into Colheita (id,cultura,quantidade) values (116,20, 650);
Insert into Colheita (id,cultura,quantidade) values (117,20, 1900);
Insert into Colheita (id,cultura,quantidade) values (118,25, 830);
Insert into Colheita (id,cultura,quantidade) values (119,22, 750);
Insert into Colheita (id,cultura,quantidade) values (120,22, 1150);
Insert into Semeadura (id,cultura,area,quantidade) values (121,21,(select area from cultura inner join parcela on parcela.designacao = cultura.parcela where id=21), 0.6);
Insert into Colheita (id,cultura,quantidade) values (122,23, 850);
Insert into Colheita (id,cultura,quantidade) values (123,23, 900);
Insert into Poda (id,cultura,quantidade) values (124,11, 30);
Insert into Poda (id,cultura,quantidade) values (125,12, 20);
Insert into Colheita (id,cultura,quantidade) values (126,11, 300);
Insert into Colheita (id,cultura,quantidade) values (127,12, 200);
Insert into Colheita (id,cultura,quantidade) values (128,21, 50);
Insert into Poda (id,cultura,quantidade) values (129,25, 70);
Insert into Poda (id,cultura,quantidade) values (130,22, 90);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (131,(select designacao from fatorproducao where designacao like 'Patentkali'),15,(select designacao from parcela where designacao like 'Campo grande'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (132,(select designacao from fatorproducao where designacao like 'Patentkali'),10,(select designacao from parcela where designacao like 'Campo grande'));
Insert into Poda (id,cultura,quantidade) values (133,26, 500);
Insert into Colheita (id,cultura,quantidade) values (134,21, 200);
Insert into Poda (id,cultura,quantidade) values (135,27, 700);
Insert into Poda (id,cultura,quantidade) values (136,23, 60);
Insert into Colheita (id,cultura,quantidade) values (137,21, 250);
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (138,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),4,(select designacao from parcela where designacao like 'Vinha'));
Insert into operacaoFatorProducao (id,fatorproducao,quantidade,parcela) values (139,(select designacao from fatorproducao where designacao like 'Calda Bordalesa ASCENZA'),5,(select designacao from parcela where designacao like 'Vinha'));
Insert into IncorporacaoSolo (id,cultura,area) values (140,3,1.3);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (8,11);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (9,12);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (15,22);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (16,23);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (17,24);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (26,26);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (27,27);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (28,22);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (29,23);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (30,2);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (35,26);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (36,27);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (52,11);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (53,12);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (60,26);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (61,27);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (66,22);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (67,23);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (68,25);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (97,26);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (98,27);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (104,22);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (105,23);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (106,25);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (131,11);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (132,12);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (138,26);
Insert into culturaOperacaoFatorProducao (operacaofatorproducao,cultura) values (139,27);
insert into OperacaoFertilizacao (id,modo) values (8,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (9,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (15,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (16,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (17,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (28,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (29,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (30,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (38,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (52,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (53,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (66,(select id from modo where modo like 'Foliar'));
insert into OperacaoFertilizacao (id,modo) values (67,(select id from modo where modo like 'Foliar'));
insert into OperacaoFertilizacao (id,modo) values (68,(select id from modo where modo like 'Foliar'));
insert into OperacaoFertilizacao (id,modo) values (104,(select id from modo where modo like 'Foliar'));
insert into OperacaoFertilizacao (id,modo) values (105,(select id from modo where modo like 'Foliar'));
insert into OperacaoFertilizacao (id,modo) values (106,(select id from modo where modo like 'Foliar'));
insert into OperacaoFertilizacao (id,modo) values (131,(select id from modo where modo like 'Solo'));
insert into OperacaoFertilizacao (id,modo) values (132,(select id from modo where modo like 'Solo'));
























insert into fabricante(fabricante) values ('Nutrofertil');
insert into fatorProducao values ('Fertimax Extrume de Cavalo',(select id from fabricante where fabricante.fabricante = 'Nutrofertil'),2,2,2);
INSERT INTO fatorproducaoph values ('Fertimax Extrume de Cavalo',6.7);
insert into fatorProducao values ('BIOFERTIL N6',(select id from fabricante where fabricante.fabricante = 'Nutrofertil'),2,2,2);
INSERT INTO fatorproducaoph values ('BIOFERTIL N6',6.4);

INSERT INTO substancia (substancia) VALUES ('Materia organica');
INSERT INTO substancia (substancia) VALUES ('N');
INSERT INTO substancia (substancia) VALUES ('P205');
INSERT INTO substancia (substancia) VALUES ('K20');
INSERT INTO substancia (substancia) VALUES ('Ca');


insert into substanciaFatorProducao values ((select id from substancia where substancia = 'Materia organica'),'Fertimax Extrume de Cavalo',50);
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'N'),'Fertimax Extrume de Cavalo',3) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'P205'),'Fertimax Extrume de Cavalo',0.8);
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'K20'),'Fertimax Extrume de Cavalo',0.4) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'Ca'),'Fertimax Extrume de Cavalo',1.6) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'MgO'),'Fertimax Extrume de Cavalo',0.3) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'B'),'Fertimax Extrume de Cavalo',0.004)  ;

insert into substanciaFatorProducao values ((select id from substancia where substancia = 'Materia organica'),'BIOFERTIL N6',50);
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'N'),'BIOFERTIL N6',6.4) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'P205'),'BIOFERTIL N6',2.5);
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'K20'),'BIOFERTIL N6',2.4) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'Ca'),'BIOFERTIL N6',6) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'MgO'),'BIOFERTIL N6',0.3) ;
insert into substanciaFatorProducao values ((select id from substancia where substancia = 'B'),'BIOFERTIL N6',0.0020)  ;

insert into produto (produto) values ('Abóbora');
INSERT INTO especie(designacao,tipoplantaid) values ('Cucurbita moschata var Butternut',2);
insert into planta (nomeComum, variedade,especieid) values('Abóbora','manteiga',(select id from especie where designacao like  'Cucurbita moschata var Butternut'));
insert into plantaProduto values ((select id from produto where produto.produto = 'Abóbora'),(select id from planta where variedade like 'manteiga'));
insert into parcela values('Campo novo',1.1);


insert into setor (setor,caudalMaximo,dataInicio) values (10,2500,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into CulturaSetor(cultura,setor,quantidade,dataInsercao) values (11,10,30,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura,setor,quantidade,dataInsercao) values (12,10,20,TO_DATE('01-05-2017', 'DD-MM-YYYY'));

insert into setor (setor,caudalMaximo,dataInicio) values (11,1500,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio) values (21,3500,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio) values (22,3500,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio,dataFim) values (41,2500,TO_DATE('01-04-2023', 'DD-MM-YYYY'),TO_DATE('10-10-2023', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio,dataFim) values (42,3500,TO_DATE('01-04-2023', 'DD-MM-YYYY'),TO_DATE('10-10-2023', 'DD-MM-YYYY'));

insert into planta (nomeComum, variedade,especieid) values('Oliveira','Arbequina',(select id from especie where designacao like  'Olea europaea'));


insert into plantaProduto values (9,(select id from planta where variedade like 'Arbequina'));

insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Arbequina'),'Campo grande',TO_DATE('2016-10-12','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2016-10-12','YYYY-MM-DD') and variedade like 'Arbequina'),(select id from unidade where designacao like 'un'),40);


insert into planta (nomeComum, variedade,especieid) values('Maceira','Porta de loja',(select id from especie where designacao like  'Malus domestica'));
insert into plantaProduto values (3,(select id from planta where variedade like 'Porta de loja'));
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Porta de loja'),'Lameiro do moinho',TO_DATE('2019-01-09','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2019-01-09','YYYY-MM-DD') and variedade like 'Porta de loja'),(select id from unidade where designacao like 'un'),50);

insert into planta (nomeComum, variedade,especieid) values('Maceira','Malápio',(select id from especie where designacao like  'Malus domestica'));
insert into plantaProduto values (3,(select id from planta where variedade like 'Malápio'));
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Malápio'),'Lameiro do moinho',TO_DATE('2019-01-10','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2019-01-10','YYYY-MM-DD') and variedade like 'Malápio'),(select id from unidade where designacao like 'un'),20);


-- Operação de plantação de Macieira Pipo de Basto
insert into planta (nomeComum, variedade,especieid) values('Maceira','Pipo de basto',(select id from especie where designacao like  'Malus domestica'));

insert into plantaProduto values (3,(select id from planta where variedade like 'Pipo de basto'));
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Pipo de basto'),'Lameiro do moinho',TO_DATE('2019-01-10','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2019-01-10','YYYY-MM-DD') and variedade like 'Pipo de basto'),(select id from unidade where designacao like 'un'),40);

-- Operação de plantação de Macieira Canada
insert into planta (nomeComum, variedade,especieid) values('Maceira','Canada' ,(select id from especie where designacao like  'Malus domestica'));

insert into plantaProduto values (3,(select id from planta where variedade like 'Canada'));
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Canada'),'Lameiro do moinho',TO_DATE('2019-01-10','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2019-01-10','YYYY-MM-DD') and variedade like 'Canada'),(select id from unidade where designacao like 'un'),30);

-- Operação de plantação de Macieira Grand Fay
insert into planta (nomeComum, variedade,especieid) values('Maceira','Grand Fay' ,(select id from especie where designacao like  'Malus domestica'));

insert into plantaProduto values (3,(select id from planta where variedade like 'Grand Fay'));
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Grand Fay'),'Lameiro do moinho',TO_DATE('2019-01-11','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2019-01-11','YYYY-MM-DD') and variedade like 'Grand Fay'),(select id from unidade where designacao like 'un'),40);

-- Operação de plantação de Macieira Gronho Doce
insert into planta (nomeComum, variedade,especieid) values('Maceira','Gronho Doce' ,(select id from especie where designacao like  'Malus domestica'));

insert into plantaProduto values (3,(select id from planta where variedade like 'Gronho Doce'));
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Gronho Doce'),'Lameiro do moinho',TO_DATE('2019-01-11','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2019-01-11','YYYY-MM-DD') and variedade like 'Gronho Doce'),(select id from unidade where designacao like 'un'),50);


insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Sugarsnax Hybrid'),'Campo novo',TO_DATE('2023-04-05','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2023-04-05','YYYY-MM-DD') and variedade like 'Sugarsnax Hybrid'),(select id from unidade where designacao like 'ha'),1.2);

insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'manteiga'),'Campo novo',TO_DATE('2023-04-06','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2023-04-06','YYYY-MM-DD') and variedade like 'manteiga'),(select id from unidade where designacao like 'ha'),0.6);


-- Monda de plantação de cenouras Danvers Half Long (08/08/2023)
insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Danvers Half Long'),'Campo novo',TO_DATE('2023-07-05','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2023-07-05','YYYY-MM-DD') and variedade like 'Danvers Half Long'),(select id from unidade where designacao like 'ha'),1.2);

insert into cultura(planta,parcela,dataInicial) values ((select id from planta where variedade like 'Amarelo'),'Campo novo',TO_DATE('2023-10-12','YYYY-MM-DD'));
Insert into Quantidade (Cultura,Unidade,quantidade) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta where datainicial = TO_DATE('2023-10-12','YYYY-MM-DD') and variedade like 'Amarelo'),(select id from unidade where designacao like 'un'),32);

insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Arbequina'),11,40,TO_DATE('01-05-2017', 'DD-MM-YYYY'));


--setor 21
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values (22,21,90,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values (23,21,60,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values (24,21,60,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values (25,21,40,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Lameiro do moinho' and planta.variedade = 'Pipo de basto'),21,40,TO_DATE('01-05-2019', 'DD-MM-YYYY'));


--setor 22
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Lameiro do moinho' and planta.variedade = 'Porta de loja'),22,50,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Lameiro do moinho' and planta.variedade = 'Malápio'),22,20,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Lameiro do moinho' and planta.variedade = 'Canada'),22,30,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Lameiro do moinho' and planta.variedade = 'Grand Fay'),22,40,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Lameiro do moinho' and planta.variedade = 'Gronho Doce'),22,50,TO_DATE('01-05-2019', 'DD-MM-YYYY'));


--setor 41
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao,dataRemocao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Campo novo' and planta.variedade = 'Sugarsnax Hybrid'),41,1.2,TO_DATE('05-04-2023', 'DD-MM-YYYY'),TO_DATE('31-05-2023', 'DD-MM-YYYY'));
insert into CulturaSetor (cultura, setor,quantidade,dataInsercao,dataRemocao) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Campo novo' and planta.variedade = 'Danvers Half Long'),41,1.2,TO_DATE('05-07-2023', 'DD-MM-YYYY'),TO_DATE('08-10-2023', 'DD-MM-YYYY'));


--setor 42
insert into CulturaSetor(cultura,setor,quantidade,dataInsercao,dataRemocao ) values ((select cultura.id from cultura inner join planta on planta.id=cultura.planta  where parcela = 'Campo novo' and planta.variedade =  'manteiga'),42,0.6,TO_DATE('06-04-2023', 'DD-MM-YYYY'),TO_DATE('10-09-2023', 'DD-MM-YYYY'));



--Operacao Rega setor 41
Insert INTO operacao (anulada,data) values (0, TO_DATE('20-05-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('02-06-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('09-06-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('09-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('16-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('23-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('30-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('07-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('14-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('21-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('28-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('06-09-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('13-09-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('20-09-2023', 'DD-MM-YYYY'));
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (141, 120, TO_TIMESTAMP('2023-05-20 07:30:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (142, 120, TO_TIMESTAMP('2023-06-02 07:30:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (143, 120, TO_TIMESTAMP('2023-06-09 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (144, 120, TO_TIMESTAMP('2023-07-09 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (145, 120, TO_TIMESTAMP('2023-07-16 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (146, 120, TO_TIMESTAMP('2023-07-23 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (147, 120, TO_TIMESTAMP('2023-07-30 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (148, 120, TO_TIMESTAMP('2023-08-07 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (149, 120, TO_TIMESTAMP('2023-08-14 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (150, 120, TO_TIMESTAMP('2023-08-21 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (151, 120, TO_TIMESTAMP('2023-08-28 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (152, 120, TO_TIMESTAMP('2023-09-06 06:20:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (153, 120, TO_TIMESTAMP('2023-09-13 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),41);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (154, 120, TO_TIMESTAMP('2023-09-20 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),41);



--setor 22
Insert INTO operacao (anulada,data) values (0, TO_DATE('13-05-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('02-06-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('16-06-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('01-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('08-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('15-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('22-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('29-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('05-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('10-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('17-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('24-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('02-09-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('09-09-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('18-09-2023', 'DD-MM-YYYY'));
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (155, 120, TO_TIMESTAMP('2023-05-13 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (156, 120, TO_TIMESTAMP('2023-06-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (157, 120, TO_TIMESTAMP('2023-06-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (158,  120, TO_TIMESTAMP('2023-07-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (159, 180, TO_TIMESTAMP('2023-07-08 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (160, 180, TO_TIMESTAMP('2023-07-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (161, 180, TO_TIMESTAMP('2023-07-22 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (162, 180, TO_TIMESTAMP('2023-07-29 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (163, 150, TO_TIMESTAMP('2023-08-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (164, 150, TO_TIMESTAMP('2023-08-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (165, 150, TO_TIMESTAMP('2023-08-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (166, 120, TO_TIMESTAMP('2023-08-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (167, 120, TO_TIMESTAMP('2023-09-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (168, 120, TO_TIMESTAMP('2023-09-09 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor)VALUES (169, 120, TO_TIMESTAMP('2023-09-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),22);


Insert INTO operacao (anulada,data) values (0, TO_DATE('13-05-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('02-06-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('16-06-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('01-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('08-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('15-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('22-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('29-07-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('05-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('10-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('17-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('24-08-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('02-09-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('09-09-2023', 'DD-MM-YYYY'));
Insert INTO operacao (anulada,data) values (0, TO_DATE('18-09-2023', 'DD-MM-YYYY'));
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (170, 120, TO_TIMESTAMP('2023-05-14 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (171, 120, TO_TIMESTAMP('2023-06-01 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (172, 120, TO_TIMESTAMP('2023-06-15 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (173, 120, TO_TIMESTAMP('2023-06-30 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (174, 180, TO_TIMESTAMP('2023-07-07 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (175, 180, TO_TIMESTAMP('2023-07-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (176, 180, TO_TIMESTAMP('2023-07-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (177, 180, TO_TIMESTAMP('2023-07-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (178, 150, TO_TIMESTAMP('2023-08-04 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (179, 150, TO_TIMESTAMP('2023-08-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (180, 150, TO_TIMESTAMP('2023-08-18 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (181, 120, TO_TIMESTAMP('2023-08-25 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (182, 120, TO_TIMESTAMP('2023-09-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (183, 120, TO_TIMESTAMP('2023-09-08 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);
INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (184, 120, TO_TIMESTAMP('2023-09-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),21);

--rega setor 10
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('02-06-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('02-07-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('02-08-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('04-09-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('02-10-2023', 'DD-MM-YYYY'));

--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (185, 60, TO_TIMESTAMP('2023-06-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),10);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (186, 120,TO_TIMESTAMP('2023-07-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),10);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (187, 180,TO_TIMESTAMP('2023-08-02 05:00:00', 'YYYY-MM-DD HH24:MI:SS'),10);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (188, 120,TO_TIMESTAMP('2023-09-04 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),10);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (189, 60, TO_TIMESTAMP('2023-10-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),10);



--setor 42
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('12-06-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('19-06-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('30-06-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('08-07-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('15-07-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('22-07-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('29-07-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('05-08-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('12-08-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('19-08-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('26-08-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('31-08-2023', 'DD-MM-YYYY'));
INSERT INTO Operacao (anulada,data) values (0, TO_DATE('05-09-2023', 'DD-MM-YYYY'));

--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (190,  60, TO_TIMESTAMP('2023-06-12 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (191,  60, TO_TIMESTAMP('2023-06-19 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (192, 120, TO_TIMESTAMP('2023-06-30 04:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (193, 120, TO_TIMESTAMP('2023-07-08 04:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (194, 120, TO_TIMESTAMP('2023-07-15 04:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (195, 150, TO_TIMESTAMP('2023-07-22 04:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (196, 150, TO_TIMESTAMP('2023-07-29 04:00:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (197, 120, TO_TIMESTAMP('2023-08-05 21:30:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (198, 120, TO_TIMESTAMP('2023-08-12 21:30:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (199, 120, TO_TIMESTAMP('2023-08-19 21:30:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (200, 120, TO_TIMESTAMP('2023-08-26 21:30:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (201, 120, TO_TIMESTAMP('2023-08-31 21:30:00', 'YYYY-MM-DD HH24:MI:SS'),42);
--INSERT INTO operacaoRegaSetor (id, duracao,  horario, setor) VALUES (202, 120, TO_TIMESTAMP('2023-09-05 21:30:00', 'YYYY-MM-DD HH24:MI:SS'),42);




INSERT INTO Operacao (anulada,data) values (0, TO_DATE('12-10-2023', 'DD-MM-YYYY'));
INSERT INTO Semeadura (id,cultura,area,quantidade) values (203,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Amarelo' and dataFinal is null),1.1,32);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('10-10-2023', 'DD-MM-YYYY'));
INSERT INTO MobilizacaoSolo (id,parcela,area) values (204,'Campo novo',0.5);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('18-09-2023', 'DD-MM-YYYY'));
INSERT INTO Colheita(id,cultura,quantidade) values (205,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),900);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Danvers Half Long'),205);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('22-09-2023', 'DD-MM-YYYY'));
INSERT INTO Colheita(id,cultura,quantidade) values (206,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),1500);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Danvers Half Long'),206);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('05-10-2023', 'DD-MM-YYYY'));
INSERT INTO Colheita(id,cultura,quantidade) values (207,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),1200);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Danvers Half Long'),207);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('05-07-2023', 'DD-MM-YYYY'));
INSERT INTO Semeadura (id,cultura,area,quantidade) values (208,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),0.5,1.2);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('08-08-2023', 'DD-MM-YYYY'));
INSERT INTO Monda (id,cultura,area) values (209,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),0.5);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('15-09-2023', 'DD-MM-YYYY'));
INSERT INTO Colheita (id,cultura,quantidade) values (210,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),8000);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Danvers Half Long'),210);



INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-15',' YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (211,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Danvers Half Long' and dataFinal IS NULL),8000);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Danvers Half Long'),211);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-25',' YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (212,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'manteiga' and dataFinal IS NULL),5000);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'manteiga'),212);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-08', 'YYYY-MM-DD'));
INSERT INTO Monda (id,cultura,area) values (213,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Sugarsnax Hybrid' and dataFinal IS NULL),0.5);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-06-14','YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (214,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Sugarsnax Hybrid' and dataFinal IS NULL),1500);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Sugarsnax Hybrid'),214);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-06-28','YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (215,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Sugarsnax Hybrid' and dataFinal IS NULL),2500);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Sugarsnax Hybrid'),215);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Monda (id,cultura,area) values (216,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like'manteiga' and dataFinal IS NULL),0.6);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO Monda (id,cultura,area) values (217,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'manteiga' and dataFinal IS NULL),0.6);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-04-05', 'YYYY-MM-DD'));
INSERT INTO Semeadura (id,cultura,area,quantidade) values (218,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Sugarsnax Hybrid' and dataFinal IS NULL),0.5,1.2);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-04-06', 'YYYY-MM-DD'));
INSERT INTO Semeadura (id,cultura,area,quantidade) values (219,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'manteiga' and dataFinal IS NULL),0.6,1.5);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-07-04', 'YYYY-MM-DD'));
INSERT INTO MobilizacaoSolo (id,area,parcela) values (220,0.5,'Campo novo');

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-08-18', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (221,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'ROYAL GALA' and dataInicial = TO_DATE('08-01-2017', 'DD-MM-YY') and dataFinal IS NULL),700);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'ROYAL GALA'),221);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (222,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'ROYAL GALA' and dataInicial = TO_DATE('10-12-2018', 'DD-MM-YY') and dataFinal IS NULL),900);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'ROYAL GALA'),222);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-05', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (223,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'JONAGORED' and dataFinal IS NULL),900);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'JONAGORED'),223);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-08', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (224,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'JONAGORED' and dataFinal IS NULL),1050);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'JONAGORED'),224);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-28', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (225,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'FUJI' and dataFinal IS NULL),950);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'FUJI'),225);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-10-03', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (226,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'FUJI' and dataFinal IS NULL),800);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'FUJI'),226);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-11-02', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (227,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Arbequina' and dataFinal IS NULL),400);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Arbequina'),227);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-11-05', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (228,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'PICUAL' and dataFinal IS NULL),300);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'PICUAL'),228);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-11-08', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (229,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Galega%' and dataFinal IS NULL),350);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Galega%'),229);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2016-10-12', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (230,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Arbequina' and dataFinal IS NULL),40);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-09', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (231,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Porta de loja' and dataFinal IS NULL),50);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-09', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (232,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Malápio' and dataFinal IS NULL),20);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-10', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (233,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Pipo de basto' and dataFinal IS NULL),40);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-10', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (234,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Canada' and dataFinal IS NULL),30);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-11', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (235,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Grand Fay' and dataFinal IS NULL),40);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-11', 'YYYY-MM-DD'));
INSERT INTO Plantacao(id,cultura,quantidade) values (236,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like  'Gronho Doce' and dataFinal IS NULL),50);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (237,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Canada' and dataFinal IS NULL),700);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Canada'),237);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-16', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (238,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like'Grand Fay' and dataFinal IS NULL),600);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Grand Fay'),238);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-20', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (239,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Grand Fay' and dataFinal IS NULL),700);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Grand Fay'),239);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-09-27', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (240,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Pipo de basto' and dataFinal IS NULL),600);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Pipo de basto'),240);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-10-05', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (241,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Pipo de basto' and dataFinal IS NULL),700);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Pipo de basto'),241);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (242,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Gronho Doce' and dataFinal IS NULL),1200);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Gronho Doce'),242);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (243,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like'Malápio' and dataFinal IS NULL),700);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Malápio'),243);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-11-12', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (244,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Porta de loja' and dataFinal IS NULL),700);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Porta de loja' ),244);

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-11-15', 'YYYY-MM-DD'));
INSERT INTO Colheita(id,cultura,quantidade) values (245,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where planta.variedade like 'Porta de loja' and dataFinal IS NULL),800);
INSERT INTO Colheita_produto (produtoid,Colheitaid) values ((select p.id from produto p inner join plantaproduto pp on p.id=pp.produto inner join planta on planta.id=pp.planta where planta.variedade like 'Porta de loja' ),245);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-13', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (246,'BIOFERTIL N6','Campo grande',120);
insert into operacaoAplicacao(id) values (246);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (246,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('PICUAL') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (247,'BIOFERTIL N6','Campo grande',180);
insert into operacaoAplicacao(id) values (247);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (247,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('galega%') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (248,'BIOFERTIL N6','Campo grande',240);
insert into operacaoAplicacao(id) values (248);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (248,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('Arbequina') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (249,'BIOFERTIL N6','Campo grande',120);
insert into operacaoAplicacao(id) values (249);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (249,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('PICUAL') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (250,'BIOFERTIL N6','Campo grande',180);
insert into operacaoAplicacao(id) values (250);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (250,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('galega%') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-13', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (251,'BIOFERTIL N6','Campo grande',240);
insert into operacaoAplicacao(id) values (251);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (251,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('Arbequina') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (252,'BIOFERTIL N6','Campo grande',120);
insert into operacaoAplicacao(id) values (252);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (252,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('picual') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (253,'BIOFERTIL N6','Campo grande',180);
insert into operacaoAplicacao(id) values (253);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (253,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('galega%') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (254,'BIOFERTIL N6','Campo grande',240);
insert into operacaoAplicacao(id) values (254);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (254,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('Arbequina') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-04-01', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (255,'Biocal Composto','Campo novo',500);
insert into operacaoAplicacao(id) values (255);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-07-03', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (256,'Fertimax Extrume de Cavalo','Campo novo',1800);
insert into operacaoAplicacao(id) values (256);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2019-01-04', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (257,'BIOFERTIL N6','Lameiro do moinho',3200);
insert into operacaoAplicacao(id) values (257);


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2020-01-06', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (258,'Fertimax Extrume de Cavalo','Lameiro do moinho',100);
insert into operacaoAplicacao(id) values (258);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (258,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('porta de loja') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2020-01-06', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (259,'Fertimax Extrume de Cavalo','Lameiro do moinho',40);
insert into operacaoAplicacao(id) values (259);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (259,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('malápio') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2020-01-06', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (260,'Fertimax Extrume de Cavalo','Lameiro do moinho',80);
insert into operacaoAplicacao(id) values (260);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (260,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('pipo de basto') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2020-01-06', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (261,'Fertimax Extrume de Cavalo','Lameiro do moinho',60);
insert into operacaoAplicacao(id) values (261);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (261,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('canada') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2020-01-07', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (262,'Fertimax Extrume de Cavalo','Lameiro do moinho',80);
insert into operacaoAplicacao(id) values (262);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (262,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('grand fay') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2020-01-07', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (263,'Fertimax Extrume de Cavalo','Lameiro do moinho',100);
insert into operacaoAplicacao(id) values (263);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (263,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('gronho doce') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-07', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (264,'Fertimax Extrume de Cavalo','Lameiro do moinho',150);
insert into operacaoAplicacao(id) values (264);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (264,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('porta de loja') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-07', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (265,'Fertimax Extrume de Cavalo','Lameiro do moinho',60);
insert into operacaoAplicacao(id) values (265);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (265,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('malápio') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-08', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (266,'Fertimax Extrume de Cavalo','Lameiro do moinho',120);
insert into operacaoAplicacao(id) values (266);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (266,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('pipo de basto') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-07', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (267,'Fertimax Extrume de Cavalo','Lameiro do moinho',90);
insert into operacaoAplicacao(id) values (267);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (267,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('canada') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-07', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (268,'Fertimax Extrume de Cavalo','Lameiro do moinho',120);
insert into operacaoAplicacao(id) values (268);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (268,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('grand fay') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2021-01-08', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (269,'Fertimax Extrume de Cavalo','Lameiro do moinho',150);
insert into operacaoAplicacao(id) values (269);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (269,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('gronho doce') and dataFinal IS NULL));


INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (270,'BIOFERTIL N6','Lameiro do moinho',150);
insert into operacaoAplicacao(id) values (270);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (270,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('porta de loja') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (271,'BIOFERTIL N6','Lameiro do moinho',60);
insert into operacaoAplicacao(id) values (271);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (271,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('malápio') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (272,'BIOFERTIL N6','Lameiro do moinho',120);
insert into operacaoAplicacao(id) values (272);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (272,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('pipo de basto') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2022-01-16', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (273,'BIOFERTIL N6','Lameiro do moinho',90);
insert into operacaoAplicacao(id) values (273);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (273,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('canada') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2022-01-16', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (274,'BIOFERTIL N6','Lameiro do moinho',120);
insert into operacaoAplicacao(id) values (274);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (274,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('grand fay') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2022-01-16', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (275,'BIOFERTIL N6','Lameiro do moinho',150);
insert into operacaoAplicacao(id) values (275);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (275,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('gronho doce') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (276,'EPSO Microtop','Lameiro do moinho',5);
insert into operacaoAplicacao(id) values (276);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (276,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('porta de loja') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (277,'EPSO Microtop','Lameiro do moinho',2);
insert into operacaoAplicacao(id) values (277);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (277,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('malápio') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (278,'EPSO Microtop','Lameiro do moinho',4);
insert into operacaoAplicacao(id) values (278);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (278,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('pipo de basto') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (279,'EPSO Microtop','Lameiro do moinho',3);
insert into operacaoAplicacao(id) values (279);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (279,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('canada') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (280,'EPSO Microtop','Lameiro do moinho',4);
insert into operacaoAplicacao(id) values (280);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (280,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('grand fay') and dataFinal IS NULL));

INSERT INTO Operacao (anulada,data) values (0, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into operacaofatorProducao(id,fatorproducao,parcela,quantidade) values (281,'EPSO Microtop','Lameiro do moinho',5);
insert into operacaoAplicacao(id) values (281);
insert into culturaoperacaofatorproducao(operacaofatorproducao,cultura) values (281,(select cultura.id from cultura inner join planta on planta.id = cultura.planta where lower(planta.variedade) like lower('gronho doce') and dataFinal IS NULL));

insert into unidade (designacao) values ('kg/ha');
insert into unidade (designacao) values ('l/ha');


insert into formulacao(formulacao) values ('Orgânico');

insert into classificacao(classificacao) values ('Matéria Orgânica');
insert into fabricante (fabricante) values ('Plymag') ;

insert into fabricante (fabricante) values ('Asfertglobal');

insert into fabricante (fabricante) values ('Tecniferti MOL');

insert into fatorProducao(designacao,fabricante,formulacao,classificacao,objetivo) values ('Tecniferti MOL',(select id from fabricante where fabricante = 'Tecniferti MOL'),4,(select id from classificacao where classificacao = 'Matéria Orgânica'),2);
insert into substancia (substancia) values ('AF');

insert into substanciaFatorProducao values (13,'Tecniferti MOL',27);
insert into substanciaFatorProducao values (14,'Tecniferti MOL',5.6);
insert into substanciaFatorProducao values (15,'Tecniferti MOL',1);
insert into substanciaFatorProducao values (18,'Tecniferti MOL',15);
insert into substanciaFatorProducao values (19,'Tecniferti MOL',10);


insert into fatorProducao(designacao,fabricante,formulacao,classificacao,objetivo) values ('soluSOP 52',(select id from fabricante where fabricante = 'K+S'),1,2,2);
insert into fatorProducaoPh values ('soluSOP 52',7);

insert into substancia(substancia) values ('SO3');


insert into substanciaFatorProducao values (20,'soluSOP 52',45);
insert into substanciaFatorProducao values (16,'soluSOP 52',52.5);

insert into fatorProducao(designacao,fabricante,formulacao,classificacao,objetivo) values ('Floracal Flow SL',(select id from fabricante where fabricante = 'Plymag'),4,2,2);
insert into fatorProducaoPh values ('Floracal Flow SL',7.8);

insert into substancia (substancia) values ('CaO');
insert into substanciaFatorProducao values (21,'Floracal Flow SL',35);

insert into fatorProducao(designacao,fabricante,formulacao,classificacao,objetivo) values ('Kiplant AllGrip',(select id from fabricante where fabricante = 'Asfertglobal'),4,2,2);
insert into fatorProducao(designacao,fabricante,formulacao,classificacao,objetivo) values ('Cuperdem',(select id from fabricante where fabricante = 'Asfertglobal'),4,2,2);
insert into substanciaFatorProducao values (1,'Cuperdem',6);


insert into mixFertirrega values (10);
insert into mixFertirrega_FatorProducao values (10, (select designacao from fatorProducao where designacao = 'EPSO Top'),1.5,3);
insert into mixFertirrega_FatorProducao values (10,(select designacao from fatorProducao where designacao = 'soluSOP 52'),2.5,3);
insert into mixFertirrega_FatorProducao values (10,(select designacao from fatorProducao where designacao = 'Floracal Flow SL'),1.7,4);

insert into mixFertirrega values (11);
insert into mixFertirrega_FatorProducao values (11,(select designacao from fatorProducao where designacao = 'Tecniferti MOL'),60,4);
insert into mixFertirrega_FatorProducao values (11,(select designacao from fatorProducao where designacao = 'Kiplant AllGrip'),2,4);
INSERT INTO operacao ( data) VALUES (TO_DATE('17-06-2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('17/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('17/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('04/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('18/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('02/10/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('13/05/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('02/06/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('01/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('08/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('22/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('29/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('05/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('17/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('24/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('02/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('18/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('12/06/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('19/06/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('08/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('22/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('05/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('19/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('26/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('31/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('05/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('02/06/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('09/06/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('16/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('23/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('30/07/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('07/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('14/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('21/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('28/08/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('06/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('13/09/2023','DD/MM/YYYY'));
INSERT INTO operacao ( data) VALUES (TO_DATE('20/09/2023','DD/MM/YYYY'));
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (282, 30, TO_TIMESTAMP('17-06-2023 05:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (283, 30, TO_TIMESTAMP('17/07/2023 05:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (284, 60, TO_TIMESTAMP('17/08/2023 05:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (285, 120, TO_TIMESTAMP('04/09/2023 06:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (286, 30, TO_TIMESTAMP('18/09/2023 05:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (287, 60, TO_TIMESTAMP('02/10/2023 06:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (288, 120, TO_TIMESTAMP('13/05/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (289, 120, TO_TIMESTAMP('02/06/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (290, 120, TO_TIMESTAMP('01/07/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (291, 180, TO_TIMESTAMP('08/07/2023 05:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (292, 180, TO_TIMESTAMP('22/07/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (293, 180, TO_TIMESTAMP('29/07/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (294, 120, TO_TIMESTAMP('05/08/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (295, 120, TO_TIMESTAMP('17/08/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (296, 120, TO_TIMESTAMP('24/08/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (297, 120, TO_TIMESTAMP('02/09/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (298, 120, TO_TIMESTAMP('18/09/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (299, 120, TO_TIMESTAMP('12/06/2023 06:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (300, 120, TO_TIMESTAMP('19/06/2023 06:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (301, 120, TO_TIMESTAMP('08/07/2023 04:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (302, 120, TO_TIMESTAMP('22/07/2023 04:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (303, 120, TO_TIMESTAMP('05/08/2023 21:30:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (304, 120, TO_TIMESTAMP('19/08/2023 21:30:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (305, 120, TO_TIMESTAMP('26/08/2023 21:30:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (306, 120, TO_TIMESTAMP('31/08/2023 21:30:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (307, 120, TO_TIMESTAMP('05/09/2023 21:30:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (308, 120, TO_TIMESTAMP('02/06/2023 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (309, 120, TO_TIMESTAMP('09/06/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (310, 120, TO_TIMESTAMP('16/07/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (311, 120, TO_TIMESTAMP('23/07/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (312, 120, TO_TIMESTAMP('30/07/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (313, 120, TO_TIMESTAMP('07/08/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (314, 120, TO_TIMESTAMP('14/08/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (315, 120, TO_TIMESTAMP('21/08/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (316, 120, TO_TIMESTAMP('28/08/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (317, 120, TO_TIMESTAMP('06/09/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (318, 120, TO_TIMESTAMP('13/09/2023 07:00:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (319, 120, TO_TIMESTAMP('20/09/2023 07:00:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacao (data) VALUES (TO_DATE('02/06/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('02/07/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('02/08/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('16/06/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('15/07/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('10/08/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('09/09/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('30/06/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('15/07/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('29/07/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('12/08/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('20/05/2023', 'DD/MM/YYYY'));
INSERT INTO operacao (data) VALUES (TO_DATE('09/07/2023', 'DD/MM/YYYY'));
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (320, 60, TO_TIMESTAMP('02/06/2023 06:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (321, 120, TO_TIMESTAMP('02/07/2023 06:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (322, 180, TO_TIMESTAMP('02/08/2023 05:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (323, 120, TO_TIMESTAMP('16/06/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (324, 180, TO_TIMESTAMP('15/07/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (325, 150, TO_TIMESTAMP('10/08/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (326, 120, TO_TIMESTAMP('09/09/2023 23:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (327, 120, TO_TIMESTAMP('30/06/2023 04:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (328, 120, TO_TIMESTAMP('15/07/2023 04:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (329, 150, TO_TIMESTAMP('29/07/2023 04:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (330, 120, TO_TIMESTAMP('12/08/2023  21:30', 'DD/MM/YYYY HH24:MI:SS'), 42);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (331, 120, TO_TIMESTAMP('20/05/2023 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (332, 120, TO_TIMESTAMP('09/07/2023 06:20:00', 'DD/MM/YYYY HH24:MI:SS'), 41);
Insert into RegaFertirrega values(320, 10);
Insert into RegaFertirrega values(321, 10);
Insert into RegaFertirrega values(322, 10);
Insert into RegaFertirrega values(323, 10);
Insert into RegaFertirrega values(324, 11);
Insert into RegaFertirrega values(325, 10);
Insert into RegaFertirrega values(326, 10);
Insert into RegaFertirrega values(327, 11);
Insert into RegaFertirrega values(328, 10);
Insert into RegaFertirrega values(329, 11);
Insert into RegaFertirrega values(330, 10);
Insert into RegaFertirrega values(331, 11);
Insert into RegaFertirrega values(332, 10);
