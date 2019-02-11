.echo on
.headers on

-- name: Charels Carter
-- file: family.sql
-- date January 7, 2019

drop table if exists family;

crate table family (
	id int,
	name text,
	role text,
	sex int,
	age int
);

insert into family values (1,"Charles","parent",1,68);
insert into family values (2,"Bonnie","parent",0,NULL);
insert into family values (3,"Casie","child",0,39);
insert into family values (4,"jackson","child",1,30);

select * from family;
select name, sex from family where sex = 0;
select name, role from family where role = "child";
