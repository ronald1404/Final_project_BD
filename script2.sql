CREATE TABLE Universidade (
    id_universidade INTEGER PRIMARY KEY,
    nome VARCHAR2(50),
    cep VARCHAR2(8),
    rua VARCHAR2(20),
    bairro VARCHAR2(20),
    numero VARCHAR2(5)
);

CREATE TABLE Resultado (
    id_resultado INTEGER PRIMARY KEY,
    pontuacao_total INTEGER
);

CREATE TABLE Grupo (
    id_grupo INTEGER PRIMARY KEY,
    id_universidade INTEGER REFERENCES Universidade(id_universidade),
    id_resultado INTEGER REFERENCES Resultado(id_resultado),
    nome VARCHAR2(20)
);

CREATE TABLE Inscrito (
    id_inscrito INTEGER PRIMARY KEY,
    id_grupo INTEGER REFERENCES Grupo(id_grupo),
    nome VARCHAR2(50),
    email VARCHAR2(30),
    telefone VARCHAR2(14)
);

CREATE TABLE Professor (
    Id_professor INTEGER PRIMARY KEY,
    id_grupo INTEGER REFERENCES Grupo(id_grupo),
    nome VARCHAR2(50),
    email VARCHAR2(30),
    telefone VARCHAR2(14)
);

CREATE TABLE Orientador (
    cod_orientador INTEGER PRIMARY KEY,
    id_professor INTEGER REFERENCES Professor(Id_professor)
);

CREATE TABLE Aplicador (
    id_aplicador INTEGER PRIMARY KEY,
    id_universidade INTEGER REFERENCES Universidade(id_universidade),
    nome VARCHAR2(50),
    email VARCHAR2(30),
    telefone VARCHAR2(14)
);

CREATE TABLE Juiz (
    id_juiz INTEGER PRIMARY KEY,
    nome VARCHAR2(50),
    email VARCHAR2(30),
    telefone VARCHAR2(14)
);

CREATE TABLE Desafio (
    id_desafio INTEGER PRIMARY KEY,
    id_resultado INTEGER REFERENCES Resultado(id_resultado),
    pontuacao INTEGER,
    nome VARCHAR2(50),
    descricao VARCHAR2(500),
    nivel_dificuldade INTEGER
);

CREATE TABLE aplicador_por (
    id_desafio INTEGER REFERENCES Desafio(id_desafio),
    id_aplicador INTEGER REFERENCES Aplicador(id_aplicador),
    PRIMARY KEY (id_desafio, id_aplicador)
);

CREATE TABLE juiz_avalia (
    id_juiz INTEGER REFERENCES Juiz(id_juiz),
    id_desafio INTEGER REFERENCES Desafio(id_desafio),
    PRIMARY KEY (id_juiz, id_desafio)
);

INSERT INTO Universidade (id_universidade, nome, cep, rua, bairro, numero)
VALUES (1, 'Universidade Federal do Pará', '66075110', 'Av. Augusto Corrêa', 'Guamá', '1');

INSERT INTO Resultado (id_resultado, pontuacao_total)
VALUES (1, 0);

INSERT INTO Grupo (id_grupo, id_universidade, id_resultado, nome)
VALUES (1, 1, 1, 'Grupo de Estudo');

INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (1, 1, 'Ronald', 'ronald@example.com', '123456789');

INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (2, 1, 'Sainy', 'sainy@example.com', '987654321');

INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (3, 1, 'Gabriel', 'gabriel@example.com', '456789123');

INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (4, 1, 'Erick', 'erick@example.com', '789123456');

INSERT INTO Inscrito (id_inscrito, id_grupo, nome, email, telefone)
VALUES (5, 1, 'Rodrigues', 'rodrigues@example.com', '321654987');

INSERT INTO Professor (Id_professor, id_grupo, nome, email, telefone)
VALUES (1, 1, 'Fabiola', 'fabiola@example.com', '987654321');

INSERT INTO Juiz (id_juiz, nome, email, telefone)
VALUES (1, 'Vinicius de Abreu', 'vinicius@example.com', '111111111');

INSERT INTO Juiz (id_juiz, nome, email, telefone)
VALUES (2, 'Victor Hugo', 'victor@example.com', '222222222');

INSERT INTO Desafio (id_desafio, id_resultado, pontuacao, nome, descricao, nivel_dificuldade)
VALUES (1, NULL, 10, 'Desafio 1', 'Descrição do Desafio 1', 1);

INSERT INTO Desafio (id_desafio, id_resultado, pontuacao, nome, descricao, nivel_dificuldade)
VALUES (2, NULL, 10, 'Desafio 2', 'Descrição do Desafio 2', 1);

INSERT INTO Desafio (id_desafio, id_resultado, pontuacao, nome, descricao, nivel_dificuldade)
VALUES (3, NULL, 15, 'Desafio 3', 'Descrição do Desafio 3', 2);

INSERT INTO Desafio (id_desafio, id_resultado, pontuacao, nome, descricao, nivel_dificuldade)
VALUES (4, NULL, 15, 'Desafio 4', 'Descrição do Desafio 4', 2);

INSERT INTO Desafio (id_desafio, id_resultado, pontuacao, nome, descricao, nivel_dificuldade)
VALUES (5, NULL, 20, 'Desafio 5', 'Descrição do Desafio 5', 3);

INSERT INTO Aplicador (id_aplicador, id_universidade, nome, email, telefone)
VALUES (1, 1, 'Claudomiro Sales', 'claudomiro@example.com', '333333333');

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (1, 1);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (1, 3);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (1, 4);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (1, 5);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (2, 1);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (2, 2);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (2, 3);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (2, 4);

INSERT INTO juiz_avalia (id_juiz, id_desafio)
VALUES (2, 5);


select * from universidade;
select * from grupo;
select * from inscrito;
select * from professor;
select * from resultado;
select * from desafio;
select * from juiz;
select * from aplicador;
