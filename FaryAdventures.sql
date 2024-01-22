DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS character_items;
DROP TABLE IF EXISTS character_stats;
DROP TABLE IF EXISTS character_weapons;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS item_types;
DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapon_types;
DROP TABLE IF EXISTS comments;

CREATE ROLE IF NOT EXISTS FaryAdmin;
CREATE ROLE IF NOT EXISTS FaryEscritor;
CREATE ROLE IF NOT EXISTS FaryLector;

CREATE USER IF NOT EXISTS `FaryConCorbata`@`localhost`;
CREATE USER IF NOT EXISTS`FaryConBoli`@`localhost`;
CREATE USER IF NOT EXISTS `FaryConGafas`@`localhost`;
CREATE USER IF NOT EXISTS `comentarios`@`localhost`; 

GRANT SELECT, INSERT, UPDATE, DELETE ON faryadventures.* TO FaryAdmin;
GRANT SELECT, INSERT, UPDATE ON faryadventures.* TO FaryEscritor;
GRANT SELECT ON faryadventures.* TO FaryLector;
GRANT SELECT, INSERT ON faryadventures.comments TO `comentarios`@`localhost`;

GRANT FaryAdmin TO FaryConCorbata@localhost;
GRANT FaryEscritor TO FaryConBoli@localhost;
GRANT FaryLector TO FaryConGafas@localhost;

CREATE TABLE characters (
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(24) NOT NULL,
    age INT(11),
    gender CHAR(2),
    level INT(11),
    health INT,
    height FLOAT,
    weight FLOAT,
    origin CHAR(2)
);

CREATE TABLE character_items (
    id_character_item INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_character CHAR(24) NOT NULL,
    id_item INT(11) NOT NULL
);

CREATE TABLE character_stats(
    id_character_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT(10) NOT NULL,
    id_stat INT(10) NOT NULL
);

CREATE TABLE character_weapons(
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT(10) NOT NULL,
    id_weapon INT(10) NOT NULL
);

CREATE TABLE items(
    id_item INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    name CHAR(24) NOT NULL,
    type INT(11) NOT NULL,
    equipable TINYINT(1) NOT NULL,
    consumable TINYINT(1) NOT NULL,
    rarity INT(11) NOT NULL,
    quantity INT(11) NOT NULL,
    shape INT(11) NOT NULL,
    uses INT(11) NOT NULL,
    id_character INT(10) UNSIGNED NOT NULL
);

CREATE TABLE item_types(
    id_item_type INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_item INT(10),
    id_type INT(10)
);

CREATE TABLE stats (
    id_stat INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    reputation INT(11) NOT NULL,
    speed INT(11) NOT NULL,
    morality INT(11) NOT NULL,
    hunger INT(11) NOT NULL,
    stamina INT(11) NOT NULL,
    defense INT(11) NOT NULL,
    reflex INT(11) NOT NULL,
    id_character INT(10) UNSIGNED NOT NULL
);

CREATE TABLE students(
    id_student INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    surname VARCHAR(32) NOT NULL,
    age INT(6) NOT NULL,
    DNI INT(16) NOT NULL,
    email VARCHAR(32) NOT NULL,
    comments TEXT,
    schooled INT(1)
);

CREATE TABLE users(
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(16) NOT NULL,
    password CHAR(32) NOT NULL,
    email VARCHAR(35) NOT NULL,
    birthdate DATE NOT NULL,
    registered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE weapons(
    id_weapon INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    weapon VARCHAR(32) NOT NULL,
    level INT(11) NOT NULL,
    price FLOAT NOT NULL,
    damage INT(11) NOT NULL,
    critical INT(11) NOT NULL,
    weight FLOAT NOT NULL,
    id_weapon_type INT(10)
);

CREATE TABLE weapon_types(
    id_weapon_type INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    weapon_type VARCHAR(16) NOT NULL
);

CREATE TABLE comments(
    id_comment INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `comment` TEXT,
    fecha_hora DATETIME NOT NULL DEFAULT now()
);

INSERT INTO characters ( name, age, gender, level, health, height, weight, origin ) VALUES
( "El Fary", 86, "N", 200, 70, 1.2, 47, "GY"),
( "El Cigala", 54, "M", 150, 80, 2.4, 150, "RU"),
( "El Churumbel", 33, "M", 33, 33, 3.3, 333, "AS"),
( "El Kiko", -1, "F", 69, 100, 1.1, 420, "RE")
;

INSERT INTO character_items ( id_character, id_item ) VALUES
( 1, 1),
( 2, 2),
( 3, 3),
( 4, 4)
;

INSERT INTO character_stats ( id_character, id_stat ) VALUES
( 1, 1),
( 2, 2),
( 3, 3),
( 4, 4)
;

INSERT INTO character_weapons ( id_character, id_weapon ) VALUES
( 2, 3),
( 3, 1),
( 1, 3),
( 1, 4)
;

INSERT INTO items ( name, type, equipable, consumable, rarity, quantity, shape, uses, id_character ) VALUES
( "Guitarra_Flamenca", 2, 1, 0, 30, 67, 4, 1, 0),
( "Bollo", 5, 0, 1, 5, 0, 3, 1, 4),
( "Piti", 3, 1, 1, 80, 5, 2, 1, 3),
( "Piano", 2, 0, 0, 67, 34, 1, 1, 3),
( "Escobilla_del_vater", 1, 1, 0, 324, 3456, 1, 1, 3)
;

INSERT INTO item_types ( id_item, id_type ) VALUES
( 1, 1), -- Guitarra Flamenca es de tipo Música
( 2, 2), -- Bollo es de tipo Alimentación
( 3, 3), -- Piti es de tipo Arma
( 4, 4), -- Escobilla del vater es de tipo Herramienta
( 5, 5)  -- Piano es de tipo Objeto
;

INSERT INTO stats ( reputation, speed, morality, hunger, stamina, defense, reflex, id_character ) VALUES
( 100, 40, 80, 0, -1, 0, 0, 1),
( 69, 50, 40, 0, 5, 1, 10, 2),
( 75, 30, 75, 0, 50, 7, 0, 3),
( 90, 60, 80, 4, 0, 1, 30, 4)
;

INSERT INTO students ( name, surname, age, DNI, email, comments, schooled ) VALUES
("Francisco", "Franco", 30, '37106582', "elcaudillo@vivaespaña.es", "odia a los moros", 0 )
;

INSERT INTO users (username, password, email, birthdate) VALUES
('admin', 'd986dcc5db7d15701e017ff15b6e9ed1', 'usr0.admin+faryadventures@enti.cat', '0001-01-01'),
('user', 'fab7b771433219728d312648312374a7', 'usr1.user+faryadventures@enti.cat', '2001-09-11')
;

INSERT INTO weapons ( weapon, level, price, damage, critical, weight, id_weapon_type ) VALUES
("puños", 5, 0, 10, 5, 0.25, 1),
("SPAS-12", 42, 400, 370, 0, 0, 2),
("Extensible", 40, 540, 680, 0 , 0, 1)
;

INSERT INTO weapon_types( weapon_type ) VALUES
("RANGED"),
("MELEE")
;
