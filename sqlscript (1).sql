REM   Script: HackerRank - Hackers and Challenges tables
REM   Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Create Table Hackers (Hacker_Id int, Name varchar(20));

Create Table Challenges (Challenge_ID int, Hacker_Id int);

insert into Hackers (Hacker_Id, Name) values (5077, 'Rose');

insert into Hackers (Hacker_Id, Name) values (21283,'Angela');

insert into Hackers (Hacker_Id, Name) values (62743,'Frank');

insert into Hackers (Hacker_Id, Name) values (88255,'Patrick');

insert into Hackers (Hacker_Id, Name) values (96196,'Lisa');

insert into Hackers (Hacker_Id, Name) values (7777, 'Iryna');

insert into Challenges (Challenge_ID, Hacker_Id ) values (61654,5077);

insert into Challenges (Challenge_ID, Hacker_Id ) values (58302,21283);

insert into Challenges (Challenge_ID, Hacker_Id ) values (40587,88255);

insert into Challenges (Challenge_ID, Hacker_Id ) values (29477,5077);

insert into Challenges (Challenge_ID, Hacker_Id ) values (1220,21283);

insert into Challenges (Challenge_ID, Hacker_Id ) values (69514,21283);

insert into Challenges (Challenge_ID, Hacker_Id ) values (46561,62743);

insert into Challenges (Challenge_ID, Hacker_Id ) values (58077,62743);

insert into Challenges (Challenge_ID, Hacker_Id ) values (18483,88255);

insert into Challenges (Challenge_ID, Hacker_Id ) values (76766,21283);

insert into Challenges (Challenge_ID, Hacker_Id ) values (52382,5077);

insert into Challenges (Challenge_ID, Hacker_Id ) values (74467,21283);

insert into Challenges (Challenge_ID, Hacker_Id ) values (33625,96196);

insert into Challenges (Challenge_ID, Hacker_Id ) values (26053,88255);

insert into Challenges (Challenge_ID, Hacker_Id ) values (42665,62743);

insert into Challenges (Challenge_ID, Hacker_Id ) values (12859,62743);

insert into Challenges (Challenge_ID, Hacker_Id ) values (70094,21283);

insert into Challenges (Challenge_ID, Hacker_Id ) values (34599,88255);

insert into Challenges (Challenge_ID, Hacker_Id ) values (54680,88255);

insert into Challenges (Challenge_ID, Hacker_Id ) values (61881,5077);

insert into Challenges (Challenge_ID , Hacker_Id ) values(1,7777);

insert into Challenges (Challenge_ID , Hacker_Id ) values(2,7777);

insert into Challenges (Challenge_ID , Hacker_Id ) values(3,7777);

insert into Challenges (Challenge_ID , Hacker_Id ) values(4,7777);

insert into Challenges (Challenge_ID , Hacker_Id ) values(5,7777);

insert into Challenges (Challenge_ID , Hacker_Id ) values(6,7777);

with ss as( 
select hk,hn,c, 
row_number() over (partition by c order by hk ) rn 
from  
( 
select  h.hacker_id hk, h.name hn,count(challenge_id) c 
from Hackers h 
join Challenges ch on h.hacker_id= ch.hacker_id 
group by  h.hacker_id, h.name 
order by 3 desc)) 
 
 
select hk,hn,c from ss  
where c!=(select max(c) from ss) and rn=1 
 
 
union  
 
select hk,hn,c from ss  
where c=(select max(c) from ss) 
order by c desc 


