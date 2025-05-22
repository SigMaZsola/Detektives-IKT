CREATE TABLE Person (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  age INT,
  height_cm INT,
  hair_color VARCHAR(50),
  eye_color VARCHAR(50),
  is_traitor BOOLEAN
);

CREATE TABLE Detective (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  birth_year INT,
  experience_years INT
);


CREATE TABLE Statement (
  id INT PRIMARY KEY AUTO_INCREMENT,
  detective_id INT,
  person_id INT,
  statement_text TEXT,
  truth_value BOOLEAN,
  FOREIGN KEY (detective_id) REFERENCES Detective(id),
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

INSERT INTO Person (name, age, height_cm, hair_color, eye_color, is_traitor) VALUES
('Anna', 28, 165, 'szőke', 'kék', false),
('Bence', 30, 180, 'barna', 'barna', false),
('Csilla', 25, 170, 'fekete', 'zöld', true),
('Dávid', 35, 178, 'szőke', 'kék', false),
('Eszter', 32, 160, 'vörös', 'barna', false),
('Feri', 29, 175, 'barna', 'kék', false),
('Gabi', 27, 168, 'fekete', 'zöld', false),
('Hanna', 31, 172, 'szőke', 'barna', false),
('István', 34, 182, 'barna', 'barna', false),
('Judit', 26, 158, 'vörös', 'kék', false);


INSERT INTO Detective (name, birth_year, experience_years) VALUES
('Nyomozó Kovács', 1980, 15),
('Nyomozó Szabó', 1975, 20);

INSERT INTO Statement (detective_id, person_id, statement_text, truth_value) VALUES
(1, 1, 'Anna szerint Bence gyanúsan viselkedett a kérdéses napon.', false),
(1, 3, 'Csilla állítása szerint nem volt a helyszínen, de ez hamisnak bizonyult.', true),
(2, 2, 'Bence azt mondta, hogy ő korábban távozott.', true),
(2, 4, 'Dávid látta Csillát elhagyni a szobát utoljára.', true),
(3, 5, 'Eszter állította, hogy ő hallotta Csillát telefonálni valakivel titokban.', true),
(3, 6, 'Feri tagadta, hogy kapcsolatban állna az eseménnyel.', true),
(1, 7, 'Gabi azt mondta, hogy Hanna ideges volt a történtek után.', false),
(2, 8, 'Hanna nem tudott alibit igazolni.', true),
(2, 9, 'István Csillára gyanakszik.', true),
(3, 10, 'Judit nem vett részt a találkozón.', false);

