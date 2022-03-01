
-- für Testskripte -> jedesmal neu anlegen
DROP DATABASE IF EXISTS sushi;
CREATE DATABASE sushi;

-- für Produktivsysteme
-- CREATE DATABASE IF NOT EXISTS sushi

USE sushi;

CREATE TABLE gast (
    gastnr INT AUTO_INCREMENT,
    name VARCHAR(50),
    strasse VARCHAR(50),
    plz CHAR(5) DEFAULT '1200',
    ort VARCHAR(50) DEFAULT 'Wien',
    PRIMARY KEY (gastnr)
);

-- Fügt Daten der Tabelle gast hinzu. Anstelle von DEFAULT wird entweder ein definierter
-- Default-Wert oder der Auto-Increment-Wert
INSERT INTO gast UP VALUES (DEFAULT,'Meier','Hauptstrasse 2','3400','Klosterneuburg');

-- Reihenfolge der Felder muss nicht der Erstellungsreihenfolge entsprechen
-- Reihenfolge der VALUES MUSS der angegebenen Feldreihenfolge entsprechen
INSERT INTO gast (name,ort,gastnr,strasse,plz) VALUES ('Müller','Wien',DEFAULT,'Langobardenstraße 52','1220');

-- Wenn Felder nicht angegeben sind, dann wird automatisch der Default-Wert verwendet
INSERT INTO gast (name,strasse) VALUES ('Bäcker','Wexstraße 19-23');

-- Felder, die nicht angegeben werden und auch keinen DEFAULT-Wert haben (hier strasse)
INSERT INTO gast (name) VALUES ('Neumann');

DELETE FROM gast WHERE gastnr > 4;

UPDATE gast SET name='Mueller' WHERE gastnr = 2;

CREATE TABLE speisenart (
    code BIGINT,
    speiseart VARCHAR(50),
    PRIMARY KEY (code)
);

INSERT INTO speisenart VALUES (1,'Vorspeise'), (2, 'Menue'), (3, 'Dessert'), (4, 'Getraenke');

CREATE TABLE speisen (
    nr INT AUTO_INCREMENT,
    bezeichnung VARCHAR(50),
    speisecode BIGINT DEFAULT 1,
    preis DOUBLE,
    PRIMARY KEY (nr),
    FOREIGN KEY (speisecode) REFERENCES speisenart(code)
);

INSERT INTO speisen (bezeichnung,speisecode,preis) VALUES
    ('California Rolls 8 Stk',DEFAULT,8.0),
    ('Sushi klein 5 Stk',DEFAULT,4.0),
    ('Sushi Menü Lachs',2,13);
