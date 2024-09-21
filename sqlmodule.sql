create database library;
use library;
create table branch(branch_no int primary key, manager_id int, branch_address varchar(100), contact_no varchar(12));
insert into branch (branch_no, manager_id, branch_address, contact_no)values
(1, 50, '123 maringg, tottenham', '333-1234'),
(2, 51, '456 donn, tottenham', '333-5678'),
(3, 52, '789 Oak, tottenham', '333-8765'),
(4, 53, '135 Maple , tottenham', '333-4321'),
(5, 54, '246 Pine, tottenham', '333-6789');
select * from branch;

create table employee(emp_id int primary key, emp_name varchar(20),position varchar(290), salary decimal(10,2),branch_no int,
foreign key (branch_no) references branch(branch_no));
insert into employee( emp_id, emp_name,position,salary,branch_no) values 
(1, 'Ronaldo', 'Librarian', 45000.00, 1),
(2, 'Virat', 'Assistant Librarian', 35000.00, 2),
(3, 'Sachin', 'Manager', 60000.00, 3),
(4, 'Messi', 'Librarian', 47000.00, 4),
(5, 'Di maria', 'Clerk', 32000.00, 5);
select * from employee;

create table books(ISBN varchar(100) primary key, book_title varchar(100),category varchar(100), rent_price decimal(10,2),status enum('yes','no'),
author varchar(100),publisher varchar(100));
insert into Books (ISBN, book_title, category, rent_price, status, author, publisher) values
('123-3-16-148410-0', 'The Great town', 'Fiction', 15.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('123-1-4028-9462-6', 'A Brief time', 'Science', 20.00, 'yes', 'Stephen Hawking', 'Bantam'),
('123-0-14-028333-4', '1984', 'Dystopian', 12.00, 'no', 'George Orwell', 'Penguin Books'),
('123-0-7432-7356-5', ' Kill a ', 'Fiction', 18.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('123-0-307-17511-2', 'The Catcher in the Rye', 'Fiction', 10.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company');
select * from books;

create table customer(customer_id int primary key,customer_name varchar(30),customer_address varchar(50),reg_date date);
 insert into Customer (customer_id, customer_name, customer_address, reg_date) values
(1, 'Dos', '456 donn, tottenham', '2021-05-15'),
(2, 'Lal', '123 maringg, tottenham', '2020-08-22'),
(3, 'Anna', '135 Maple , tottenham', '2023-01-10'),
(4, 'Jose', '246 Pine, tottenham',  '2022-11-30'),
(5, 'Rafi',  '246 Pine, tottenham',  '2019-03-05');
select * from customer;

create table issuestatus(issue_id int primary key,issued_cust int, issued_book_name varchar(50),issued_date date, ISBN_book varchar(50),
foreign key (issued_cust) references customer(customer_Id),foreign key (ISBN_book) references books(ISBN));
insert into issuestatus (issue_id, issued_cust, issued_book_name, issued_date, ISBN_book) values
(1, 1, 'The Great town', '2023-07-01', '123-3-16-148410-0'),
(2, 2, '1984', '2023-06-15', '123-0-14-028333-4'),
(3, 3, ' Kill a ', '2023-08-05', '123-0-7432-7356-5'),
(4, 1, 'A Brief Time', '2023-07-20', '123-1-4028-9462-6'),
(5, 4, 'The Catcher in the Rye', '2023-05-25', '123-0-307-17511-2');
select * from issuestatus;

create table returnstatus (return_id int primary key,return_cust int,return_book_name varchar(100),return_date date,ISBN_book2 varchar(20),
foreign key (Return_cust)references Customer(Customer_Id),foreign key (ISBN_book2) references Books(ISBN));
insert into returnstatus (return_id, return_cust, return_book_name, return_date, ISBN_book2) values
(1, 1, 'The Great town', '2023-08-01', '123-3-16-148410-0'),
(2, 2, '1984', '2023-07-01', '123-0-14-028333-4'),
(3, 3, 'To Kill a ', '2023-08-10', '123-0-7432-7356-5'),
(4, 1, 'A Brief Time', '2023-08-05', '123-1-4028-9462-6'),
(5, 4, 'The Catcher in the Rye', '2023-06-15', '123-0-307-17511-2');
select * from returnstatus;

select book_title,category,rent_price from books where status='yes';

select emp_name,salary from employee order by salary desc;

select B.book_title, C.customer_name from issuestatus ISS 
jOIN books B ON ISS.ISBN_book = B.ISBN 
JOIN customer C ON ISS.issued_cust = C.customer_id;

select category,count(*) as TotalBooks from books group by category;

select emp_name,position from employee where salary>50000;

select C.customer_name from customer C 
left join issuestatus ISS on C.customer_id = ISS.issued_cust where C.reg_date < '2022-01-01' and ISS.issued_cust IS null;

select branch_no, count(*) as TotalEmployees from branch group by branch_no;

select distinct C.customer_name from issuestatus ISS
join customer C on ISS.issued_cust = C.customer_id 
where month(ISS.issued_date) = 6 and year(ISS.issued_date) = 2023;

select book_title from books where book_title like '%history%';

select branch_no ,count(*) as EmployyeCount from employee group by branch_no having count(*)>5;

select E.Emp_name, B.branch_address from employee E 
join branch B on E.branch_no = B.branch_no 
where E.position = 'Manager';

select distinct C.customer_name from IssueStatus ISS 
join books B on ISS.ISBN_book = B.ISBN 
join customer C on ISS.issued_cust = C.customer_id 
where B.rent_price > 25;

#drop database library;






