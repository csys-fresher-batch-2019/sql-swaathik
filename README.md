# Student Management System
* http://studeduportal.in
## Features

* Students should be able to view all the course titles.

### Feature 1: List all Course
```sql
create table courses(course_code number primary key,
                     course_name varchar2(40) not null unique
                     );
```
                     
Query:
```sql
select*from courses;
```
### Feature 2: List course details and batches
```sql
      alter table courses add course_fee number not null;
      alter table courses add course_duration_weeks number;
      alter table courses add  pre_req varchar2(100);
create table batches(batch_code number Primary key ,
                     course_code number,
                     starting_date date not null,
                     end_date date,
                     timings varchar2(20) not null,
                     foreign key(course_code) references courses(course_code)
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
insert into batches(batch_code,course_code,starting_date,end_date,timings)
values(01,111,to_date('01-01-2010','dd-MM-yyyy'),to_date('14-1-2020','dd-MM-yyyy'),'3.00PM TO 6.00PM');
select*from batches;
```



