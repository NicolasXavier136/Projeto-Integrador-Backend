DROP DATABASE IF EXISTS proconnect;
CREATE DATABASE proconnect;
USE proconnect;

-- Tabela de usuários
CREATE TABLE usuarios (
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
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

INSERT INTO usuarios(nome, email, senha) VALUE ( "Micael Jaison", "MicaelJaison@gmail.com", 1234567);
INSERT INTO usuarios(nome, email, senha) VALUE ( "Rodrigo Pedro", "Rodriguinho02@gmail.com", 1234567);
INSERT INTO usuarios(nome, email, senha) VALUE ( "Matheus Oliveira", "MatheusGP@gmail.com", 1234567);

INSERT INTO perfil(id_usuario, titulo, descricao, foto) VALUE (1, "Eu gostaria da criação de um site para meu mercado.", "Especificações do site: Design Responsivo,Catálogo de Produtos,Sistema de Busca,Carrinho de Compras,Cadastro de Usúario.", "FOTO");
INSERT INTO perfil(id_usuario, titulo, descricao, foto) VALUE (2, "Olá eu gostaria da criação de um site para a exportação de grãos.", "Design Responsivo,Catálogo de Produtos,Sistema de Busca,Informações sobre Exportação, Cotações e Preços,Área do Cliente,Segurança: Implementação de protocolos de segurança,ntegração com Sistemas de Logística.", "FOTO");
INSERT INTO perfil(id_usuario, titulo, descricao, foto) VALUE (3, "Oi eu quero a criação de um site para minha loja de material de construção", "Design Limpo e Intuitivo,Página Inicial,Catálogo de Produtos,Página de Produto,Carrinho de Compras,Opções de Pagamento,Contato e Suporte,Localização da Loja,Blog ou Dicas,Integração com Redes Sociais,SEO Básico,Responsividade", "FOTO");