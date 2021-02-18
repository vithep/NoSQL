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
