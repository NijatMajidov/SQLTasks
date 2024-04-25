--create database MovieDB
--use MovieDB

create table Countries(
Id int primary key identity,
CountrieName nvarchar(30) not null
)
create table Directors(
Id int primary key identity,
DirectorName nvarchar(25) not null,
CountryId int foreign key references Countries(Id)
)

create table Movies(
Id int primary key identity,
[Name] nvarchar(40) not null,
DirectorId int foreign key references Directors(Id),
Price decimal not null,
Rating float not null,
AgeRating int not null,
ReleaseYear int not null,
CountryId int foreign key references Countries(Id)
)

create table Actors(
Id int primary key identity,
ActorName nvarchar(35) not null,
CountryId int foreign key references Countries(Id)
)

create table MovieActor(
Id int primary key identity,
MovieId int references Movies(Id),
ActorId int references Actors(Id)
)

create table Users(
Id int primary key identity,
UserName nvarchar(30) not null
)

create table Reviews(
Id int primary key identity,
MovieId int references Movies(Id),
UserId int references Users(Id),
ReviewText nvarchar(max) not null,
ReviewDate date not null,
)

create table Genres(
Id int primary key identity,
GenreName nvarchar(20) not null
)

create table MovieGenre(
Id int primary key identity,
MovieId int references Movies(Id),
GenreId int references Genres(Id)
)

create table Awards(
Id int primary key identity,
AwardName nvarchar(50) not null
)

create table MovieAward(
Id int primary key identity,
MovieId int references Movies(Id),
AwardId int references Awards(Id)
)

create table Languages(
Id int primary key identity,
Language nvarchar(50) not null
)

create table MovieLanguage(
Id int primary key identity,
MovieId int references Movies(Id),
LanguageId int references Languages(Id)
)