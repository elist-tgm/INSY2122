-- DDL Data Definition Language
-- CREATE: erzeugen von Strukturelementen
-- ALTER:  ändern -"-
-- DROP:   löschen -"-
-- SHOW:   anzeigen von -"-

-- Eine Datenbank erzeugen
CREATE DATABASE kino2;

-- Aktivieren einer Datenbank
USE kino2;

-- Eine Tabelle erzeugen
CREATE TABLE film (
    name VARCHAR(100),
    jahr INT,
    untertitel VARCHAR(250),
    land CHAR(2),
    PRIMARY KEY (name,jahr),
    FOREIGN KEY (land) REFERENCES land(code)
);

CREATE TABLE person (
    id INT PRIMARY KEY,
    vorname VARCHAR(100),
    nachname VARCHAR(100),
    kuenstlername VARCHAR(50),
    gebdat DATE,
    nationalitaet CHAR(2),
    FOREIGN KEY (nationalitaet) 
       REFERENCES land(code)
);

CREATE TABLE land (
    code CHAR(2) PRIMARY KEY,
    name VARCHAR(50)
);

-- Zeige alle Tabellen der Datenbank
SHOW TABLES;

-- 
SHOW CREATE TABLE film;


