create table Dimensao_Empresa(
             Cod_Empresa NUMERIC NOT NULL,
             Desc_Empresa VARCHAR(100) NOT NULL,
  CONSTRAINT Dimensao_Empresa_PK PRIMARY KEY (Cod_Empresa)
)

create table Dimensao_Cliente(
             Cod_Cliente NUMERIC NOT NULL,
             Desc_Cliente VARCHAR(100) NOT NULL,
  CONSTRAINT Dimensao_Cliente_PK PRIMARY KEY (Cod_Cliente)
)

create table Dimensao_Documento(
             Cod_Documento VARCHAR(100) NOT NULL,
             Desc_Documento VARCHAR(100) NOT NULL,
  CONSTRAINT Dimensao_Documento_PK PRIMARY KEY (Cod_Documento)
)

create table Dimensao_Termo_Pagamento(
             Cod_Termo_Pagamento_Parcela VARCHAR(100) NOT NULL,
             Desc_Termo_Pagamento_Parcela VARCHAR(100) NOT NULL,
  CONSTRAINT Dimensao_Termo_Pagamento_PK PRIMARY KEY (Cod_Termo_Pagamento_Parcela)
)

create table Dimensao_Tipo_Operacao_Recibo(
             Cod_Tipo_Operacao NUMERIC NOT NULL,
             Desc_Tipo_Operacao VARCHAR(100) NOT NULL,
  CONSTRAINT Dimensao_Tipo_Operacao_Recibo_PK PRIMARY KEY (Cod_Tipo_Operacao)
)

create table Dimensao_Indexador_Recibo(
             Cod_Indexador NUMERIC NOT NULL,
             Desc_Indexador VARCHAR(100) NOT NULL,
  CONSTRAINT Dimensao_Indexador_Recibo_PK PRIMARY KEY (Cod_Indexador)
)

create table Titulo_Receber(
             Cod_Empresa NUMERIC NOT NULL,
             Cod_Cliente NUMERIC NOT NULL,
             Cod_Documento VARCHAR(100) NOT NULL,
             Numero_Documento VARCHAR(100) NOT NULL,
             Titulo NUMERIC NOT NULL,
             Data_Emissao DATE NOT NULL,
             Origem VARCHAR(100) NOT NULL,
  CONSTRAINT Titulo_Receber_PK PRIMARY KEY (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao)
)

create table Fato_Parcelas_Titulo(
             Cod_Empresa NUMERIC(10,2) NOT NULL,
             Cod_Cliente NUMERIC(10,2) NOT NULL,
             Cod_Documento VARCHAR(100) NOT NULL,
             Numero_Documento VARCHAR(100) NOT NULL,
             Titulo NUMERIC(10,2) NOT NULL,
             Data_Emissao DATE NOT NULL,
             Parcela NUMERIC(10,2) NOT NULL,
             Cod_Termo_Pagamento_Parcela VARCHAR(100) NOT NULL,
             Valor_Original NUMERIC(10,2) NOT NULL,
             Valor_Saldo NUMERIC(10,2) NOT NULL,
             Data_Vencimento DATE NOT NULL,
  CONSTRAINT Fato_Parcelas_Titulo_PK PRIMARY KEY (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao, Parcela)
)

create table Fato_Recibos_Parcela(
             Cod_Empresa NUMERIC NOT NULL,
             Cod_Cliente NUMERIC NOT NULL,
             Cod_Documento VARCHAR(100) NOT NULL,
             Numero_Documento VARCHAR(100) NOT NULL,
             Titulo NUMERIC NOT NULL,
             Data_Emissao DATE NOT NULL,
             Parcela NUMERIC NOT NULL,
             Data_Baixa DATE NOT NULL,
             Numero_Sequencial_Recibo NUMERIC NOT NULL,
             Cod_Tipo_Operacao NUMERIC NOT NULL,
             Cod_Indexador NUMERIC NOT NULL,
             Valor_Liquido NUMERIC(10,2) NOT NULL,
             Data_Vencimento DATE NOT NULL,
             Valor_Bruto NUMERIC(10,2) NOT NULL,
  CONSTRAINT Fato_Recibos_Parcela_PK PRIMARY KEY (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao, Parcela, Data_Baixa, Numero_Sequencial_Recibo, Cod_Tipo_Operacao, Cod_Indexador)
)

 ALTER TABLE Fato_Recibos_Parcela  ADD CONSTRAINT Dimensao_Tipo_Operacao_Recibo_Fato_Recibos_Parcela_FK
 FOREIGN KEY (Cod_Tipo_Operacao)
  REFERENCES Dimensao_Tipo_Operacao_Recibo (Cod_Tipo_Operacao)
NOT DEFERRABLE;

 ALTER TABLE Fato_Recibos_Parcela  ADD CONSTRAINT Dimensao_Indexador_Recibo_Fato_Recibos_Parcela_FK
 FOREIGN KEY (Cod_Indexador)
  REFERENCES Dimensao_Indexador_Recibo (Cod_Indexador)
NOT DEFERRABLE;

 ALTER TABLE Fato_Parcelas_Titulo  ADD CONSTRAINT Dimensao_Termo_Pagamento_Fato_Parcelas_Titulo_FK
 FOREIGN KEY (Cod_Termo_Pagamento_Parcela)
  REFERENCES Dimensao_Termo_Pagamento (Cod_Termo_Pagamento_Parcela)
NOT DEFERRABLE;

 ALTER TABLE Titulo_Receber  ADD CONSTRAINT Dimensao_Empresa_Titulo_Receber_FK
 FOREIGN KEY (Cod_Empresa)
  REFERENCES Dimensao_Empresa (Cod_Empresa)
NOT DEFERRABLE;

 ALTER TABLE Titulo_Receber  ADD CONSTRAINT Dimensao_Cliente_Titulo_Receber_FK
 FOREIGN KEY (Cod_Cliente)
  REFERENCES Dimensao_Cliente (Cod_Cliente)
NOT DEFERRABLE;

 ALTER TABLE Titulo_Receber  ADD CONSTRAINT Dimensao_Documento_Titulo_Receber_FK
 FOREIGN KEY (Cod_Documento)
  REFERENCES Dimensao_Documento (Cod_Documento)
NOT DEFERRABLE;

 ALTER TABLE Fato_Parcelas_Titulo  ADD CONSTRAINT Titulo_Receber_Fato_Parcelas_Titulo_FK
 FOREIGN KEY (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao)
  REFERENCES Titulo_Receber (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao)
NOT DEFERRABLE;

 ALTER TABLE Fato_Recibos_Parcela  ADD CONSTRAINT Fato_Parcelas_Titulo_Fato_Recibos_Parcela_FK
 FOREIGN KEY (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao, Parcela)
  REFERENCES Fato_Parcelas_Titulo (Cod_Empresa, Cod_Cliente, Cod_Documento, Numero_Documento, Titulo, Data_Emissao, Parcela)
NOT DEFERRABLE;