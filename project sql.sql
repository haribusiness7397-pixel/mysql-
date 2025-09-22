create database pp ;

#task3
select * from pp.customers
where city="North kyle";

select * from products
where Category="furits";

#task4

create table pp.customer(
CustomerID varchar(50) Primary Key,
Name varchar(50) Unique,
Age int Not Null , check(Age >=18),
Gender varchar(50),
City varchar(50),
State varchar(50),
Country varchar(50),
SignupDate varchar(50),
PrimeMember varchar(50));
select * from  hari.customer;

#task5
insert into  pp.products(ProductID, ProductName, Category, SubCategory, PricePerUnit, StockQuantity, SupplierID) values
("b8a16df8-38c0-462d-888d-9c5e42704268","Black Fruit","Fruits","Sub-Fruits-2",376,35,"46b1ce1c-f956-4c83-8ffb-b00e7bf490b1"),
("455b7097-b656-49b8-9cf2-a98d71d3ba89","We Snacks", "Snacks","Sub-Snacks-3", 436, 45, "1d344858-3396-49cf-be1a-6fe391841b4b"),
("089d2e9f-0785-4cb7-85dd-b002fee30c9f","Profit Baker", "Bakery", "Sub-Bakery-4", 987, 50, "d22c6d75-89a6-442c-aaa6-a0e3d4763f0f");

#task6
update  pp.products
set StockQuantity = 754
where ProductID = "d2a3e556-244b-4a92-a5c9-e68099bd71ff";

set sql_safe_updates=0;

#task7
delete from  pp.suppliers
where city ="South Ana";

#task8
alter table  pp.reviews
add check (rating >=1 and rating <= 5);  

alter table  pp.customers
modify PrimeMember varchar(50)
 default "No"; 
 
 #Task9
select * from  pp.orders
where OrderDate > 2024-01-01;

select productid,avg(rating) as avg_rating
from project.reviews 
group by productid
having  avg(rating)>4;

select * ,(Quantity*UnitPrice) as totalsales,
rank()over ( partition by productid order by (Quantity*UnitPrice)desc) as grade
from  pp.order_details;

#task10
select * from  pp.customers;

select a.name,sum(orderamount+deliveryfee) as amnt_spent,
Rank () over(order by sum(orderamount+deliveryfee)desc)as amnt_spent
from customers as a
inner join orders as b
on a.customerid=b.customerid
group by a.name ;

select *,(orderamount+deliveryfee) as spent from pp.orders
where (orderamount+deliveryfee)>5000;

#task 11
select a.orderid,b.productid,b.quantity,b.unitprice,b.discount,
((quantity*unitprice)-discount) as revenue from orders as a
inner join order_details as b
on a.orderid=b.orderid;

select supplierid,productname,stockquantity from products
where stockquantity>0;

#task 12
create table categories (
categoryid int primary key,
categoryname varchar(50),
subcategoryname varchar(50));

 select * from categories;
 
 #task 13
 select productname,revenue from
(select a.productname,sum(b.quantity*b.unitprice) as revenue 
from products as a
inner join order_details as b
on a.productid=b.productid
group  by a.productid,a.productname
order by revenue desc limit 3)
as top3product; 

select customerid,name from customers
where customerid not in (select distinct customerid from orders);

#task14
select city,count(primemember)from customers
group by city;

select distinct a.category,count(b.orderid) from
products as a inner join order_details as b
group by a.category
order by count(b.orderid) desc
limit 3;
