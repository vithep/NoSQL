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