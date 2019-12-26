create table list(
task_no number,
  task_name varchar2(50) not null,
  emp_name varchar2(50) not null,
  deadline_date date not null,
  completed_date date ,
  status varchar2(10) not null,
  priority_no number not null,
  constraint priority_no_uq unique(priority_no),
  constraint task_no_pk primary key(task_no),
  constraint status_cq check(status in('completed','bending'))
);
insert into list(task_no,
                 task_name,
                 emp_name,
                 deadline_date,
                 completed_date,
                 priority_no,
                 status) values (1,'Install Oracle Software','Swaathi',to_date('20-12-2019','dd-MM-yyyy'),to_date('20-12-2019','dd-MM-yyyy'),bending,1);
                             update list set completed_date = '23-12-2019';
insert into list(task_no,
                 task_name,
                 emp_name,
                 deadline_date,
                 completed_date,
                 priority_no,
                 status) values (2,'Install jdk Software','Sruthi',to_date('21-12-2019','dd-MM-yyyy'),to_date('20-12-2019','dd-MM-yyyy'),completed,2);

select *from list Order by priority_no;
