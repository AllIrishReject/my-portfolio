-- Creating the Database
CREATE DATABASE Ireflix;

-- Using the newly created database
USE Ireflix;

-- Creating tables in the database
CREATE TABLE Users(
Username varchar (35) PRIMARY KEY,
Name varchar (35) NOT NULL,
Surname varchar (35) NOT NULL,
password varchar (15) NOT NULL)
;

CREATE TABLE Actors(
Name VARCHAR (35) NOT NULL,
Surname VARCHAR (35) NOT NULL,
Nationality VARCHAR (50) NOT NULL,
PRIMARY KEY (Name, Surname))
;

CREATE TABLE Directors(
Name VARCHAR (35) NOT NULL,
Surname VARCHAR (35) NOT NULL,
Nationality VARCHAR (50) NOT NULL,
PRIMARY KEY (Name, Surname))
; 

CREATE TABLE Movies(
ID_Movie INT PRIMARY KEY,
Name_of_the_Movie VARCHAR (35) NOT NULL,
Genre VARCHAR (20) NOT NULL,
Duration INT NOT NULL,
Qualification_from_Users INT NOT NULL,
Name_of_the_Protagonist_Actor VARCHAR (35) NOT NULL,
Surname_of_the_Protagonist_Actor VARCHAR (35) NOT NULL,
FOREIGN KEY (Name_of_the_Protagonist_Actor , Surname_of_the_Protagonist_Actor) REFERENCES Actors(Name, Surname)
);

CREATE TABLE Series(
ID_of_the_Series INT PRIMARY KEY,
Genre VARCHAR (20) NOT NULL,
Qualification_from_Users INT NOT NULL,
Name_of_the_Protagonist_Actor VARCHAR (35) NOT NULL,
Surname_of_the_Protagonist_Actor VARCHAR (35) NOT NULL,
Number_of_Seasons INT NOT NULL,
FOREIGN KEY (Name_of_the_Protagonist_Actor , Surname_of_the_Protagonist_Actor) REFERENCES Actors(Name, Surname)
);

-- Looking at the tables once data has been imported
SELECT * FROM Actors;
SELECT * FROM Directors;
SELECT * FROM Movies;

-- Adding colums to existing tables
ALTER TABLE Series
ADD COLUMN Year INT;

SELECT * FROM Series;

ALTER TABLE Movies
ADD COLUMN Year INT;

SELECT * FROM Movies;

-- Finding movies and series one actor, Brandon Vargas, has been in

-- Count the number of movies where the actor is a protagonist
SELECT COUNT(*) AS number_of_movies_or_series
FROM Movies
WHERE Name_of_the_Protagonist_Actor = 'Brandon' AND Surname_of_the_Protagonist_Actor = 'Vargas'

UNION ALL

-- Count the number of series where the actor is a protagonist
SELECT COUNT(*) AS number_of_movies_or_series
FROM Series
WHERE Name_of_the_Protagonist_Actor = 'Brandon' AND Surname_of_the_Protagonist_Actor = 'Vargas';

-- Actor Brandon Vargas returns having stared in 0 movies or series

-- Obtaining a list of actors in films that HAVE NOT been in a series

SELECT DISTINCT Name_of_the_Protagonist_Actor, Surname_of_the_Protagonist_Actor
FROM Movies
WHERE (Name_of_the_Protagonist_Actor, Surname_of_the_Protagonist_Actor) NOT IN (
    SELECT Name_of_the_Protagonist_Actor, Surname_of_the_Protagonist_Actor
    FROM Series
);
