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