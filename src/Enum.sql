create table publishers (
                            publisher_id serial primary key,
                            publisher_name varchar
);
create table languages(
                          language_id serial primary key,
                          language_name varchar
);

create type gender as enum (
    'Male', 'Female'
    );

create table authors (
                         author_id serial primary key,
                         author_firstName varchar,
                         author_lastName varchar,
                         author_email varchar,
                         author_dateOfBirth date,
                         author_country varchar,
                         gender gender
);

create type genre as enum (
    'DETECTIVE','DRAMA','HISTORY','ROMANCE','BIOGRAPHY','FANTASY'
    );

create table books (
                       book_id serial primary key,
                       book_name varchar,
                       book_country varchar,
                       book_publishedYear date,
                       book_price int,
                       genre genre
);

alter table languages
    alter column language_name set not null;

alter table authors
    add constraint unique_author_email unique(author_email);

alter table books add column language_id int;
alter table books add constraint fk_language foreign key (language_id) references languages(language_id);

alter table books add column publisher_id int;
alter table books add constraint fk_publisher_id foreign key (publisher_id) references publishers(publisher_id);

alter table books add column author_id int;
alter table books add constraint fk_author_id foreign key (author_id) references authors(author_id);
insert into publishers(publisher_name)
values ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');
insert into authors(author_firstName, author_lastName, author_email, author_dateOfBirth, author_country, gender)
values ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', '9/25/1968', 'France', 'Female'),
       ('Patti', 'Walster', 'pwalster1@addtoany.com', '10/31/1965', 'China', 'Female'),
       ('Sonnie', 'Emmens', 'semmens2@upenn.edu', '5/16/1980', 'Germany', 'Male'),
       ('Brand', 'Burel', 'bburel3@ovh.net', '4/24/1964', 'United States', 'Male'),
       ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', '7/3/1967', 'France', 'Male'),
       ('Alexey', 'Arnov', 'larnoldi5@writer.com', '12/29/1964', 'Russia', 'Male'),
       ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', '12/14/1983', 'China', 'Female'),
       ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', '1/29/1960', 'United States', 'Female'),
       ('Boigie', 'Etridge', 'betridge8@ed.gov', '11/17/1978', 'France', 'Male'),
       ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', '9/8/1962', 'Germany', 'Male'),
       ('Margarita', 'Bartova', 'mbartova@example.com', '12/3/1984', 'Russia', 'Female'),
       ('Innis', 'Hugh', 'ihughb@marriott.com', '8/28/1983', 'Germany', 'Male'),
       ('Lera', 'Trimnella', 'ltrimnellc@msn.com', '3/28/1980', 'Russia', 'Female'),
       ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', '8/5/1966', 'Spain', 'Male'),
       ('Loretta', 'Gronaver', 'lgronavere@technorati.com', '10/17/1962', 'United States', 'Female');

insert into languages(language_name)
values ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');

insert into books(book_name,  book_country,publisher_id , book_price, genre, language_id, publisher_id, author_id)
values('Taina', 'Russia', '11/12/2021', '568','DETECTIVE', '5', '12', '6'),
      ('Zvezdopad', 'Russia', '12/9/2004', '446', 'ROMANS', '5', '13', '11'),
      ('Homo Faber', 'Germany', '4/10/2022', '772','FANTASY', '3', '5', '3'),
      ('Der Richter und Sein Henker', 'Germany', '2/1/2011', '780','DETECTIVE', '3', '3', '10'),
      ('Lord of the Flies', 'United States', '7/11/2015', '900','FANTASY', '1', '2', '4'),
      ('Un soir au club', 'France', '1/12/2018', '480','DRAMA', '2', '1', '1'),
      ('Voina', 'Russia', '12/6/2004', '880',  'HISTORY', '5', '4', '13'),
      ('Sun Tzu', 'China', '9/5/2022', '349',  'HISTORY', '4', '4', '2'),


      ('Emil und die Detektive', 'Germany', '6/11/2010', '228','DETECTIVE','3', '5', '10'),
      ('Coule la Seine', 'France', '3/1/2015', '732','FANTASY', '2', '6', '1'),
      ('Love and hatred', 'Russia', '2/3/2012', '763', 'ROMANS', '5', '14', '13'),
      ('Fantastic Mr Fox', 'United States', '3/10/2018', '309','FANTASY', '1', '9', '8'),
      ('Contes de la Bécasse', 'France', '10/5/2019', '378', 'ROMANS', '2', '6', '9'),
      ('“The Death of Ivan Ilyich', 'Russia', '9/24/2000', '814','DRAMA', '5', '6', '6'),
      ('Bonjour Tristesse', 'France', '8/2/2015', '502', 'ROMANS', '2', '8', '5'),
      ('Die Verwandlung', 'Germany', '6/19/2008', '305', 'DETECTIVE','3','7', '12'),
      ('The Inspector Barlach Mysteries', 'Germany', '3/10/2007', '566','DETECTIVE', '3', '3', '3'),
      ('LÉtranger', 'France', '11/14/2017', '422', 'ROMANS', '2', '8', '5'),
      ('Lao Tse', 'China', '7/16/2005', '900','FANTASY', '4', '4', '2'),
      ('Semya', 'Russia', '4/12/2004', '194','DRAMA', '5', '13', '11'),
      ('Empty World', 'United States', '1/4/2008', '324','FANTASY', '1', '11', '15'),
      ('Domainer', 'Germany', '1/6/2020', '420', 'ROMANS', '3', '5', '10'),
      ('The Fault in Our Stars', 'United States', '2/13/2008', '396', 'ROMANS','1', '9', '4'),
      ('Die R uber', 'Germany', '6/25/2020', '300', 'ROMANS', '3', '7', '12'),
      ('Jung Chang', 'China', '5/14/2021', '600',  'HISTORY', '4', '10', '7'),
      ('Les Aventures de Tintin', 'France', '4/10/2015', '582','DRAMA', '2', '1', '5'),
      ('Unvollendete Geschichte', 'Germany', '12/12/2010', '269','DETECTIVE', '3', '5', '10'),
      ('Amy Tan', 'China', '1/9/2023', '486','DRAMA', '4', '4', '7'),
      ('Krasnaya luna', 'Russia', '2/7/2020', '550','FANTASY', '5', '12', '11'),
      ('Emma', 'United States', '10/11/2021', '599', 'BIOGRAPHY','1', '2', '15');

--1.Китептердин атын, чыккан жылын, жанрын чыгарыныз.
select book_name, book_publishedYear, genre from books;
--2.Авторлордун мамлекеттери уникалдуу чыксын.
select distinct author_country from authors;
--3.2020-2023 жылдардын арасындагы китептер чыксын.
select * from books where  book_publishedYear between '2020-01-01' and '2023-12-31';
--4.Детектив китептер жана алардын аттары чыксын.
select book_name , genre from books where genre = 'DETECTIVE';
--5.Автордун аты-жону author деген бир колонкага чыксын.
select concat(author_firstName,' ',author_lastName) as author from authors;
--6.Германия жана Франциядан болгон авторлорду толук аты-жону менен сорттоп чыгарыныз.
select concat(author_firstName,' ',author_lastName) as fullName, author_country from authors where author_country in ('Germany','France')
order by fullName;
--7.Романдан башка жана баасы 500 дон кичине болгон китептердин аты, олкосу, чыккан жылы, баасы жанры чыксын..
select book_name, book_country, book_publishedYear, book_price, genre from books where genre!= 'ROMANCE' and book_price>500;
--8.Бардык кыз авторлордун биринчи 3 ну чыгарыныз.
select * from authors where gender= 'Female' limit 3;
--9.Почтасы .com мн буткон, аты 4 тамгадан турган, кыз авторлорду чыгарыныз.
select * from authors where gender= 'Female' and author_email like '%.com' and  length(author_firstName)=4;
--10.Бардык олколорду жана ар бир олкодо канчадан автор бар экенин чыгаргыла.
select author_country , count(author_id) from authors group by author_country;
--11.Уч автор бар болгон олколорду аты мн сорттоп чыгарыныз.
select author_country , count(author_id) from authors group by author_country having count(author_id)=3 ;
--12. Ар бир жанрдагы китептердин жалпы суммасын чыгарыныз
select genre, sum(book_price) from books group by genre;
--13. Роман жана Детектив китептеринин эн арзан бааларын чыгарыныз
select genre, min(book_price) from books where genre in ('ROMANCE','DETECTIVE') group by genre;
--14.История жана Биографиялык китептердин сандарын чыгарыныз
select genre , count(genre) from books where genre in ('BIOGRAPHY','HISTORY') group by genre;
--15.Китептердин , издательстволордун аттары жана тили чыксын
select book_name, publisher_name from books join publishers on books.publisher_id= publishers.publisher_id;
--16.Авторлордун бардык маалыматтары жана издательстволору чыксын, издательство болбосо null чыксын
select author_firstName ,author_lastName, author_email,author_dateOfBirth, author_country, gender, publisher_name
from authors left join books on authors.author_id = books.author_id left join publishers on books.publisher_id = publishers.publisher_id;
--17.Авторлордун толук аты-жону жана китептери чыксын, китеби жок болсо null чыксын.
select author_firstName ,author_lastName, book_name from authors left join books on authors.author_id= books.author_id;
--18.Кайсы тилде канча китеп бар экендиги ылдыйдан ойлдого сорттолуп чыксын.
select language_name, count(book_id) from languages join books on languages.language_id= books.language_id group by language_name
order by language_name desc;
--19.Издательствонун аттары жана алардын тапкан акчасынын оточо суммасы тегеректелип чыгарылсын.
select publisher_name, round(avg(book_price)) from publishers join books on publishers.publisher_id = books.publisher_id
group by publisher_name order by publisher_name desc;
--20.2010-2015 жылдардын арасындагы китептер жана автордун аты-фамилиясы чыксын.
select author_firstName, author_lastName, book_name from authors join books on authors.author_id = books.author_id where
    book_publishedYear between '2010-01-01' and '2015-12-31';
--21.2010-2015 жылдардын арасындагы китептердин авторлорунун толук аты-жону жана алардын тапкан акчаларынын жалпы суммасы чыксын.
select concat(author_firstName,' ',author_lastName) as fullName, sum(book_price) from authors join books on authors.author_id = books.author_id where
    book_publishedYear between '2010-01-01' and '2015-12-31' group by fullName;














