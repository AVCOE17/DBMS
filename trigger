create database Company;
use Company;
create table Employee(name varchar(100), id int , age int, salary varchar (100), address varchar (100));
describe Employee;
insert into Employee values ("employee 1", 1, 18, "10000000", "xyz"), ("employee 2", 2, 20, "20000000", "pqr");
select * from Employee;
create table backup(name varchar(100), id int , age int, salary varchar (100), address varchar (100));
delimiter $$
create trigger t1
before delete 
on Employee for each row
begin
insert into backup(name, id, salary) values(old.name, old.id, old.salary);
end $$
delimiter;
delete from Employee where name="employee 1";
select * from Employee;
select * from backup;
// similarly for after delete, before update, after update;
