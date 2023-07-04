create table Universidade(
    id_universidade number not null,
    nome varchar2(50) not null,
    cep varchar(8),
    rua varchar(30),
    bairro varchar(20),
    numero varchar(5),
    constraint pk_universidade primary key (id_universidade)
);
create table Grupo(
    id_grupo number not null,
    id_universidade number not null,
    nome varchar2(50) not null,
    cep varchar(8),
    rua varchar(30),
    bairro varchar(20),
    numero varchar(5),
    constraint pk_grupo primary key(id_grupo),
    constraint fk_universidade_grupo
    foreign key (id_universidade)
    references Universidade(id_universidade)
);
create table Inscrito(
    id_inscrito number not null,
    id_grupo number not null,
    nome varchar2(50) not null,
    email varchar(50),
    telefone varchar(14),
    constraint pk_inscrito primary key(id_inscrito),
    constraint fk_grupo_inscrito
    foreign key (id_grupo)
    references Grupo(id_grupo)
);
create table Professor(
    id_professor number not null,
    id_grupo number not null,
    nome varchar2(50) not null,
    email varchar(50),
    telefone varchar(14),
    constraint pk_professor primary key(id_professor),
    constraint fk_grupo_professor
    foreign key (id_grupo)
    references Grupo(id_grupo)
);
create table Desafio (
    id_desafio number not null,
    nome varchar2(50),
    descricao varchar2(500),
    nivel_dificuldade number(2),
    constraint pk_desafio primary key (id_desafio)
);
