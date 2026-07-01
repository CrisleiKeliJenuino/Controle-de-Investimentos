CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

CREATE TABLE ativos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    ticker VARCHAR(20) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    quantidade DECIMAL(15,2) DEFAULT 0,
    preco_medio DECIMAL(15,2) DEFAULT 0,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE movimentacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ativo_id INT NOT NULL,
    data_mov DATE NOT NULL,
    tipo_mov VARCHAR(20) NOT NULL,
    quantidade DECIMAL(15,2) DEFAULT 0,
    preco DECIMAL(15,2) DEFAULT 0,
    CHECK (tipo_mov IN ('COMPRA', 'VENDA')),
    FOREIGN KEY (ativo_id) REFERENCES ativos(id)
);

CREATE TABLE dividendos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ativo_id INT NOT NULL,
    data_pagto DATE NOT NULL,
    valor DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (ativo_id) REFERENCES ativos(id)
);

CREATE TABLE metas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nome VARCHAR(100),
    valor_meta DECIMAL(15,2) NOT NULL,
    valor_atual DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);