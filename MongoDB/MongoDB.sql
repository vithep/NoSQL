/* No SQL se chama tabela */
/* No NoSQL se chama coleção */

/* No SQL se chama registro*/
/* No NoSQL se chama documento*/

/*C:\Program Files\MongoDB\Server\4.4\data
# C:\Program Files\MongoDB\Server\4.4\bin
# C:\Program Files\MongoDB\Server\4.4\log*/

/* MongoDB -> Documento*/
/* Neo4j -> Grafos
 React -> Dicionarios*/

/*SQL                      x                NoSQL*/
Schema Definido (Tabela)    Schemaless(on the FLY)
Formas Normais                      Sem Convenções
Utilização de Joins               Não possui Joins
Maior Segurança                    Menor Segurança
Mais Lento                             Mais rapido
Crescimento Vertical        Crescimento Horizontal
Sistemas sem Mudança            Sistemas Dinâmicos
                      Objetos 
Tabelas                                Collections
Registros                               Documentos
Chave Estrangeira                              Nos
Primary Key                                    Key
Foreign Key                                  Value
                                            Labels
                                        Properties

/* Documento JSON */
[
	{ 
	  "aeroPartida": "SDU",
	  "aeroChegada": "YYZ",
	  "aviao": "Airbus A380",
	  "distacia":30000,
	  "intercontinental": true
	}
]

/* Exemplo Aeroporto SQL*/
create database aviacao;

/* verificar as bases de dados */
show databases;

/*conectar*/
use aviacao;

/*mostrar tabelas*/
show tables;

/*criar tabelas*/
create table aviao(
	IDAVIAO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(100)
);
CREATE TABLE AEROPORTO(
	IDAEROPORTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SIGLA CHAR(2)
);
CREATE TABLE VOOS(
	IDVIAGEM INT PRIMARY KEY AUTO_INCREMENT,
	ID_AVIAO INT,
	ID_PARTIDA INT,
	ID_CHEGADA INT,
	DISTANCIA INT,
	INTERCONTINENTAL BINARY
);

ALTER TABLE VOOS ADD CONSTRAINT FK_AVIAO
FOREIGN KEY (ID_AVIAO) REFERENCES AVIAO(IDAVIAO);

ALTER TABLE VOOS ADD CONSTRAINT FK_AERO_PARTIDA
FOREIGN KEY (ID_PARTIDA) REFERENCES AEROPORTO(IDAEROPORTO);

ALTER TABLE VOOS ADD CONSTRAINT FK_AERO_CHEGADA
FOREIGN KEY (ID_CHEGADA) REFERENCES AEROPORTO(IDAEROPORTO);

/* VERIFICANDO AS TABELAS */
DESC 'NOME DA TABELA'

/* VERIFICANDO OS REGISTROS DAS TABELAS */
SELECT * FROM AVIAO;
SELECT * FROM AEROPORTO;
SELECT * FROM VOOS;
limit one

/* ALTERANDO TABELAS */
ALTER TABLE AEROPORTO
MODIFY COLUMN SIGLA CHAR(3);
DESC 'NOME DA TABELA'

/* RELACIONAL 
-- 1 - CRIAR BANCO
-- 2 - CONECTOU
-- 3 - CRIOU TABELAS
	   -- AVIAO
	   -- AEROPORTOS
	   -- VOOS
-- 4 - ENTROU COM OS DADOS
	   -- AVIAO
	   -- AEROPORTOS
	   -- VOOS
-- 5 - CONSULTAR OS DADOS*/

/* NOSQL */
-- ARMAZENA DADOS NO FORMATO JSON --
[
	(
	  AEROPARTIDA: "SDU",
	  AEROCHEGADA: "YYZ",
	  AVIAO: "AIRBUS A380",
	  DISTANCIA: 30000,
	  INTERCONTINENTAL: TRUE
	),
	(
	  AEROPARTIDA: "GRU",
	  AEROCHEGADA: "GIG",
	  AVIAO: "AIRBUS A320",
	  DISTANCIA: 550,
	  INTERCONTINENTAL: FALSE
	)
]
-- PASSOS INICIAIS

show dbs

-- verificando o nome do banco
-- por padrão o mongodb conecta-se com o banco test

db.getName()

-- CRIANDO BANCO DE DADOS

use aviacao

-- ARMAZENANDO DADOS NO MONGO DB
--------------
--- O comando INSERTONE()
------------------

db.voos.insertOne( {} )


db.voos.insertOne( 
	{
	  AEROPARTIDA: "SDU",
	  AEROCHEGADA: "YYZ",
	  AVIAO: "AIRBUS A380",
	  DISTANCIA: 30000,
	  INTERCONTINENTAL: true
	}
)
		
db.voos.insertOne( 
	{
	  AEROPARTIDA: "GRU",
	  AEROCHEGADA: "GIG",
	  AVIAO: "AIRBUS A320",
	  DISTANCIA: 550,
	  INTERCONTINENTAL: false
	}
)

----------------
--- CONSULTADO DOCUMENTOS (REGISTROS)
--- findone()
----------------
db.voos.findOne()
/* no SQL */
select * from aviao limit 1;

--- find()
----------------
db.voos.find()
{ "_id" : ObjectId("5fa7233bf1214cb5ca2e3a4d"), "AEROPARTIDA" : "SDU", "AEROCHEGADA" : "YYZ", "AVIAO" : "AIRBUS A380", "DISTANCIA" : 30000, "INTERCONTINENTAL" : true }
{ "_id" : ObjectId("5fa7236ff1214cb5ca2e3a4e"), "AEROPARTIDA" : "GRU", "AEROCHEGADA" : "GIG", "AVIAO" : "AIRBUS A320", "DISTANCIA" : 550, "INTERCONTINENTAL" : false }

db.voos.find().pretty()
{
        "_id" : ObjectId("5fa7233bf1214cb5ca2e3a4d"),
        "AEROPARTIDA" : "SDU",
        "AEROCHEGADA" : "YYZ",
        "AVIAO" : "AIRBUS A380",
        "DISTANCIA" : 30000,
        "INTERCONTINENTAL" : true
}
{
        "_id" : ObjectId("5fa7236ff1214cb5ca2e3a4e"),
        "AEROPARTIDA" : "GRU",
        "AEROCHEGADA" : "GIG",
        "AVIAO" : "AIRBUS A320",
        "DISTANCIA" : 550,
        "INTERCONTINENTAL" : false
}
SELECT P.NOME AS AEROPARTIDA,
	   C.NOME AS AEROCHEGADA,
	   MODELO AS AVIAO,
	   V.DISTANCIA AS DISTANCIA,
	   V.INTERCONTINENTAL AS INTERCONTINENTAL
FROM AEROPORTO P 
INNER JOIN VOOS V 
ON P.IDAEROPORTO = V.ID_PARTIDA
INNER JOIN AVIAO 
ON IDAVIAO = V.ID_AVIAO
INNER JOIN AEROPORTO C
ON C.IDAEROPORTO = V.ID_CHEGADA;

-----------------------
- Falando de Schemaless
-----------------------

{
        "AEROPARTIDA" : "GRU",
        "AEROCHEGADA" : "GIG",
        "AVIAO" : "AIRBUS A320",
        "DISTANCIA" : 550,
        "INTERCONTINENTAL" : false,
		"atrasado": true
}
insert into voos values(null,3,5,6,5000,0,0);

alter table voos add atrasado binary;

-- No NoSQL

db.voos.insertOne(
	{
        "AEROPARTIDA" : "JFK",
        "AEROCHEGADA" : "DCA",
        "AVIAO" : "Boeing 7070",
        "DISTANCIA" : 5000,
        "INTERCONTINENTAL" : false,
		"ATRASADO": false
	}
)

db.voos.find().pretty()
{
        "_id" : ObjectId("5fa74dd5f1214cb5ca2e3a50"),
        "AEROPARTIDA" : "SDU",
        "AEROCHEGADA" : "YYZ",
        "AVIAO" : "AIRBUS A380",
        "DISTANCIA" : 30000,
        "INTERCONTINENTAL" : true
}
{
        "_id" : ObjectId("5fa74dd6f1214cb5ca2e3a51"),
        "AEROPARTIDA" : "GRU",
        "AEROCHEGADA" : "GIG",
        "AVIAO" : "AIRBUS A320",
        "DISTANCIA" : 550,
        "INTERCONTINENTAL" : false
}
{
        "_id" : ObjectId("5fa74e13f1214cb5ca2e3a52"),
        "AEROPARTIDA" : "JFK",
        "AEROCHEGADA" : "DCA",
        "AVIAO" : "Boeing 7070",
        "DISTANCIA" : 5000,
        "INTERCONTINENTAL" : false,
        "ATRASADO" : false
}

-- Trabalhando com IDS
db.voos.insertOne(
	{
		"AEROPARTIDA" : "JFK",
        "AEROCHEGADA" : "DCA",
        "AVIAO" : "Boeing 7070",
        "DISTANCIA" : 5000,
        "INTERCONTINENTAL" : false,
        "ATRASADO" : false,
		"_id": 123
	}
)

db.voos.insertOne(
	{
		"AEROPARTIDA" : "JFK",
        "AEROCHEGADA" : "DCA",
        "AVIAO" : "Airbus 320",
        "DISTANCIA" : 5000,
        "INTERCONTINENTAL" : false,
        "ATRASADO" : true,
		"_id": 123
	}
)

/* Não autoriza pois tem duplicidade de IDs!! */

---------- 
-- FILTROS
----------

create table clientes(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1)
);

INSERT INTO CLIENTES VALUES(NULL,'JOAO','M');
INSERT INTO CLIENTES VALUES(NULL,'JORGE','M');
INSERT INTO CLIENTES VALUES(NULL,'CLARA','F');
INSERT INTO CLIENTES VALUES(NULL,'LILIAN','F');

DELETE FROM CLIENTES;

SELECT * FROM CLIENTES;

DELETE FROM CLIENTES WHERE IDCLIENTE = 5;
DELETE FROM CLIENTES WHERE SEXO = 'F';

-- FILTRANDO NO MONGODB

--------------------
-- DELETEONE()
--------------------

db.voos.deleteOne({_id: 123})

--------------------
-- DELETEMANY()
--------------------

db.voos.deleteMany({'INTERCONTINENTAL': false})

{
        "_id" : ObjectId("5fa74dd5f1214cb5ca2e3a50"),
        "AEROPARTIDA" : "SDU",
        "AEROCHEGADA" : "YYZ",
        "AVIAO" : "AIRBUS A380",
        "DISTANCIA" : 30000,
        "INTERCONTINENTAL" : true
}


-----------------------------------------------
-- delete sem filtro (CUIDADO)!!
-----------------------------------------------
db.voos.deleteMany({})   /*== deletar tudo*/

-- não faz sentido usar deleteOne sem criterio
db.voos.deleteOne({})


-----------------------------------------------
-- Comando InsertMany()
-----------------------------------------------

INSERT INTO CLIENTES VALUES(NULL,'LETICIA','F'), (NULL,'MAFRA','F')

-- [ ] -> Vetor ['maçã','banana','perâ']
-- { } -> Dicionario {cliente: 'Mafra',sexo: 'M',idade: 37}
--

db.clientes.insertMany([
	{
	_id:1,
	nome: 'João',
	sexo: 'M'},
	{
	_id:2,
	nome: 'Clara',
	sexo: 'F'},
	{
	_id:3,
	nome: 'Lilian',
	sexo: 'F'},
	{
	_id:4,
	nome: 'Mafra',
	sexo: 'M'},
	{
	_id:5,
	nome: 'Leticia',
	sexo: 'F'}
])
)

--------------------------
-- updateOne()
--------------------------

db.clientes.updateOne({FILTRO},{VAlOR A ENTRAR})

-- Tags de comandos são precedidos de $

db.clientes.updateOne(
	{_id:1},{$set:{ativo:true}}
)

db.clientes.find().pretty()
{ "_id" : 1, "nome" : "João", "sexo" : "M", "ativo" : true }
{ "_id" : 2, "nome" : "Clara", "sexo" : "F" }
{ "_id" : 3, "nome" : "Lilian", "sexo" : "F" }
{ "_id" : 4, "nome" : "Mafra", "sexo" : "M" }
{ "_id" : 5, "nome" : "Leticia", "sexo" : "F" }

--------------------------------------
-- updateMany()
-- operador $set
--------------------------------------

db.clientes.updateMany({},{$set:{active:true}})

-------------------------------------
-- operador $unset
-------------------------------------
-- antes
{
        "_id" : 1,
        "nome" : "João",
        "sexo" : "M",
        "ativo" : true,
        "active" : true
}
{ "_id" : 2, "nome" : "Clara", "sexo" : "F", "active" : true }
{ "_id" : 3, "nome" : "Lilian", "sexo" : "F", "active" : true }
{ "_id" : 4, "nome" : "Mafra", "sexo" : "M", "active" : true }
{ "_id" : 5, "nome" : "Leticia", "sexo" : "F", "active" : true }


db.clientes.updateOne({_id:1},{$unset:{ativo:""}})

-- depois

{ "_id" : 1, "nome" : "João", "sexo" : "M", "active" : true }
{ "_id" : 2, "nome" : "Clara", "sexo" : "F", "active" : true }
{ "_id" : 3, "nome" : "Lilian", "sexo" : "F", "active" : true }
{ "_id" : 4, "nome" : "Mafra", "sexo" : "M", "active" : true }
{ "_id" : 5, "nome" : "Leticia", "sexo" : "F", "active" : true }

--------------------------------
-- mongoDB tem muitos operadores entre eles $set e o $unset
-- $[set - utilizado para modificar ou acrescentar um campo chave:valor
-- $unset - utilizado para remover um campo 
--------------------------------

------------------------------------------------------------------
-- Vetores  - é um conjunto de elementos, GERALMENTE do mesmo tipo
------------------------------------------------------------------

db.funcionarios.insertOne(
	{
		nome: 'Michel',
		idade: 29,
		filhos: ['Isabela','Natan']
	}
)

db.funcionarios.insertMany([
	{
		nome: 'Lilian',
		idade: 34,
		filhos: ['Leticia','Clara']
	},
	{
		nome: 'Bianca',
		idade: 31,
		filhos: ['Olivia','Eva']
	},
	{
		nome: 'Andre',
		idade: 35,
		filhos: ['Bruno','Ana']
	}
	]
)

--------------------------------
--------EXERCICIO DO PROJETO 01
--------------------------------

-- AGRUPE OS ELEMENTOS
-- TEM CHAVE E VALOR? É UM DICIONARIO {}
-- TEM MAIS DE UM? É UM VETOR! []
-- OS ELEMENTOS DO VETOR SAO APENAS VALORES? É UM VETOR SUMPLES [A,B,C]
-- DENTRO DO VETOR TEM CHAVE E VALOR? É UM VETOR DE DICIONARIO [{PAI:JOAO},{MÂE:MARIA}]
-- TODOS OS ELEMENTOS PODEM SER ANINHADOS MAIS DE UMA VEZ {A:[{A:B},{C:[D,E,F]}]}
-- INSERTONE NAO UTILIZA VETOR LOGO APOS O PAREMTRO INSEETONE([]) --> VDD --> INSERTONE({[]})
-- INSERTMANY UTILIZA COLCHETES LOGO APOS O PARAMETRO INSERTMANY([{},{},{}])

-- CRIO UM BANCO DE EXEMPLO/TESTE

USE EXEMPLO

-- INSIRA SEMPRE COM INSERTONE E DEPOIS DE CORRETO, CONVERTA PARA UM VETOR (INSERTMANY)
-- NA FASE DE TESE NAO COLOQUE ID

db.alunos.insertOne({nome: 'Joao'})

db.alunos.find().pretty()

-- INSIRA O PRIMEIRO NIVEL

db.alunos.insertOne(
	{
		nome:'João',
		sexo: 'M',
		serie: 8,
		voluntario: true,
		telefones: ['34578876','99876789'],
		materias:[
					{
						Gerais:[
							{'Matematica':[7.8,8.9,9.3]},
							{'Portugues':[5.9,7.3,5.9]},
							{'Geografia':[8.0,5.7,6.7]}
								]
					},
				    {
						Eletivas:['Desenho','Musica']}
				]
	}
)

-- Convertendo para insertMany()

use escola

db.alunos.insertMany([
	{
		_id: 1
		nome:'João',
		sexo: 'M',
		serie: 8,
		voluntario: true,
		telefones: ['34578876','99876789'],
		materias:[
					{
						Gerais:[
							{'Matematica':[7.8,8.9,9.3]},
							{'Portugues':[5.9,7.3,5.9]},
							{'Geografia':[8.0,5.7,6.7]}
								]
					},
				    {
						Eletivas:['Desenho','Musica']}
				]
	},
	{
		_id: 2
		nome:'Clara',
		sexo: 'F',
		serie: 7,
		email: 'clara@gmail.com',
		voluntario: true,
		telefones: ['34532211','91236772'],
		materias:[
					{
						Gerais:[
							{'Matematica':[5.9,2.0,9.8]},
							{'Portugues':[6.9,8.8,9.7]},
							{'Geografia':[7.9,9.8,9.8]}
								]
					},
				    {
						Eletivas:['Ed.Fisica','Musica']}
				]
	},
	{
		_id: 3
		nome:'Carlos',
		sexo: 'M',
		serie: 6,
		voluntario: true,
		telefones: ['12348876','99855789'],
		materias:[
					{
						Gerais:[
							{'Matematica':[7.0,6.9,2.3]},
							{'Portugues':[4.9,6.3,5.9]},
							{'Geografia':[7.0,4.7,8.7]}
								]
					},
				    {
						Eletivas:['Desenho','Ed.Fisica']}
				]
	},
	{
		_id: 4
		nome:'Marla',
		sexo: 'F',
		serie: 7,
		voluntario: true,
		telefones: ['34278276','92826789'],
		materias:[
					{
						Gerais:[
							{'Matematica':[5.8,4.9,7.3]},
							{'Portugues':[2.9,7.3,8.9]},
							{'Geografia':[8.4,6.7,3.7]}
								]
					},
				    {
						Eletivas:['Artes','Musica']}
				]
	},
	{
		_id: 5
		nome:'Kiko',
		sexo: 'M',
		serie: 6,
		voluntario: true,
		telefones: ['98778876','90006789'],
		materias:[
					{
						Gerais:[
							{'Matematica':[7.3,8.0,9.9]},
							{'Portugues':[5.3,7.7,7.9]},
							{'Geografia':[8.7,5.9,6.0]}
								]
					},
				    {
						Eletivas:['Desenho','Artes']}
				]
	}
]
)


--- importação de dados
-- Mockaroo - https://www.mockaroo.com 

	{
		id: 1,
		nome: 'Lilian',
		sobrenome: 'Nunes',
		email: 'lilianunes@gmail.com'
	}

-- segundo caso
{
	funcionario:
		{
			nome: 'Joao',
			sobrenome: 'Nunes'
		}
		dependentes: [
			{ nome_completo: 'Felipe Mafra',
			  sexo: 'Masculino'
			},
			{ nome_completo: 'Clara Mafra',
			  sexo: 'Feminino'
			}
		]
}

-- IMPORTANDO ARQUIVOS JSON

mongoimport --stopOnError --db exemplo  --collection clientes  < "C:\Users\Vithep\Documents\Cursos\TI\NoSQL - Udemy - Nov_2020\MOCK_DATA.json" 

-- Modifique o conteudo do arquivo apagando os [ ] e as virgulas no final dos registros

mongoimport --stopOnError --db exemplo  --collection clientes  < "C:\Users\Vithep\Documents\Cursos\TI\NoSQL - Udemy - Nov_2020\PessoasSimples.json" 

-- Importando arquivos com vetores

mongoimport --stopOnError --db exemplo  --collection funcionarios  < "C:\Users\Vithep\Documents\Cursos\TI\NoSQL - Udemy - Nov_2020\MOCK_DATA(2).json" --jsonArray



---------------
-- Neo4j
---------------
:HELP
:SEVER DISCONNECT
:SERVER CONNECT 
:PLAY START
:SERVER STATUS
:SYSINFO
:QUERIES




principais palabras da linguagem CYPHER

CREATE = CRIAR - NODE E RELACIONAMENTO
MATCH = SELECT
RETURN = MOSTRA O VALOR CRIADO (RETORNA)
WHERE = SELECAO
SET = UPDATE
REMOVE = DELETE
MERGE = CRIAR UM OBJETO DERIVADO

LABEL - ANALOGA AO NOME DE UMA TABELA 

PROPRIEDADE - ANALOGA AO NOME DE COLUNAS

---INTRODUZINDO O WHERE
MATCH (n) WHERE id(n)=3 RETURN (n)
MATCH (n) WHERE id(n)=8 RETURN (n)

-SO TEM TIME 
MATCH (n:TIME) RETURN (n)
-SO DE FUTEBOL
MATCH (n:TIME:FUTEBOL) RETURN (n)
- TRAZENDO TIME ESPECIFICO
MATCH (n) WHERE n.NOME='FLAMENGO' RETURN (n)
- TRAZENDO MAIS DE UM 
MATCH (n),(y) WHERE n.NOME='FLAMENGO' AND y.NOME='FLUMINENSE' RETURN n,y
===========================

CREATE (:SELECAO  {NOME: 'BRASIL',COR:'VERDE',COR:'AMARELO'})
CREATE (:SELECAO  {NOME: 'ARGENTINA',COR:'AZUL',COR:'BRANCO'})
CREATE (:SELECAO  {NOME: 'URUGUAI',COR:'AZUL',COR:'BRANCO'})

CREATE (:SELECAO  {NOME: 'FRANCA',COR:'AZUL',COR:'BRANCO', COR:'VERMELHO'})
CREATE (:SELECAO  {NOME: 'ESPANHA',COR:'VERMELHO',COR:'AMARELO'})
CREATE (:SELECAO  {NOME: 'ALEMANHA',COR:'VERMELHO',COR:'AMARELO', COR:'PRETO'})
CREATE (:SELECAO  {NOME: 'INGLATERRA',COR:'VERMELHO',COR:'BRANCO'})
CREATE (:SELECAO  {NOME: 'ITALIA',COR:'VERDE',COR:'VERMELHO',COR:'BRANCO'})

CREATE (:SELECAO  {NOME: 'EUA',COR:'AZUL',COR:'VERMELHO', COR:'BRANCO'})
CREATE (:SELECAO  {NOME: 'JAPAO',COR:'BRANCO',COR:'VERMELHO'})
CREATE (:SELECAO  {NOME: 'NIGERIA',COR:'VERDE',COR:'BRANCO'})

CREATE (:SELECAO  {NOME: 'CANADA',COR:'BRANCO',COR:'VERMELHO'})
CREATE (:SELECAO  {NOME: 'COLOMBIA',COR:'AMARELO',COR:'VERMELHO', COR:'AZUL'})

---------------------------------------------

CREATE (:SELECAO  {NOME: 'BRASIL',COR:'VERDE,AMARELO'})
CREATE (:SELECAO  {NOME: 'ARGENTINA',COR:'AZUL,BRANCO'})
CREATE (:SELECAO  {NOME: 'URUGUAI',COR:'AZUL,BRANCO'})

CREATE (:SELECAO  {NOME: 'FRANCA',COR:'AZUL,BRANCO,VERMELHO'})
CREATE (:SELECAO  {NOME: 'ESPANHA',COR:'VERMELHO,AMARELO'})
CREATE (:SELECAO  {NOME: 'ALEMANHA',COR:'VERMELHO,AMARELO,PRETO'})
CREATE (:SELECAO  {NOME: 'INGLATERRA',COR:'VERMELHO,BRANCO'})
CREATE (:SELECAO  {NOME: 'ITALIA',COR:'VERDE,VERMELHO,BRANCO'})

CREATE (:SELECAO  {NOME: 'EUA',COR:'AZUL,VERMELHO,BRANCO'})
CREATE (:SELECAO  {NOME: 'JAPAO',COR:'BRANCO,VERMELHO'})
CREATE (:SELECAO  {NOME: 'NIGERIA',COR:'VERDE,BRANCO'})

CREATE (:SELECAO  {NOME: 'CANADA',COR:'BRANCO,VERMELHO'})
CREATE (:SELECAO  {NOME: 'COLOMBIA',COR:'AMARELO,VERMELHO,AZUL'})

------------------------------------------------

MATCH (n) WHERE n.COR CONTAINS "VERMELHO" AND n.COR CONTAINS "BRANCO" RETURN (n)

MATCH (n) WHERE n.COR CONTAINS "VERDE" OR n.COR CONTAINS "ROSA" RETURN (n)

------------------------------------------------


--CRIANDO CONTINENTES

CREATE (:CONTINENTE {NOME: 'AMERICA DO SUL'})
CREATE (:CONTINENTE {NOME: 'AMERICA DO NORTE'})
CREATE (:CONTINENTE {NOME: 'EUROPA'})
CREATE (:CONTINENTE {NOME: 'AFRICA'})
CREATE (:CONTINENTE {NOME: 'ASIA'})


----------------------------------------------
--CRIANDO RELACIONAMENTO 

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'COLOMBIA' AND C.NOME='AMERICA DO SUL'
CREATE (P)-[R : PERTENCE]->(C)
RETURN P,C,R

--RELACIONAMENTO BIDIMENCIONAL

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'COLOMBIA' AND C.NOME='AMERICA DO SUL'
CREATE (P)<-[R : CONTEM]-(C)
RETURN P,C,R]

--TRAZENDO O RELACIONAMENTO 

MATCH (P: SELECAO), (C: CONTINENTE)
WHERE P.NOME = 'COLOMBIA'AND C.NOME = 'AMERICA DO SUL'
RETURN P,C

--OUTRA FORMA 

MATCH (P: SELECAO)-[R:PERTENCE]->(C: CONTINENTE)
WHERE P.NOME = 'COLOMBIA'AND C.NOME = 'AMERICA DO SUL'
RETURN P,C,R

--DELETANDO RELACIONAMENTO
MATCH (P:SELECAO)-[R:PERTENCE]->(C:CONTINENTE)
WHERE P.NOME = 'COLOMBIA' AND C.NOME='AMERICA DO SUL'
DELETE R
RETURN P,C

--MERGE (nÃO DUPLICA) (PODE COLOCAR VARIOS RELACIONAMENTOS)
MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'COLOMBIA' AND C.NOME='AMERICA DO SUL'
MERGE (P)-[R : PERTENCE]->(C)
RETURN P,C,R

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'BRASIL' AND C.NOME='AMERICA DO SUL'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S
--
MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'ARGENTINA' AND C.NOME='AMERICA DO SUL'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'URUGUAI' AND C.NOME='AMERICA DO SUL'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'ITALIA' AND C.NOME='EUROPA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'ESPANHA' AND C.NOME='EUROPA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'FRANCA' AND C.NOME='EUROPA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'ALEMANHA' AND C.NOME='EUROPA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'INGLATERRA' AND C.NOME='EUROPA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'EUA' AND C.NOME='AMERICA DO NORTE'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'CANADA' AND C.NOME='AMERICA DO NORTE'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'JAPAO' AND C.NOME='ASIA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S

MATCH (P :SELECAO), (C :CONTINENTE) WHERE P.NOME = 'NIGERIA' AND C.NOME='AFRICA'
MERGE (P)<-[R : CONTEM]-(C)
MERGE (P)-[S : PERTENCE]->(C)
RETURN P,C,R,S