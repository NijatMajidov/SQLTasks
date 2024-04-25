use MovieDB
insert into Countries (CountrieName) values 
('USA'),
('UK'),
('France'),
('Germany'),
('Spain'),
('Turkie')

--select *from Countries

insert into Directors (DirectorName, CountryId) values
('Christopher Nolan', 1),
('Quentin Tarantino', 1),
('Martin Scorsese', 1),
('Steven Spielberg', 1),
('Hayao Miyazaki', 3);

--select *from Directors

insert into Movies ([Name], DirectorId, Price, Rating, AgeRating, ReleaseYear, CountryId) values
('Tenet', 1, 14.99, 7.5, 13, 2020, 1),
('Inception', 1, 12.99, 8.8, 13, 2010, 1),
('Pulp Fiction', 2, 9.99, 8.9, 18, 1994, 1),
('The Godfather', 3, 14.99, 9.2, 18, 1972, 1),
('Schindler''s List', 4, 11.99, 8.9, 15, 1993, 1),
('Spirited Away', 5, 10.99, 8.6, 10, 2001, 3)

insert into Actors (ActorName, CountryId) values
('Leonardo DiCaprio', 1),
('Brad Pitt', 1),
('Tom Hanks', 1),
('Morgan Freeman', 1),
('Scarlett Johansson', 1)

insert into Movieactor (MovieId, ActorId) values
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5)

insert into Users (UserName) values
('user1'),
('user2'),
('user3'),
('user4'),
('user5')

insert into Reviews (MovieId, UserId, ReviewText, ReviewDate) values
(1, 1, 'Great movie!', '2023-05-10'),
(2, 2, 'Classic!', '2023-07-20'),
(3, 3, 'Masterpiece', '2023-09-15'),
(4, 4, 'Heartbreaking story', '2023-11-01'),
(5, 5, 'Wonderful animation', '2023-12-25'),
(6, 1, 'Mind-bending!', '2023-12-30')

insert into Genres (GenreName) values
('Action'),
('Crime'),
('Drama'),
('Animation')

insert into Moviegenre (MovieId, GenreId) values
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4)

insert into Awards (AwardName) values
('Oscar'),
('Golden Globe'),
('BAFTA'),
('Cannes Film Festival'),
('Berlin International Film Festival')

insert into Movieaward (MovieId, AwardId) values
(1, 2),
(2, 1),
(3, 2),
(4, 1),
(4, 3),
(5, 1),
(6, 1)

insert into Languages (Language) values
('English'),
('French'),
('German'),
('Japanese'),
('Turkish')

insert into Movielanguage (MovieId, LanguageId) values
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 4)

SELECT * FROM MovieLanguage;
SELECT * FROM Languages;
SELECT * FROM MovieAward;
SELECT * FROM Awards;
SELECT * FROM MovieGenre;
SELECT * FROM Genres;
SELECT * FROM Reviews;
SELECT * FROM Users;
SELECT * FROM MovieActor;
SELECT * FROM Actors;
SELECT * FROM Movies;
SELECT * FROM Directors;
SELECT * FROM Countries;