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
