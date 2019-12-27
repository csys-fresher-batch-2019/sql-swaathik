drop table books ;
create table books (
book_id number primary key,
book_name varchar2(50) not null,
author_name varchar2(50)not null,
price number not null,
publisher varchar2(50) not null,
version number,
category_book varchar2(50)not null,
active number not null default 1 check(active in(1,0)),
constraint price_cq check(price>=0)
);
drop table orders;
create table orders (
order_id number primary key,
user_name varchar2(50)not null,
book_id number not null ,
ordered_date timestamp not null,
delivered_date timestamp not null,
total_amount number not null,
quantity number not null,
status varchar2(30) not null,
constraint book_id_fk foreign key(book_id)references books(book_id),
constraint quantity_cq check(quantity>=1)
);
insert into books(book_id,book_name,author_name,price,publisher,version,category_book,active) 
values(1,'Java','JamesGosling',900,'AA Publishers',1,'Technical',1);
insert into books(book_id,book_name,author_name,price,publisher,version,category_book,active) 
values(2,'code compute','steve',600,'Microsoft',1,'Education',0);

insert into orders(order_id,user_name,book_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1,'Sruthi',3,sysdate,sysdate,900,3,'Delivered');
insert into orders(order_id,user_name,book_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1,'Sruthi',2,sysdate,sysdate,900,3,'Not available');

Alter table orders
add comments varchar2(100);


insert into orders(comments)
values('reporting time');


select* from books Order by book_id;
select* from orders;


