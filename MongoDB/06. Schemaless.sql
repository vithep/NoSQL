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