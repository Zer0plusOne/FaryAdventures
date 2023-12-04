DROP TABLE IF EXISTS users;

CREATE TABLE users( 
	id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(16) NOT NULL,
       	password CHAR(32) NOT NULL,
       	email VARCHAR(32) NOT NULL,
	birthday DATE NOT NULL,
	registered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, password, email, birthday, registered)
VALUES ("El_Generalisimo", "fe7d81814e02eb1296757e75bb3c6be9" , "viva@españa.facha", "2001-09-11", "2023-11-27 14:21:03");
INSERT INTO users (username, password, email, birthday)
VALUES ("xokas", "fe7d81814e02eb1296757e75bb3c6be9" , "marruecos@noesunjuego.com", "2007-07-07");
INSERT INTO users (username, `password`, email, birthday)
VALUES('Falillo', MD5('sanroque777'), 'falillosanroque@veryhotmail.com', '2004-05-01');
