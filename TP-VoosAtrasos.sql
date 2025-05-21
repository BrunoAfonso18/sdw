USE RAW;
DROP TABLE Companhia_AereaRAW;
DROP TABLE AeronaveRAW;
DROP TABLE AeroportoRAW;
USE AUD;
DROP TABLE Companhia_AereaAUD;
DROP TABLE AeronaveAUD;
DROP TABLE AeroportoAUD;
USE FONTE;
DROP TABLE Companhia_AereaFONTE;
DROP TABLE AeronaveFONTE;
DROP TABLE AeroportoFONTE;
USE ERROS;
DROP TABLE Companhia_AereaERRO;
DROP TABLE VooQUA;
DROP TABLE AeronaveERRO;
DROP TABLE AeroportoERRO;
USE RDY;
DROP TABLE Viagem;
DROP TABLE Voo;
DROP TABLE Companhia_Aerea;
DROP TABLE VooRDY;
DROP TABLE Aeronave;
DROP TABLE Aeroporto;
DROP TABLE cidade;
DROP TABLE clima;
DROP TABLE cobertura_nuvens;
DROP TABLE CompanhiaAereaCritica;
DROP TABLE direcao_vento;
DROP TABLE distancia;
DROP TABLE pais;
DROP TABLE precipitacao;
DROP TABLE probabilidade_precipitacao;
DROP TABLE temperatura;
DROP TABLE velocidade_vento;
DROP TABLE visibilidade;
USE HST;
DROP TABLE Companhia_AereaHST;
DROP TABLE AeronaveHST;
DROP TABLE AeroportoHST;

CREATE DATABASE FONTE;
CREATE DATABASE RAW;
CREATE DATABASE ERROS;
CREATE DATABASE RDY;
CREATE DATABASE HST;

USE FONTE;

CREATE TABLE Companhia_AereaFONTE (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Country VARCHAR(50)
);

CREATE TABLE AeronaveFONTE (
    Model VARCHAR(100) PRIMARY KEY,
    Company VARCHAR(100)
);

CREATE TABLE AeroportoFONTE (
    ID_aeroporto INT PRIMARY KEY,
    Nome VARCHAR(100),
    Pais VARCHAR(100),
    Cidade VARCHAR(100),
    Latitude DECIMAL(15,10),
    Longitude DECIMAL(15,10)
);
USE FONTE;
SHOW TABLES;


USE AUD;

CREATE TABLE Companhia_AereaAUD (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Country VARCHAR(50),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL,
    FOREIGN KEY (Airline_ID) REFERENCES FONTE.Companhia_AereaFONTE(Airline_ID) ON DELETE CASCADE
);

CREATE TABLE AeronaveAUD (
    Model VARCHAR(100) PRIMARY KEY,
    Company VARCHAR(100),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL
);

CREATE TABLE AeroportoAUD (
	ID_aeroporto INT PRIMARY KEY,
    Nome VARCHAR(100),
    Pais VARCHAR(100),
    Cidade VARCHAR(100),
    Latitude DECIMAL(15,10),
    Longitude DECIMAL(15,10),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_aeroporto) REFERENCES FONTE.AeroportoFONTE(ID_aeroporto) ON DELETE CASCADE
);

USE FONTE;

DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_Companhia_AereaINSERT
AFTER INSERT ON FONTE.Companhia_AereaFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.Companhia_AereaAUD (
		Airline_ID,
		Name,
		Country,
		Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
        NEW.Airline_ID, 
        NEW.Name, 
        NEW.Country,
        'INSERT', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_Companhia_AereaUPDATE
AFTER UPDATE ON FONTE.Companhia_AereaFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.Companhia_AereaAUD (
		Airline_ID,
		Name,
		Country,
		Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
        NEW.Airline_ID, 
        NEW.Name, 
        NEW.Country,
        'UPDATE', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_Companhia_AereaDELETE
AFTER DELETE ON FONTE.Companhia_AereaFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.Companhia_AereaAUD (
		Airline_ID,
		Name,
		Country,
		Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
        OLD.Airline_ID, 
        OLD.Name, 
        OLD.Country,
        'DELETE', 
        NOW(),
        USER()
    );
END //
DELIMITER ;

#----------------------------------------------------

DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_AeronaveINSERT
AFTER INSERT ON FONTE.AeronaveFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.AeronaveAUD (
		Model,
		Company,
        Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
        NEW.Model,
        NEW.Company,
        'INSERT', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_AeronaveUPDATE
AFTER UPDATE ON FONTE.AeronaveFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.AeronaveAUD (
		Model,
		Company,
        Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
        NEW.Model,
        NEW.Company,
        'UPDATE', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_AeronaveDELETE
AFTER DELETE ON FONTE.AeronaveFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.AeronaveAUD (
		Model,
		Company,
        Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
        OLD.Model,
        OLD.Company,
        'DELETE', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


#----------------------------------------------------
USE FONTE;

DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_AeroportoINSERT
AFTER INSERT ON FONTE.AeroportoFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.AeroportoAUD (
		ID_aeroporto,
		Nome,
		Pais,
        Cidade,
		Latitude,
		Longitude,
        Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
		NEW.ID_aeroporto,
        NEW.Nome, 
        NEW.Pais,
        NEW.Cidade,
        NEW.Latitude,
        NEW.Longitude,
        'INSERT', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_AeroportoUPDATE
AFTER UPDATE ON FONTE.AeroportoFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.AeroportoAUD (
		ID_aeroporto,
		Nome,
		Pais,
        Cidade,
		Latitude,
		Longitude,
        Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
		NEW.ID_aeroporto,
        NEW.Nome, 
        NEW.Pais,
        NEW.Cidade,
        NEW.Latitude,
        NEW.Longitude,
        'UPDATE', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_FONTE_to_AUD_AeroportoDELETE
AFTER DELETE ON FONTE.AeroportoFONTE
FOR EACH ROW
BEGIN
    INSERT INTO AUD.AeroportoAUD (
		ID_aeroporto,
		Nome,
		Pais,
        Cidade,
		Latitude,
		Longitude,
        Operacao,
		Etiqueta,
		Utilizador
    ) VALUES (
		OLD.ID_aeroporto,
        OLD.Nome, 
        OLD.Pais,
        OLD.Cidade,
        OLD.Latitude,
        OLD.Longitude,
        'DELETE', 
        NOW(),
        USER()
    );
END //
DELIMITER ;


USE RAW;

CREATE TABLE Companhia_AereaRAW (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Country VARCHAR(50),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL
);

CREATE TABLE AeronaveRAW (
    Model VARCHAR(100),
    Company VARCHAR(100),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL
);

CREATE TABLE AeroportoRAW (
	ID_aeroporto INT PRIMARY KEY,
    Nome VARCHAR(100),
    Pais VARCHAR(100),
    Cidade VARCHAR(100),
    Latitude DECIMAL(15,10),
    Longitude DECIMAL(15,10),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL
);

USE ERROS;

CREATE TABLE Companhia_AereaERRO (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Descricao VARCHAR(100) NOT NULL
);

CREATE TABLE AeronaveERRO (
    Model VARCHAR(100) PRIMARY KEY,
    Company VARCHAR(100),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Descricao VARCHAR(100) NOT NULL
);

CREATE TABLE AeroportoERRO (
	ID_aeroporto INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cidade VARCHAR(100),
    Pais VARCHAR(100),
    Latitude DECIMAL(15,10),
    Longitude DECIMAL(15,10),
    Operacao VARCHAR(50) NOT NULL,
    Etiqueta VARCHAR(50) NOT NULL,
    Utilizador VARCHAR(50) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Descrição VARCHAR(100) NOT NULL
);

CREATE TABLE VooQUA (
    id_voo INT AUTO_INCREMENT PRIMARY KEY,
    nr_voo INT,
    data_partida DATE,
    nome_companhia_aerea VARCHAR(100),
    aeroporto_origem CHAR(3),
    aeroporto_destino CHAR(3),
    hora_partida_real DECIMAL(5,1),
    hora_partida_esperada DECIMAL(5,1),
    hora_chegada_real DECIMAL(5,1),
    hora_chegada_esperada DECIMAL(5,1),
    cancelado DECIMAL(6,1),
    desviado DECIMAL(6,1),
    distancia DECIMAL(6,1),
    atraso_companhia_aerea DECIMAL(5,1),
    atraso_metereologia DECIMAL(5,1),
    atraso_SNA DECIMAL(5,1),
    atraso_seguranca DECIMAL(5,1),
    atraso_voo_anterior DECIMAL(5,1),
    Modelo_Avião VARCHAR(50) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    avaliacao DECIMAL(5,1)
);

USE RDY;

CREATE TABLE Companhia_Aerea (
    id_companhia_aerea INT PRIMARY KEY,
    nome VARCHAR(150) UNIQUE NOT NULL,
    país VARCHAR(50) NOT NULL
);


CREATE TABLE Aeronave (
    Modelo VARCHAR(100) PRIMARY KEY,
    Fabricante VARCHAR(100)
);

CREATE TABLE Pais (
    pais VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Cidade (
	id_cidade INT PRIMARY KEY,
    cidade VARCHAR(100)
);

CREATE TABLE Aeroporto (
	ID_aeroporto INT PRIMARY KEY,
    Codigo_IATA CHAR(3) UNIQUE,
    Nome VARCHAR(100),
    Cidade VARCHAR(100),
    Pais VARCHAR(100),
    Latitude DECIMAL(15,10),
    Longitude DECIMAL(15,10)
);


CREATE TABLE clima (
	id_clima INT PRIMARY KEY,
    temperatura DECIMAL(5,5),
    precipitacao DECIMAL(5,5),
    probabilidade DECIMAL(5,5),
    visibilidade DECIMAL(5,5),
    cobertura DECIMAL(5,5),
    velocidade DECIMAL(5,5),
    direcao DECIMAL(5,5)
    );




CREATE TABLE distancia (
	id_distancia INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(5,1)
);

CREATE TABLE Voo (
	id_voo INT AUTO_INCREMENT PRIMARY KEY,
    nr_voo INT,
    id_distancia INT,
    hora_partida_real DECIMAL(5,1),
    hora_partida_esperada DECIMAL(5,1),
    hora_chegada_real DECIMAL(5,1),
    hora_chegada_esperada DECIMAL(5,1),
    FOREIGN KEY (id_distancia) REFERENCES RDY.distancia(id_distancia) ON DELETE CASCADE
    );

CREATE TABLE Viagem (
	id_viagem INT AUTO_INCREMENT PRIMARY KEY,
    avaliacao DECIMAL(5,1),
    cancelado DECIMAL(6,1),
    desviado DECIMAL(6,1),
    atraso_companhia_aerea DECIMAL(5,1),
    atraso_metereologia DECIMAL(5,1),
    atraso_SNA DECIMAL(5,1),
    atraso_seguranca DECIMAL(5,1),
    atraso_voo_anterior DECIMAL(5,1),
    id_voo INT,
    nome_companhia_aerea VARCHAR(150),
	aeroporto_origem CHAR(3),
	aeroporto_destino CHAR(3),
	Modelo_Avião VARCHAR(100),
	id_clima INT,
    FOREIGN KEY (id_voo) REFERENCES RDY.Voo(id_voo) ON DELETE CASCADE,
    FOREIGN KEY (nome_companhia_aerea) REFERENCES RDY.Companhia_Aerea(nome) ON DELETE CASCADE,
    FOREIGN KEY (aeroporto_origem) REFERENCES RDY.Aeroporto(Codigo_IATA) ON DELETE CASCADE,
    FOREIGN KEY (aeroporto_destino) REFERENCES RDY.Aeroporto(Codigo_IATA) ON DELETE CASCADE,
    FOREIGN KEY (Modelo_Avião) REFERENCES RDY.Aeronave(Modelo) ON DELETE CASCADE,
    FOREIGN KEY (id_clima) REFERENCES RDY.clima(id_clima) ON DELETE CASCADE
);



CREATE TABLE VooRDY (
    id_voo INT AUTO_INCREMENT PRIMARY KEY,
    nr_voo INT,
    data_partida DATE,
    nome_companhia_aerea VARCHAR(100),
    aeroporto_origem CHAR(3),
    aeroporto_destino CHAR(3),
    hora_partida_real DECIMAL(5,1),
    hora_partida_esperada DECIMAL(5,1),
    hora_chegada_real DECIMAL(5,1),
    hora_chegada_esperada DECIMAL(5,1),
    cancelado DECIMAL(6,1),
    desviado DECIMAL(6,1),
    distancia DECIMAL(6,1),
    atraso_companhia_aerea DECIMAL(5,1),
    atraso_metereologia DECIMAL(5,1),
    atraso_SNA DECIMAL(5,1),
    atraso_seguranca DECIMAL(5,1),
    atraso_voo_anterior DECIMAL(5,1),
    Modelo_Avião VARCHAR(100),
    avaliacao DECIMAL(5,1)
);

#DROP TABLE Voo;

USE HST;

CREATE TABLE Companhia_AereaHST (
    id_companhia_aerea INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    país VARCHAR(50) NOT NULL,
    Modificação VARCHAR(100),
    DataHoraModificação VARCHAR(100)
);

CREATE TABLE AeronaveHST (
    Modelo VARCHAR(100),
    Fabricante VARCHAR(100),
    Modificação VARCHAR(100),
    DataHoraModificação VARCHAR(100)
);

CREATE TABLE AeroportoHST (
	ID_aeroporto INT PRIMARY KEY,
    Codigo_IATA CHAR(3),
    Nome VARCHAR(100),
    Cidade VARCHAR(100),
    Pais VARCHAR(100),
    Latitude DECIMAL(15,10),
    Longitude DECIMAL(15,10),
    Modificação VARCHAR(100),
    DataHoraModificação VARCHAR(100)
);




