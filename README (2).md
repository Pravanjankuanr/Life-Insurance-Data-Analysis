
# Life Insurance Data Analysis using SQL

## Project Overview

Project Title: Life Insurance Analysis

Database: `LI_DB`

This project demonstrates the implementation of a Life Insurance using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries.
![Logo](img.png)


## Objective

    1. Set up the Life insurance Database: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
    2. CRUD Operations: Perform Create, Read, Update, and Delete operations on the data.
    3. CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.
    4. Advanced SQL Queries: Develop complex queries to analyze and retrieve specific data.

## Project Structure

###    1. Database Setup

![Logo](image.png)

- Database Creation: Created a database named `LI_DB`.
- Table Creation: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.
```sql
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