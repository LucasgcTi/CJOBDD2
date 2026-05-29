USE Master
GO

IF DB_ID('SistemaCartorio') IS NULL
    CREATE DATABASE SistemaCartorio
GO

USE SistemaCartorio
GO


-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    rg VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    salario DECIMAL(10,2),
    data_admissao DATE
);

-- Tabela Documento
CREATE TABLE Documento (
    id_documento INT PRIMARY KEY,
    tipo_documento VARCHAR(50),
    numero_documento VARCHAR(50),
    data_emissao DATE,
    orgao_emissor VARCHAR(50),
    id_cliente INT,
    
    FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente)
);

-- Tabela Atendimento
CREATE TABLE Atendimento (
    id_atendimento INT PRIMARY KEY,
    data_atendimento DATETIME,
    tipo_servico VARCHAR(100),
    valor DECIMAL(10,2),
    status_atendimento VARCHAR(30),
    id_cliente INT,
    id_funcionario INT,

    FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente),

    FOREIGN KEY (id_funcionario)
    REFERENCES Funcionario(id_funcionario)
);

-- Tabela Registro
CREATE TABLE Registro (
    id_registro INT PRIMARY KEY,
    tipo_registro VARCHAR(50),
    livro VARCHAR(20),
    folha VARCHAR(20),
    termo VARCHAR(20),
    data_registro DATE,
    id_atendimento INT,

    FOREIGN KEY (id_atendimento)
    REFERENCES Atendimento(id_atendimento)
);

-- =========================
-- INSERTS TABELA CLIENTE
-- =========================

INSERT INTO Cliente VALUES
(1, 'João Silva', '12345678901', 'MG123456', '(11)99999-1111', 'joao@gmail.com', 'Rua das Flores, 100'),
(2, 'Maria Oliveira', '12345678902', 'SP987654', '(11)99999-2222', 'maria@gmail.com', 'Av. Central, 200'),
(3, 'Carlos Souza', '12345678903', 'RJ654321', '(11)99999-3333', 'carlos@gmail.com', 'Rua Azul, 45'),
(4, 'Fernanda Lima', '12345678904', 'SP456789', '(11)99999-4444', 'fernanda@gmail.com', 'Rua Verde, 88'),
(5, 'Lucas Pereira', '12345678905', 'MG741852', '(11)99999-5555', 'lucas@gmail.com', 'Av. Paulista, 900'),
(6, 'Ana Costa', '12345678906', 'SP369258', '(11)99999-6666', 'ana@gmail.com', 'Rua das Palmeiras, 50'),
(7, 'Ricardo Alves', '12345678907', 'RJ258369', '(11)99999-7777', 'ricardo@gmail.com', 'Rua do Sol, 12'),
(8, 'Patricia Gomes', '12345678908', 'SP753159', '(11)99999-8888', 'patricia@gmail.com', 'Av. Brasil, 300'),
(9, 'Juliana Rocha', '12345678909', 'MG951357', '(11)99999-9999', 'juliana@gmail.com', 'Rua da Paz, 400'),
(10, 'Bruno Martins', '12345678910', 'SP852456', '(11)98888-1111', 'bruno@gmail.com', 'Rua XV, 77'),
(11, 'Camila Santos', '12345678911', 'RJ951753', '(11)98888-2222', 'camila@gmail.com', 'Rua Bela Vista, 89'),
(12, 'Eduardo Ferreira', '12345678912', 'SP357951', '(11)98888-3333', 'eduardo@gmail.com', 'Rua das Acácias, 15'),
(13, 'Mariana Lopes', '12345678913', 'MG456123', '(11)98888-4444', 'mariana@gmail.com', 'Av. Independência, 450'),
(14, 'Thiago Ribeiro', '12345678914', 'SP789456', '(11)98888-5555', 'thiago@gmail.com', 'Rua das Oliveiras, 67'),
(15, 'Aline Mendes', '12345678915', 'RJ123789', '(11)98888-6666', 'aline@gmail.com', 'Rua Primavera, 145');

INSERT INTO Funcionario VALUES
(1, 'Paulo Henrique', 'Escrevente', '98765432101', '(11)97777-1111', 3500.00, '2022-01-10'),
(2, 'Roberta Lima', 'Tabeliã', '98765432102', '(11)97777-2222', 7000.00, '2020-03-15'),
(3, 'Felipe Souza', 'Atendente', '98765432103', '(11)97777-3333', 2800.00, '2021-07-20'),
(4, 'Amanda Costa', 'Escrevente', '98765432104', '(11)97777-4444', 3600.00, '2023-02-01'),
(5, 'Renato Alves', 'Supervisor', '98765432105', '(11)97777-5555', 5000.00, '2019-09-12');

INSERT INTO Documento VALUES
(1, 'RG', 'MG123456', '2018-05-10', 'SSP', 1),
(2, 'CPF', '12345678902', '2017-08-15', 'Receita Federal', 2),
(3, 'Certidão de Nascimento', 'CN1001', '2001-03-20', 'Cartório Central', 3),
(4, 'RG', 'SP456789', '2019-01-11', 'SSP', 4),
(5, 'CPF', '12345678905', '2016-07-09', 'Receita Federal', 5),
(6, 'RG', 'SP369258', '2020-02-14', 'SSP', 6),
(7, 'Certidão de Casamento', 'CC2002', '2021-06-01', 'Cartório Norte', 7),
(8, 'CPF', '12345678908', '2015-09-30', 'Receita Federal', 8),
(9, 'RG', 'MG951357', '2018-10-21', 'SSP', 9),
(10, 'CPF', '12345678910', '2017-12-12', 'Receita Federal', 10),
(11, 'RG', 'RJ951753', '2019-11-18', 'SSP', 11),
(12, 'CPF', '12345678912', '2020-04-22', 'Receita Federal', 12),
(13, 'RG', 'MG456123', '2016-06-13', 'SSP', 13),
(14, 'Certidão de Nascimento', 'CN3003', '2000-01-01', 'Cartório Sul', 14),
(15, 'CPF', '12345678915', '2018-08-08', 'Receita Federal', 15);

INSERT INTO Atendimento VALUES
(1, '2026-01-10 09:00:00', 'Reconhecimento de Firma', 25.00, 'Concluído', 1, 1),
(2, '2026-01-11 10:30:00', 'Autenticação de Documento', 15.00, 'Concluído', 2, 2),
(3, '2026-01-12 11:15:00', 'Emissão de Certidão', 40.00, 'Concluído', 3, 3),
(4, '2026-01-13 14:00:00', 'Registro de Nascimento', 120.00, 'Concluído', 4, 4),
(5, '2026-01-14 15:45:00', 'Registro de Casamento', 250.00, 'Pendente', 5, 5),
(6, '2026-01-15 08:20:00', 'Reconhecimento de Firma', 25.00, 'Concluído', 6, 1),
(7, '2026-01-16 13:00:00', 'Autenticação de Documento', 15.00, 'Concluído', 7, 2),
(8, '2026-01-17 16:10:00', 'Emissão de Certidão', 40.00, 'Concluído', 8, 3),
(9, '2026-01-18 09:50:00', 'Registro de Imóvel', 500.00, 'Pendente', 9, 4),
(10, '2026-01-19 10:00:00', 'Reconhecimento de Firma', 25.00, 'Concluído', 10, 5),
(11, '2026-01-20 11:30:00', 'Autenticação de Documento', 15.00, 'Concluído', 11, 1),
(12, '2026-01-21 14:40:00', 'Registro de Nascimento', 120.00, 'Concluído', 12, 2),
(13, '2026-01-22 15:20:00', 'Registro de Casamento', 250.00, 'Pendente', 13, 3),
(14, '2026-01-23 09:15:00', 'Emissão de Certidão', 40.00, 'Concluído', 14, 4),
(15, '2026-01-24 13:50:00', 'Registro de Imóvel', 500.00, 'Concluído', 15, 5);

INSERT INTO Registro VALUES
(1, 'Firma', 'L01', 'F12', 'T001', '2026-01-10', 1),
(2, 'Documento', 'L01', 'F13', 'T002', '2026-01-11', 2),
(3, 'Certidão', 'L02', 'F20', 'T003', '2026-01-12', 3),
(4, 'Nascimento', 'L03', 'F01', 'T004', '2026-01-13', 4),
(5, 'Casamento', 'L03', 'F02', 'T005', '2026-01-14', 5),
(6, 'Firma', 'L01', 'F14', 'T006', '2026-01-15', 6),
(7, 'Documento', 'L01', 'F15', 'T007', '2026-01-16', 7),
(8, 'Certidão', 'L02', 'F21', 'T008', '2026-01-17', 8),
(9, 'Imóvel', 'L04', 'F10', 'T009', '2026-01-18', 9),
(10, 'Firma', 'L01', 'F16', 'T010', '2026-01-19', 10),
(11, 'Documento', 'L01', 'F17', 'T011', '2026-01-20', 11),
(12, 'Nascimento', 'L03', 'F03', 'T012', '2026-01-21', 12),
(13, 'Casamento', 'L03', 'F04', 'T013', '2026-01-22', 13),
(14, 'Certidão', 'L02', 'F22', 'T014', '2026-01-23', 14),
(15, 'Imóvel', 'L04', 'F11', 'T015', '2026-01-24', 15);

SELECT 
    C.nome AS 'Nome_Cliente', 
    A.tipo_servico AS 'Servico_Solicitado', 
    A.valor AS 'Valor_Cobrado'
FROM Cliente AS C
INNER JOIN Atendimento AS A 
    ON C.id_cliente = A.id_cliente;

SELECT 
    C.nome AS 'Cliente_Pendente', 
    A.tipo_servico AS 'Servico', 
    A.data_atendimento AS 'Data_Agendada'
FROM Cliente AS C
INNER JOIN Atendimento AS A 
    ON C.id_cliente = A.id_cliente
WHERE A.status_atendimento = 'Pendente';

SELECT 
    A.tipo_servico AS 'Categoria_Servico', 
    SUM(A.valor) AS 'Receita_Total_Gerada'
FROM Atendimento AS A
GROUP BY A.tipo_servico;

SELECT 
    C.nome AS 'Titular_Documento', 
    D.tipo_documento AS 'Especie_Doc', 
    D.numero_documento AS 'Numero_Registro'
FROM Cliente AS C
INNER JOIN Documento AS D 
    ON C.id_cliente = D.id_cliente;

SELECT 
    F.nome AS 'Colaborador', 
    F.cargo AS 'Cargo_Ocupado', 
    F.salario AS 'Remuneracao_Atual'
FROM Funcionario AS F
ORDER BY F.salario DESC;

SELECT 
    R.tipo_registro AS 'Natureza_Registro', 
    R.livro AS 'Livro_Cartorio', 
    R.folha AS 'Folha_Cartorio', 
    A.tipo_servico AS 'Ato_Praticado'
FROM Registro AS R
INNER JOIN Atendimento AS A 
    ON R.id_atendimento = A.id_atendimento;

SELECT 
    C.nome AS 'Cliente_Paulista', 
    C.rg AS 'Identidade_SP', 
    C.endereco AS 'Endereco_Completo'
FROM Cliente AS C
WHERE C.rg LIKE 'SP%' OR C.endereco LIKE '%SP%';

SELECT 
    A.status_atendimento AS 'Status_Atual', 
    AVG(A.valor) AS 'Ticket_Medio'
FROM Atendimento AS A
GROUP BY A.status_atendimento;

SELECT 
    A.id_atendimento AS 'Num_Protocolo', 
    C.nome AS 'Cliente_Atendido', 
    F.nome AS 'Funcionario_Atendente',
    A.tipo_servico AS 'Servico_Executado'
FROM Atendimento AS A
INNER JOIN Funcionario AS F 
    ON A.id_funcionario = F.id_funcionario
INNER JOIN Cliente AS C 
    ON A.id_cliente = C.id_cliente;

SELECT 
    D.tipo_documento AS 'Tipo_Do_Documento', 
    D.numero_documento AS 'Num_Doc', 
    D.data_emissao AS 'Data_De_Emissao'
FROM Documento AS D
WHERE D.data_emissao < '2018-01-01';

SELECT 
    C.nome AS 'Nome_Completo', 
    C.email AS 'Endereco_Eletronico'
FROM Cliente AS C
WHERE C.email LIKE '%@gmail.com';

SELECT TOP 3 
    A.tipo_servico AS 'Servico_Premium', 
    A.valor AS 'Custo_Maximo',
    A.data_atendimento AS 'Data_Do_Registro'
FROM Atendimento AS A
ORDER BY A.valor DESC;

SELECT 
    D.orgao_emissor AS 'Orgao_Responsavel', 
    COUNT(D.id_documento) AS 'Volume_Processado'
FROM Documento AS D
GROUP BY D.orgao_emissor;

SELECT 
    CAST(A.data_atendimento AS DATE) AS 'Data_Caixa', 
    SUM(A.valor) AS 'Total_Arrecadado_Dia'
FROM Atendimento AS A
GROUP BY CAST(A.data_atendimento AS DATE);

SELECT 
    F.nome AS 'Colaborador', 
    DATEDIFF(YEAR, F.data_admissao, GETDATE()) AS 'Anos_Na_Empresa'
FROM Funcionario AS F;

SELECT 
    C.nome AS 'Nome_Dos_Noivos', 
    A.data_atendimento AS 'Data_Da_Solicitacao'
FROM Cliente AS C
INNER JOIN Atendimento AS A 
    ON C.id_cliente = A.id_cliente
WHERE A.tipo_servico = 'Registro de Casamento';

SELECT 
    A.tipo_servico AS 'Descricao_Servico', 
    A.valor AS 'Valor_Base', 
    CASE 
        WHEN A.valor >= 100 THEN 'Alto Custo'
        ELSE 'Baixo Custo'
    END AS 'Faixa_De_Preco'
FROM Atendimento AS A;

SELECT 
    A.tipo_servico AS 'Ato_Cartorario', 
    R.livro AS 'Livro_De_Registro', 
    R.folha AS 'Folha_De_Registro'
FROM Atendimento AS A
INNER JOIN Registro AS R 
    ON A.id_atendimento = R.id_atendimento
WHERE R.livro = 'L01';

SELECT 
    C.nome AS 'Cliente_VIP', 
    A.tipo_servico AS 'Servico_Executado',
    A.valor AS 'Valor_Gasto'
FROM Cliente AS C
INNER JOIN Atendimento AS A 
    ON C.id_cliente = A.id_cliente
WHERE A.valor > (SELECT AVG(A2.valor) FROM Atendimento AS A2);

SELECT 
    F.nome AS 'Funcionario_Recente', 
    F.data_admissao AS 'Data_De_Entrada'
FROM Funcionario AS F
WHERE YEAR(F.data_admissao) IN (2020, 2021);

WITH Gastos_Do_Cliente AS (
    SELECT 
        A.id_cliente AS 'id_cliente', 
        SUM(A.valor) AS 'total_gasto'
    FROM Atendimento AS A
    GROUP BY A.id_cliente
)
SELECT 
    C.nome AS 'Nome_Do_Cliente', 
    G.total_gasto AS 'Gasto_Acumulado'
FROM Cliente AS C
INNER JOIN Gastos_Do_Cliente AS G 
    ON C.id_cliente = G.id_cliente;

SELECT 
    CONCAT(C.nome, ' (CPF: ', C.cpf, ') - Tel: ', C.telefone) AS 'Ficha_De_Contato'
FROM Cliente AS C;

SELECT 
    F.nome AS 'Nome_Do_Colaborador', 
    SUM(A.valor) AS 'Base_Para_Comissao'
FROM Funcionario AS F
INNER JOIN Atendimento AS A 
    ON F.id_funcionario = A.id_funcionario
WHERE A.status_atendimento = 'Concluído'
GROUP BY F.nome;

SELECT 
    C.nome AS 'Ultimo_Cliente_Atendido', 
    A.data_atendimento AS 'Data_Mais_Recente'
FROM Cliente AS C
INNER JOIN Atendimento AS A 
    ON C.id_cliente = A.id_cliente
WHERE A.data_atendimento = (SELECT MAX(A2.data_atendimento) FROM Atendimento AS A2);

SELECT 
    ROW_NUMBER() OVER(ORDER BY F.salario DESC) AS 'Posicao_No_Ranking', 
    F.nome AS 'Empregado', 
    F.salario AS 'Salario_Atual'
FROM Funcionario AS F;

SELECT 
    R.tipo_registro AS 'Classe_De_Registro', 
    COUNT(*) AS 'Qtd_De_Entradas'
FROM Registro AS R
GROUP BY R.tipo_registro;

UPDATE Funcionario 
SET salario = salario * 1.10
OUTPUT 
    DELETED.nome AS 'Colaborador_Atingido',
    DELETED.salario AS 'Salario_Antigo_Sem_Aumento',
    INSERTED.salario AS 'Salario_Novo_Ajustado'
WHERE cargo = 'Escrevente';

SELECT 
    C.nome AS 'Cliente_Alto_Valor',
    C.cpf AS 'CPF_Do_Cliente',
    C.endereco AS 'Endereco_Residencial'
FROM Cliente AS C
WHERE EXISTS (
    SELECT 1 
    FROM Atendimento AS A
    WHERE A.id_cliente = C.id_cliente
      AND A.valor >= 250.00
);

SELECT 
    F.nome AS 'Colaborador_Responsavel',
    SUM(CASE WHEN A.status_atendimento = 'Concluído' THEN 1 ELSE 0 END) AS 'Qtd_Concluidos',
    SUM(CASE WHEN A.status_atendimento = 'Pendente' THEN 1 ELSE 0 END) AS 'Qtd_Pendentes',
    SUM(A.valor) AS 'Volume_Financeiro_Total'
FROM Funcionario AS F
INNER JOIN Atendimento AS A 
    ON F.id_funcionario = A.id_funcionario
GROUP BY F.nome
ORDER BY 'Volume_Financeiro_Total' DESC;