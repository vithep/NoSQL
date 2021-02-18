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