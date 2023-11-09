-- LAS AVENTURAS DEL FARY

DROP TABLE IF EXISTS characters;
CREATE TABLE characters (
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(24) NOT NULL,
    age INT(11),
    gender CHAR(2)
    level INT(11),
    health INT,
    height FLOAT,
    weight FLOAT,
    origin CHAR(2)
);
INSERT INTO characters ( name, age, gender, level, health, height, weight, origin ) VALUES
( "El Fary", 86, "N", 200, 70, 1.2, 47, "GY"),
( "El Cigala", 54, "M", 150, 80, 2.4, 150, "RU"),
( "El Churumbel", 33, "M", 33, 33, 3.3, 333, "AS"),
( "El Kiko", -1, "F", 69, 100, 1.1, 420, "RE")
;

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DROP TABLE IF EXISTS stats;
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
INSERT INTO stats ( reputation, speed, morality, hunger, stamina, defense, reflex, id_character ) VALUES
( 100, 40, 80, 0, -1, 0, 0, 1),
( 69, 50, 40, 0, 5, 1, 10, 2),
( 75, 30, 75, 0, 50, 7, 0, 3),
( 90, 60, 80, 4, 0, 1, 30, 4)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DROP TABLE IF EXISTS items;
CREATE TABLE items (
    id_stat INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
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
INSERT INTO items ( name, type, equipable, consumable, rarity, quantity, shape, uses, id_character ) VALUES
( "Guitarra_Flamenca", 2, 1, 0, 30, 67, 4, 1, 0),
( "Bollo", 5, 0, 1, 5, 0, 3, 1, 4),
( "Piti", 3, 1, 1, 80, 5, 2, 1, 3),
( "Piano", 2, 0, 0, 67, 34, 1, 1, 3),
( "Escobilla_del_vater", 1, 1, 0, 324, 3456, 1, 1, 3)
;
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DROP TABLE IF EXISTS character_items;
CREATE TABLE character_items (
    id_character_item INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_character CHAR(24) NOT NULL,
    id_item INT(11) NOT NULL
);
INSERT INTO character_items ( id_character, id_item ) VALUES
( 1, 1),
( 2, 2),
( 3, 3),
( 4, 4)
;