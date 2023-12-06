DROP TABLE Parcela CASCADE CONSTRAINTS;
DROP TABLE Modo CASCADE CONSTRAINTS;
DROP TABLE FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Fabricante CASCADE CONSTRAINTS;
DROP TABLE Formulacao CASCADE CONSTRAINTS;
DROP TABLE Classificacao CASCADE CONSTRAINTS;
DROP TABLE Objetivo CASCADE CONSTRAINTS;
DROP TABLE Cultura CASCADE CONSTRAINTS;
DROP TABLE planta CASCADE CONSTRAINTS;
DROP TABLE TipoPlanta CASCADE CONSTRAINTS;
DROP TABLE Data CASCADE CONSTRAINTS;
DROP TABLE MedicaoSensor CASCADE CONSTRAINTS;
DROP TABLE Sensor CASCADE CONSTRAINTS;
DROP TABLE EstacaoMeteorologica CASCADE CONSTRAINTS;
DROP TABLE TipoSensor CASCADE CONSTRAINTS;
DROP TABLE Substancia CASCADE CONSTRAINTS;
DROP TABLE SubstanciaFatorProducao CASCADE CONSTRAINTS;
DROP TABLE TipoData CASCADE CONSTRAINTS;
DROP TABLE Produto CASCADE CONSTRAINTS;
DROP TABLE SetorParcelaCultura CASCADE CONSTRAINTS;
DROP TABLE plantaProduto CASCADE CONSTRAINTS;
DROP TABLE OperacaoRegaSetor CASCADE CONSTRAINTS;
DROP TABLE Operacao CASCADE CONSTRAINTS;
DROP TABLE Setor CASCADE CONSTRAINTS;
DROP TABLE MixFertirrega CASCADE CONSTRAINTS;
DROP TABLE MixFertirrega_FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Monda CASCADE CONSTRAINTS;
DROP TABLE MobilizacaoSolo CASCADE CONSTRAINTS;
DROP TABLE Semeadura CASCADE CONSTRAINTS;
DROP TABLE Plantacao CASCADE CONSTRAINTS;
DROP TABLE Produto_Colheita CASCADE CONSTRAINTS;
DROP TABLE CulturaOperacaoFatorProducao CASCADE CONSTRAINTS;
DROP TABLE RegaFertirrega CASCADE CONSTRAINTS;
DROP TABLE OperacaoFertilizacao CASCADE CONSTRAINTS;
DROP TABLE OperacaoAplicacao CASCADE CONSTRAINTS;
DROP TABLE Colheita CASCADE CONSTRAINTS;
DROP TABLE Poda CASCADE CONSTRAINTS;
DROP TABLE IncorporacaoSolo CASCADE CONSTRAINTS;
DROP TABLE OperacaoFatorProducao CASCADE CONSTRAINTS;
CREATE TABLE Parcela (
  designacao varchar2(25) NOT NULL, 
  area       number NOT NULL, 
  PRIMARY KEY (designacao));
CREATE TABLE Modo (
  id   number GENERATED AS IDENTITY, 
  modo varchar2(20) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE FatorProducao (
  designacao    varchar2(30) NOT NULL, 
  Fabricante    number NOT NULL, 
  formulacao    number NOT NULL, 
  classificacao number NOT NULL, 
  objetivo      number NOT NULL, 
  ph            number, 
  PRIMARY KEY (designacao));
CREATE TABLE Fabricante (
  id         number GENERATED AS IDENTITY, 
  Fabricante varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Formulacao (
  id         number GENERATED AS IDENTITY, 
  formulacao varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Classificacao (
  id            number GENERATED AS IDENTITY, 
  classificacao varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Objetivo (
  id       number GENERATED AS IDENTITY, 
  objetivo varchar2(40) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Cultura (
  id          number GENERATED AS IDENTITY, 
  planta      varchar2(50) NOT NULL, 
  parcela     varchar2(25) NOT NULL, 
  dataInicial date NOT NULL, 
  dataFinal   date, 
  quantidade  number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE planta (
  Variedade  varchar2(50) NOT NULL, 
  nomeComum  varchar2(30) NOT NULL, 
  especie    varchar2(40) NOT NULL, 
  tipoplanta number NOT NULL, 
  PRIMARY KEY (Variedade));
CREATE TABLE TipoPlanta (
  id         number GENERATED AS IDENTITY, 
  tipoPlanta varchar2(30) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE Data (
  id     number GENERATED AS IDENTITY, 
  planta varchar2(50) NOT NULL, 
  data   varchar2(50) NOT NULL, 
  tipo   number NOT NULL, 
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
  tipo   varchar2(30) NOT NULL, 
  PRIMARY KEY (idTipo));
CREATE TABLE Substancia (
  id         number GENERATED AS IDENTITY, 
  substancia varchar2(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE SubstanciaFatorProducao (
  substancia    number NOT NULL, 
  fatorProducao varchar2(30) NOT NULL, 
  percentagem   number NOT NULL, 
  PRIMARY KEY (substancia, 
  fatorProducao));
CREATE TABLE TipoData (
  id       number GENERATED AS IDENTITY, 
  tipoData varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Produto (
  id      number GENERATED AS IDENTITY, 
  produto varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE SetorParcelaCultura (
  id           number(10) GENERATED AS IDENTITY, 
  setor        varchar2(2) NOT NULL, 
  quantidade   number NOT NULL, 
  dataInsercao date NOT NULL, 
  dataRemocao  date, 
  Cultura      number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE plantaProduto (
  produto number NOT NULL, 
  planta  varchar2(50) NOT NULL, 
  PRIMARY KEY (produto, 
  planta));
CREATE TABLE OperacaoRegaSetor (
  id                  number NOT NULL, 
  duracao             number NOT NULL, 
  horario             timestamp(0) NOT NULL, 
  SetorParcelaCultura number(10) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Operacao (
  id      number GENERATED AS IDENTITY, 
  anulada number(1) DEFAULT 0 NOT NULL, 
  data    date NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Setor (
  setor        varchar2(2) NOT NULL, 
  caudalMaximo number NOT NULL, 
  dataInicio   date NOT NULL, 
  dataFim      date, 
  PRIMARY KEY (setor));
CREATE TABLE MixFertirrega (
  id         number GENERATED AS IDENTITY, 
  designacao varchar2(40) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE MixFertirrega_FatorProducao (
  MixFertirrega number NOT NULL, 
  FatorProducao varchar2(30) NOT NULL, 
  PRIMARY KEY (MixFertirrega, 
  FatorProducao));
CREATE TABLE Monda (
  id      number NOT NULL, 
  Cultura number NOT NULL, 
  area    number(10) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE MobilizacaoSolo (
  id      number NOT NULL, 
  area    number(10) NOT NULL, 
  Cultura number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Semeadura (
  id         number NOT NULL, 
  Cultura    number NOT NULL, 
  area       number(10) NOT NULL, 
  quantidade number(10) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Plantacao (
  id         number NOT NULL, 
  Cultura    number NOT NULL, 
  quantidade number(10) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Produto_Colheita (
  Produtoid          number NOT NULL, 
  OperacaoColheitaid number NOT NULL, 
  Colheitaid         number NOT NULL, 
  PRIMARY KEY (Produtoid, 
  OperacaoColheitaid, 
  Colheitaid));
CREATE TABLE CulturaOperacaoFatorProducao (
  OperacaoFatorProducao number NOT NULL, 
  Cultura               number NOT NULL, 
  PRIMARY KEY (OperacaoFatorProducao));
CREATE TABLE RegaFertirrega (
  OperacaoRegaSetor number GENERATED AS IDENTITY, 
  MixFertirrega     number NOT NULL, 
  PRIMARY KEY (OperacaoRegaSetor));
CREATE TABLE OperacaoFertilizacao (
  id   number NOT NULL, 
  modo number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE OperacaoAplicacao (
  id number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Colheita (
  id         number NOT NULL, 
  Cultura    number NOT NULL, 
  quantidade number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Poda (
  id         number NOT NULL, 
  cultura    number NOT NULL, 
  quantidade number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE IncorporacaoSolo (
  id      number NOT NULL, 
  area    number NOT NULL, 
  Cultura number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE OperacaoFatorProducao (
  id            number NOT NULL, 
  fatorproducao varchar2(30) NOT NULL, 
  parcela       varchar2(25) NOT NULL, 
  quantidade    number NOT NULL, 
  PRIMARY KEY (id));
ALTER TABLE FatorProducao ADD CONSTRAINT FKFatorProdu762811 FOREIGN KEY (objetivo) REFERENCES Objetivo (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura134268 FOREIGN KEY (planta) REFERENCES planta (Variedade);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor671518 FOREIGN KEY (Estacao) REFERENCES EstacaoMeteorologica (designacao);
ALTER TABLE SubstanciaFatorProducao ADD CONSTRAINT FKSubstancia885676 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor396405 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Data ADD CONSTRAINT FKData170005 FOREIGN KEY (planta) REFERENCES planta (Variedade);
ALTER TABLE Data ADD CONSTRAINT FKData398401 FOREIGN KEY (tipo) REFERENCES TipoData (id);
ALTER TABLE SetorParcelaCultura ADD CONSTRAINT FKSetorParce564186 FOREIGN KEY (setor) REFERENCES Setor (setor);
ALTER TABLE plantaProduto ADD CONSTRAINT FKplantaProd128917 FOREIGN KEY (planta) REFERENCES planta (Variedade);
ALTER TABLE plantaProduto ADD CONSTRAINT FKplantaProd874382 FOREIGN KEY (produto) REFERENCES Produto (id);
ALTER TABLE OperacaoRegaSetor ADD CONSTRAINT FKOperacaoRe832593 FOREIGN KEY (SetorParcelaCultura) REFERENCES SetorParcelaCultura (id);
ALTER TABLE MixFertirrega_FatorProducao ADD CONSTRAINT FKMixFertirr147144 FOREIGN KEY (MixFertirrega) REFERENCES MixFertirrega (id);
ALTER TABLE MixFertirrega_FatorProducao ADD CONSTRAINT FKMixFertirr220075 FOREIGN KEY (FatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura155084 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE SetorParcelaCultura ADD CONSTRAINT FKSetorParce706503 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Monda ADD CONSTRAINT FKMonda818719 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Semeadura ADD CONSTRAINT FKSemeadura484590 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE MobilizacaoSolo ADD CONSTRAINT FKMobilizaca539483 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao644701 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao567054 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Monda ADD CONSTRAINT FKMonda393036 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Semeadura ADD CONSTRAINT FKSemeadura275244 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE MobilizacaoSolo ADD CONSTRAINT FKMobilizaca220351 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE OperacaoRegaSetor ADD CONSTRAINT FKOperacaoRe730827 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Produto_Colheita ADD CONSTRAINT FKProduto_Co772513 FOREIGN KEY (Produtoid) REFERENCES Produto (id);
ALTER TABLE RegaFertirrega ADD CONSTRAINT FKRegaFertir391842 FOREIGN KEY (MixFertirrega) REFERENCES MixFertirrega (id);
ALTER TABLE RegaFertirrega ADD CONSTRAINT FKRegaFertir824492 FOREIGN KEY (MixFertirrega) REFERENCES OperacaoRegaSetor (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita943585 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita268170 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Produto_Colheita ADD CONSTRAINT FKProduto_Co270585 FOREIGN KEY (OperacaoColheitaid) REFERENCES Colheita (id);
ALTER TABLE OperacaoFertilizacao ADD CONSTRAINT FKOperacaoFe3347 FOREIGN KEY (modo) REFERENCES Modo (id);
ALTER TABLE Poda ADD CONSTRAINT FKPoda426785 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Poda ADD CONSTRAINT FKPoda869973 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE IncorporacaoSolo ADD CONSTRAINT FKIncorporac414313 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE IncorporacaoSolo ADD CONSTRAINT FKIncorporac202557 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE CulturaOperacaoFatorProducao ADD CONSTRAINT FKCulturaOpe850504 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa455406 FOREIGN KEY (fatorproducao) REFERENCES FatorProducao (designacao);
ALTER TABLE CulturaOperacaoFatorProducao ADD CONSTRAINT FKCulturaOpe323177 FOREIGN KEY (OperacaoFatorProducao) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa39367 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE OperacaoAplicacao ADD CONSTRAINT FKOperacaoAp303441 FOREIGN KEY (id) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFertilizacao ADD CONSTRAINT FKOperacaoFe880318 FOREIGN KEY (id) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa567047 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
