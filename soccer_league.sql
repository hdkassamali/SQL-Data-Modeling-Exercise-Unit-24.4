-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams ON DELETE SET NULL,
    team2 INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    game_id INTEGER REFERENCES games ON DELETE CASCADE
);

CREATE TABLE standings (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE referees_games (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE start_end_dates (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO teams (name) 
VALUES 
('Snowballs'),
('Lions'),
('Tigers'),
('Bears');


INSERT INTO players (name, team_id)
VALUES 
('Ronaldo', 1),
('Beckham', 2),
('Lebron', 3),
('Jordan', 4);

INSERT INTO games (team1, team2)
VALUES 
(1,2),
(1,3),
(4,2),
(3,4);

INSERT INTO referees (name)
VALUES 
('Buddy'),
('Guy'),
('Friend');

INSERT INTO goals (player_id, game_id)
VALUES 
(1,2),
(2,3),
(3,4),
(4,4);

INSERT INTO standings (team_id)
VALUES 
(2),
(1),
(3),
(4);

INSERT INTO referees_games (game_id, referee_id)
VALUES 
(1,1),
(2,3),
(3,1),
(4,2);

INSERT INTO start_end_dates (start_date, end_date)
VALUES 
('2024-10-02', '2025-05-05');
