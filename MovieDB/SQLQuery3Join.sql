use MovieDB
--Qiymət aralığında olan filmlər:
select * from Movies
where Price between 12 and 15;

--2010-dan sonra çəkilmiş filmlər:
select * from Movies
where ReleaseYear >= 2010;

--filmin reytinqi ən az 8.8 və ya daha yüksəkdir:
select * from Movies
where Rating >= 8.8;

--Film adları və rejissorların adları:
select m.Name as MovieName, d.DirectorName
from Movies as m
inner join Directors as d on m.DirectorId = d.Id;

--Film adları, janrlar və mükafatlar:
select  m.Name as MovieName, g.GenreName, a.AwardName
from Movies as m
inner join MovieGenre as mg on m.Id = mg.MovieId
inner join Genres as g on mg.GenreId = g.Id
left join MovieAward as ma on m.Id = ma.MovieId
left join Awards as a on ma.AwardId = a.Id;


--filmin hansı ölkədən olduğu:
select m.Name as MovieName, c.CountrieName as CountryName
from Movies as m
inner join Countries as c on m.CountryId = c.Id;

--film hansı dildedir: 
select m.Name as MovieName, l.Language as MovieLanguage
from Movies as m
inner join MovieLanguage as ml on m.Id = ml.MovieId
inner join Languages as l on ml.LanguageId = l.Id;

--Bir istifadəçinin verdiyi bütün rəylər:
select r.*, u.UserName
from Reviews as r
inner join Users as u on r.UserId = u.Id;

--Bir filme hansı aktyorlarla çəkilib:
select m.Name as MovieName, a.ActorName
from Movies as m
inner join MovieActor as ma on m.Id = ma.MovieId
inner join Actors as a on ma.ActorId = a.Id;