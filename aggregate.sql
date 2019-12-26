drop table to_do;
create table to_do(task_no number not null unique,
task_name varchar2(20) not null ,
task_performer varchar2(20) not null ,
deadline_date date,
completed_on date,
priority_no number not null unique,
status varchar2(10)
);
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (1,'Install Oracle','Swaathi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),1,'completed');
insert into to_do(task_no,task_name,task_performer,completed_on,priority_no) values (2,'Install jdk','Sruthi',to_date('22-12-2019','dd-MM-yyyy'),2);
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (3,'Install Oracle','Swaathi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),10,'completed');
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (4,'Install jdk','Sruthi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),3,'completed');
insert into to_do(task_no,task_name,task_performer,completed_on,priority_no) values (5,'Install Oracle','Swaathi',to_date('23-12-2019','dd-MM-yyyy'),4);
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (6,'Install jdk','Sruthi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),5,'completed');
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (7,'Install Oracle','Swaathi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),6,'completed');
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (8,'Install jdk','Sruthi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),7,'completed');
insert into to_do(task_no,task_name,task_performer,deadline_date,completed_on,priority_no,status) values (9,'Install Oracle','Swaathi',to_date('22-12-2019','dd-MM-yyyy'),to_date('23-12-2019','dd-MM-yyyy'),8,'completed');
update to_do set status='pending' where deadline_date IS NULL;
SELECT COUNT(task_no), task_name
FROM to_do
GROUP BY task_name;
ORDER BY COUNT(task_no) DESC;
