CREATE TABLE Autores (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Livros (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
);

CREATE TABLE Exemplares (
    exemplar_id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id)
);

CREATE TABLE Membros (
    membro_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE Emprestimos (
    emprestimo_id INT PRIMARY KEY AUTO_INCREMENT,
    membro_id INT,
    exemplar_id INT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    multa DECIMAL(10, 2),
    FOREIGN KEY (membro_id) REFERENCES Membros(membro_id),
    FOREIGN KEY (exemplar_id) REFERENCES Exemplares(exemplar_id)
);

INSERT INTO Autores (nome) VALUES ('J.K. Rowling');
INSERT INTO Autores (nome) VALUES ('George Orwell');
INSERT INTO Autores (nome) VALUES ('Isaac Asimov');

INSERT INTO Livros (titulo, autor_id) VALUES ('Harry Potter and the Philosopher\'s Stone', 1);
INSERT INTO Livros (titulo, autor_id) VALUES ('1984', 2);
INSERT INTO Livros (titulo, autor_id) VALUES ('Foundation', 3);

INSERT INTO Exemplares (livro_id) VALUES (1);
INSERT INTO Exemplares (livro_id) VALUES (1);
INSERT INTO Exemplares (livro_id) VALUES (2);
INSERT INTO Exemplares (livro_id) VALUES (3);

INSERT INTO Membros (nome, data_nascimento) VALUES ('John Doe', '1990-05-15');
INSERT INTO Membros (nome, data_nascimento) VALUES ('Jane Smith', '1985-10-22');

INSERT INTO Emprestimos (membro_id, exemplar_id, data_emprestimo, data_devolucao, multa) 
VALUES (1, 1, '2024-10-01', '2024-10-10', 0);
INSERT INTO Emprestimos (membro_id, exemplar_id, data_emprestimo, data_devolucao, multa) 
VALUES (2, 2, '2024-10-05', '2024-10-15', 5.50);
INSERT INTO Emprestimos (membro_id, exemplar_id, data_emprestimo, data_devolucao, multa) 
VALUES (1, 3, '2024-10-12', NULL, NULL);
