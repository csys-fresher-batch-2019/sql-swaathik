drop table order_items;
create table order_items(
order_id number not null unique,
item_id number not null unique,
book_id number primary key,
quantity number not null,
status varchar2(30),
constraint book_id_fk foreign key(book_id)references books(book_id),
constraint quantity_cq check(quantity>=1)
);
drop table stock;
create table stock(
book_id number primary key,
stock_id number not null,
book_name varchar2(30) not null,
quantity number not null,
constraint book_id_fk foreign key(book_id)references books(book_id),
constraint quantity_cq check(quantity>=1)
);
drop table books;
create table books(
book_id number primary key,
book_name varchar2(20) not null,
price number not null,
  constraint book_id_fk foreign key(book_id)references books(book_id),
  constraint price_cq check(price>=0)
);
drop table orders;
create table orders(
order_id number not null unique,
user_name varchar2(30) not null,
total_amount number not null,
ordered_date timestamp not null,
delivered_date timestamp,
status varchar2(30) default 'Pending' check(status in('Pending','not available','Completed')),
constraint total_amount_cq check(total_amount>=0)
);
insert into books(book_id,book_name,price) values
(1,'java',400);
insert into orders(order_id,user_name,total_amount,ordered_date,delivered_date,status) values
(1,'Swaathi',400,sysdate,sysdate,'Pending');
insert into order_items(order_id,item_id,book_id,quantity,status) values 
(1,1,1,1,'pending');
insert into stock(book_id,stock_id,book_name,quantity) values
(1,1,'Java',5);
select* from order_items order by book_id;
select* from stock order by book_id;
select* from orders order by order_id;
select* from books order by book_id;
-----AVAILABLE STOCK----------
select quantity from stock where book_id=1;
------DISPLAY BOOK NAME AND STOCK------
select book_name,(
(select quantity from stock where book_id=b.book_id)
)from books b
------DISPLAY BOOK NAME AND NO OF QUANTITIES ORDERED---------
select book_name,(
(select sum(quantity) from order_items where book_id = b.book_id)
)from books b;
------CALCULATE AVAILABLE STOCK FOR EACH BOOK------
select book_name,(
(select quantity from stock where book_id = b.book_id) -
(select sum(quantity) from order_items where book_id = b.book_id)
)from books b;
