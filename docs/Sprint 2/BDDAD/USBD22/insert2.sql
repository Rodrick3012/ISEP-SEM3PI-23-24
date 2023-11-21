insert into fabricante(fabricante) values ('Nutrofertil');
insert into fatorProducao values ('Fertimax Extrume de Cavalo',(select id from fabricante where fabricante.fabricante = 'Nutrofertil'),2,2,2,6.7);
insert into fatorProducao values ('BIOFERTIL N6',(select id from fabricante where fabricante.fabricante = 'Nutrofertil'),2,2,2,6.4);

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
insert into planta values('Cucurbita moschata var Butternut','Abóbora','manteiga',2);
insert into plantaProduto values ((select id from produto where produto.produto = 'Abóbora'),'Cucurbita moschata var Butternut');
insert into parcela values('Campo novo',1.1);

insert into setor (setor,caudalMaximo,dataInicio) values (10,2500,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setorParcelaCultura(parcela,cultura,setor,quantidade,dataInsercao) values ('Campo grande',11,10,30,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura,setor,quantidade,dataInsercao) values ('Campo grande',12,10,20,TO_DATE('01-05-2017', 'DD-MM-YYYY'));

insert into setor (setor,caudalMaximo,dataInicio) values (11,1500,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio) values (21,3500,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio) values (22,3500,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio,dataFim) values (41,2500,TO_DATE('01-04-2023', 'DD-MM-YYYY'),TO_DATE('10-10-2023', 'DD-MM-YYYY'));
insert into setor (setor,caudalMaximo,dataInicio,dataFim) values (42,3500,TO_DATE('01-04-2023', 'DD-MM-YYYY'),TO_DATE('10-10-2023', 'DD-MM-YYYY'));
insert into planta values('Arbquina' ,'Oliveira', 'Arbquina',1);
insert into plantaProduto values (9,'Arbquina');
insert into cultura(planta,dataInicial,quantidade) values ('Arbquina',TO_DATE('2016-10-12','YYYY-MM-DD'),40);
insert into parcelaCultura values ('Campo grande',(select id from cultura where planta = 'Arbquina'));
insert into planta values('Porta de loja' ,'Maceira', 'Malus domestica',1);
insert into plantaProduto values (3,'Porta de loja');
insert into cultura(planta,dataInicial,quantidade) values ('Porta de loja',TO_DATE('2019-01-09','YYYY-MM-DD'),50);
insert into parcelaCultura values ('Lameiro do moinho',(select id from cultura where planta = 'Porta de loja'));

insert into planta values('Malápio' ,'Maceira', 'Malus domestica',1);
insert into plantaProduto values (3,'Malápio');
insert into cultura(planta,dataInicial,quantidade) values ('Malápio',TO_DATE('2019-01-10','YYYY-MM-DD'),20);
insert into parcelaCultura values ('Lameiro do moinho',(select id from cultura where planta = 'Malápio'));

-- Operação de plantação de Macieira Pipo de Basto
insert into planta values('Pipo de basto' ,'Maceira', 'Malus domestica',1);
insert into plantaProduto values (3,'Pipo de basto');
insert into cultura(planta,dataInicial,quantidade) values ('Pipo de basto',TO_DATE('2019-01-10','YYYY-MM-DD'),40);
insert into parcelaCultura values ('Lameiro do moinho',(select id from cultura where planta = 'Pipo de basto'));

-- Operação de plantação de Macieira Canada
insert into planta values('Canada' ,'Maceira', 'Malus domestica',1);
insert into plantaProduto values (3,'Canada');
insert into cultura(planta,dataInicial,quantidade) values ('Canada',TO_DATE('2019-01-10','YYYY-MM-DD'),30);
insert into parcelaCultura values ('Lameiro do moinho',(select id from cultura where planta = 'Canada'));

-- Operação de plantação de Macieira Grand Fay
insert into planta values('Grand Fay' ,'Maceira', 'Malus domestica',1);
insert into plantaProduto values (3,'Grand Fay');
insert into cultura(planta,dataInicial,quantidade) values ('Grand Fay',TO_DATE('2019-01-11','YYYY-MM-DD'),40);
insert into parcelaCultura values ('Lameiro do moinho',(select id from cultura where planta = 'Grand Fay'));

-- Operação de plantação de Macieira Gronho Doce
insert into planta values('Gronho Doce' ,'Maceira', 'Malus domestica',1);
insert into plantaProduto values (3,'Gronho Doce');
insert into cultura(planta,dataInicial,quantidade) values ('Gronho Doce',TO_DATE('2019-01-11','YYYY-MM-DD'),50);
insert into parcelaCultura values ('Lameiro do moinho',(select id from cultura where planta = 'Gronho Doce'));



insert into cultura(planta,dataInicial,quantidade) values ('Sugarsnax Hybrid',TO_DATE('2023-04-05','YYYY-MM-DD'),1.2);

insert into parcelaCultura values ('Campo novo',(select id from cultura where planta = 'Sugarsnax Hybrid' And dataFinal is NULL));

insert into cultura(planta,dataInicial,quantidade) values ('Cucurbita moschata var Butternut',TO_DATE('2023-04-06','YYYY-MM-DD'),0.6);
insert into parcelaCultura values ('Campo novo',(select id from cultura where planta = 'Cucurbita moschata var Butternut' And dataFinal is NULL));

insert into tipoOperacao (tipoOperacao) values ('Monda');



-- Monda de plantação de cenouras Danvers Half Long (08/08/2023)
insert into cultura(planta,dataInicial,quantidade) values ('Danvers Half Long',TO_DATE('2023-07-05','YYYY-MM-DD'),1.2);
insert into parcelaCultura values ('Campo novo',(select id from cultura where planta = 'Danvers Half Long' AND datafinal IS null));

insert into cultura(planta,dataInicial,quantidade) values ('Amarelo',TO_DATE('2023-10-12','YYYY-MM-DD'),32);
insert into parcelaCultura values ('Campo novo',(select id from cultura where planta = 'Amarelo' AND datafinal IS null));

--setor11
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Campo grande',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Campo grande' and cultura.planta = 'Arbquina'),11,40,TO_DATE('01-05-2017', 'DD-MM-YYYY'));



--setor 21
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro da ponte',22,21,90,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro da ponte',23,21,60,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro da ponte',24,21,60,TO_DATE('01-05-2017', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro da ponte',25,21,40,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro do moinho',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Lameiro do moinho' and cultura.planta = 'Pipo de basto'),21,40,TO_DATE('01-05-2019', 'DD-MM-YYYY'));

--setor 22
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro do moinho',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Lameiro do moinho' and cultura.planta = 'Porta de loja'),22,50,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro do moinho',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Lameiro do moinho' and cultura.planta = 'Malápio'),22,20,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro do moinho',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Lameiro do moinho' and cultura.planta = 'Canada'),22,30,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro do moinho',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Lameiro do moinho' and cultura.planta = 'Grand Fay'),22,40,TO_DATE('01-05-2019', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Lameiro do moinho',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Lameiro do moinho' and cultura.planta = 'Gronho Doce'),22,50,TO_DATE('01-05-2019', 'DD-MM-YYYY'));

--setor 41
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao,dataRemocao) values ('Campo novo',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Campo novo' and cultura.planta = 'Sugarsnax Hybrid'),41,1.2,TO_DATE('05-04-2023', 'DD-MM-YYYY'),TO_DATE('31-05-2023', 'DD-MM-YYYY'));
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao,dataRemocao) values ('Campo novo',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Campo novo' and cultura.planta = 'Danvers Half Long'),41,1.2,TO_DATE('05-07-2023', 'DD-MM-YYYY'),TO_DATE('08-10-2023', 'DD-MM-YYYY'));
--setor 42
insert into setorParcelaCultura(parcela,cultura,setor,quantidade,dataInsercao,dataRemocao ) values ('Campo novo',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Campo novo' and cultura.planta = 'Cucurbita moschata var Butternut'),42,0.6,TO_DATE('06-04-2023', 'DD-MM-YYYY'),TO_DATE('10-09-2023', 'DD-MM-YYYY'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-05-20 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-06-02 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-06-09 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-09 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-16 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-23 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo',(select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-30 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo',(select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-07 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo',(select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-14 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo',(select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-21 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo',(select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-28 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-09-06 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-09-13 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Danvers Half Long' and datainicial = TO_DATE('05-07-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-09-20 :00', 'YYYY-MM-DD HH24:MI:SS'));
-- Operações de rega para a cultura com ID 50 no setor 41 e la 'Campo novo')



INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-05-20 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-06-02 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-06-09 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-09 06:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-16 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-23 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-07-30 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-07 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-14 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-21 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-08-28 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-09-06 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-09-13 :00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (41, 'Campo novo', (select id from cultura where planta = 'Sugarsnax Hybrid' and datainicial = TO_DATE('05-04-2023', 'DD-MM-YYYY')), 120, TO_TIMESTAMP('2023-09-20 :00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-06-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-06-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES(22,'Lameiro do moinho', ( select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-07-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 180, TO_TIMESTAMP('2023-07-08 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura,duracao, horario)VALUES (22, 'Lameiro do moinho', ( select id from cultura where planta = 'Porta de loja'), 180, TO_TIMESTAMP('2023-07-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 180, TO_TIMESTAMP('2023-07-22 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 180, TO_TIMESTAMP('2023-07-29 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 150, TO_TIMESTAMP('2023-08-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 150, TO_TIMESTAMP('2023-08-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 150, TO_TIMESTAMP('2023-08-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-08-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-09-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-09-09 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-09-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-05-13 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-06-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-06-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES(22,'Lameiro do moinho', ( select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-07-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 180, TO_TIMESTAMP('2023-07-08 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura,duracao, horario)VALUES (22, 'Lameiro do moinho', ( select id from cultura where planta = 'Malápio'), 180, TO_TIMESTAMP('2023-07-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 180, TO_TIMESTAMP('2023-07-22 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 180, TO_TIMESTAMP('2023-07-29 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 150, TO_TIMESTAMP('2023-08-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 150, TO_TIMESTAMP('2023-08-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 150, TO_TIMESTAMP('2023-08-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-08-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-09-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-09-09 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Malápio'), 120, TO_TIMESTAMP('2023-09-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22,'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-05-13 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22,'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-06-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22,'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-06-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES(22,'Lameiro do moinho', ( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-07-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 180, TO_TIMESTAMP('2023-07-08 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura,duracao, horario)VALUES (22, 'Lameiro do moinho', ( select id from cultura where planta = 'Canada'), 180, TO_TIMESTAMP('2023-07-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 180, TO_TIMESTAMP('2023-07-22 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 180, TO_TIMESTAMP('2023-07-29 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 150, TO_TIMESTAMP('2023-08-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 150, TO_TIMESTAMP('2023-08-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 150, TO_TIMESTAMP('2023-08-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-08-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-09-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-09-09 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho', (select id from cultura where planta = 'Canada'), 120, TO_TIMESTAMP('2023-09-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-05-13 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-06-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22,'Lameiro do moinho',(select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-06-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES(22, 'Lameiro do moinho', ( select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-07-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho', (select id from cultura where planta = 'Grand Fay'), 180, TO_TIMESTAMP('2023-07-08 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura,duracao, horario)VALUES (22,  'Lameiro do moinho', ( select id from cultura where planta = 'Grand Fay'), 180, TO_TIMESTAMP('2023-07-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 180, TO_TIMESTAMP('2023-07-22 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 180, TO_TIMESTAMP('2023-07-29 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 150, TO_TIMESTAMP('2023-08-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 150, TO_TIMESTAMP('2023-08-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 150, TO_TIMESTAMP('2023-08-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-08-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-09-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-09-09 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Grand Fay'), 120, TO_TIMESTAMP('2023-09-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao,horario) VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Gronho Doce'), 120, TO_TIMESTAMP('2023-05-13 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Gronho Doce'), 120, TO_TIMESTAMP('2023-06-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,horario)VALUES (22,'Lameiro do moinho',(select id from cultura where planta =  'Gronho Doce'), 120, TO_TIMESTAMP('2023-06-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,horario)VALUES(22, 'Lameiro do moinho', ( select id from cultura where planta ='Gronho Doce'), 120, TO_TIMESTAMP('2023-07-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,horario)VALUES (22, 'Lameiro do moinho', (select id from cultura where planta = 'Gronho Doce'), 180, TO_TIMESTAMP('2023-07-08 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura,duracao, horario)VALUES (22,  'Lameiro do moinho',(  select id from cultura where planta = 'Gronho Doce'), 180, TO_TIMESTAMP('2023-07-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 180, TO_TIMESTAMP('2023-07-22 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 180, TO_TIMESTAMP('2023-07-29 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 150, TO_TIMESTAMP('2023-08-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 150, TO_TIMESTAMP('2023-08-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 150, TO_TIMESTAMP('2023-08-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 120, TO_TIMESTAMP('2023-08-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 120, TO_TIMESTAMP('2023-09-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 120, TO_TIMESTAMP('2023-09-09 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario)VALUES (22, 'Lameiro do moinho',( select id from cultura where planta = 'Gronho Doce'), 120, TO_TIMESTAMP('2023-09-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-05-14 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-06-01 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-06-15 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-06-30 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 180, TO_TIMESTAMP('2023-07-07 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 180, TO_TIMESTAMP('2023-07-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 180, TO_TIMESTAMP('2023-07-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 180, TO_TIMESTAMP('2023-07-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 150, TO_TIMESTAMP('2023-08-04 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 150, TO_TIMESTAMP('2023-08-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 150, TO_TIMESTAMP('2023-08-18 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-08-25 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-09-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-09-08 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 24, 120, TO_TIMESTAMP('2023-09-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
-- Operações de rega para a cultura com ID 25 no setor 21 ela 'Lameiro da ponte'


INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-05-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-06-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-06-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-06-30 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 180, TO_TIMESTAMP('2023-07-07 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 180, TO_TIMESTAMP('2023-07-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 180, TO_TIMESTAMP('2023-07-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 180, TO_TIMESTAMP('2023-07-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 150, TO_TIMESTAMP('2023-08-04 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 150, TO_TIMESTAMP('2023-08-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 150, TO_TIMESTAMP('2023-08-18 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-08-25 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-09-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-09-08 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 25, 120, TO_TIMESTAMP('2023-09-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 23, 120, TO_TIMESTAMP('2023-05-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte', 23, 120, TO_TIMESTAMP('2023-06-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 120, TO_TIMESTAMP('2023-06-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 120, TO_TIMESTAMP('2023-06-30 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 180, TO_TIMESTAMP('2023-07-07 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 180, TO_TIMESTAMP('2023-07-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 180, TO_TIMESTAMP('2023-07-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 180, TO_TIMESTAMP('2023-07-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 150, TO_TIMESTAMP('2023-08-04 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 150, TO_TIMESTAMP('2023-08-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 150, TO_TIMESTAMP('2023-08-18 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 120, TO_TIMESTAMP('2023-08-25 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 120, TO_TIMESTAMP('2023-09-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 120, TO_TIMESTAMP('2023-09-08 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',23, 120, TO_TIMESTAMP('2023-09-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 120, TO_TIMESTAMP('2023-06-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 120, TO_TIMESTAMP('2023-06-30 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 180, TO_TIMESTAMP('2023-07-07 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 180, TO_TIMESTAMP('2023-07-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 180, TO_TIMESTAMP('2023-07-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 180, TO_TIMESTAMP('2023-07-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 150, TO_TIMESTAMP('2023-08-04 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 150, TO_TIMESTAMP('2023-08-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 150, TO_TIMESTAMP('2023-08-18 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 120, TO_TIMESTAMP('2023-08-25 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 120, TO_TIMESTAMP('2023-09-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 120, TO_TIMESTAMP('2023-09-08 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao, horario) VALUES (21, 'Lameiro da ponte',22, 120, TO_TIMESTAMP('2023-09-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 11, 60, TO_TIMESTAMP('2023-06-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 11, 120, TO_TIMESTAMP('2023-07-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 11, 180, TO_TIMESTAMP('2023-08-02 05:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 11, 120, TO_TIMESTAMP('2023-09-04 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 11, 60, TO_TIMESTAMP('2023-10-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 12, 60, TO_TIMESTAMP('2023-06-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 12, 120, TO_TIMESTAMP('2023-07-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 12, 180, TO_TIMESTAMP('2023-08-02 05:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 12, 120, TO_TIMESTAMP('2023-09-04 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (10, 'Campo grande', 12, 60, TO_TIMESTAMP('2023-10-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42 ), 60, TO_TIMESTAMP('2023-06-12 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 60, TO_TIMESTAMP('2023-06-19 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-06-30 04:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-07-08 04:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-07-15 04:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 150, TO_TIMESTAMP('2023-07-22 04:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 150, TO_TIMESTAMP('2023-07-29 04:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-08-05 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-08-12 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-08-19 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario) VALUES (42, 'Campo novo',( select cultura from setorparcelacultura where parcela = 'Campo novo' and setor = 42), 120, TO_TIMESTAMP('2023-08-26 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Sementeira'),TO_DATE('2023-10-12', 'YYYY-MM-DD'),32,(SELECT id FROM cultura WHERE planta = 'Amarelo' and dataFinal is null),'Campo novo',3);
insert into operacao(tipoOperacao,data,quantidade,parcela,unidade) values (8,TO_DATE('2023-10-10','YYYY-MM-DD'),1.1,'Campo novo',4);
insert into operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-18', 'YYYY-MM-DD'), 900, (select id from cultura where planta = 'Danvers Half Long' and dataFinal IS NULL), 'Campo novo',3);
insert into operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-22', 'YYYY-MM-DD'), 1500, (select id from cultura where planta = 'Danvers Half Long' and dataFinal IS NULL), 'Campo novo',3);
insert into operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-10-05', 'YYYY-MM-DD'), 1200, (select id from cultura where planta = 'Danvers Half Long' and dataFinal IS NULL), 'Campo novo',3);
INSERT INTO operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Sementeira'),TO_DATE('2023-07-05', 'YYYY-MM-DD'),1.2,(SELECT id FROM cultura WHERE planta = 'Danvers Half Long' AND dataFinal IS NULL),'Campo novo',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-08-08','YYYY-MM-DD'),0.5,(select id from cultura where cultura.planta = 'Danvers Half Long' and dataFinal IS NULL),'Campo novo',4);

insert into operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 8000, (select id from cultura where planta = 'Cucurbita moschata var Butternut' and dataFinal IS NULL), 'Campo novo',3);
insert into operacao(tipoOperacao, data, quantidade, cultura, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-25', 'YYYY-MM-DD'), 5000, (select id from cultura where cultura.planta = 'Cucurbita moschata var Butternut' and dataFinal IS NULL), 'Campo novo',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-05-08','YYYY-MM-DD'),0.5,(select id from cultura where cultura.planta = 'Sugarsnax Hybrid' and dataFinal IS NULL),'Campo novo',4);

insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-06-14','YYYY-MM-DD'),1500,(select id from cultura where planta = 'Sugarsnax Hybrid' AND dataFinal IS NULL),'Campo novo',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-06-28','YYYY-MM-DD'),2500,(select id from cultura where planta = 'Sugarsnax Hybrid' AND dataFinal IS NULL),'Campo novo',3);

insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-05-20','YYYY-MM-DD'),0.6,(select id from cultura where cultura.planta = 'Cucurbita moschata var Butternut' and dataFinal IS NULL),'Campo novo',4);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-06-20','YYYY-MM-DD'),0.6,(select id from cultura where cultura.planta = 'Cucurbita moschata var Butternut' and dataFinal IS NULL),'Campo novo',4);
insert into operacaoFatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values(TO_DATE('2023-04-01','YYYY-MM-DD'),500,'Campo novo',1,'Biocal Composto',5,3);
insert into operacaoFatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values(TO_DATE('2023-07-03','YYYY-MM-DD'),1800,'Campo novo',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (8,TO_DATE('2023-07-04','YYYY-MM-DD'),0.5,'Campo novo',4);


insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-08-18', 'YYYY-MM-DD'),700,24,'Lameiro da ponte',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),900,25,'Lameiro da ponte',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-09-05', 'YYYY-MM-DD'),900,22,'Lameiro da ponte',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),1050,22,'Lameiro da ponte',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),950,23,'Lameiro da ponte',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),800,23,'Lameiro da ponte',3);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2016-10-12','YYYY-MM-DD'),40,(select id from cultura where planta = 'Arbquina'),'Campo grande',1);
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2019-01-09','YYYY-MM-DD'),50,(select id from cultura where planta = 'Porta de loja'),'Lameiro do moinho',1);



insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2019-01-09','YYYY-MM-DD'),20,(select id from cultura where planta = 'Malápio'),'Lameiro do moinho',1);



insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2019-01-10','YYYY-MM-DD'),40,(select id from cultura where planta = 'Pipo de basto'),'Lameiro do moinho',1);

-- Operação de plantação de Macieira Canada

insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2019-01-10','YYYY-MM-DD'),30,(select id from cultura where planta = 'Canada'),'Lameiro do moinho',1);

-- Operação de plantação de Macieira Grand Fay
insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2019-01-11','YYYY-MM-DD'),40,(select id from cultura where planta = 'Grand Fay'),'Lameiro do moinho',1);

-- Operação de plantação de Macieira Gronho Doce

insert into operacao (tipoOperacao,data,quantidade,cultura,parcela,unidade) values (1,TO_DATE('2019-01-11','YYYY-MM-DD'),50,(select id from cultura where planta = 'Gronho Doce'),'Lameiro do moinho',1);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2019-01-04','YYYY-MM-DD'),1.1,'Lameiro do moinho',1,'BIOFERTIL N6',5,4);


-- Fertimax Extrume de Cavalo
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),100,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),40,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),80,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),60,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-07','YYYY-MM-DD'),80,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-07','YYYY-MM-DD'),100,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);

-- Fertimax Extrume de Cavalo (2021)
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),150,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),60,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-08','YYYY-MM-DD'),120,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),90,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),120,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-08','YYYY-MM-DD'),150,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);

-- BIOFERTIL N6 (2022)
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-15','YYYY-MM-DD'),150,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-15','YYYY-MM-DD'),60,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-15','YYYY-MM-DD'),120,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-16','YYYY-MM-DD'),90,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-16','YYYY-MM-DD'),120,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-16','YYYY-MM-DD'),150,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
