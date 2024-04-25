--create database BlogDb
--use BlogDb

create table Categories (
Id int primary key identity,
Name nvarchar(20) unique not null 
)
insert into Categories VALUES ('CAR'),('flower')
insert into Categories VALUES ('Russian')
create table Tags (
Id int primary key identity,
Name nvarchar(20) unique not null 
)

insert into Tags VALUES ('#CAR'),('#flower')


create table Users (
Id int primary key identity,
UserName nvarchar(20) unique not null,
FullName nvarchar(20) not null,
Age int check(Age>0 and Age<150) 
)

insert into users values ('user1','User admin',18)
insert into users values ('user2','User2 admin',39)
insert into users values ('sari','sari veli',33)

create table Blogs (
Id int primary key identity,
UserId int references Users(Id),
CategoryId int references Categories(Id),
Title nvarchar(50) check(LEN(Title)>0 and Len(Title)<50) not null
)
insert into Blogs values (1,1,'bla bla')
insert into Blogs values (3,3,'Rusiya')
insert into Blogs values (2,2,'duck')

create table Comments(
Id int primary key identity,
UserId int references Users(Id),
BlogId int references Blogs(Id),
Comment nvarchar(250) check(LEN(Comment)>0 and Len(comment)<250) not null
)
insert into Comments values (1,1,'bla bla')
insert into Comments values (3,3,'?????')
insert into Comments values (2,2,'VAK')

Create table BlogTag(
Id int primary key identity,
TagId int references Tags(Id),
BlogId int references Blogs(Id),
)
INSERT INTO BlogTag VALUES 
(1,1),
(3,2),
(2,3)

create view ups_TitleUserAndFullName
as
select b.Title, u.UserName , u.FullName from Blogs as b
join Users as u on b.UserId = u.Id

select * from ups_TitleUserAndFullName

create view ups_TitleCategoryName
as
select b.Title, c.Name from Blogs as b
join Categories as c on b.CategoryId = c.Id

select * from ups_TitleCategoryName

create procedure ups_UserComments @userId int 
as
select * from Comments as c
where c.UserId = @userId

execute dbo.ups_UserComments 1

create procedure ups_UserBlogs @userId int 
as
select * from blogs as b
where b.UserId = @userId

execute dbo.ups_UserBlogs 2


create function countBlog (@catogoryId INT)
RETURNS	INT	
AS
begin
DECLARE @Count INT 
SELECT @Count =  COUNT(*) from Blogs as b
where b.CategoryId = @catogoryId
return @Count
end

SELECT  DBO.countBlog (1)