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
insert into planta values('Arbequina' ,'Oliveira', 'Arbequina',1);
insert into plantaProduto values (9,'Arbequina');
insert into cultura(planta,dataInicial,quantidade) values ('Arbequina',TO_DATE('2016-10-12','YYYY-MM-DD'),40);
insert into parcelaCultura values ('Campo grande',(select id from cultura where planta = 'Arbequina'));
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
insert into setorParcelaCultura (parcela,cultura, setor,quantidade,dataInsercao) values ('Campo grande',(select cultura from parcelaCultura inner join cultura on cultura.id=parcelaCultura.cultura where parcela = 'Campo grande' and cultura.planta = 'Arbequina'),11,40,TO_DATE('01-05-2017', 'DD-MM-YYYY'));



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



INSERT INTO operacaoRega (setor, parcela, cultura, duracao,  horario)VALUES (22, 'Lameiro do moinho',(select id from cultura where planta = 'Porta de loja'), 120, TO_TIMESTAMP('2023-05-13 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
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

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Sementeira'),TO_DATE('2023-10-12', 'YYYY-MM-DD'),32,'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Amarelo') and dataFinal is null),215);

    
insert into operacao(tipoOperacao,data,quantidade,parcela,unidade) values (8,TO_DATE('2023-10-10','YYYY-MM-DD'),1.1,'Campo novo',4);
insert into operacao(tipoOperacao, data, quantidade, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-18', 'YYYY-MM-DD'), 900,  'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Danvers Half Long') and dataFinal IS NULL),217);

insert into operacao(tipoOperacao, data, quantidade, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-22', 'YYYY-MM-DD'), 1500, 'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Danvers Half Long') and dataFinal IS NULL),218);


insert into operacao(tipoOperacao, data, quantidade, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-10-05', 'YYYY-MM-DD'), 1200,  'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Danvers Half Long') and dataFinal IS NULL),219);


INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Sementeira'),TO_DATE('2023-07-05', 'YYYY-MM-DD'),1.2,'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Danvers Half Long') and dataFinal IS NULL),220);


insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-08-08','YYYY-MM-DD'),0.5,'Campo novo',4);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Danvers Half Long') and dataFinal IS NULL),221);

insert into operacao(tipoOperacao, data, quantidade, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 8000,  'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Danvers Half Long') and dataFinal IS NULL),222);


insert into operacao(tipoOperacao, data, quantidade, parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Colheita'), TO_DATE('2023-09-25', 'YYYY-MM-DD'), 5000,  'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Cucurbita moschata var Butternut') and dataFinal IS NULL),223);


insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-05-08','YYYY-MM-DD'),0.5,'Campo novo',4);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Sugarsnax Hybrid') and dataFinal IS NULL),224);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-06-14','YYYY-MM-DD'),1500,'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Sugarsnax Hybrid') and dataFinal IS NULL),225);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-06-28','YYYY-MM-DD'),2500,'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Sugarsnax Hybrid') and dataFinal IS NULL),226);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-05-20','YYYY-MM-DD'),0.6,'Campo novo',4);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Cucurbita moschata var Butternut') and dataFinal IS NULL),227);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values((select id from tipoOperacao where tipoOperacao = 'Monda'),TO_DATE('2023-06-20','YYYY-MM-DD'),0.6,'Campo novo',4);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Cucurbita moschata var Butternut') and dataFinal IS NULL),228);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (8,TO_DATE('2023-07-04','YYYY-MM-DD'),0.5,'Campo novo',4);


INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Sementeira'),TO_DATE('2023-04-05', 'YYYY-MM-DD'),1.2,'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Sugarsnax Hybrid') and dataFinal IS NULL),230);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Sementeira'),TO_DATE('2023-04-06', 'YYYY-MM-DD'),1.5,'Campo novo',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Cucurbita moschata var Butternut') and dataFinal IS NULL),231);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-08-18', 'YYYY-MM-DD'),700,'Lameiro da ponte',3);
insert into culturaOperacao values(24,232);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),900,'Lameiro da ponte',3);
insert into culturaOperacao values(25,233);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-09-05', 'YYYY-MM-DD'),900,'Lameiro da ponte',3);
insert into culturaOperacao values(22,234);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),1050,'Lameiro da ponte',3);
insert into culturaOperacao values(22,235);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),950,'Lameiro da ponte',3);
insert into culturaOperacao values(23,236);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-08-30', 'YYYY-MM-DD'),800,'Lameiro da ponte',3);
insert into culturaOperacao values(23,237);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-11-02','YYYY-MM-DD'),400,'Campo grande',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Arbequina') and dataFinal IS NULL),238);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-11-05','YYYY-MM-DD'),300,'Campo grande',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('PICUAL') and dataFinal IS NULL),239);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (7,TO_DATE('2023-11-08','YYYY-MM-DD'),350,'Campo grande',3);
insert into culturaOperacao values(11,240);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2016-10-12','YYYY-MM-DD'),40,'Campo grande',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Arbequina') and dataFinal IS NULL),241);


insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2019-01-09','YYYY-MM-DD'),50,'Lameiro do moinho',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),242);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2019-01-09','YYYY-MM-DD'),20,'Lameiro do moinho',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Malápio') and dataFinal IS NULL),243);

insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2019-01-10','YYYY-MM-DD'),40,'Lameiro do moinho',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Pipo de basto') and dataFinal IS NULL),244);

-- Operação de plantação de Macieira Canada
insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2019-01-10','YYYY-MM-DD'),30,'Lameiro do moinho',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Canada') and dataFinal IS NULL),245);

-- Operação de plantação de Macieira Grand Fay
insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2019-01-11','YYYY-MM-DD'),40,'Lameiro do moinho',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),246);

-- Operação de plantação de Macieira Gronho Doce
insert into operacao (tipoOperacao,data,quantidade,parcela,unidade) values (1,TO_DATE('2019-01-11','YYYY-MM-DD'),50,'Lameiro do moinho',1);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Gronho Doce') and dataFinal IS NULL),247);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),700,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Canada') and dataFinal IS NULL),248);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),600,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),249);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),700,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),250);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),600,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Pipo de Basto') and dataFinal IS NULL),251);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),700,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Pipo de Basto') and dataFinal IS NULL),252);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),1200,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Gronho Doce') and dataFinal IS NULL),253);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),700,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Malápio') and dataFinal IS NULL),254);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),700,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),255);

INSERT INTO operacao(tipoOperacao, data, quantidade, parcela,unidade)VALUES ((SELECT id FROM tipoOperacao WHERE tipoOperacao = 'Colheita'),TO_DATE('2023-09-15', 'YYYY-MM-DD'),800,'Lameiro do moinho',3);
insert into culturaOperacao values((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),256);



insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-13','YYYY-MM-DD'),120,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('PICUAL') and dataFinal IS NULL),30);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),180,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values (11,31);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),240,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Arbequina') and dataFinal IS NULL),32);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),120,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('PICUAL') and dataFinal IS NULL),33);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),180,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values (11,34);
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-13','YYYY-MM-DD'),240,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Arbequina') and dataFinal IS NULL),35);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),120,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('PICUAL') and dataFinal IS NULL),36);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),180,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values (11,37);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-12','YYYY-MM-DD'),240,'Campo grande',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Arbequina') and dataFinal IS NULL),38);

insert into operacaoFatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values(TO_DATE('2023-04-01','YYYY-MM-DD'),500,'Campo novo',1,'Biocal Composto',5,3);
insert into operacaoFatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values(TO_DATE('2023-07-03','YYYY-MM-DD'),1800,'Campo novo',1,'Fertimax Extrume de Cavalo',5,3);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2019-01-04','YYYY-MM-DD'),3200,'Lameiro do moinho',1,'BIOFERTIL N6',5,4);

-- Fertimax Extrume de Cavalo
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),100,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),42);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),40,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Malápio') and dataFinal IS NULL),43);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),80,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Pipo de Basto') and dataFinal IS NULL),44);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-06','YYYY-MM-DD'),60,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Canada') and dataFinal IS NULL),45);


insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-07','YYYY-MM-DD'),80,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),46);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2020-01-07','YYYY-MM-DD'),100,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Gronho Doce') and dataFinal IS NULL),47);

-- Fertimax Extrume de Cavalo (2021)
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),150,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),48);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),60,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Malápio') and dataFinal IS NULL),49);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-08','YYYY-MM-DD'),120,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Pipo de Basto') and dataFinal IS NULL),50);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),90,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Canada') and dataFinal IS NULL),51);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-07','YYYY-MM-DD'),120,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),52);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2021-01-08','YYYY-MM-DD'),150,'Lameiro do moinho',1,'Fertimax Extrume de Cavalo',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Gronho Doce') and dataFinal IS NULL),53);

-- BIOFERTIL N6 (2022)
insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-15','YYYY-MM-DD'),150,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),54);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-15','YYYY-MM-DD'),60,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Malápio') and dataFinal IS NULL),55);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-15','YYYY-MM-DD'),120,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Pipo de Basto') and dataFinal IS NULL),56);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-16','YYYY-MM-DD'),90,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Canada') and dataFinal IS NULL),57);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-16','YYYY-MM-DD'),120,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),58);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2022-01-16','YYYY-MM-DD'),150,'Lameiro do moinho',1,'BIOFERTIL N6',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Gronho Doce') and dataFinal IS NULL),59);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2023-05-15','YYYY-MM-DD'),5,'Lameiro do moinho',3,'EPSO Microtop',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Porta de loja') and dataFinal IS NULL),60);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2023-05-15','YYYY-MM-DD'),2,'Lameiro do moinho',3,'EPSO Microtop',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Malápio') and dataFinal IS NULL),61);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2023-05-15','YYYY-MM-DD'),4,'Lameiro do moinho',3,'EPSO Microtop',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Pipo de Basto') and dataFinal IS NULL),62);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2023-05-15','YYYY-MM-DD'),3,'Lameiro do moinho',3,'EPSO Microtop',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Canada') and dataFinal IS NULL),63);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2023-05-15','YYYY-MM-DD'),4,'Lameiro do moinho',3,'EPSO Microtop',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta) = lower('Grand Fay') and dataFinal IS NULL),64);

insert into operacaofatorProducao(data,quantidade,parcela,modo,fatorProducao,tipoOperacao,unidade) values (TO_DATE('2023-05-15','YYYY-MM-DD'),5,'Lameiro do moinho',3,'EPSO Microtop',5,3);
insert into culturaOperacaoFatorProducao values ((select id from cultura where lower(planta)= lower('Gronho Doce') and dataFinal IS NULL),65);
