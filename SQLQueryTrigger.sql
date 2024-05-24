create database  lastSql
use lastSql

create table Users(
id int primary key identity,
userName nvarchar(225),
email nvarchar(225)
)

create table Operations(
id int primary key identity,
[type] nvarchar(225),
userId int,
[date] date
)
drop table Operations

create table DeletedUsers(
id int primary key identity,
userName nvarchar(225),
userId int,
[date] date
)

create trigger deleteType
on users
after delete
as
begin
insert into DeletedUsers(userName,userId,[date])
select username,id,getDate()
from deleted
end


create trigger insertType
on users
after insert 
as
begin
insert into operations ([type],userId,[date])
select 'insert', Id, GetDate()
from inserted
end


create trigger updateType
on users
after update
as
begin
insert into operations([type],userId,[date])
select 'update', id,getDate()
from inserted
end



