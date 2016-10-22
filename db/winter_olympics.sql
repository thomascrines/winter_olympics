DROP TABLE athletes;
DROP TABLE teams;
DROP TABLE events;
DROP TABLE disciplines;
DROP TABLE results;

CREATE TABLE teams (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
code VARCHAR(3),
flag_url TEXT,
);

CREATE TABLE athletes (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
gender VARCHAR(6),
team_id INT4 REFERENCES teams(id) ON DELETE CASCADE
);

CREATE TABLE disciplines (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
);

CREATE TABLE events (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
gender VARCHAR(6),
discipline_id INT4 REFERENCES disciplines(id) ON DELETE CASCADE
);

CREATE TABLE results (
id SERIAL4 PRIMARY KEY,
event_id INT4 REFERENCES events(id) ON DELETE CASCADE,
gold_id INT4 REFERENCES athletes(id) ON DELETE CASCADE,
silver_id INT4 REFERENCES athletes(id) ON DELETE CASCADE,
bronze_id INT4 REFERENCES athletes(id) ON DELETE CASCADE
);