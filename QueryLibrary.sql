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

 insert into Category values ('Romance')
 insert into Category values ('Fantasy')
 insert into Category values ('Family saga')
 insert into Category values ('Crime novel')

 insert into Author values ('H. Rider Haggard','United Kingdom')
 insert into Author values ('Cao Xueqin','China')
insert into Author values ('Agatha Christie','United Kingdom')
insert into Author values ('J. K. Rowling','Canada')
insert into Author values ('Antoine de Saint-Exupéry','United States')

 insert into Book values ('She: A History of Adventure',1868
 ,(select id from Category where Name like '%Romance%' )
 ,(select id from Author where Name like '%Rider Hagga%' ))

insert into Book values ('Dream of the Red Chamber',1887
 ,(select id from Category where Name like '%Family saga%' )
 ,(select id from Author where Name like '%Cao Xueqin%' ))

 insert into Book values ('And Then There Were None',1887
 ,(select id from Category where Name like '%Crime novel%' )
 ,(select id from Author where Name like '%Agatha%' ))

  insert into Book values ('Harry Potter and the Philosophers Stone',1997
 ,(select id from Category where Name like '%Fantasy%' )
 ,(select id from Author where Name like '%J. K. Rowling%' ))

   insert into Book values ('The Little Prince',1997
 ,(select id from Category where Name like '%Fantasy%' )
 ,(select id from Author where Name like '%Antoine de Saint-Exupéry%' ))

  
   