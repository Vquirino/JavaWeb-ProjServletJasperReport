drop database if exists aula;
create database aula;
use aula;

create table curso(
    idcurso     integer         auto_increment      primary key,
    nome        varchar(35)     not null,
    descricao   text            not null
);

create table professor(
    idprofessor integer         auto_increment      primary key,
    nome        varchar(35)     not null,
    email       varchar(35)     not null
);

create table turma(
    idturma     integer         auto_increment      primary key,
    descricao   varchar(35)     not null,
    datainicio  date            not null,
    idprofessor integer         not null,
    idcurso     integer         not null,
    foreign key (idprofessor) references professor(idprofessor),
    foreign key (idcurso) references curso(idcurso)
);

insert into curso (nome, descricao) values ('Java Developer', 'Java Web e Frameworks');
insert into curso (nome, descricao) values ('.Net', 'CSharp e Asp .Net');

insert into professor (nome, email) values ('Sergio Mendes', 'sergio.coti@gmail.com');
insert into professor (nome, email) values ('Edson Belem', 'belem@gmail.com');

insert into turma values (null, 'Turma intensivo', '2010-11-02',2,1);
insert into turma values (null, 'Developer Microsoft', '2010-12-02',1,2);
insert into turma values (null, 'Turma noite', '2010-01-10',2,1);

select * from curso;
select * from professor;
select * from turma;

#=======================================================================================

#VIEW

create view relatorio as
select
    t.idturma,
    t.descricao as turma,
    date_format(t.datainicio, '%W %d %M %Y') as datainicio,
    c.nome as curso,
    c.descricao,
    p.nome as professor,
    p.email
from turma t
inner join professor p
on t.idprofessor = p.idprofessor
inner join curso c 
on t.idcurso = c.idcurso;

select * from relatorio;

#=======================================================================================

create table aluno(
    idaluno         integer         primary key,
    nome            varchar(35)     not null,
    idade           integer         not null
);

create table alunobackup(
    idaluno         integer,
    nome            varchar(35),
    idade           integer
);

insert into aluno values (1, 'Fernanda', 20);
insert into aluno values (2, 'Ary', 25);
insert into aluno values (3, 'Mais Velho', 23);
insert into aluno values (4, 'Sr Flandes', 20);

select * from aluno;

#=======================================================================================

#Alterar o delimiter do MySQL

delimiter $

#=======================================================================================

# TRIGGER (Gatilho)

create trigger backup
before delete on aluno
for each row
begin
    declare     vidaluno    integer;
    declare     vnome       varchar(35);
    declare     vidade      integer;

    set vidaluno = old.idaluno;
    set vnome = old.nome;
    set vidade = old.idade;

insert into alunobackup values (vidaluno, vnome, vidade);
end
$

delete from aluno where idaluno = 1$

select * from aluno$
select * from alunobackup$

#=======================================================================================

create procedure obterdados (nome varchar(35))
begin
    select * from relatorio where professor = nome;
end
$

call obterdados ('Sergio Mendes')$
call obterdados ('Edson Belem')$

#=======================================================================================

#Exportar daddos da tabela

select
    t.idturma,
    t.descricao as turma,
    date_format (t.datainicio, '%W %d %M %Y') as datainicio,
    c.nome as curso,
    c.descricao,
    p.nome as professor,
    p.email
into outfile 'c:/relatorio.txt'
fields terminated by ';'
lines terminated by '\n'
from turma t
inner join professor p
on t.idprofessor = p.idprofessor
inner join curso c
on t.idcurso = c.idcurso$