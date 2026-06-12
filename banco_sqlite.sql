CREATE TABLE IF NOT EXISTS categorias (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    nome       VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS produtos (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria_id   INTEGER,
    nome           VARCHAR(150) NOT NULL,
    codigo         VARCHAR(50) UNIQUE,
    preco          REAL NOT NULL,
    estoque        INTEGER DEFAULT 0,
    estoque_minimo INTEGER DEFAULT 5,
    ativo          INTEGER DEFAULT 1,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE IF NOT EXISTS clientes (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    nome       VARCHAR(150) NOT NULL,
    cpf        VARCHAR(14),
    cnpj       VARCHAR(18),
    email      VARCHAR(150),
    telefone   VARCHAR(20),
    cep        VARCHAR(9),
    logradouro VARCHAR(200),
    numero     VARCHAR(10),
    bairro     VARCHAR(100),
    cidade     VARCHAR(100),
    uf         CHAR(2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS caixas (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    data_abertura    DATETIME NOT NULL,
    data_fechamento  DATETIME,
    valor_inicial    REAL DEFAULT 0,
    valor_final      REAL,
    status           VARCHAR(10) DEFAULT 'aberto'
);

CREATE TABLE IF NOT EXISTS vendas (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    caixa_id         INTEGER,
    cliente_id       INTEGER,
    subtotal         REAL NOT NULL,
    desconto         REAL DEFAULT 0,
    total            REAL NOT NULL,
    forma_pagamento  VARCHAR(20) NOT NULL,
    status           VARCHAR(15) DEFAULT 'concluida',
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (caixa_id) REFERENCES caixas(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE IF NOT EXISTS venda_itens (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id        INTEGER NOT NULL,
    produto_id      INTEGER NOT NULL,
    quantidade      INTEGER NOT NULL,
    preco_unitario  REAL NOT NULL,
    subtotal        REAL NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE IF NOT EXISTS usuarios (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE,
    senha      VARCHAR(255) NOT NULL,
    perfil     VARCHAR(20) NOT NULL DEFAULT 'operador',
    ativo      INTEGER DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS login_attempts (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    ip         VARCHAR(45) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_ip_created ON login_attempts (ip, created_at);

-- Dados iniciais
INSERT INTO categorias (nome) VALUES ('Alimentos'),('Bebidas'),('Limpeza'),('Higiene'),('Eletrônicos');

INSERT INTO produtos (categoria_id, nome, codigo, preco, estoque, estoque_minimo) VALUES
(1, 'Arroz 5kg',          'ARR001', 22.90, 50, 10),
(1, 'Feijão 1kg',         'FEI001',  8.50, 40, 10),
(1, 'Macarrão 500g',      'MAC001',  4.90, 60, 10),
(2, 'Água Mineral 500ml', 'AGU001',  2.00,100, 20),
(2, 'Refrigerante 2L',    'REF001',  9.90, 30,  5),
(2, 'Suco de Laranja 1L', 'SUC001',  7.50, 25,  5),
(3, 'Detergente 500ml',   'DET001',  3.50, 60, 10),
(3, 'Sabão em Pó 1kg',    'SAP001',  8.90, 35, 10),
(4, 'Sabonete',           'SAB001',  2.90, 80, 15),
(4, 'Shampoo 400ml',      'SHA001', 12.90, 40, 10);

INSERT INTO clientes (nome, cpf, email, telefone) VALUES
('João Silva',  '111.222.333-44', 'joao@email.com',   '(11) 99999-0001'),
('Maria Souza', '222.333.444-55', 'maria@email.com',  '(11) 99999-0002'),
('Carlos Lima', '333.444.555-66', 'carlos@email.com', '(11) 99999-0003');

INSERT INTO usuarios (nome, email, senha, perfil) VALUES
('Administrador', 'admin@pdv.com', '$2y$12$8usbO.d06EUO1njl1qC.f.QG42w69.fxzZ6M1UU5w21duPmCq3dhy', 'admin');
