create table customers
(
cust_no number(10),
cname varchar2(20),
city varchar2(20),
primary key(cust_no)
);

create table orders
(
order_no number(10),
odate date,
cust_no number(10),
order_amount number(10),
primary key(order_no),
foreign key(cust_no) REFERENCES customers(cust_no)
);


create table item
(
item_no number(10),
price decimal(12,2),
primary key(item_no)
);


create table order_item
(
order_no number(10),
item_no number(10),
qty number(10),
foreign key (order_no) REFERENCES orders(order_no),
foreign key (item_no) REFERENCES item(item_no)
);


create table warehouse
(
warehouse_no number(10),
city varchar2(20),
primary key(warehouse_no)
);

create table shipment
(
order_no number(10),
warehouse_no number(10),
dates date,
foreign key (order_no) REFERENCES orders(order_no),
foreign key (warehouse_no) REFERENCES warehouse(warehouse_no)
);

select * from customers;

insert into customers values(771,'pushpa k','bangalore');
insert into customers values(772,'suman','mumbai');
insert into customers values(773,'sourav','calicut');
insert into customers values(774,'laila','hyderabad');
insert into customers values(775,'faizal','bangalore');
 
select * from customers;

select * from orders;

insert into orders values(111,'22-jan-02',771,18000);
insert into orders values(112,'30-jul-02',774,6000);
insert into orders values(113,'03-apr-03',775,9000);
insert into orders values(114,'03-nov-03',775,29000);
insert into orders values(115,'10-dec-03',773,29000);
insert into orders values(116,'19-aug-04',772,56000);
insert into orders values(117,'10-sep-04',771,20000);
insert into orders values(118,'20-nov-04',775,29000);
insert into orders values(119,'13-feb-05',774,29000);
insert into orders values(120,'13-oct-05',775,29000);

select * from orders;

insert into item values(5001,503.00);
insert into item values(5002,750.00);
insert into item values(5003,150.00);
insert into item values(5004,600.00);
insert into item values(5005,890.00);

select * from item;

insert into ORDER_ITEM values (111,5001,50);
insert into ORDER_ITEM values (112,5003,20);
insert into ORDER_ITEM values (113,5002,50);
insert into ORDER_ITEM values (114,5005,60);
insert into ORDER_ITEM values (115,5004,90);
insert into ORDER_ITEM values (116,5001,10);
insert into ORDER_ITEM values (117,5003,80);
insert into ORDER_ITEM values (118,5005,50);
insert into ORDER_ITEM values (119,5002,10);
insert into ORDER_ITEM values (120,5004,45);

select * from order_item;



insert into warehouse values(1,'delhi');
insert into warehouse values(2,'bombay');
insert into warehouse values(3,'chennai');
insert into warehouse values(4,'bangalore');
insert into warehouse values(5,'bangalore');
insert into warehouse values(6,'delhi');
insert into warehouse values(7,'bombay');
insert into warehouse values(8,'chennai');
insert into warehouse values(9,'delhi');
insert into warehouse values(10,'bangalore');

select * from warehouse;


insert into shipment values(111,1,'10-feb-02');
insert into shipment values(112,5,'10-sep-02');
insert into shipment values(113,8,'10-feb-03');
insert into shipment values(114,3,'10-dec-03');
insert into shipment values(115,9,'19-jan-04');
insert into shipment values(116,1,'20-sep-04');
insert into shipment values(117,5,'10-sep-04');
insert into shipment values(118,7,'30-nov-04');
insert into shipment values(119,7,'30-apr-05');
insert into shipment values(120,6,'21-dec-05');

select * from shipment;


