/*create database*/
create database store;
use store;
create table countries(
code int primary key,
name varchar(25) unique,
continent_name varchar(25) not null
);
create table users(
id int primary key,
full_name varchar(20),
email varchar(20) unique,
gender char(1) check(gender= 'f' or gender= 'm'),
date_of_birth varchar(15),
country_code int,
foreign key (country_code) references countries(code)
);
create table orders(
id int primary key,
user_id int,
foreign key (user_id) references users(id),
status varchar(30) check(status= 'start' or status= 'finish')
);
create table order_products(
order_id int,
product_id int,
primary key (order_id, product_id),
foreign key (order_id) references orders(id),
foreign key (product_id) references orders(id),
quantity int default 0
);
create table products(
id int primary key,
price int default 0,
name varchar(10) not null,
status varchar(10) check(status= 'valid' or status= 'expired')
);

use store;
alter table users
add column created_at datetime default current_timestamp;

use store;
alter table orders
add column created_at datetime default current_timestamp;

use store;
alter table products
add column created_at datetime default current_timestamp;

use store;
insert into countries 
values('id','Taeef', 'Asia');

use store;
insert into users
values('1','Taeef ALanzi','emailde@gmail.com', 'f', '1999-10-16', 0);

use store;
insert into orders
values('1','45557','start', '1999-10-16');

use store;
insert into order_products
values('5','6','0');

use store;
insert into products
values('7','macha','20','expired');

select * from users;
update countries 
set continent_name='Australia' where code= 'cc';

use store;
delete from proudects 
where id= '1';
