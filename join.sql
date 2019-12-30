drop table employees;
create table employees(emp_id number primary key, 
emp_name varchar2(20) not null, 
emp_department varchar2(20) not null, 
emp_salary number not null, 
emp_date_of_joining timestamp not null, 
emp_designation varchar2(20) not null, 
emp_status varchar2(20) default 'Temporary' check(emp_status in('Permanent','Temporary')) 
);
drop table customers;
create table customers(customer_id number primary key, 
customer_name varchar2(20), 
emp_id number not null unique, 
assigned_to_employee varchar2(20) not null, 
assigned_date timestamp not null, 
delivered_date timestamp, 
payment_status varchar2(20) default 'Unpaid' check(payment_status in('paid','Unpaid')) 
);
insert into employees(emp_id,emp_name,emp_department,emp_salary,emp_date_of_joining,emp_designation,emp_status) values 
(1,'Suresh','Product',20000,sysdate,'Developer','Permanent');
insert into employees(emp_id,emp_name,emp_department,emp_salary,emp_date_of_joining,emp_designation,emp_status) values 
(2,'Priya','Sevice',15000,sysdate,'Testing','Permanent');
insert into employees(emp_id,emp_name,emp_department,emp_salary,emp_date_of_joining,emp_designation,emp_status) values 
(3,'Ajay','Functional',14000,sysdate,'Human Resource','Temporary');
insert into employees(emp_id,emp_name,emp_department,emp_salary,emp_date_of_joining,emp_designation,emp_status) values 
(4,'Meena','Sales',10000,sysdate,'Client approach','Permanent');
insert into employees(emp_id,emp_name,emp_department,emp_salary,emp_date_of_joining,emp_designation,emp_status) values 
(5,'Vasanth','Product',20000,sysdate,'Client approach','Permanent');

insert into customers(customer_id,customer_name,emp_id,assigned_to_employee,assigned_date,delivered_date,payment_status) values 
(1,'Santhosh',1,'Suresh',sysdate,sysdate,'paid');
insert into customers(customer_id,customer_name,emp_id,assigned_to_employee,assigned_date,delivered_date) values 
(2,'Mariya',3,'Ajay',sysdate,sysdate);
insert into customers(customer_id,customer_name,emp_id,assigned_to_employee,assigned_date,delivered_date,payment_status) values 
(3,'Jasmine',10,'Vikashni',sysdate,sysdate,'paid');
insert into customers(customer_id,customer_name,emp_id,assigned_to_employee,assigned_date,delivered_date) values 
(4,'Lily',5,'Vasanth',sysdate,sysdate);
insert into customers(customer_id,customer_name,emp_id,assigned_to_employee,assigned_date,delivered_date) values 
(5,'Prakash',4,'Meena',sysdate,sysdate);
select*from employees;
select*from customers;
select e.emp_id,c.customer_id from employees e,customers c where e.emp_id = c.emp_id;
select e.emp_name,c.customer_name from employees e left outer join customers c on e.emp_id=c.emp_id;
select e.emp_name,c.customer_name from employees e right outer join customers c on e.emp_id=c.emp_id;
select e.emp_name,c.customer_name from employees e full outer join customers c on e.emp_id=c.emp_id;
select c.emp_id,c.customer_name, c1.customer_name as customer_id from customers c,customers c1 where c.customer_id=c1.emp_id;
