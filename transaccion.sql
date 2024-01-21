START TRANSACTION;

INSERT INTO characters (name, age, gender, level, health, height, weight, origin) VALUES
("El Gref", 20, "M", 999, 999, 999, 999, "Andorra");

INSERT INTO weapons (weapon, level, price, damage, critical, weight, id_weapon_type) VALUES
("Abuela", 80, 999, 999, 999, 999, 1);

INSERT INTO character_weapons ( id_character, id_weapon ) VALUES
(5, 4),
(5, 1);

COMMIT;

ROLLBACK; // Por una solicitud de calse
