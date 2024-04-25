--create database BlogDb
--use BlogDb

create table Categories (
Id int primary key identity,
Name nvarchar(20) unique not null 
)

create table Tags (
Id int primary key identity,
Name nvarchar(20) unique not null 
)

create table Users (
Id int primary key identity,
UserName nvarchar(20) unique not null,
FullName nvarchar(20) not null,
Age int check(Age>0 and Age<150) 
)

create table Blogs (
Id int primary key identity,
UserId int references Users(Id),
CategoryId int references Categories(Id),
Title nvarchar(50) check(LEN(Title)>0 and Len(Title)<50) not null
)

create table Comments(
Id int primary key identity,
UserId int references Users(Id),
BlogId int references Blogs(Id),
Comment nvarchar(250) check(LEN(Comment)>0 and Len(comment)<250) not null
)

Create table BlogTag(
Id int primary key identity,
TagId int references Tags(Id),
BlogId int references Blogs(Id),
)

--Insertler 
insert into Categories 
values 
('CAR'),
('flower'),
('Russian')

insert into Tags
values 
('#CAR'),
('#flower'),
('#tag')

insert into Users 
values 
('user1','User admin',18),
('user2','User2 admin',39),
('sari','sari veli',33)

insert into Blogs
values 
(1,1,'bla bla'),
(2,2,'duck'),
(3,3,'Rusiya')

insert into Comments
values
(1,1,'bla bla'),
(2,2,'lorem'),
(3,3,'impus')

INSERT INTO BlogTag 
VALUES 
(1,1),
(3,2),
(2,3)

--viewlar
create view TitleUserAndFullName
as
select b.Title, u.UserName , u.FullName 
from Blogs as b
join Users as u 
on 
b.UserId = u.Id

select * from TitleUserAndFullName

create view TitleCategoryName
as
select b.Title, c.Name
from Blogs as b
join Categories as c 
on
b.CategoryId = c.Id

select * from TitleCategoryName

--prosedurlar
create procedure ups_GetUserComments @userId int 
as
select * from Comments
where UserId = @userId

execute dbo.ups_GetUserComments 1

create procedure ups_GetUserBlogs @userId int 
as
select * from blogs
where UserId = @userId

execute dbo.ups_GetUserBlogs 2

--function
create function countBlog (@catogoryId INT)
RETURNS	INT	
AS
begin
declare @Count INT 
select @Count =  COUNT(*) 
from Blogs as b
where b.CategoryId = @catogoryId
return @Count
end

select  dbo.countBlog (1) as [Count]

create function GetUserBlogs (@UserId INT)
RETURNS	table	
AS
return(
select * from Blogs
    WHERE UserId = @userId
)
SELECT * FROM dbo.GetUserBlogs(3);
--trigger
ALTER TABLE Blogs
ADD isDeleted BIT DEFAULT 0;

CREATE TRIGGER TR_Blogs_Delete
ON Blogs
INSTEAD OF DELETE
AS
BEGIN
    UPDATE b
    SET b.isDelete = 1
    FROM deleted d
    INNER JOIN Blogs b ON d.Id = b.Id;
END;

DELETE FROM Blogs WHERE Id = 3;
SELECT * FROM deleted;
SELECT * FROM Blogs;
