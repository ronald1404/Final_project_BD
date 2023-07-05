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
    resultado number(4),
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
    constraint fk_inscrito_grupo
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
    constraint fk_professor_grupo
    foreign key (id_grupo)
    references Grupo(id_grupo)
);
create table Aplicador_1 (
    id_aplicador number not null,
    nome varchar2(50) not null,
    email varchar2(50),
    telefone varchar2(12),
    constraint pk_aplicador_1 primary key (id_aplicador)
);

create table Aplicador (
    id_aplicador number not null,
    id_universidade number not null,
    constraint pk_aplicador primary key (id_aplicador, id_universidade),
    constraint fk_aplicador_universidade foreign key (id_universidade) references Universidade(id_universidade),
    constraint fk_aplicador_aplicador_1 foreign key (id_aplicador) references Aplicador_1(id_aplicador)
);
create table Juiz(
    id_juiz number not null,
    nome varchar2(50) not null,
    email varchar2(50),
    telefone varchar2(12),    
    constraints pk_Juiz primary key (id_juiz)    
);
create table Nivel_Dificuldade(
    id_nivel_dificuldade number not null,
    pontos_nivel number(4),
    dificuldade varchar2(10),
    constraints pk_nivel_dificuldade primary key (id_nivel_dificuldade)
);
create table Desafio(
    id_desafio number not null,
    id_nivel_dificuldadade number not null,
    nome varchar2(50),
    descricao varchar2(500),
    constraints pk_desafio primary key (id_desafio),
    constraints fk_desafio_nivel_dificuldade
    foreign key (id_nivel_dificuldadade)
    references Nivel_Dificuldade(id_nivel_dificuldade)
);
create table Grupo_Participa_desafio(
    id_grupo number not null,
    id_desafio number not null,
    constraints pk_Grupo_Participa_desafio primary key(id_grupo,id_desafio),
    constraints fk_Grupo_Participa_desafio_grupo foreign key(id_grupo) references Grupo(id_grupo),
    constraints fk_Grupo_Participa_desafio_desafio foreign key (id_desafio) references Desafio (id_desafio)
);

create table juiz_avalia(
    id_juiz number not null,
    id_desafio number not null,
    nota number(2),
    constraints pk_juiz_avalia primary key(id_juiz,id_desafio),
    constraints fk_juiz_avalia_juiz foreign key(id_juiz) references Juiz(id_juiz),
    constraints fk_juiz_avalia_desafio foreign key (id_desafio) references Desafio (id_desafio)
);

create table Aplicado_por(    
    id_desafio number not null,
    id_aplicador number not null,
    id_universidade number not null,
    constraints pk_Aplicado_por primary key (id_desafio,id_aplicador,id_universidade),
    constraints fk_Aplicado_por_desafio foreign key(id_desafio) references Desafio(id_desafio),
    constraints fk_Aplicado_por_aplicador foreign key (id_aplicador,id_universidade) references Aplicador(id_aplicador,id_universidade)
);
-- Inserindo Universidade A
INSERT INTO Universidade (id_universidade, nome, cep, rua, bairro, numero)
VALUES (1, 'Universidade A', '11111111', 'Av. A', 'Bairro A', '1');

-- Inserindo Universidade B
INSERT INTO Universidade (id_universidade, nome, cep, rua, bairro, numero)
VALUES (2, 'Universidade B', '22222222', 'Av. B', 'Bairro B', '2');

-- Inserindo Universidade C
INSERT INTO Universidade (id_universidade, nome, cep, rua, bairro, numero)
VALUES (3, 'Universidade C', '33333333', 'Av. C', 'Bairro C', '3');

-- Inserindo Universidade D
INSERT INTO Universidade (id_universidade, nome, cep, rua, bairro, numero)
VALUES (4, 'Universidade D', '44444444', 'Av. D', 'Bairro D', '4');

-- Inserindo Universidade E
INSERT INTO Universidade (id_universidade, nome, cep, rua, bairro, numero)
VALUES (5, 'Universidade E', '55555555', 'Av. E', 'Bairro E', '5');


-- Inserindo Grupo A
INSERT INTO Grupo (id_grupo, id_universidade, resultado, nome)
VALUES (202301, 1, 1, 'Grupo A');

-- Inserindo Grupo B
INSERT INTO Grupo (id_grupo, id_universidade, resultado, nome)
VALUES (202302, 2, 2, 'Grupo B');

-- Inserindo Grupo C
INSERT INTO Grupo (id_grupo, id_universidade, resultado, nome)
VALUES (202303, 3, 3, 'Grupo C');

-- Inserindo Grupo D
INSERT INTO Grupo (id_grupo, id_universidade, resultado, nome)
VALUES (202304, 4, 4, 'Grupo D');

-- Inserindo Grupo E
INSERT INTO Grupo (id_grupo, id_universidade, resultado, nome)
VALUES (202305, 5, 5, 'Grupo E');
-- Inserindo os 25 inscritos nos grupos
-- Substitua <id_grupo> pelos IDs corretos de cada grupo

-- Inscritos para o Grupo 1
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (1, 202301, 'Inscrito 1', 'inscrito1@example.com', '1111111111');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (2, 202301, 'Inscrito 2', 'inscrito2@example.com', '2222222222');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (3, 202301, 'Inscrito 3', 'inscrito3@example.com', '3333333333');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (4, 202301, 'Inscrito 4', 'inscrito4@example.com', '4444444444');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (5, 202301, 'Inscrito 5', 'inscrito5@example.com', '5555555555');

-- Inscritos para o Grupo 2
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (6, 202302, 'Inscrito 6', 'inscrito6@example.com', '6666666666');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (7, 202302, 'Inscrito 7', 'inscrito7@example.com', '7777777777');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (8, 202302, 'Inscrito 8', 'inscrito8@example.com', '8888888888');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (9, 202302, 'Inscrito 9', 'inscrito9@example.com', '9999999999');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (10, 202302, 'Inscrito 10', 'inscrito10@example.com', '1010101010');

-- Inscritos para o Grupo 3
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (11, 202303, 'Inscrito 11', 'inscrito11@example.com', '11111111111');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (12, 202303, 'Inscrito 12', 'inscrito12@example.com', '1212121212');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (13, 202303, 'Inscrito 13', 'inscrito13@example.com', '1313131313');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (14, 202303, 'Inscrito 14', 'inscrito14@example.com', '1414141414');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (15, 202303, 'Inscrito 15', 'inscrito15@example.com', '1515151515');

-- Inscritos para o Grupo 4
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (16, 202304, 'Inscrito 16', 'inscrito16@example.com', '1616161616');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (17, 202304, 'Inscrito 17', 'inscrito17@example.com', '1717171717');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (18, 202304, 'Inscrito 18', 'inscrito18@example.com', '1818181818');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (19, 202304, 'Inscrito 19', 'inscrito19@example.com', '1919191919');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (20, 202304, 'Inscrito 20', 'inscrito20@example.com', '2020202020');

-- Inscritos para o Grupo 5
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (21,202305, 'Inscrito 21', 'inscrito21@example.com', '2121212121');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (22,202305, 'Inscrito 22', 'inscrito22@example.com', '2222222222');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (23,202305, 'Inscrito 23', 'inscrito23@example.com', '2323232323');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (24,202305, 'Inscrito 24', 'inscrito24@example.com', '2424242424');
INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (25,202305, 'Inscrito 25', 'inscrito25@example.com', '2525252525');

select * from Universidade;
select * from Grupo;
select * from Inscrito;