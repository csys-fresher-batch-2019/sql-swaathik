# Student Management System
* http://studeduportal.in
## Features

* Students should be able to view all the courses.
* Students should be able to view their batch details.
* Students should be able to view their own details.
* Students should be able to view their payment details.
* To Display student record in a particular order(eg:by batch code or by date of joining)
* To Display all payments done by student in a particular month
* To Display payment type (cheque or cash)
* To Display batches that are currently running
* To Display batches of particular course
* To Display due date for the payment assuming due date is 7 days from date of joining
* To Display details of students where due date for payment is over
* To Display details of courses with a proposal increase of 10% in course fee less for courses with course fee less than or equal to   
  specific value.
* To Display students whose name contains letter 's' and fathers name contains letter 'p'
* To Display batches that are running for more than 45 days
* To Display the difference between actual ending date and estimated ending date for batches assuming each batch takes 2 months
* To Display payments with amount more than 1000 made by students with admission number within certain range in the last 10 days
* Grouping of particular data 
(eg:course name,batch code,starting date and ending date
    receipt no,fullname,amountpaid and paydate
    batchcode and no of students in the batch)



### Feature 1: List all Course
```sql
  create table courses(course_code number primary key,
                     course_name varchar2(40) not null,
                     course_fee number not null,
                     course_duration_days number,
                     pre_req varchar2(100)
                     );
insert into courses(course_code,course_name,course_fee,course_duration_days,pre_req) 
values(111,'C++',8000,40,'C language');
insert into courses(course_code,course_name,course_fee,course_duration_days,pre_req) 
values(222,'Core java',10000,60,'Basics of oops');
insert into courses(course_code,course_name,course_fee,course_duration_days) 
values(333,'HTML',5000,50);
```
                     
Query:
```sql
select*from courses;
```

### Feature 2: List batch details 
```sql
create table batches(batch_code number primary key ,
                     course_code number not null,
                     starting_date date not null,
                     end_date date,
                     timings varchar2(20) not null,
                     foreign key(course_code) references courses(course_code),
                     constraint batch_date_cq check(starting_date <= end_date)
                     );
insert into batches (batch_code,course_code,starting_date,end_date,timings)
values(121,111,'20-MAY-2019','30-JULY-2019','4:30 TO 6:00 PM'); 
insert into batches (batch_code,course_code,starting_date,timings)
values(131,333,'13-JAN-2020','4.00 TO 6:00 PM'); 
insert into batches (batch_code,course_code,starting_date,end_date,timings)
values(141,222,'19-OCT-2019','27-DEC-2019','6.00 TO 8.00 PM');

  ```
                     
 Query:
 ```sql
 select*from batches;
 ```
### Feature 3: List Student details
 ```sql
 create table students(adm_no number primary key,batch_code number not null ,
                       roll_no number not null unique,full_name varchar2(50) not null,
                       father_name_or_guardian_name varchar2(50)not null ,email_id varchar2(100) not null,
                       phone_no varchar2(15) not null,date_of_joining date);
                       foreign key(batch_code) references batches(batch_code));
 
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
values(1,123,2000,'11-MAY-08','cash');
insert into payments(receipt_no,adm_no,amount_paid,pay_date,re_marks)
values(2,456,5000,'11-JUNE-08','cheque');
select*from payments;
'''



