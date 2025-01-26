drop database if exists master;
create database if not exists master;

use master;

drop table if exists product;
create table if not exists product
(
	product_code varchar(10) primary key
   ,product_name varchar(50) not null
);

drop table if exists customer;
create table if not exists customer
(
	customer_id varchar(10) primary key
   ,customer_name varchar(50) not null
);

drop table if exists employee;
create table if not exists employee
(
	emp_code varchar(15) primary key
   ,emp_name varchar(70) not null
);

drop table if exists policy_type;
Create table if not exists policy_type(
 ptype_code int primary key
,ptype varchar(10) not null
);

drop table if exists policy_details;
create table if not exists policy_details
(
	proposal_no varchar(20) primary key
   ,customer_id varchar(10) not null
   ,emp_code varchar(15) not null
   ,product_code varchar(10) not null
   ,policy_number varchar(30) not null
   ,premium float not null
   ,issue_date date not null
   ,premium_term int not null
   ,policy_status varchar(25) not null
   ,ptype_code int not null
   ,premium_mode varchar(15) not null
   ,foreign key (customer_id) references customer(customer_id)
   ,foreign key (emp_code) references employee(emp_code)
   ,foreign key (product_code) references product(product_code)
   ,foreign key (ptype_code) references policy_type(ptype_code)
);

insert into policy_type
 (ptype_code, ptype)
values
 (4999, 'New')
,(3999, 'Renewal');

select * from product;
select * from customer;
select * from employee;
select * from policy_details;
select * from policy_type;

update policy_type
set ptype = 'NewPolicy'
where ptype = 'New';

truncate table employee;

delete from employee
where emp_code is null;

show databases;

show tables;

show columns in product;
show columns from product;

show index from product;
show index in product;

show indexes in product;
show indexes from product;

describe policy_details;

SHOW GLOBAL STATUS;

select version();
show variables like '%version%';

show global variables;
show session variables;

show full processlist;
show processlist;

alter table product
add column product_type varchar(20) not null;

alter table employee
drop column channel;

alter table emp
rename to employee;

alter table employee
modify channel varchar(30) null;

alter table employee
change channels channel varchar(30) not null;

create table employee_sales as
select emp_name, count(proposal_no) as total_sales
from employee as emp
join policy_details as pd
	on emp.emp_code = pd.emp_code
group by emp_name
order by total_sales desc;

# Where Clause

select * 
from policy_details
where premium >= 100000;

select * 
from policy_details
where issue_date > '2022-01-01';

select * 
from policy_details
where policy_status = 'InForce';

select * 
from policy_details
where premium_mode = 'Single';

# Group By Clause

select policy_status, sum(premium)
from policy_details
group by policy_status;

select product_code, count(proposal_no)
from policy_details
group by product_code;

select premium_mode, avg(premium)
from policy_details
group by premium_mode;

select emp_name, count(proposal_no)
from employee
join policy_details
	on employee.emp_code = policy_details.emp_code
group by employee.emp_code;

# Order By Clause

select *
from policy_details
order by issue_date;

select *
from policy_details
order by premium desc;

select *
from policy_details
order by premium_term;

select *
from policy_details
inner join product
	on policy_details.product_code = product.Product_code
order by product_name;

# Having Clause

select emp_name
from employee emp
inner join policy_details pd
 on emp.emp_code = pd.emp_code
group by emp.emp_code
having count(emp.emp_code) > 10;

select policy_status, sum(premium)
from policy_details
group by policy_status
having sum(premium) > 1000000;

select product_code, avg(premium)
from policy_details
group by product_code
having avg(premium) > 50000;

select ptype, count(proposal_no) as count
from policy_details pd
inner join policy_type pt
	on pd.ptype_code = pt.ptype_code
group by ptype
having count(proposal_no) > 2000;

# Limit Clause

select emp_name, sum(premium) Total_Amount
from employee emp
inner join policy_details pd
	on emp.emp_code = pd.emp_code
group by emp.emp_code
order by sum(premium) desc
limit 10;

select emp_name, issue_date
from employee emp
inner join policy_details pd
	on emp.emp_code = pd.emp_code
where issue_date >= '2024-01-01'
order by issue_date
limit 1;


select product_name, sum(premium)
from product pro
inner join policy_details pd
	on pro.Product_code = pd.Product_code
group by pro.Product_code
order by sum(premium) desc
limit 3;

select customer_name, sum(premium)
from customer cust
inner join policy_details pd
	on cust.customer_id = pd.customer_id
group by cust.customer_id
order by sum(premium) desc
limit 5;

#Alias
select premium_mode, count(proposal_no) as Total
from policy_details
group by premium_mode;

# Joins

select ptype as Business_type, count(proposal_no) as  Total_sales, sum(premium) Total_revenue
from policy_details as pd
inner join policy_type pt
	on pd.ptype_code = pt.ptype_code
group by Business_type
order by Business_type;
