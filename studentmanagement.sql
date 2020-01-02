drop table course;
create table courses(course_code number primary key,
                     course_name varchar2(40) not null,
                     course_fee number not null,
                     course_duration_days number,
                     pre_req varchar2(100)
                     );
insert into courses(course_code,course_name,course_fee,course_duration_days,pre_req) 
values(111,'C++',8000,40,'C language');
insert into courses(course_code,course_name,course_fee,course_duration_weeks,pre_req) 
values(222,'Core java',10000,60,'Basics of oops');
insert into courses(course_code,course_name,course_fee,course_duration_weeks) 
values(333,'HTML',5000,1);
select*from courses;
drop table batches;
create table batches(batch_code number Primary key ,
                     course_code number not null unique,
                     starting_date date not null,
                     end_date date,
                     timings varchar2(20) not null,
                     foreign key(course_code) references courses(course_code),
                     constraint batch_date_cq check(starting_date <= end_date)
                     );
insert into batches (batch_code,course_code,starting_date,end_date,timings)
values(121,111,'13-MAY-08','30-JULY-08','4:30 TO 6:00 PM'); 
insert into batches (batch_code,course_code,starting_date,timings)
values(131,333,'12-JUNE-08','4.00 TO 6:00 PM'); 
select*from batches;
drop table students;
create table students(adm_no number primary key,batch_code number not null ,
                       roll_no number not null unique,full_name varchar2(50) not null,
                       father_name_or_guardian_name varchar2(50)not null ,email_id varchar2(100) not null,
                       phone_no varchar2(15) not null,date_of_joining date,
                       foreign key(batch_code) references batches(batch_code));
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(123,121,23,'Meena','Ramesh','meenaramesh@gmail.com','9362931110','13-MAY-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(456,131,42,'Sathya','Murali','sathyamurali@gmail.com','9837489490','12-JUNE-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(170,131,63,'ajmeer','abdul','ajmeer@gmail.com','9362931110','13-MAY-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(200,131,82,'helen','george','helen@gmail.com','9837489490','12-JUNE-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(223,121,34,'lily','balu','lilybalu@gmail.com','9362931110','13-MAY-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(150,131,56,'Jasmine','ganesh','jasmine@gmail.com','9837489490','12-JUNE-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(146,121,73,'babu','surya','babusurya@gmail.com','9362931110','13-MAY-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(132,131,89,'vijay','karthik','vijaykarthik@gmail.com','9837489490','12-JUNE-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(120,121,65,'surya','Ajith','surya@gmail.com','9362931110','13-MAY-08');
insert into students(adm_no,batch_code,roll_no,full_name,father_name_or_guardian_name,email_id,phone_no,date_of_joining)
values(119,131,51,'preethi','jegan','preethijegan@gmail.com','9837489490','12-JUNE-08');
select*from students;
drop table payments;
create table payments(receipt_no number primary key,
                      adm_no number not null unique,
                      amount_paid number not null,
                      pay_date date not null,
                      re_marks varchar2(30),
                      foreign key(adm_no)references students(adm_no),
                      constraint amount_paid_cq check(amount_paid>0)
                       );
insert into payments(receipt_no,adm_no,amount_paid,pay_date,re_marks)
values(1,123,2000,'12-MAY-08','Paid registration fees');
insert into payments(receipt_no,adm_no,amount_paid,pay_date,re_marks)
values(2,456,5000,'11-JUNE-08','Paid course fees');
select*from payments;
----Order----
select*from students order by batch_code,date_of_joining;
----Display all payments made in the particular month----
select*from payments where pay_date between '1-MAY-08' AND '31-MAY-08';
----Display Payment type----
select*from payments where re_marks like '%cheque%';
----Display Batches that are currently running----
select*from batches where end_date IS NULL;
----Display batches of core java and html----
select*from batches where course_code IN(111,222);
----Display due date for the payment assuming due date is 7 days from date of joining----
select full_name,batch_code,date_of_joining,date_of_joining+7 due_date from students;
----Display details of students where due date for payment is over----
select full_name,batch_code,date_of_joining+7 from students where date_of_joining+7 < sysdate order by date_of_joining+7;
----Display details of courses with a proposal increase of 10% in course fee less for courses with course fee less than or equal to 5000----
select course_name,course_fee,course_fee*1.1 new_fee from courses where course_fee <= 5000;
----Display students whose name contains letter 's' and fathers name contains letter 'p'----
select*from students where full_name like '%S%' and father_name_or_guardian_name like '%M%';
----Display batches that are running for more than 45 days----
select*from batches where sysdate - starting_date > 45;
----Display the difference between actual ending date and estimated ending date for batches assuming each batch takes 2 months----
select batch_code, end_date, add_months(starting_date,2) apoxenddate,  ADD_MONTHS(starting_date,2)- end_date daysdifference from batches where course_code = 111 and end_date is not null;
----Display payments with amount more than 1000 made by students with admission number within certain range in the last 10 days----
select * FROM payments WHERE adm_no >= 100 AND adm_no<=150 AND  amount_paid > 1000 OR SYSDATE - pay_date <= 10; 
----Display approx date when cheque will be realised for cheque payments---- 
select  receipt_no, amount_paid, pay_date, pay_date + 3 REALISATION_DATE FROM  payments WHERE re_marks LIKE '%cheque%';
----Display total amount paid by all students----
select sum(amount_paid)from payments;
----Display the highest receipt number for payments in the month of MAY 2008---- 
select max(receipt_no) from payments where pay_date between '1-MAY-08' AND '31-MAY-08';   
----Display batchcode and no of students in the batch---- 
select batch_code,count(roll_no) from students group by batch_code;
----Display the most recently started batched for each course---- 
select course_code,max(starting_date) from batches group by course_code;
----Display total amount paid on each day---- 
select trunc(pay_date),sum(amount_paid) from payments group by trunc(pay_date);
----Display no of batches for each course in the current year---- 
select course_code,count(*) no_batches from batches where to_char(starting_date,'yyyy')= to_char(sysdate,'yyyy') group by course_code;
----Display batches where the number of students is more than 10----
select batch_code,count(roll_no)from students group by batch_code having count(roll_no)>4;

 

  
