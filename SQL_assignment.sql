create database NameError;

use NameError;

-- CREATE, INSERT, ALTER, UPDATE 
create table students(id int, name varchar(255), department varchar(300), maths int, science int);

insert into students values(1, "Aakash", "CS", 87, 77);
insert into students values(2, "Vicky", "IT", 83, 89);
insert into students values(3, "Chandan", "ECE", 90, 96);
insert into students values(4, "Rahul", "CS", 65, 45);
insert into students values(5, "Rishi", "CS", 43, 56);
insert into students values(6, "Vinay", "ECE", 66, 98);
select * from students;

alter table students change column maths mathematics int;
update students set department="IT" where name="Rahul";

select * from students;

-- AVERAGE, GROUP BY, HAVING, ORDER BY
select department, avg(mathematics) “maths_average” from students
group by department
having avg(mathematics) > 70
order by avg(mathematics) desc;

-- NESTED SUBQUERY
select name students_above_avg_science from students 
where science > (select avg(science) from students);

-- BETWEEN, IN, AND, OR
select * from students
where ((name in ("Aakash", "Chandan")) or (mathematics between 25 and 45));

-- PRIMARY KEY, AUTO_INCREMENT, NOT NULL, CHECK
create table ranks(standings int primary key auto_increment, name varchar(255), english int not null,  check(english > 0));

insert into ranks (name, english) values ("Chandan", 85);
insert into ranks (name, english) values ("Vicky", 78);
insert into ranks (name, english) values ("Aakash", 80);
insert into ranks (name, english) values ("Vinay", 66);
insert into ranks (name, english) values ("Rahul", 34);
insert into ranks (name, english) values ("Rishi", 52);

-- JOIN
select s.name, s.mathematics, s.science, r.english
from students s
inner join ranks r
on s.name=r.name;