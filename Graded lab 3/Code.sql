create database classicmodels;
use classicmodels;

-- ___________________________QUESTION =1
select customerName
from customers as c
where  exists(
select *
 from orders as o
 where c.customerNumber= o.customerNumber
 and year(shippedDate)=2005
);

-- ___________________________QUESTION =2
select  c.customerName
from customers as c
where "On Hold" =any (
select status 
from orders as o
where c.customerNumber=o.customerNumber

);


-- ___________________________QUESTION =3
select c.customerName , count(orderNumber)
from customers as c
left join orders as o  
on c.customerNumber = o.customerNumber
group by c.customerName;


-- ___________________________QUESTION =4
select p.productName, sum(quantityOrdered)
from products as p
join orderDetails as o
on p.productCode=o.productCode
group by productName;


-- ___________________________QUESTION =5
select customerName
from customers as c
join payments as p
on c.customerNumber = p.customerNumber
group by customerName
order by sum(p.amount)
limit 1;


