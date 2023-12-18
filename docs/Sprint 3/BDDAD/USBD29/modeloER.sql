DROP TABLE tipoAlteracao CASCADE CONSTRAINTS;
DROP TABLE LogOperacoes CASCADE CONSTRAINTS;
DROP TABLE OperacaoFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Operacao CASCADE CONSTRAINTS;
DROP TABLE FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Fabricante CASCADE CONSTRAINTS;
DROP TABLE Formulacao CASCADE CONSTRAINTS;
DROP TABLE Classificacao CASCADE CONSTRAINTS;
DROP TABLE Objetivo CASCADE CONSTRAINTS;
DROP TABLE Parcela CASCADE CONSTRAINTS;
DROP TABLE IncorporacaoSolo CASCADE CONSTRAINTS;
DROP TABLE Cultura CASCADE CONSTRAINTS;
DROP TABLE planta CASCADE CONSTRAINTS;
DROP TABLE Especie CASCADE CONSTRAINTS;
DROP TABLE TipoPlanta CASCADE CONSTRAINTS;
DROP TABLE Poda CASCADE CONSTRAINTS;
DROP TABLE Colheita CASCADE CONSTRAINTS;
DROP TABLE OperacaoAplicacao CASCADE CONSTRAINTS;
DROP TABLE OperacaoFertilizacao CASCADE CONSTRAINTS;
DROP TABLE Modo CASCADE CONSTRAINTS;
DROP TABLE RegaFertirrega CASCADE CONSTRAINTS;
DROP TABLE OperacaoRegaSetor CASCADE CONSTRAINTS;
DROP TABLE Setor CASCADE CONSTRAINTS;
DROP TABLE MixFertirrega CASCADE CONSTRAINTS;
DROP TABLE CulturaOperacaoFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Plantacao CASCADE CONSTRAINTS;
DROP TABLE Semeadura CASCADE CONSTRAINTS;
DROP TABLE MobilizacaoSolo CASCADE CONSTRAINTS;
DROP TABLE Monda CASCADE CONSTRAINTS;
DROP TABLE MixFertirrega_FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Unidade CASCADE CONSTRAINTS;
DROP TABLE plantaProduto CASCADE CONSTRAINTS;
DROP TABLE Produto CASCADE CONSTRAINTS;
DROP TABLE CulturaSetor CASCADE CONSTRAINTS;
DROP TABLE TipoPeriodo CASCADE CONSTRAINTS;
DROP TABLE Periodo CASCADE CONSTRAINTS;
DROP TABLE MedicaoSensor CASCADE CONSTRAINTS;
DROP TABLE Sensor CASCADE CONSTRAINTS;
DROP TABLE EstacaoMeteorologica CASCADE CONSTRAINTS;
DROP TABLE TipoSensor CASCADE CONSTRAINTS;
DROP TABLE Substancia CASCADE CONSTRAINTS;
DROP TABLE SubstanciaFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Colheita_Produto CASCADE CONSTRAINTS;
DROP TABLE FatorProducaoPH CASCADE CONSTRAINTS;
CREATE TABLE tipoAlteracao (
                               id            number GENERATED AS IDENTITY,
                               tipoAlteracao varchar2(20) NOT NULL UNIQUE,
                               PRIMARY KEY (id));
CREATE TABLE LogOperacoes (
                              idLog                  number GENERATED AS IDENTITY,
                              idOperacao             number NOT NULL,
                              estadoAnulacaoAnterior number(1) NOT NULL,
                              dataOperacao           date NOT NULL,
                              dataAlteracao          timestamp(0) NOT NULL,
                              tipoAlteracao          number NOT NULL,
                              PRIMARY KEY (idLog));
CREATE TABLE OperacaoFatorProducao (
                                       id            number NOT NULL,
                                       fatorproducao varchar2(30) NOT NULL,
                                       parcela       varchar2(25) NOT NULL,
                                       quantidade    number NOT NULL,
                                       PRIMARY KEY (id));
CREATE TABLE Operacao (
                          id      number GENERATED AS IDENTITY,
                          anulada number DEFAULT 0 NOT NULL,
                          data    date NOT NULL,
                          PRIMARY KEY (id));
CREATE TABLE FatorProducao (
                               designacao    varchar2(30) NOT NULL,
                               Fabricante    number NOT NULL,
                               formulacao    number NOT NULL,
                               classificacao number NOT NULL,
                               objetivo      number NOT NULL,
                               PRIMARY KEY (designacao));
CREATE TABLE Fabricante (
                            id         number GENERATED AS IDENTITY,
                            Fabricante varchar2(30) NOT NULL UNIQUE,
                            PRIMARY KEY (id));
CREATE TABLE Formulacao (
                            id         number GENERATED AS IDENTITY,
                            formulacao varchar2(30) NOT NULL UNIQUE,
                            PRIMARY KEY (id));
CREATE TABLE Classificacao (
                               id            number GENERATED AS IDENTITY,
                               classificacao varchar2(30) NOT NULL UNIQUE,
                               PRIMARY KEY (id));
CREATE TABLE Objetivo (
                          id       number GENERATED AS IDENTITY,
                          objetivo varchar2(40) NOT NULL UNIQUE,
                          PRIMARY KEY (id));
CREATE TABLE Parcela (
                         designacao varchar2(25) NOT NULL,
                         area       number NOT NULL,
                         PRIMARY KEY (designacao));
CREATE TABLE IncorporacaoSolo (
                                  id      number NOT NULL,
                                  area    number NOT NULL,
                                  Cultura number NOT NULL,
                                  PRIMARY KEY (id));
CREATE TABLE Cultura (
                         id          number GENERATED AS IDENTITY,
                         planta      number NOT NULL,
                         parcela     varchar2(25) NOT NULL,
                         dataInicial date NOT NULL,
                         dataFinal   date,
                         quantidade  number NOT NULL,
                         PRIMARY KEY (id));
CREATE TABLE planta (
                        id        number GENERATED AS IDENTITY,
                        Variedade varchar2(50) NOT NULL,
                        nomeComum varchar2(30) NOT NULL,
                        Especieid number NOT NULL,
                        PRIMARY KEY (id));
CREATE TABLE Especie (
                         id           number GENERATED AS IDENTITY,
                         designacao   varchar2(40) NOT NULL UNIQUE,
                         TipoPlantaid number NOT NULL,
                         PRIMARY KEY (id));
CREATE TABLE TipoPlanta (
                            id         number GENERATED AS IDENTITY,
                            tipoPlanta varchar2(30) NOT NULL UNIQUE,
                            PRIMARY KEY (id));
CREATE TABLE Poda (
                      id         number NOT NULL,
                      cultura    number NOT NULL,
                      quantidade number NOT NULL,
                      PRIMARY KEY (id));
CREATE TABLE Colheita (
                          id         number NOT NULL,
                          Cultura    number NOT NULL,
                          quantidade number NOT NULL,
                          PRIMARY KEY (id));
CREATE TABLE OperacaoAplicacao (
                                   id number NOT NULL,
                                   PRIMARY KEY (id));
CREATE TABLE OperacaoFertilizacao (
                                      id   number NOT NULL,
                                      modo number NOT NULL,
                                      PRIMARY KEY (id));
CREATE TABLE Modo (
                      id   number GENERATED AS IDENTITY,
                      modo varchar2(20) NOT NULL UNIQUE,
                      PRIMARY KEY (id));
CREATE TABLE RegaFertirrega (
                                OperacaoRegaSetor number NOT NULL,
                                MixFertirrega     number NOT NULL,
                                PRIMARY KEY (OperacaoRegaSetor));
CREATE TABLE OperacaoRegaSetor (
                                   id      number NOT NULL,
                                   duracao number NOT NULL,
                                   horario timestamp(0) NOT NULL,
                                   setor   varchar2(2) NOT NULL,
                                   PRIMARY KEY (id));
CREATE TABLE Setor (
                       setor        varchar2(2) NOT NULL,
                       caudalMaximo number NOT NULL,
                       dataInicio   date NOT NULL,
                       dataFim      date,
                       PRIMARY KEY (setor));
CREATE TABLE MixFertirrega (
                               id number GENERATED AS IDENTITY,
                               PRIMARY KEY (id));
CREATE TABLE CulturaOperacaoFatorProducao (
                                              OperacaoFatorProducao number NOT NULL,
                                              Cultura               number NOT NULL,
                                              PRIMARY KEY (OperacaoFatorProducao));
CREATE TABLE Plantacao (
                           id         number NOT NULL,
                           Cultura    number NOT NULL,
                           quantidade number(10) NOT NULL,
                           PRIMARY KEY (id));
CREATE TABLE Semeadura (
                           id         number NOT NULL,
                           Cultura    number NOT NULL,
                           area       number(10) NOT NULL,
                           quantidade number(10) NOT NULL,
                           PRIMARY KEY (id));
CREATE TABLE MobilizacaoSolo (
                                 id      number NOT NULL,
                                 area    number(10) NOT NULL,
                                 parcela varchar2(25) NOT NULL,
                                 PRIMARY KEY (id));
CREATE TABLE Monda (
                       id      number NOT NULL,
                       Cultura number NOT NULL,
                       area    number(10) NOT NULL,
                       PRIMARY KEY (id));
CREATE TABLE MixFertirrega_FatorProducao (
                                             MixFertirrega number NOT NULL,
                                             FatorProducao varchar2(30) NOT NULL,
                                             quantidade    number(10) NOT NULL,
                                             Unidade       number NOT NULL,
                                             PRIMARY KEY (MixFertirrega,
                                                          FatorProducao));
CREATE TABLE Unidade (
                         id         number GENERATED AS IDENTITY,
                         designacao number(10) NOT NULL UNIQUE,
                         PRIMARY KEY (id));
CREATE TABLE plantaProduto (
                               produto number NOT NULL,
                               planta  number NOT NULL,
                               PRIMARY KEY (produto,
                                            planta));
CREATE TABLE Produto (
                         id      number GENERATED AS IDENTITY,
                         produto varchar2(30) NOT NULL UNIQUE,
                         PRIMARY KEY (id));
CREATE TABLE CulturaSetor (
                              id           number GENERATED AS IDENTITY,
                              setor        varchar2(2) NOT NULL,
                              Cultura      number NOT NULL,
                              quantidade   number NOT NULL,
                              dataInsercao date NOT NULL,
                              dataRemocao  date,
                              PRIMARY KEY (id));
CREATE TABLE TipoPeriodo (
                             id          number GENERATED AS IDENTITY,
                             tipoPeriodo varchar2(30) NOT NULL UNIQUE,
                             PRIMARY KEY (id));
CREATE TABLE Periodo (
                         id      number GENERATED AS IDENTITY,
                         periodo varchar2(50) NOT NULL,
                         tipo    number NOT NULL,
                         planta  number NOT NULL,
                         PRIMARY KEY (id));
CREATE TABLE MedicaoSensor (
                               idSensor    number NOT NULL,
                               ValorMedido number NOT NULL,
                               PRIMARY KEY (idSensor));
CREATE TABLE Sensor (
                        id         number GENERATED AS IDENTITY,
                        Estacao    varchar2(40) NOT NULL,
                        tipoSensor number NOT NULL,
                        parcela    varchar2(25),
                        PRIMARY KEY (id));
CREATE TABLE EstacaoMeteorologica (
                                      designacao  varchar2(40) NOT NULL,
                                      localizacao varchar2(50) NOT NULL,
                                      PRIMARY KEY (designacao));
CREATE TABLE TipoSensor (
                            idTipo number GENERATED AS IDENTITY,
                            tipo   varchar2(30) NOT NULL UNIQUE,
                            PRIMARY KEY (idTipo));
CREATE TABLE Substancia (
                            id         number GENERATED AS IDENTITY,
                            substancia varchar2(50) NOT NULL UNIQUE,
                            PRIMARY KEY (id));
CREATE TABLE SubstanciaFatorProducao (
                                         substancia    number NOT NULL,
                                         fatorProducao varchar2(30) NOT NULL,
                                         percentagem   number NOT NULL,
                                         PRIMARY KEY (substancia,
                                                      fatorProducao));
CREATE TABLE Colheita_Produto (
                                  Colheitaid number NOT NULL,
                                  Produtoid  number NOT NULL,
                                  PRIMARY KEY (Colheitaid,
                                               Produtoid));
CREATE TABLE FatorProducaoPH (
                                 fatorProducao varchar2(30) NOT NULL,
                                 Ph            number NOT NULL,
                                 PRIMARY KEY (fatorProducao));
ALTER TABLE LogOperacoes ADD CONSTRAINT FKLogOperaco411938 FOREIGN KEY (tipoAlteracao) REFERENCES tipoAlteracao (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa39367 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa455406 FOREIGN KEY (fatorproducao) REFERENCES FatorProducao (designacao);
ALTER TABLE FatorProducao ADD CONSTRAINT FKFatorProdu762811 FOREIGN KEY (objetivo) REFERENCES Objetivo (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa567047 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE IncorporacaoSolo ADD CONSTRAINT FKIncorporac414313 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE IncorporacaoSolo ADD CONSTRAINT FKIncorporac202557 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura605439 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE planta ADD CONSTRAINT FKplanta165264 FOREIGN KEY (Especieid) REFERENCES Especie (id);
ALTER TABLE Especie ADD CONSTRAINT FKEspecie960694 FOREIGN KEY (TipoPlantaid) REFERENCES TipoPlanta (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura155084 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Poda ADD CONSTRAINT FKPoda426785 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Poda ADD CONSTRAINT FKPoda869973 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita943585 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita268170 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE OperacaoAplicacao ADD CONSTRAINT FKOperacaoAp303441 FOREIGN KEY (id) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFertilizacao ADD CONSTRAINT FKOperacaoFe880318 FOREIGN KEY (id) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFertilizacao ADD CONSTRAINT FKOperacaoFe3347 FOREIGN KEY (modo) REFERENCES Modo (id);
ALTER TABLE RegaFertirrega ADD CONSTRAINT FKRegaFertir40828 FOREIGN KEY (OperacaoRegaSetor) REFERENCES OperacaoRegaSetor (id);
ALTER TABLE OperacaoRegaSetor ADD CONSTRAINT FKOperacaoRe730827 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE OperacaoRegaSetor ADD CONSTRAINT FKOperacaoRe376754 FOREIGN KEY (setor) REFERENCES Setor (setor);
ALTER TABLE RegaFertirrega ADD CONSTRAINT FKRegaFertir391842 FOREIGN KEY (MixFertirrega) REFERENCES MixFertirrega (id);
ALTER TABLE CulturaOperacaoFatorProducao ADD CONSTRAINT FKCulturaOpe323177 FOREIGN KEY (OperacaoFatorProducao) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE CulturaOperacaoFatorProducao ADD CONSTRAINT FKCulturaOpe850504 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao567054 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao644701 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Semeadura ADD CONSTRAINT FKSemeadura275244 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Semeadura ADD CONSTRAINT FKSemeadura484590 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE MobilizacaoSolo ADD CONSTRAINT FKMobilizaca220351 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE MobilizacaoSolo ADD CONSTRAINT FKMobilizaca144825 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Monda ADD CONSTRAINT FKMonda393036 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Monda ADD CONSTRAINT FKMonda818719 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE MixFertirrega_FatorProducao ADD CONSTRAINT FKMixFertirr147144 FOREIGN KEY (MixFertirrega) REFERENCES MixFertirrega (id);
ALTER TABLE MixFertirrega_FatorProducao ADD CONSTRAINT FKMixFertirr220075 FOREIGN KEY (FatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE MixFertirrega_FatorProducao ADD CONSTRAINT FKMixFertirr351504 FOREIGN KEY (Unidade) REFERENCES Unidade (id);
ALTER TABLE plantaProduto ADD CONSTRAINT FKplantaProd874382 FOREIGN KEY (produto) REFERENCES Produto (id);
ALTER TABLE plantaProduto ADD CONSTRAINT FKplantaProd610790 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE CulturaSetor ADD CONSTRAINT FKCulturaSet575296 FOREIGN KEY (setor) REFERENCES Setor (setor);
ALTER TABLE CulturaSetor ADD CONSTRAINT FKCulturaSet432979 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Periodo ADD CONSTRAINT FKPeriodo235042 FOREIGN KEY (tipo) REFERENCES TipoPeriodo (id);
ALTER TABLE Periodo ADD CONSTRAINT FKPeriodo609572 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor671518 FOREIGN KEY (Estacao) REFERENCES EstacaoMeteorologica (designacao);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor396405 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE SubstanciaFatorProducao ADD CONSTRAINT FKSubstancia885676 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Colheita_Produto ADD CONSTRAINT FKColheita_P599783 FOREIGN KEY (Colheitaid) REFERENCES Colheita (id);
ALTER TABLE Colheita_Produto ADD CONSTRAINT FKColheita_P165515 FOREIGN KEY (Produtoid) REFERENCES Produto (id);
ALTER TABLE FatorProducaoPH ADD CONSTRAINT FKFatorProdu315394 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
