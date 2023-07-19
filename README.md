# Relatório de Contas a Pagar e Receber (SQL)

Este repositório contém a estrutura de um banco de dados para gerenciamento de contas a pagar e receber, utilizando a linguagem SQL. O esquema do banco de dados é baseado em uma arquitetura de Data Warehouse, com tabelas dimensionais e uma tabela de fatos.

Estrutura do Banco de Dados
O banco de dados é composto pelas seguintes tabelas dimensionais:

## Dimensao_Empresa: 
Armazena informações sobre as empresas envolvidas nas transações financeiras.

• Campos:
Cod_Empresa (Chave primária)
Desc_Empresa: Descrição da empresa.

## Dimensao_Cliente: 
Contém informações dos clientes relacionados às transações financeiras.

• Campos:
Cod_Cliente (Chave primária)
Desc_Cliente: Descrição do cliente.

## Dimensao_Documento: 
Armazena os tipos de documentos utilizados nas transações.

• Campos:
Cod_Documento (Chave primária)
Desc_Documento: Descrição do documento.

## Dimensao_Termo_Pagamento: 
Registra os termos de pagamento aplicados nas parcelas das transações.

• Campos:
Cod_Termo_Pagamento_Parcela (Chave primária)
Desc_Termo_Pagamento_Parcela: Descrição do termo de pagamento.

## Dimensao_Tipo_Operacao_Recibo: 
Contém informações sobre os tipos de operações relacionadas a recibos.

• Campos:
Cod_Tipo_Operacao (Chave primária)
Desc_Tipo_Operacao: Descrição do tipo de operação.

## Dimensao_Indexador_Recibo: 
Armazena os indexadores utilizados nos recibos.

• Campos:
Cod_Indexador (Chave primária)
Desc_Indexador: Descrição do indexador.

## Titulo_Receber: 
Contém informações sobre os títulos a receber.

• Campos:
Cod_Empresa (Chave primária, chave estrangeira para Dimensao_Empresa)
Cod_Cliente (Chave primária, chave estrangeira para Dimensao_Cliente)
Cod_Documento (Chave primária, chave estrangeira para Dimensao_Documento)
Numero_Documento (Chave primária)
Titulo (Chave primária)
Data_Emissao (Chave primária)
Origem: Origem do título.

## Fato_Parcelas_Titulo: 
Armazena informações detalhadas sobre as parcelas dos títulos a receber.

• Campos:
Cod_Empresa (Chave primária, chave estrangeira para Dimensao_Empresa)
Cod_Cliente (Chave primária, chave estrangeira para Dimensao_Cliente)
Cod_Documento (Chave primária, chave estrangeira para Dimensao_Documento)
Numero_Documento (Chave primária)
Titulo (Chave primária)
Data_Emissao (Chave primária)
Parcela (Chave primária)
Cod_Termo_Pagamento_Parcela (Chave estrangeira para Dimensao_Termo_Pagamento)
Valor_Original: Valor original da parcela.
Valor_Saldo: Valor do saldo da parcela.
Data_Vencimento: Data de vencimento da parcela.
Fato_Recibos_Parcela: Registra as informações detalhadas sobre as parcelas dos recibos.

• Campos:
Cod_Empresa (Chave primária, chave estrangeira para Dimensao_Empresa)
Cod_Cliente (Chave primária, chave estrangeira para Dimensao_Cliente)
Cod_Documento (Chave primária, chave estrangeira para Dimensao_Documento)
Numero_Documento (Chave primária)
Titulo (Chave primária)
Data_Emissao (Chave primária)
Parcela (Chave primária)
Data_Baixa: Data de baixa do recibo.
Numero_Sequencial_Recibo: Número sequencial do recibo.
Cod_Tipo_Operacao (Chave estrangeira para Dimensao_Tipo_Operacao_Recibo)
Cod_Indexador (Chave estrangeira para Dimensao_Indexador_Recibo)
Valor_Liquido: Valor líquido do recibo.
Data_Vencimento: Data de vencimento da parcela relacionada ao recibo.
Valor_Bruto: Valor bruto do recibo.
Restrições de Chave Estrangeira

## Estabelecidas restrições de chave estrangeira para garantir a integridade dos dados nas tabelas de fatos:

A tabela Fato_Recibos_Parcela possui as chaves estrangeiras Cod_Tipo_Operacao e Cod_Indexador que fazem referência às tabelas dimensionais Dimensao_Tipo_Operacao_Recibo e Dimensao_Indexador_Recibo, respectivamente.
A tabela Fato_Parcelas_Titulo possui a chave estrangeira Cod_Termo_Pagamento_Parcela que faz referência à tabela dimensional Dimensao_Termo_Pagamento.
A tabela Titulo_Receber possui as chaves estrangeiras Cod_Empresa, Cod_Cliente, e Cod_Documento que fazem referência às tabelas dimensionais Dimensao_Empresa, Dimensao_Cliente, e Dimensao_Documento, respectivamente.
As tabelas Fato_Recibos_Parcela e Fato_Parcelas_Titulo possuem chaves estrangeiras que fazem referência à tabela Titulo_Receber.
