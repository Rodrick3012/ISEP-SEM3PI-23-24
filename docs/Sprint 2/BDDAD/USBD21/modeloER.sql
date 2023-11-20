DROP TABLE OperacaoFatorProducao CASCADE CONSTRAINTS;
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
DROP TABLE TipoOperacao CASCADE CONSTRAINTS;
DROP TABLE Data CASCADE CONSTRAINTS;
DROP TABLE CargoUtilizador CASCADE CONSTRAINTS;
DROP TABLE Utilizadores CASCADE CONSTRAINTS;
DROP TABLE Operacao CASCADE CONSTRAINTS;
DROP TABLE MedicaoSensor CASCADE CONSTRAINTS;
DROP TABLE Sensor CASCADE CONSTRAINTS;
DROP TABLE EstacaoMeteorologica CASCADE CONSTRAINTS;
DROP TABLE TipoSensor CASCADE CONSTRAINTS;
DROP TABLE Edificio CASCADE CONSTRAINTS;
DROP TABLE Substancia CASCADE CONSTRAINTS;
DROP TABLE ColheitaPrevista CASCADE CONSTRAINTS;
DROP TABLE SubstanciaFatorProducao CASCADE CONSTRAINTS;
DROP TABLE TipoData CASCADE CONSTRAINTS;
DROP TABLE Produto CASCADE CONSTRAINTS;
DROP TABLE ParcelaCultura CASCADE CONSTRAINTS;
DROP TABLE SetorParcelaCultura CASCADE CONSTRAINTS;
DROP TABLE Setor CASCADE CONSTRAINTS;
DROP TABLE plantaProduto CASCADE CONSTRAINTS;
DROP TABLE OperacaoRega CASCADE CONSTRAINTS;
DROP TABLE Unidade CASCADE CONSTRAINTS;
CREATE TABLE OperacaoFatorProducao (
  id            number GENERATED AS IDENTITY, 
  data          date NOT NULL, 
  quantidade    number NOT NULL, 
  parcela       varchar2(25) NOT NULL, 
  modo          number NOT NULL, 
  fatorproducao varchar2(30) NOT NULL, 
  cultura       number, 
  tipooperacao  number NOT NULL, 
  unidade       number NOT NULL, 
  PRIMARY KEY (id));
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
CREATE TABLE TipoOperacao (
  id           number GENERATED AS IDENTITY, 
  tipoOperacao varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Data (
  id     number GENERATED AS IDENTITY, 
  planta varchar2(50) NOT NULL, 
  data   varchar2(50) NOT NULL, 
  tipo   number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE CargoUtilizador (
  id    number GENERATED AS IDENTITY, 
  cargo varchar2(30) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Utilizadores (
  cartaoCidadao number GENERATED AS IDENTITY, 
  nome          varchar2(80) NOT NULL, 
  cargo         number NOT NULL, 
  PRIMARY KEY (cartaoCidadao));
CREATE TABLE Operacao (
  id           number GENERATED AS IDENTITY, 
  TipoOperacao number NOT NULL, 
  data         date NOT NULL, 
  quantidade   number NOT NULL, 
  cultura      number NOT NULL, 
  parcela      varchar2(25) NOT NULL, 
  unidade      number, 
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
CREATE TABLE Edificio (
  designacao varchar2(30) NOT NULL, 
  area       number, 
  PRIMARY KEY (designacao));
CREATE TABLE Substancia (
  id         number GENERATED AS IDENTITY, 
  substancia varchar2(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE ColheitaPrevista (
  id         number GENERATED AS IDENTITY, 
  idCultura  number NOT NULL, 
  semana     number NOT NULL, 
  quantidade number NOT NULL, 
  CONSTRAINT id 
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
CREATE TABLE ParcelaCultura (
  parcela varchar2(25) NOT NULL, 
  cultura number NOT NULL, 
  PRIMARY KEY (parcela, 
  cultura));
CREATE TABLE SetorParcelaCultura (
  setor        varchar2(2) NOT NULL, 
  parcela      varchar2(25) NOT NULL, 
  cultura      number NOT NULL, 
  quantidade   number NOT NULL, 
  dataInsercao date NOT NULL, 
  dataRemocao  date, 
  PRIMARY KEY (setor, 
  parcela, 
  cultura));
CREATE TABLE Setor (
  setor        varchar2(2) NOT NULL, 
  caudalMaximo number NOT NULL, 
  dataInicio   date NOT NULL, 
  dataFim      date NOT NULL, 
  PRIMARY KEY (setor));
CREATE TABLE plantaProduto (
  produto number NOT NULL, 
  planta  varchar2(50) NOT NULL, 
  PRIMARY KEY (produto, 
  planta));
CREATE TABLE OperacaoRega (
  id      number GENERATED AS IDENTITY, 
  setor   varchar2(2) NOT NULL, 
  Parcela varchar2(25) NOT NULL, 
  cultura number NOT NULL, 
  duracao number NOT NULL, 
  data    date NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Unidade (
  id      number GENERATED AS IDENTITY, 
  unidade varchar2(5) NOT NULL, 
  PRIMARY KEY (id));
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa567047 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa644819 FOREIGN KEY (modo) REFERENCES Modo (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa455406 FOREIGN KEY (fatorproducao) REFERENCES FatorProducao (designacao);
ALTER TABLE FatorProducao ADD CONSTRAINT FKFatorProdu762811 FOREIGN KEY (objetivo) REFERENCES Objetivo (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa482555 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura134268 FOREIGN KEY (planta) REFERENCES planta (Variedade);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa148046 FOREIGN KEY (tipooperacao) REFERENCES TipoOperacao (id);
ALTER TABLE Utilizadores ADD CONSTRAINT FKUtilizador274231 FOREIGN KEY (cargo) REFERENCES CargoUtilizador (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao305476 FOREIGN KEY (TipoOperacao) REFERENCES TipoOperacao (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao289770 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao240167 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor671518 FOREIGN KEY (Estacao) REFERENCES EstacaoMeteorologica (designacao);
ALTER TABLE SubstanciaFatorProducao ADD CONSTRAINT FKSubstancia885676 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor396405 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Data ADD CONSTRAINT FKData170005 FOREIGN KEY (planta) REFERENCES planta (Variedade);
ALTER TABLE Data ADD CONSTRAINT FKData398401 FOREIGN KEY (tipo) REFERENCES TipoData (id);
ALTER TABLE ParcelaCultura ADD CONSTRAINT FKParcelaCul159527 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE ParcelaCultura ADD CONSTRAINT FKParcelaCul209130 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE SetorParcelaCultura ADD CONSTRAINT FKSetorParce564186 FOREIGN KEY (setor) REFERENCES Setor (setor);
ALTER TABLE plantaProduto ADD CONSTRAINT FKplantaProd128917 FOREIGN KEY (planta) REFERENCES planta (Variedade);
ALTER TABLE plantaProduto ADD CONSTRAINT FKplantaProd874382 FOREIGN KEY (produto) REFERENCES Produto (id);
ALTER TABLE SetorParcelaCultura ADD CONSTRAINT FKSetorParce783701 FOREIGN KEY (parcela, cultura) REFERENCES ParcelaCultura (parcela, cultura);
ALTER TABLE OperacaoRega ADD CONSTRAINT FKOperacaoRe946333 FOREIGN KEY (setor, Parcela, cultura) REFERENCES SetorParcelaCultura (setor, parcela, cultura);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao731299 FOREIGN KEY (unidade) REFERENCES Unidade (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa538514 FOREIGN KEY (unidade) REFERENCES Unidade (id);
