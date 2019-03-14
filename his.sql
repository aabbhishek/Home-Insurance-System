create database his;
use his;
create table user_info(fname char(20),lname char(20),dob char(10),email varchar(50),password varchar(60));
truncate user_info;
drop table user_info;
select * from user_info;

create table owner_info(email varchar(20),name char(40),dob varchar(10),con_num char(10),location varchar(80));
select * from owner_info;
truncate owner_info;