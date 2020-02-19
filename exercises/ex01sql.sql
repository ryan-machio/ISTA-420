.echo on
.headers on

--name: cars exercises
--script: cars.sql
--date: January 14, 2020

drop table if exists dogpharmacy;

create table dogpharmacy (
ID integer primary key,
breed text,
color text,
weight integer, 
condition text,
temperature float
);
insert into dogpharmacy values (1, 'golden retriever', 'yellow', 30, 'ill', 88.5);
insert into dogpharmacy values (1, 'german shephard', 'black', 60, 'healthy', 98.6);
insert into dogpharmacy values (1, 'black labrador', 'black', 40, 'ill', 88.9);
insert into dogpharmacy values (1, 'chihuahua', 'brown-black', 5 'ill', 93.5);
insert into dogpharmacy values (1, 'malamute', 'blue', 90, 'healthy', 98.6);

select * from dogpharmacy;

