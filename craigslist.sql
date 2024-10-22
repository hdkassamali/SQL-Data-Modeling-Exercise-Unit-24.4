-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;



CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(25) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL
);

INSERT INTO regions (city, state) 
VALUES 
('Los Angeles', 'California'),
('New York', 'New York'),
('Detroit', 'Michigan');


INSERT INTO users (username, password, preferred_region_id)
VALUES 
('lebronfan', 'lakers123', 1),
('cookielover12', 'baseball432', 2),
('coffeedrinker81', 'javachip2323', 3),
('skunkman99', 'password5!', 1);


INSERT INTO categories (name, description)
VALUES 
('Sports', 'For all your sports needs!'),
('Gardening', 'Learn from other gardeners');

INSERT INTO posts (title, text, user_id, category_id, region_id) 
VALUES 
('Bronny to the Lakers', 'Lebron recruited his son to the Lakers with the 55th pick', 1, 1, 1),
('Pretty Flowers', 'My favorite flowers are lillies, roses, and sunflowers', 2, 2, 3),
('Best Mulch', 'Mulch from Home Depot is the best quality!', 2, 2, 2),
('Cowboys Suck Again', 'Jerry is running the team into the ground lol.', 3, 1, 2),
('Chiefs Win', 'The Kansas City Referees have won again', 4, 1, 1);