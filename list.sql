create table list(
task_no number,task_name varchar2(50) not null,emp_name varchar(50) not null,deadline date,completed_date date,status varchar(10),constraint task_no_uq unique(task_no)
);
insert into list(task_no,task_name,emp_name,deadline,completed_date,status) values (1,'Install Oracle Software','Swaathi',to_date('20-12-2019','dd-MM-yyyy'),to_date('20-12-2019','dd-MM-yyyy'),completed);
insert into list(task_no,task_name,emp_name,deadline,completed_date,status) values (1,'Install jdk Software','Sruthi',to_date('21-12-2019','dd-MM-yyyy'),to_date('20-12-2019','dd-MM-yyyy'),completed);

select *from list where (status='completed');
