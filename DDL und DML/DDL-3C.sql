-- Datenbank anlegen
CREATE DATABASE kino;

-- aktivieren der DB kino
USE kino;

CREATE TABLE film (
    titel VARCHAR(100),
    jahr INT,
    untertitel VARCHAR(250),
    land CHAR(2),
    PRIMARY KEY (titel,jahr)
);