-- Active: 1712767786781@@127.0.0.1@5433@practice_db
CREATE TABLE movies (
    id SERIAL PRIMARY KEY, title VARCHAR(255), genre VARCHAR(255), release_year INT, director VARCHAR(255), rating DECIMAL(3, 1) DEFAULT 5
);

INSERT INTO
    movies (
        title, director, release_year, genre
    )
VALUES (
        'The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama'
    ),
    (
        'The Godfather', 'Francis Ford Coppola', 1972, 'Crime'
    ),
    (
        'The Dark Knight', 'Christopher Nolan', 2008, 'Action'
    ),
    (
        'Inception', 'Christopher Nolan', 2010, 'Sci-Fi'
    ),
    (
        'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime'
    ),
    (
        'The Matrix', 'Lana Wachowski', 1999, 'Sci-Fi'
    ),
    (
        'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama'
    ),
    (
        'Fight Club', 'David Fincher', 1999, 'Drama'
    ),
    (
        'Star Wars: Episode V - The Empire Strikes Back', 'Irvin Kershner', 1980, 'Sci-Fi'
    ),
    (
        'Goodfellas', 'Martin Scorsese', 1990, 'Crime'
    );

INSERT INTO
    movies (
        title, director, release_year, genre
    )
VALUES (
        'Starman', 'John Carpenter', 1984, 'Sci-Fi'
    ),
    (
        'Moulin Rouge!', 'Baz Luhrmann', 2001, 'Musical'
    ),
    (
        'The Matrix', 'Lana Wachowski', 1999, 'Sci-Fi'
    ),
    (
        'The Matrix Reloaded', 'Lana Wachowski', 2003, 'Sci-Fi'
    ),
    (
        'The Matrix Revolutions', 'Lana Wachowski', 2003, 'Sci-Fi'
    ),
    (
        'The Fifth Element', 'Luc Besson', 1997, 'Sci-Fi'
    ),
    (
        'The Hitchhiker', 'Garth Jennings', 2005, 'Sci-Fi'
    ),
    (
        'Minority Report', 'Steven Spielberg', 2002, 'Sci-Fi'
    ),
    (
        'AI. Artificial Intelligence', 'Steven Spielberg', 2001, 'Sci-Fi'
    ),
    (
        'Jurassic Park', 'Steven Spielberg', 1993, 'Sci-Fi'
    );

select * from movies;

-- 1. Find the titles of all movies directed by Lana Wachowski.
select title from movies where director = 'Lana Wachowski';

-- 2. Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order.
select DISTINCT
    release_year,
    id
from movies
where
    rating in (2, 9)
ORDER BY release_year ASC, id DESC;

select * from movies;

select count(id) from movies;

CREATE Table movies_clone (
    id SERIAL PRIMARY KEY, title VARCHAR(255), genre VARCHAR(255), release_year INT, director VARCHAR(255), rating DECIMAL(3, 1) DEFAULT 5
)
-- clone the movies table into movies_clone table

insert into movies_clone select * from movies;

select * from movies_clone1;

-- we can also copy selected columns and insert into another column

create table movies_clone1 (
    id SERIAL PRIMARY KEY, title VARCHAR(255), genre VARCHAR(255), release_year INT, director VARCHAR(255), rating DECIMAL(3, 1) DEFAULT 5
);

insert into
    movies_clone1 (
        title, genre, release_year, rating
    )
select
    title,
    genre,
    release_year,
    rating
from movies;
