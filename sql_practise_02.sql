
Select * from student_table;
create table scholarship(student_ref_id int,scholarship_amount int,scholarship_date varchar(50));

insert into scholarship(student_ref_id,scholarship_amount,scholarship_date)
values(201,5000,2025-12-22),
(202,4500,2025-12-21),
(203,3000,2025-12-20),
(204,4000,2025-12-19);

#17. Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
select s.first_name,s.last_name,sch.scholarship_amount,sch.scholarship_date
from student_table as s
inner join scholarship as sch
where s.student_id=sch.student_ref_id;

#18. Write an SQL query to show only odd rows from Student table.

select * from student_table
where student_id % 2 !=0;

#19. Write an SQL query to show only even rows from Student table
select * from student_table
where student_id %2 =0;

#20. List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL for the scholarship details.
select s.student_id,s.first_name,s.last_name,sh.scholarship_amount,sh.scholarship_date
from student_table as s
left join  scholarship as sh
on s.student_id=sh.student_ref_id;

#21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
select * 
from student_table
order by GPA desc
LIMIT 5;

#22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.
select *
from student_table
order by GPA desc
LIMIT 4,1;
# limit 4,1 will skip top 4 records

#23. Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.
select *
from student_table s1
where 5 = (select count(distinct s2.gpa) from student_table s2 where s2.gpa>=s1.gpa);

#24 . Write an SQL query to fetch the list of Students with the same GPA.
select s1.*
from student_table s1,student_table s2
where s1.gpa = s2.gpa
and s1.student_id!=s2.student_id;

#25. Write an SQL query to show the second highest GPA from a Student table using sub-query.
select max(gpa) from student_table
where gpa<(select max(gpa) from student_table);

#26. Write an SQL query to show one row twice in results from a table.
select * 
from student_table
UNION ALL
Select * 
from
student_table
order by student_id;

#27. Write an SQL query to list STUDENT_ID who does not get Scholarship.
select distinct s.student_id 
from student_table s
left join scholarship s2
on s.student_id=s2.student_ref_id
where s2.student_ref_id is null;

#28. Write an SQL query to fetch the first 50% records from a table.
select Floor(count(*)/2) from student_table;



