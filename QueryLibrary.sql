--Drop Database Library
Create Database Library;

Use Library;

create table Author(
Id int primary key identity(1,1),
Name nvarchar(200) null,
Country nvarchar(100) null
)

create table Category(
Id int primary key identity(1,1),
Name nvarchar(200) null,
)

create table Book(
Id int primary key identity(1,1),
Title nvarchar(100) null,
Year smallint null,
Price money null,
CategoryId int null foreign key references Category(Id),
AuthorId int null foreign key references Author(Id)
)


 insert into Author values ('Jorge Isaac','Colombia')
 insert into Author values ('Gabriel Garcia Marquez','Colombia')
 insert into Author values ('00000000000','Colombia')
 insert into Author values ('00000000000','Colombia')
 insert into Author values ('00000000000','Colombia')



 insert into Category values ('00000000000')
 insert into Category values ('00000000000')
 insert into Category values ('00000000000')
 insert into Category values ('00000000000')
 insert into Category values ('00000000000')


 insert into Book values ('00000000000',2015,20.00,1,2)