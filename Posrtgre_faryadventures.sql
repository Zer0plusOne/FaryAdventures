DROP TABLE IF EXISTS characters CASCADE; -- Se indica CASCADE para que elimine todas las filas existentes dentro de la tabla ya que es necesario especificarlo segun el siguiente post: https://stackoverflow.com/questions/14141266/postgresql-foreign-key-on-delete-cascade
DROP TABLE IF EXISTS character_items CASCADE;
DROP TABLE IF EXISTS character_stats CASCADE;
DROP TABLE IF EXISTS character_weapons CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS item_types CASCADE;
DROP TABLE IF EXISTS stats CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS weapons CASCADE;
DROP TABLE IF EXISTS weapon_types CASCADE;
DROP TABLE IF EXISTS comments CASCADE;


-- Al no funcionar de la manera que estaba anteriormente se le ha preguntado a chatgpt como realizar esa operacion

-- BLOQUE ANTERIOR:

--CREATE ROLE IF NOT EXISTS FaryAdmin;
--CREATE ROLE IF NOT EXISTS FaryEscritor;
--CREATE ROLE IF NOT EXISTS FaryLector;
--
--CREATE USER IF NOT EXISTS `FaryConCorbata`@`localhost`;
--CREATE USER IF NOT EXISTS`FaryConBoli`@`localhost`;
--CREATE USER IF NOT EXISTS `FaryConGafas`@`localhost`;
--CREATE USER IF NOT EXISTS `comentarios`@`localhost`; 
--CREATE USER IF NOT EXISTS `carles@10.65.0.77`;
--
--GRANT SELECT, INSERT, UPDATE, DELETE ON faryadventures.* TO FaryAdmin;
--GRANT SELECT, INSERT, UPDATE ON faryadventures.* TO FaryEscritor;
--GRANT SELECT ON faryadventures.* TO FaryLector;
--
--GRANT FaryAdmin TO FaryConCorbata@localhost;
--GRANT FaryEscritor TO FaryConBoli@localhost;
--GRANT FaryLector TO FaryConGafas@localhost;

-- BLOQUE ADAPTADO A POSTGRESQL:

DO $$

BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'faryadmin') THEN
        CREATE ROLE faryadmin;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'faryescritor') THEN
        CREATE ROLE faryescritor;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'farylector') THEN
        CREATE ROLE farylector;
    END IF;

END$$
;

CREATE TABLE characters (
    id_character SERIAL PRIMARY KEY,
    name VARCHAR(24) NOT NULL,
    age INT,
    gender CHAR(2),
    level INT,
    health INT,
    height FLOAT,
    weight FLOAT,
    origin CHAR(2)
)
;

CREATE TABLE character_items (
    id_character_item SERIAL PRIMARY KEY, 
    id_character INT NOT NULL REFERENCES characters(id_character),
    id_item INT NOT NULL
)
;

CREATE TABLE character_stats(
    id_character_stat SERIAL PRIMARY KEY,
    id_character INT NOT NULL REFERENCES characters(id_character),
    id_stat INT NOT NULL
)
;

CREATE TABLE character_weapons(
    id_character_weapon SERIAL PRIMARY KEY,
    id_character INT NOT NULL REFERENCES characters(id_character),
    id_weapon INT NOT NULL
)
;

CREATE TABLE items(
    id_item SERIAL PRIMARY KEY, 
    name VARCHAR(24) NOT NULL,
    type INT NOT NULL,
    equipable BOOLEAN NOT NULL,
    consumable BOOLEAN NOT NULL,
    rarity INT NOT NULL,
    quantity INT NOT NULL,
    shape INT NOT NULL,
    uses INT NOT NULL,
    id_character INT NOT NULL REFERENCES characters(id_character)
)
;

CREATE TABLE item_types(
    id_item_type SERIAL PRIMARY KEY,
    id_item INT NOT NULL,
    id_type INT NOT NULL
)
;

CREATE TABLE stats (
    id_stat SERIAL PRIMARY KEY, 
    reputation INT NOT NULL,
    speed INT NOT NULL,
    morality INT NOT NULL,
    hunger INT NOT NULL,
    stamina INT NOT NULL,
    defense INT NOT NULL,
    reflex INT NOT NULL,
    id_character INT NOT NULL REFERENCES characters(id_character)
)
;

CREATE TABLE students(
    id_student SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    surname VARCHAR(32) NOT NULL,
    age INT NOT NULL,
    dni VARCHAR(16) NOT NULL,
    email VARCHAR(32) NOT NULL,
    comments TEXT,
    schooled BOOLEAN NOT NULL
)
;

CREATE TABLE users(
    id_user SERIAL PRIMARY KEY,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(32) NOT NULL,
    email VARCHAR(35) NOT NULL,
    birthdate DATE NOT NULL,
    registered TIMESTAMP NOT NULL DEFAULT NOW()
)
;

CREATE TABLE weapons(
    id_weapon SERIAL PRIMARY KEY,
    weapon VARCHAR(32) NOT NULL,
    level INT NOT NULL,
    price FLOAT NOT NULL,
    damage INT NOT NULL,
    critical INT NOT NULL,
    weight FLOAT NOT NULL,
    id_weapon_type INT NOT NULL
)
;

CREATE TABLE weapon_types(
    id_weapon_type SERIAL PRIMARY KEY,
    weapon_type VARCHAR(16) NOT NULL
)
;

CREATE TABLE comments(
    id_comment SERIAL PRIMARY KEY,
    comment TEXT,
    fecha_hora TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
)
;

INSERT INTO characters (name, age, gender, level, health, height, weight, origin) VALUES
('El Fary', 86, 'N', 200, 70, 1.2, 47, 'GY'),
('El Cigala', 54, 'M', 150, 80, 2.4, 150, 'RU'),
('El Churumbel', 33, 'M', 33, 33, 3.3, 333, 'AS'),
('El Kiko', -1, 'F', 69, 100, 1.1, 420, 'RE')
;

INSERT INTO character_items (id_character, id_item) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4)
;

INSERT INTO character_stats (id_character, id_stat) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4)
;

INSERT INTO character_weapons (id_character, id_weapon) VALUES
(2, 3),
(3, 1),
(1, 3),
(1, 4)
;

INSERT INTO items (name, type, equipable, consumable, rarity, quantity, shape, uses, id_character) VALUES
('Guitarra_Flamenca', 2, 1, 0, 30, 67, 4, 1, 0),
('Bollo', 5, 0, 1, 5, 0, 3, 1, 4),
('Piti', 3, 1, 1, 80, 5, 2, 1, 3),
('Piano', 2, 1, 1, 67, 34, 1, 1, 3),
('Escobilla_del_vater', 1, 1, 0, 324, 3456, 1, 1, 3)
;

INSERT INTO item_types (id_item, id_type) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

INSERT INTO stats (reputation, speed, morality, hunger, stamina, defense, reflex, id_character) VALUES
(100, 40, 80, 0, -1, 0, 0, 1),
(69, 50, 40, 0, 5, 1, 10, 2),
(75, 30, 75, 0, 50, 7, 0, 3),
(90, 60, 80, 4, 0, 1, 30, 4)
;

INSERT INTO students (name, surname, age, dni, email, comments, schooled) VALUES
('Francisco', 'Franco', 30, '37106582', 'elcaudillo@vivaespaña.es', 'odia a los moros', FALSE)
;

INSERT INTO users (username, password, email, birthdate) VALUES
('admin', 'd986dcc5db7d15701e017ff15b6e9ed1', 'usr0.admin+faryadventures@enti.cat', '0001-01-01'),
('user', 'fab7b771433219728d312648312374a7', 'usr1.user+faryadventures@enti.cat', '2001-09-11')
;

INSERT INTO weapons (weapon, level, price, damage, critical, weight, id_weapon_type) VALUES
('puños', 5, 0, 10, 5, 0.25, 1),
('SPAS-12', 42, 400, 370, 0, 0, 2),
('Extensible', 40, 540, 680, 0 , 0, 1)
;

INSERT INTO weapon_types (weapon_type) VALUES
('RANGED'),
('MELEE')
;
