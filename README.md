# Student Management System
* http://studeduportal.in
## Features

* Students should be able to view all the course titles.

### Feature 1: List all Course
```sql
  create table courses(course_code number primary key,
                     course_name varchar2(40) not null,
                     course_fee number not null,
                     course_duration_weeks number,
                     pre_req varchar2(100)
                     );
```
                     
Query:
```sql
insert into courses(course_code,course_name,course_fee,course_duration_weeks,pre_req) 
values(111,'C++',8000,2,'C language');
insert into courses(course_code,course_name,course_fee,course_duration_weeks,pre_req) 
values(222,'Core java',10000,3,'Basics of oops');
insert into courses(course_code,course_name,course_fee,course_duration_weeks) 
values(333,'HTML',5000,1);
select*from courses;
```

### Feature 2: List batch details and student details
```sql
create table batches(batch_code number Primary key ,
                     course_code number not null unique,
                     starting_date date not null,
                     end_date date,
                     timings varchar2(20) not null,
                     foreign key(course_code) references courses(course_code),
                     constraint batch_date_cq check(starting_date <= end_date)
                     );
 create table students(adm_no number primary key,batch_code number not null unique,
                       roll_no number not null unique,full_name varchar2(50) not null,
                       father_name_or_guardian_name varchar2(50)not null ,email_id varchar2(100) not null,
                       phone_no varchar2(15) not null,date_of_joining date,
                       foreign key(batch_code) references batches(batch_code));
  ```
                     
 Query:
 ```sql

 
insert into batches (batch_code,course_code,starting_date,end_date,timings)
values(121,111,'13-MAY-08','17-JUN-08','4:30 TO 6:00 PM'); 
insert into batches (batch_code,course_code,starting_date,timings)
values(131,333,'12-JUNE-08','4.00 TO 6:00 PM'); 
select*from batches;
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(123,121,23,'Meena','Ramesh','meenaramesh@gmail.com','9362931110','13-MAY-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(456,131,42,'Sathya','Murali','sathyamurali@gmail.com','9837489490','12-JUNE-08');
select*from students;
```
### Feature 3: List Payment Details
```sql
   create table payments(receipt_no number primary key,
                      adm_no number not null unique,
                      amount_paid number not null,
                      pay_date date not null,
                      re_marks varchar2(30),
                      foreign key(adm_no)references students(adm_no),
                      constraint amount_paid_cq check(amount_paid>0)
                       );
```
Query:
```sql
insert into payments(receipt_no,adm_no,amount_paid,pay_date,re_marks)
values(1,123,2000,'12-MAY-08','cash');
insert into payments(receipt_no,adm_no,amount_paid,pay_date,re_marks)
values(2,456,5000,'11-JUNE-08','cheque');
select*from payments;
'''



