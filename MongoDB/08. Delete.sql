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
