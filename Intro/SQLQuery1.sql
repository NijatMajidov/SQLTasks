Create Database BB207

use BB207

Create table Departments(Name nvarchar(15))

create table Employees (Name nvarchar(15), Surname nvarchar(20), Salary money, Email nvarchar(30), DepName nvarchar(15))

--delete Employees

alter table Employees
add Id tinyint

alter table Employees
drop column Id

alter table Employees
alter column Id int 

delete Employees
delete Departments

insert into Departments values ('BackEnd')
insert into Departments values ('FrontEnd')
insert into Employees values ('Nicat','Mecidov',null,'mcdov@code.edu.az','BackEnd',1)
insert into Employees values ('Nicat','Mecidov',null,'mcdov@code.edu.az','BackEnd',2)
insert into Employees values ('user','admin',2100,'user@code.edu.az','FrontEnd',3)

Update Employees set Name='Fatime', Surname='Kerimli',Salary=1200, Email= 'kerimli@gmail.com'
where Id=2

insert into Employees values ('user','admin',1000,'user@code.edu.az','FrontEnd',4)
insert into Employees values ('user','admin',900,'user@code.edu.az','FrontEnd',5)
insert into Employees values ('Admin','admin',900,'user@code.edu.az','FrontEnd',6)

select * from Employees
select * from Departments


Select  Name, Surname, Salary from Employees
where Salary>=1000

Select Name+' '+Surname as FullName from Employees

Select Name+' '+Surname as FullName, Salary from Employees
where Salary between 1000 and 2500



Select Name,Surname from Employees
where SUBSTRING(Name,1,1)='A'