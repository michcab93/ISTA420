.echo on
.headers on

--Name: Michelle Caballero
--File: people.sql
--Date: 22 January 2019

DROP TABLE IF EXISTS men;

CREATE TABLE men (
id int,
name text,
wid int);

drop table if exists women;

create table women (
id int,
name text,
hid int);

insert into men values  (1, 'Al', 6);
insert into men values  (2, 'Bod', null);
insert into men values  (3, 'Chuck', 2);
insert into men values  (4, 'Dan', 4);
insert into men values  (5, 'Ed', null);
insert into men values  (6, 'Fritz', 1);

insert into women values  (1, 'Gail', 6);
insert into women values  (2, 'Helen',3);
insert into women values  (3, 'Iren', null);
insert into women values  (4, 'Jackie', 4);
insert into women values  (5, 'Kindra', null);
insert into women values  (6, 'Linda', 1);

select * from men;
select * from women;

-- innerjoin
select m.id, m.name, m.wid, w.name, w.hid
from men as m
inner join women as w
on m.id = w.hid;

--outer join
select m.id, m.name, m.wid, w.id, w.name, w.hid
from men as m
outer join women as w
on m.id = w.hid;

--left outer join
select m.id, m.name, m.wid, w.id, w.name, w.hid
from men as m
left outer join women as w
on m.id = w.hid;

select m.id, m.name, m.wid, w.id, w.name, w.hid
from men as m
left outer join women as w
where m.id = w.hid;
