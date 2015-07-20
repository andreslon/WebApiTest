--Drop Database LibraryTest_db
Create Database LibraryTest_db;

Use LibraryTest_db;

create table Author(
Id int primary key identity(1,1),
Name nvarchar(200)  ,
Country nvarchar(100)  
)

create table Category(
Id int primary key identity(1,1),
Name nvarchar(200)  ,
)

 

create table Book(
Id int primary key identity(1,1),
Title nvarchar(100)  ,
Year int  ,
CategoryId int null foreign key references Category(Id),
AuthorId int null foreign key references Author(Id)
)


 insert into Author values ('Jorge Isaac','Colombia')
 insert into Author values ('Gabriel Garcia Marquez','Colombia')
  

 insert into Category values ('Love')
 insert into Category values ('Thriller')
 

 insert into Book values ('Don Quijote',1992,1,2)

  

  SELECT 
    [Extent1].[Id] AS [Id], 
    [Extent1].[Title] AS [Title], 
    [Extent1].[Year] AS [Year], 
    [Extent1].[CategoryId] AS [CategoryId], 
    [Extent1].[AuthorId] AS [AuthorId]
    FROM [dbo].[Book] AS [Extent1]