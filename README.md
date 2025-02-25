# Life Insurance Data Analysis using SQL

## Project Overview

### Project Title: Life Insurance Analysis

### Database: `LI_DB`

This project demonstrates the implementation of Life Insurance using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries.

![Logo](Logo.jpg)


## Objective

    1. Set up the Life insurance Database: Create and populate the database with tables for product,
       employee, customer, policy_details and policy_type.
    2. CRUD Operations: Perform Create, Read, Update, and Delete operations on the data.
    3. SQL Administrative Commands: Managing and maintaining SQL database systems efficiently.
    4. Table Modification Commands: Managing and modifying table schema for optimal performance.
    5. CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.
    6. SQL Execution Order: The sequence in which a SQL query is processed.
    7. Advanced SQL Queries: Develop complex queries to analyze and retrieve specific data.

## Project Structure

###    1. Database Setup

![Logo](Data_modeling.jpg)

- Database Creation: Created a database named `LI_DB`.
- Table Creation: Created tables for product, employee, customer, policy_details, and policy_type. Each table includes relevant columns and relationships.
```sql
-- Create Database 'LI_DB'
drop database if exists LI_DB;
create database if not exists LI_DB;

use LI_DB; #To select the database to work

-- Create table 'product'
drop table if exists product;
create table if not exists product
(
	product_code varchar(10) primary key
   ,product_name varchar(50) not null
);

-- Create table 'customer'
drop table if exists customer;
create table if not exists customer
(
	customer_id varchar(10) primary key
   ,customer_name varchar(50) not null
);

-- Create table 'employee'
drop table if exists employee;
create table if not exists employee
(
	emp_code varchar(15) primary key
   ,emp_name varchar(70) not null
);

-- Create table 'policy_type'
drop table if exists policy_type;
Create table if not exists policy_type(
 ptype_code int primary key
,ptype varchar(10) not null
);

-- Create table 'policy_details'
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

```
### 2. CRUD Operations

- #### Create: Create tables and insert data into the tables.
  ##### 1. Creation involves three main steps: creating the database, creating tables, and adding data: database and tables already established the next step involves populating the tables with data, mostly data import to the databases through CSV files.
  ##### 2. Manual Data Import Method
```sql

insert into policy_type
 (ptype_code, ptype)
values
 (4999, 'New')
,(3999, 'Renewal');
```
- #### Read: Retrieve and display data from various tables.
```sql
select * from product;
select * from customer;
select * from employee;
select * from policy_details;
select * from policy_type;
```
- #### Update: Update record in the policy_type table.
```sql
update policy_type
set ptype = 'NewPolicy'
where ptype = 'New';

```
- #### Delete: Remove records from the tables as needed.
```sql
truncate table employee; #removes all rows from a specified table

delete from employee
where emp_code is null; #delete all rows from employee where conditions are met
```
### 3. SQL Administrative Commands
- #### SQL Administrative Commands: Managing and maintaining SQL database systems efficiently.
```sql
-- Display all 'Databases' on the server
show databases;

-- Display all 'Tables' in the current database
show tables; 

-- Display 'Columns' information for a specified table
show columns in product;
show columns from product;

-- Display 'Index' information for a specified table
show index from product;
show index in product;

show indexes in product;
show indexes from product;

-- Display the structure of a table
DESCRIBE policy_details;

-- Display the 'Server' version
SELECT VERSION();
SHOW VARIABLES LIKE '%version%';

-- Display the 'Server' variables
SHOW GLOBAL VARIABLES;
SHOW SESSION VARIABLES;

-- Display the 'running' processes
SHOW FULL PROCESSLIST;
SHOW PROCESSLIST;
```
### 4. Table Modification Commands: Managing and modifying table schema for optimal performance
- #### Add Column:
```sql
alter table product
add column product_type varchar(20) not null;
```
- #### Drop Column:
```sql
alter table employee
drop column channel;
```
- #### Rename Table:
```sql
alter table emp
rename to employee;
```
- #### Modify Column schema:
```sql
alter table employee
modify channel varchar(30) null;
```
- #### Change Column Name (Rename Column):
```sql
alter table employee
change channels channel varchar(30) not null;
	#Renaming a column often requires updating its data type
```
### 5. CTAS (Create Table As Select)
- #### CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.
```sql
drop table if exists employee_sales;
create table employee_sales as
select emp_name, count(proposal_no) as total_sales
from employee as emp
join policy_details as pd
	on emp.emp_code = pd.emp_code
group by emp_name
order by total_sales desc;

select * from employee_sales;
```
### 6. SQL Execution Order:
- #### The sequence in which a SQL query is processed.

![Logo](SQL-Execution-Order.jpg)

### 7. Advanced SQL Queries: Develop complex queries to analyze and retrieve specific data
- #### Where Clause
  ##### 1. Retrieve all records with a premium value of 100,000 or higher.
```sql
select * 
from policy_details
where premium >= 100000;
```
  ##### 2. Retrieve all policies issued after '2022-01-01'.
```sql
select * 
from policy_details
where issue_date > '2022-01-01';
```
  ##### 3. Retrieve all policies with a policy status of 'InForce'.
```sql
select * 
from policy_details
where policy_status = 'InForce';
```
  ##### 4. Retrieve all policies with a  premium mode of 'Single'.
```sql
select * 
from policy_details
where premium_mode = 'Single';
```
- #### Group By Clause
  ##### 1. Retrieve the total premium amount for each policy status.
```sql
select policy_status, sum(premium)
from policy_details
group by policy_status;
```
  ##### 2. Retrieve all the policies issued for each product code.
```sql
select product_code, count(proposal_no)
from policy_details
group by product_code;
```
  ##### 3. Retrieve the average premium term for each premium mode.
```sql
select premium_mode, avg(premium)
from policy_details
group by premium_mode;
```
  ##### 4. Retrieve the total sales of each employee.
```sql
select emp_name, count(proposal_no)
from employee
join policy_details
	on employee.emp_code = policy_details.emp_code
group by employee.emp_code;
```
- #### Order By Clause
  ##### 1. Retrieve all policies in ascending order of their issue dates.
```sql
select *
from policy_details
order by issue_date;
```
  ##### 2. Retrieve all the proposals in descending order of their premium amounts.
```sql
select *
from policy_details
order by premium desc;
```
  ##### 3. Retrieve all policies in ascending order of their premium terms.
```sql
select *
from policy_details
order by premium_term;
```
  ##### 4. Retrieved all policies by product name in alphabetical order.
```sql
select *
from policy_details
inner join product
	on policy_details.product_code = product.Product_code
order by product_name;
```
- #### Having Clause
  ##### 1. Retrieve all the employees who have issued more than 10 policies.
```sql
select emp_name
from employee emp
inner join policy_details pd
 on emp.emp_code = pd.emp_code
group by emp.emp_code
having count(emp.emp_code) > 10;
```
  ##### 2. Retrieve all the policy statuses with a total premium amount greater than 1000000.
```sql
select policy_status, sum(premium)
from policy_details
group by policy_status
having sum(premium) > 1000000;
```
  ##### 3. Retrieve all the product codes with an average premium amount greater than 50000.
```sql
select product_code, avg(premium)
from policy_details
group by product_code
having avg(premium) > 50000;
```
  ##### 4. Retrieve the policy type  with a count of policies greater than 2000.
```sql
select ptype, count(proposal_no) as count
from policy_details pd
inner join policy_type pt
	on pd.ptype_code = pt.ptype_code
group by ptype
having count(proposal_no) > 2000;
```
- #### Limit Clause
  ##### 1. Retrieve the top 10 employees who made the highest Sales(Premium).
```sql
select emp_name, sum(premium) Total_Amount
from employee emp
inner join policy_details pd
	on emp.emp_code = pd.emp_code
group by emp.emp_code
order by sum(premium) desc
limit 10;
```
  ##### 2. Retrieve the employee who made the first sale in the year 2024.
```sql
select emp_name, issue_date
from employee emp
inner join policy_details pd
	on emp.emp_code = pd.emp_code
where issue_date >= '2024-01-01'
order by issue_date
limit 1;
```
  ##### 3. Retrieve the top 3 products that contribute the most to the revenue.
```sql
select product_name, sum(premium)
from product pro
inner join policy_details pd
	on pro.Product_code = pd.Product_code
group by pro.Product_code
order by sum(premium) desc
limit 3;
```
  ##### 4. Retrieve the top 5 customers who have the highest premium.
```sql
select customer_name, sum(premium)
from customer cust
inner join policy_details pd
	on cust.customer_id = pd.customer_id
group by cust.customer_id
order by sum(premium) desc
limit 5;
```
- #### Alias: Gives a temporary name to tables or columns
```sql
select premium_mode, count(proposal_no) as Total
from policy_details
group by premium_mode; #The keyword "AS" gives an alias to a table/column.
```
- #### Joins: Combines related table data
  ##### 1. Inner Join: Returns only the rows with matching values in both tables.
```sql
select ptype as Business_type, count(proposal_no) as  Total_sales, sum(premium) Total_revenue
from policy_details as pd
inner join policy_type pt
	on pd.ptype_code = pt.ptype_code
group by Business_type
order by Business_type;
```
  ##### 2. SQL Joins: The Ultimate Data Connection
  #### [Mastering in SQL Joins](https://github.com/Pravanjankuanr/Life-Insurance-Data-Analysis)

### Explore Exciting Projects
#### [Project1](https://github.com/Pravanjankuanr/Life-Insurance-Data-Analysis)
#### [Project2](https://github.com/Pravanjankuanr/Life-Insurance-Data-Analysis)
#### [Project3](https://github.com/Pravanjankuanr/Life-Insurance-Data-Analysis)

## Conclusion

This project effectively demonstrated the application of SQL in analyzing and managing life insurance data, highlighting its efficacy in extracting valuable insights and optimizing data management.
