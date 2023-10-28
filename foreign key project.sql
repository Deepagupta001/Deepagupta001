create database Membership;
use membership;
create table Members(Cust_id int primary key,Joint_date date);
insert into members values(101,'2015-06-05'),(102,'2002-11-12'),(103,'2000-01-26'),(104,'2016-07-09'),(105,'2001-12-11'),
(106,'2008-10-19'),(107,'2022-05-29'),(108,'1999-08-13'),(109,'2000-09-16'),(110,'2005-06-28'),(111,'2011-11-29'),(112,'2015-08-23'),(113,'2022-02-14'),
(114,'2017-03-19'),(115,'2020-12-12'),(116,'2001-04-06'),(117,'2004-07-16'),(118,'2005-10-18'),(119,'2020-06-15'),(220,'2022-09-14');
select*from members;
create table Menu(Product_id int primary key,Product_Name varchar(20),Price decimal(7,2));
insert into menu values(301,'Tooth paste',500),(302,'Bath soap',1000),(303,'face powder',2000),(304,'Brash',500),(305,'cloth soap',1000),
(306,'scrup',600),(307,'face wash',3500),(308,'face scrup',800),(309,'baby powder',1000),(310,'baby cream',1500),(311,'face cream',6000),
(312,'hand wash',600),(313,'detergent powder',1200),(314,'toilet cleaner',900),(315,'room freshner',500),(316,'cookies',3000),(317,'baby rash cream',500),
(318,'body lotion',1200),(319,'sunscreen',600),(320,'baby diaper',3200);
select*from menu;
create table sales(Cust_id int, order_date date, Product_id int,foreign key (Cust_id) references Members(Cust_id),foreign key (Product_id) references 
Menu(Product_id));
use membership;
describe sales;
insert into sales values(110,'2022-10-15',315);
insert into sales values(118,'2022-11-18',318),(103,'2022-12-25',319),(101,'2022-06-15',316),(102,'2023-01-29',317);
insert into sales values(113,'2022-03-15',314),(104,'2023-03-24',313);
insert into sales values(220,'2022-10-14',303),(117,'2023-01-30',320),(119,'2021-05-16',311);
insert into sales values(105,'2019-12-25',301),(106,'2018-06-30',302);
insert into sales values(107,'2023-01-14',310),(108,'2022-04-29',312),(109,'2023-02-16',304),(111,'2015-06-30',305),(112,'2022-08-16',305),
(114,'2020-02-15',306),(115,'2022-12-12',307),(116,'2022-08-13',308);
select*from sales;

select max(price) from menu;
select price,product_id from menu where price =(select max(price) from menu);
select min(price) from menu;
select product_name,price from menu where price=(select min(price) from menu);


select cust_id, joint_date from members where joint_date between '2000-01-01' and '2020-01-01';
select*from members,sales;


select product_Name, cust_id from menu,sales;
select joint_date,order_date,s.cust_id from sales s,members m where s.cust_id=m.cust_id;
select joint_date,order_date,s.cust_id from sales s join members m on(s.cust_id=m.cust_id);
select joint_date,order_date,s.cust_id from sales s join members m using(cust_id);


alter table sales rename column cust_id to customerid;
select*from sales;
alter table sales rename column customerid to cust_id;

select count(distinct cust_id) from members;
select product_name from menu;
select*from menu;
select product_name,price,case product_name when 'Tooth paste' then '5% discount' when 'bath soap' then 
'2%disxount' else '1%discount' end 'offer' from menu;

select product_name from menu order by product_name;
select product_name from menu order by product_name desc;
select price from menu order by price desc;
select price,product_name from menu where product_name='Tooth paste';
select avg(price) from menu;
select *from menu where price>(select avg(price) from menu);
select product_name,cust_id from menu join sales using(product_id);


select product_name,s.product_id,s.cust_id from menu join sales s using(product_id);
select max(price) from menu;
select product_name,price from menu where price=(select max(price) from menu);
select joint_date,year(joint_date) from members;

select joint_date,day(joint_date) from members;
