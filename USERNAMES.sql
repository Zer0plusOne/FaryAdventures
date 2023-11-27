DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(16) NOT NULL,
    password CHAR(32) NOT NULL,
    email VARCHAR(32) NOT NULL,
    birthdate DATE NOT NULL
    registered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
INSERT INTO users (username, password, email, birthdate) VALUES
('admin', 'd986dcc5db7d15701e017ff15b6e9ed1', 'usr0.admin+faryadventures@enti.cat', '0001-01-01'),
('user', 'fab7b771433219728d312648312374a7', 'usr1.user+faryadventures@enti.cat', '2001-09-11');

