-- criação do banco de dados
create database senai_tech;

-- ativação do banco de dados
use senai_tech;

--
create table departamentos (
	id int,
    nome varchar(60),
    primary key (id)
);

create table funcionarios (
	id int,
    nome varchar(60),
    sobrenome varchar(60),
    salario decimal(10,2),
    id_departamento int,
    foreign key(id_departamento) references departamentos(id)
);

drop table depatamentos;

-- Liste nome, sobrenome e nome do departamento dos funcionários
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento FROM Funcionarios
JOIN Departamentos ON f.id_departamento = Departamentos.id;
    
-- Liste nome, sobrenome e nome do departamento
-- dos funcionários do departamentos de TI
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento FROM Funcionarios f
JOIN Departamentos d ON f.id_departamento = D.id where d.nome='TI';

-- Liste nome, sobrenome e nome do departamento dos funcionários do
-- departamentos de TI ordenado pelo nome
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento FROM Funcionarios f
JOIN Departamentos d ON f.id_departamento = D.id where d.nome='TI'order by nome;

-- Liste nome, sobrenome, salario e nome do departamento dos
-- funcionários do departamentos de TI que recebem acima de 5000 ordenado pelo nome
select f.nome, f.sobrenome, f.salario, d.nome as nome_departamento from funcionarios f 
inner join departamentos d on f.id_departamento = d.id 
where d.nome ='TI' and f.salario > 5000 order by f.nome; 

-- Calcular a média salarial dos funcionários em cada departamento
select d.nome as nome_departamento, avg(f.salario) as media_salarios from funcionarios f
inner join departamentos d on f.id_departamento = d.id group by d.id, d.nome;

-- funcionários que pertencem ao departamento "TI"
select concat(f.nome, '', f.sobrenome) as nome_completo from funcionarios f
inner join departamentos d on f.id_departamento = d.id where d.nome = 'TI';

-- Calcular a soma total dos salários de todos os funcionários
-- no departamento de "Recursos Humanos"
select sum(salario) as soma_total_salarios from funcionarios where 
id_departamento = (select id from departamentos where nome = 'Recursos Humanos');

-- Contar quantos funcionários cada departamento possui
select d.nome, count(*) as numero_funcionarios from funcionarios f 
inner join departamentos d on f.id_departamento = d.id group by d.id; 

-- Listar os funcionários que ganham mais de 7000 em ordem alfabética
SELECT f.nome, f.sobrenome,f.salario, d.nome AS nome_departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE  f.salario > 7000 
order by f.nome;

-- Mostrar o nome do departamento e a média de salário dos funcionários de cada departamento
select d.nome, avg(f.salario) as media_salarial from funcionarios f 
inner join departamentos d on f.id_departamento = d.id group by d.id;

-- Mostrar os funcionários que têm sobrenome “Matisse" e seus respectivos departamentos
select concat(f.nome, '', f.sobrenome) as nome_completo from funcionarios f
inner join departamentos d on f.id_departamento = d.id where f.sobrenome = 'matisse';