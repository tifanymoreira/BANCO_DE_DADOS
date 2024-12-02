-----------------------------------------------------------------------------------
-- Prova P2 - 2024
-- Prova P2 - ALUNOS.sql
-- Solução da Prova P2
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- Disciplina: Banco de Dados 2 (CJOBDD2)
-- Nome do aluno: Tifany Luiza de Jesus Moreira
-- Data da prova: 02/12/2024
-----------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
-- PARTE A: CRIAÇÃO DO BANCO DE DADOS E DAS TABELAS QUE SERÃO UTILIZADAS
-----------------------------------------------------------------------------------


-- * Instruções: Execute os comandos abaixo para criar o banco de dados.


USE master;
GO


-- Cria o banco de dados LOJAMARIA
CREATE DATABASE LOJAMARIA;
GO


-- Habilita o contexto do banco de dados
USE LOJAMARIA;
GO


-- 2. Instruções: Execute os comandos abaixo para criar as tabelas


-- Cria a tabela CLIENTES
CREATE TABLE CLIENTES (
    CodigoCliente SMALLINT PRIMARY KEY,
    NomeCliente   CHAR(20),
    Endereco      CHAR(35),
    Cidade        CHAR(15),
    Cep           CHAR(8),
    UF            CHAR(2),
    CNPJ          CHAR(20),
    IE            CHAR(20)
);
GO


-- Cria a tabela VENDEDORES
CREATE TABLE VENDEDORES (
    CodigoVendedor SMALLINT PRIMARY KEY,
    NomeVendedor   CHAR(20),
    Salario        MONEY,
    FaixaComissao  CHAR(1)
);
GO


-- Cria a tabela PEDIDOS
CREATE TABLE PEDIDOS (
    NumeroPedido   INT PRIMARY KEY,
    PrazoEntrega   SMALLINT NOT NULL,
    CodigoCliente  SMALLINT NOT NULL,
    CodigoVendedor SMALLINT NOT NULL,
    FOREIGN KEY (CodigoCliente)  REFERENCES CLIENTES (CodigoCliente),
    FOREIGN KEY (CodigoVendedor) REFERENCES VENDEDORES (CodigoVendedor)
);
GO


-- Cria a tabela PRODUTOS
CREATE TABLE PRODUTOS (
    CodigoProduto    SMALLINT PRIMARY KEY,
    DescricaoProduto CHAR(30),
    UnidadeProduto   CHAR(3),
    ValorUnitario    MONEY
);
GO


-- Cria a tabela ITEM_DE_PEDIDO
CREATE TABLE ITEM_DE_PEDIDO (
    NumeroPedido  INT NOT NULL,
    CodigoProduto SMALLINT NOT NULL,
    Quantidade    INT,
    PRIMARY KEY (NumeroPedido, CodigoProduto),
    FOREIGN KEY (NumeroPedido)  REFERENCES PEDIDOS (NumeroPedido),
    FOREIGN KEY (CodigoProduto) REFERENCES PRODUTOS (CodigoProduto)
);
GO


-----------------------------------------------------------------------------------
-- PARTE B: INSERÇÃO DOS DADOS NAS TABELAS
-----------------------------------------------------------------------------------


-- * Instruções: Execute os comandos abaixo para inserir os dados nas tabelas.


--  Insere os clientes 
INSERT INTO CLIENTES VALUES 
    (720, 'Ana', 'Rua 17, n. 19', 'Niterói', '24358310', 'RJ', '12113231/0001-34', '2134'),
    (870, 'Flávio', 'Av. Pres. Vargas, n. 10', 'São Paulo', '22763931', 'SP', '22534126/9387-9', '4631'), 
    (110, 'Jorge', 'Rua Caiapo, n. 13', 'Curitiba', '30078500', 'PR', '14512764/9834-9', null), 
    (222, 'Lúcia', 'Rua Itabira 123, Loja 9', 'Belo Horizonte', '22124391', 'MG', '28315213/9348-8', '2985'),
    (830, 'Maurício', 'Av. Paulista 1236, sl/2345', 'São Paulo', '3012683', 'SP', '32816985/7465-6', '9343'), 
    (130, 'Edmar', 'Rua da Praia s/n', 'Salvador', '30079300', 'BA', '23463284/234-9', '7121'), 
    (410, 'Rodolfo', 'Largo da Lapa 27, sobrado', 'Rio de Janeiro', '30078900', 'RJ', '12835128/2346-9', '7431'), 
    (20, 'Beth', 'Av. Climério, n. 45', 'São Paulo', '25679300', 'SP', '32485126/7326-8', '9280'), 
    (157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', null, 'PR', '32848223/324-2', '1923'), 
    (180, 'Lívio', 'Av. Beira Mar, n. 1256', 'Florianópolis', '30077500', 'SC', '12736571/2347-4', null), 
    (260, 'Susana', 'Rua Lopes Mendes, n. 12', 'Niterói', '30046500', 'RJ', '21763571/232-9', '2530'),
    (290, 'Renato', 'Rua Meireles, n. 123, bl. 2 sl. 345', 'São Paulo', '30225900', 'SP', '13276571/1231-4', '1820'), 
    (390, 'Sebastião', 'Rua da Igreja, n. 10', 'Uberaba', '30438700', 'MG', '32176547/213-3', '9071'), 
    (234, 'José', 'Quadra 3 bl. 3 sl. 1003', 'Brasília', '22841650', 'DF', '21763576/1232-3', '2931');
GO


SELECT * FROM CLIENTES;
GO


--  Insere os vendedores
INSERT INTO VENDEDORES VALUES 
    (209, 'José', 1800.00,'C'),
    (111, 'Carlos', 2490.00, 'A'),
    (11, 'João', 2780.00, 'C'),
    (240, 'Antônio', 9500.00, 'C'),
    (720, 'Felipe', 4600.00, 'A'),
    (213, 'Jonas', 2300.00, 'A'),
    (101, 'João', 2650.00, 'C'),
    (310, 'Josias', 870, 'B'),
    (250, 'Maurício', 2930.00, 'B');
GO


SELECT * FROM VENDEDORES;
GO


--  Insere os produtos
INSERT INTO PRODUTOS VALUES 
    (25, 'Queijo','Kg', 0.97),
    (31, 'Chocolate','BAR', 0.87),
    (78, 'Vinho','L', 2.00),
    (22, 'Linho','M', 0.11),
    (30, 'Açúcar','SAC', 0.30),
    (53, 'Linha','M', 1.80),
    (13, 'Ouro','G', 6.18),
    (45, 'Madeira','M', 0.25),
    (87, 'Cano','M', 1.97),
    (77, 'Papel','M', 1.05);
GO


SELECT * FROM PRODUTOS;
GO


--  Insere os pedidos
INSERT INTO PEDIDOS VALUES 
    (121, 20, 410, 209),
    (97, 20, 720, 101),
    (101, 15, 720, 101),
    (137, 20, 720, 720),
    (148, 20, 720, 101),
    (189, 15, 870, 213),
    (104, 30, 110, 101),
    (203, 30, 830, 250),
    (98, 20, 410, 209),
    (143, 30, 20, 111),
    (105, 15, 180, 240),
    (111, 20, 260, 240),
    (103, 20, 260, 11),
    (91, 20, 260, 11),
    (138, 20, 260, 11),
    (108, 15, 290, 310),
    (119, 30, 390, 250),
    (127, 10, 410, 11);
GO


SELECT * FROM PEDIDOS;
GO


--  Insere os itens de pedido
INSERT INTO ITEM_DE_PEDIDO VALUES 
    (121, 25, 10),
    (121, 31, 35),
    (97, 77, 20),
    (101, 31, 9),
    (101, 78, 18),
    (101, 13, 5),
    (98, 77, 5),
    (148, 45, 8),
    (148, 31, 7),
    (148, 77, 3),
    (148, 25, 10),
    (148, 78, 30),
    (104, 53, 32),
    (203, 31, 6),
    (189, 78, 45),
    (143, 31, 20),
    (143, 78, 10),
    (105, 78, 10),
    (111, 25, 10),
    (111, 78, 70),
    (103, 53, 37),
    (91, 77, 40),
    (138, 22, 10),
    (138, 77, 35),
    (138, 53, 18),
    (108, 13, 17),
    (119, 77, 40),
    (119, 13, 6),
    (119, 22, 10),
    (119, 53, 43),
    (137, 13, 8);
GO


SELECT * FROM ITEM_DE_PEDIDO;
GO


-----------------------------------------------------------------------------------
-- PARTE C: CONSULTAS
-----------------------------------------------------------------------------------


-- * Instruções: Escreva os códigos SQL para realizar as consultas abaixo.


-- 1. Liste o nome e a data da criação das tabelas que foram criadas. 
-- Utilize aliases para exibir o nome das colunas.(0.5 ponto)

SELECT 
    name        AS 'Nome Da Tabela',
    create_date AS 'Data De Criação'
FROM 
    sys.tables;
GO

-- 2. Liste o código, nome, endereço, cidade e estado dos clientes. Exiba as 
-- informações somente dos clientes que forem do estado de São Paulo ou de Santa 
-- Catarina. Utilize aliases para exibir o nome das colunas. (1.0 ponto)

SELECT 
    CodigoCliente AS 'Código',
    NomeCliente   AS 'Nome',
    Endereco      AS 'Endereço',
    Cidade        AS 'Cidade',
    UF            AS 'Estado'
FROM 
    CLIENTES
WHERE 
    UF IN ('SP', 'SC');
GO


-- 3. Liste o valor do maior e do menor preço para dos produtos armazenados no 
-- banco de dados. Utilize aliases para exibir o nome das colunas. (1.0 ponto)

SELECT 
    MAX(ValorUnitario) AS 'Maior Preço',
    MIN(ValorUnitario) AS 'Menor Preço'
FROM 
    PRODUTOS;
GO

-- 4. Listar o número do pedido, o código do produto e a quantidade dos itens do 
-- pedido com a quantidade igual a 35 da tabela ITEM_DE_PEDIDO. Utilize aliases 
-- para exibir o nome das colunas. (1.0 ponto)

SELECT 
    NumeroPedido  AS 'Número do Pedido',
    CodigoProduto AS 'Código do Produto',
    Quantidade    AS 'Quantidade'
FROM 
    ITEM_DE_PEDIDO
WHERE 
    Quantidade = 35;
GO

-- 5. Listar o código, nome e salário dos vendedores cujo nome comece com A, C, 
-- F ou M. Ordene o resultado pelo nome do vendedor. Utilize aliases para exibir 
-- o nome das colunas. (1.0 ponto)

SELECT 
    CodigoVendedor AS 'Código', 
    NomeVendedor   AS 'Nome', 
    Salario        AS 'Salário'
FROM 
    VENDEDORES
WHERE 
    NomeVendedor    LIKE 'A%' 
    OR NomeVendedor LIKE 'C%' 
    OR NomeVendedor LIKE 'F%' 
    OR NomeVendedor LIKE 'M%'
ORDER BY 
    NomeVendedor;
GO

-- 6. Listar todos os dados dos clientes que não tenham número de inscrição 
-- estadual (IE). (1.0 ponto)

SELECT * 
FROM CLIENTES
WHERE IE IS NULL;
GO

-- 7. Exibir o número do pedido, a quantidade total de produtos diferentes que 
-- existem em cada pedido e o total geral de itens que existem em cada pedido.
-- Utilize aliases para exibir o nome das colunas. (1.0 ponto)

SELECT 
    NumeroPedido         AS 'Número do Pedido',
    COUNT(CodigoProduto) AS 'Produtos Diferentes',
    SUM(Quantidade)      AS 'Total de Itens'
FROM 
    ITEM_DE_PEDIDO
GROUP BY 
    NumeroPedido
ORDER BY 
    NumeroPedido;
GO

-- 8. Exibir o código, nome, salário e média salarial dos vendedores. Exibir
-- somente as informações dos vendedores que ganham acima da média salarial.
-- Utilize aliases para exibir o nome das colunas. (1.5 pontos)

SELECT 
    CodigoVendedor                        AS 'Código do Vendedor',
    NomeVendedor                          AS 'Nome do Vendedor',
    Salario                               AS 'Salário',
    (SELECT AVG(Salario) FROM Vendedores) AS 'Média Salarial'
FROM 
    Vendedores
WHERE 
    Salario > (SELECT AVG(Salario) FROM Vendedores)
ORDER BY 
    Salario DESC;
GO


-- 9. Exibir o código do cliente, seu nome, o produto que ele comprou, o valor
-- unitário desse produto, a quantidade que foi comprada, o valor total a ser 
-- pago, o prazo de entrega do pedido e o nome do vendedor que efetuou a venda. 
-- Ordene o resultado pelo nome do cliente, nome do produto, quantidade de itens 
-- que foram comprados, o prazo de entrega do pedido e o nome do vendedor.
-- Utilize aliases para exibir o nome das colunas. (2.0 pontos)

SELECT 
    CLIENTES.CodigoCliente                               AS 'Código do Cliente',
    CLIENTES.NomeCliente                                 AS 'Nome do Cliente',
    PRODUTOS.DescricaoProduto                            AS 'Produto',
    PRODUTOS.ValorUnitario                               AS 'Valor Unitário',
    ITEM_DE_PEDIDO.Quantidade                            AS 'Quantidade Comprada',
    (ITEM_DE_PEDIDO.Quantidade * PRODUTOS.ValorUnitario) AS 'Valor Total a Pagar',
    PEDIDOS.PrazoEntrega                                 AS 'Prazo de Entrega',
    VENDEDORES.NomeVendedor                              AS 'Vendedor'

FROM 
    CLIENTES
-- usar join ou left join? --
JOIN 
    PEDIDOS        ON CLIENTES.CodigoCliente       = PEDIDOS.CodigoCliente
JOIN 
    ITEM_DE_PEDIDO ON PEDIDOS.NumeroPedido         = ITEM_DE_PEDIDO.NumeroPedido
JOIN 
    PRODUTOS       ON ITEM_DE_PEDIDO.CodigoProduto = PRODUTOS.CodigoProduto
JOIN  
    VENDEDORES     ON PEDIDOS.CodigoVendedor       = VENDEDORES.CodigoVendedor

ORDER BY 
    CLIENTES.NomeCliente, 
    PRODUTOS.DescricaoProduto, 
    ITEM_DE_PEDIDO.Quantidade, 
    PEDIDOS.PrazoEntrega, 
    VENDEDORES.NomeVendedor;

-----------------------------------------------------------------------------------
-- PARTE D: REMOVE O BANCO DE DADOS
-----------------------------------------------------------------------------------


-- * Instruções: Execute os comandos abaixo para remover o banco de dados.


USE master;
GO


DROP DATABASE LOJAMARIA;
GO