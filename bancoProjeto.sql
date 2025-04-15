DROP DATABASE IF EXISTS proconnect;
CREATE DATABASE proconnect;
USE proconnect;

-- Tabela de usuários
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de perfis com as ideias
CREATE TABLE perfil (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    foto VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

INSERT INTO usuario(nome, email, senha) VALUE ( "Teste", "teste@gmail.com", 1234567);