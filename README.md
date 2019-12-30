# Student Management System
* http://studeduportal.in
## Features

* Students should be able to view all the course titles.

### Feature 1: List all Course
```sql
create table courses(course_code number primary key,
                     course_name varchar2(40) not null
                     );
```
                     
Query:
```sql
select*from courses;
```





