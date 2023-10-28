create database casestudy1010;
use casestudy1010;
create table books (book_id int primary key,title varchar(30),Author varchar(20),publication_year VARCHAR(20),price decimal(7,2),available_qty int);
create table customers (customer_id int primary key,firstname varchar(20),lastname varchar(20),email varchar(30),registration_date varchar(20));
create table orders (order_id int primary key,customer_id int,order_date varchar(20),total_amount decimal(10,2),
foreign key(customer_id) references customers(customer_id));
create table order_details (order_id int,book_id int,quantity int,subtotal decimal(10,2),foreign key(order_id) references orders(order_id),foreign key (book_id) 
references books (book_id));
show tables;
alter table books drop publication_year;
alter table books add publucation_year varchar(5);
alter table customers drop registration_date;
alter table customers add registration_date varchar(5);
insert into books values(194,"Ballinby Boys","Abraham Stackhouse",2008,600,12);
insert into books values (102,"Nothing But Capers","Anastasia Inez",2008,650,10),(103,"Alanna Saves the Day","Arthur McCrumb",2009,700,15),
(104,"Post Alley","Bernard",2009,300,9),(105,"Thatchwork Cottage","Bravig",2010,450,6),(106,"Zero over Twelve","Charles",2010,900,20),
(107,"Portmeirion","Darryl",2012,250,10),(108,"The Mallemaroking","Elmer",2015,950,3),(109,"No More Lightning","Grace",2020,750,6),
(110,"The Winchcombe Railway Museum Heist","Hamlin",2022,960,8),(111,"the life and times of an utterly inconsequential person","Jill",2022,650,20),
(112,"Land Water Sky Space","John W.",2023,700,10),(113,"And I Said Yes","Jonathan",2023,500,12);
select*from books;
insert into customers values(1,"reena","G",'upurdy0@cdbaby.com',2021);
insert into customers values(2,"leena","F",'rvatini1@fema.gov',2021),(3,"roshan","G",'rturbitt2@geocities.jp',2022),
(4,"viki","T",'rkirsz3@jalbum.net',2023),(5,"sunil","G","ckupis4@tamu.edu",2023),(6,"pooja","S",'kadamec5@weather.com',2023);
select*from customers;
alter table orders drop order_date;
alter table orders add order_date varchar(5);
insert into orders values(201,2,2019,1500),(202,3,2020,2000),(203,1,2020,2500),(204,6,2020,1500),(205,5,2021,1600),
(206,1,2022,1200),(207,4,2022,2220),(208,5,2023,1500);
select*from orders;
insert into order_details values(202,194,2,2000),(204,102,2,1500),(201,104,3,1500),(203,105,3,2500),(205,106,2,1600),(206,102,2,1200),(207,105,4,2220),
(208,103,3,1500);
select*from order_details;
select*from books;
alter table books
RENAME column  price TO  publication_year;
drop database casestudy1010;
show databases;



/*1) Retrieve a list of books (book title and author) published in the year 2022.*/
select title,author,publication_year from books where publication_year=2022;

/*2)● Calculate the total revenue generated by the bookstore in the year 2022.*/
select order_date,sum(total_amount) from orders where order_date=2022;

/*3) Find the top 5 bestselling books (based on the total quantity sold) in descending order.*/
select book_id,sum(quantity) from order_details group by book_id order by sum(quantity)desc;

/*4)Determine the customer who made the highest total purchase amount and the total
amount they spent.*/
select customer_id,sum(total_amount) from orders group by customer_id  order by sum(total_amount)desc;

/*5) Calculate the average price of books published before the year 2010.*/
select publication_year, avg(price) from books group by (publication_year) having publication_year<2010;

/*6)● Identify the customer(s) who registered in 2023.*/
select customer_id,registration_date from customers where registration_date=2023;

/*7)● Calculate the total number of orders placed in the database.*/
select count(order_id) from order_details;

/*8)● Find the book(s) with the lowest available quantity in stock.*/
select book_id,title,min(available_qty) from books;

/*9)● Calculate the total revenue for each year from 2020 to 2022.*/
select*from orders;
select order_date,sum(total_amount)from orders group by order_date having order_date between 2020 and 2022;

/*10) ● Determine the customer(s) with the most orders placed.*/
select*from orders;
select*from order_details;
select customer_id,order_id,sum(quantity) from orders join order_details using(order_id) group by customer_id having sum(quantity) order by sum(quantity)desc;









































 

