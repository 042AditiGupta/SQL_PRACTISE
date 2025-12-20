# create database
create database student1;

## create table
use student1;
create table student_table(student_id int,first_name varchar(60),last_name varchar(50),GPA float,enroll varchar(20), major varchar(70));

Insert into student_table
(student_id,first_name,last_name,GPA,enroll,major)
values
(201,"Shivansh","mahajan",8.79,2022-09-10,"science"),
(202,"umesh","sharma",9.01,2022-09-16,"maths"),
(203,"rakesh","kumar",5.6,2021-03-07,"biology");

Insert into student_table
(student_id,first_name,last_name,GPA,enroll,major)
values
(204,"Radha","sharma",9.2,2022-09-24,"biology"),
(205,"Kush","kumar",5.6,2021-06-07,"maths"),
(206,"Pankaj","Chopra",7.8,2021-03-07,"science"),
(207,"Prem","kumar",9.89,2021-03-07,"biology"),
(208,"aditi","kumari",5.6,2021-03-07,"maths");

#1. Write a SQL query to fetch "FIRST_NAME" from the Student table in upper case and use ALIAS name as STUDENT_NAME.
use student1;
select upper(first_name) as STUDENT_NAME from student_table;

# Write a SQL query to fetch unique values of MAJOR Subjects from Student Table
select distinct major from student_table;

# 3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.
select substring(first_name,1,3) from student_table; 

#The SUBSTRING() function extracts a portion of the string. Here, the function starts at position 1 and retrieves the next 3 characters from FIRST_NAME.

# 4 . Write a SQL query to find the position of alphabet ('a') int the first name column 'Shivansh' from Student table.
select instr(lower(first_name),"a") from  student_table where first_name = "Shivansh";
# explanation : The INSTR()function finds the position of the first occurrence of the specified character ('a') in the string. For the name 'Shivansh', 'a' is at the 5th position.

#5. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.
select distinct major , length(major) from student_table
group by major; 

#6. Write a SQL query to print FIRST_NAME from the Student table after replacing 'a' with 'A'.
select replace(first_name,'a','A') from student_table ;

# 7. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.'
select concat(first_name,' ',last_name) as complete_name from student_table;
# concat() combines both first_name and last_name and separated by space

# 8. Write a SQL query to print all Student details from Student table order by FIRST_NAME Ascending and MAJOR Subject descending .
select * from student_table
order by first_name asc,major desc;

#9. Write a SQL query to print details of the Students with the FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
select * from student_table
where first_name ="prem" or first_name= "Shivansh";

# or 

select * from student_table
where first_name in("Prem","Shivansh");

#10. Write a SQL query to print details of the Students excluding FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
select * from student_table
where first_name NOT in( "Prem" ,"Shivansh"); 
# The NOT IN operator filters out rows where FIRST_NAME is 'Prem' or 'Shivansh'.


# 11. Write a SQL query to print details of the Students whose FIRST_NAME ends with 'a'.
select  * from student_table 
where first_name like "%a";

#  12. Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains five alphabets.
SELECT * 
FROM student_table
WHERE FIRST_NAME LIKE '____a';

# 13. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
select * from student_table
where GPA between 9.00 and 9.99;

#14. Write an SQL query to fetch the count of Students having Major Subject ‘maths’.
select count(student_id) from student_table 
where major="maths";

#15. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
select concat(first_name,'  ', last_name) as full_name from student_table
where GPA >=8.5 and GPA<=9.5;

#16. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
select major,count(major) 
from student_table
group by major
order by count(major) desc;

