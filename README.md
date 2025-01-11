
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
    4. CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.
    5. Advanced SQL Queries: Develop complex queries to analyze and retrieve specific data.

## Project Structure

###    1. Database Setup

![Logo](Data_modeling.jpg)

- Database Creation: Created a database named `LI_DB`.
- Table Creation: Created tables for product, employee, customer, policy_details, and policy_type. Each table includes relevant columns and relationships.
```sql
drop database if exists LI_DB;
create database if not exists LI_DB;

use LI_DB;

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
#Update Record
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
show databases; #displays all databases on the server

show tables; #displays all tables in the current database

show columns in product; # 1. displays column information for a specified table

show columns from product; # 2. displays column information for a specified table

show index from product; # 1. displays index information for a specified table
show index in product; # 2. displays index information for a specified table
show indexes in product; # 3. displays index information for a specified table
show indexes from product; # 4. displays index information for a specified table
```
- #### Check all tables in the current database
```sql

```
