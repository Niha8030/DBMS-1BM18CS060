 create table SUPPLIERS(
 sid number(5),
 sname varchar(20),
 city varchar(20),
 primary key(sid)
 );
 
create table PARTS(
pid number(5),
pname varchar(20),
color varchar(10),
primary key(pid),
);

create table CATALOG(
sid number(5), 
pid number(5),
cost float(6),
primary key(sid, pid),
foreign key(sid) references SUPPLIERS(sid),
foreign key(pid) references PARTS(pid)
);

insert into suppliers values(10001, 'Acme Widget','Bangalore');
insert into suppliers values(10002, 'Johns','Kolkata');
insert into suppliers values(10003, 'Vimal','Mumbai');
insert into suppliers values(10004, 'Reliance','Delhi');
insert into suppliers values(10005, 'Mahindra','Mumbai');

insert into PARTS values(20001, 'Book','Red');
insert into PARTS values(20002, 'Pen','Red');
insert into PARTS values(20003, 'Pencil','Green');
insert into PARTS values(20004, 'Mobile','Green');
insert into PARTS values(20005, 'Charger','Black');

insert into CATALOG values(10001, '20001','10');
insert into CATALOG values(10001, '20002','10');
insert into CATALOG values(10001, '20003','30');
insert into CATALOG values(10001, '20004','10');
insert into CATALOG values(10001, '20005','10');
insert into CATALOG values(10002, '20001','10');
insert into CATALOG values(10002, '20002','20');
insert into CATALOG values(10003, '20003','30');
insert into CATALOG values(10004, '20003','40');

SELECT DISTINCT P.pname 
FROM Parts P, Catalog C 
WHERE P.pid = C.pid;

SELECT S.sname
FROM Suppliers S 
WHERE NOT EXISTS ((SELECT P.pid  FROM Parts P) MINUS (SELECT C.pid FROM Catalog C WHERE C.sid = S.sid));

SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (( SELECT P.pid
FROM Parts P
WHERE P.color = 'Red' )
			MINUS
			( SELECT C.pid
			FROM Catalog C, Parts P
			WHERE C.sid = S.sid AND
			C.pid = P.pid AND P.color = 'Red' ));

SELECT pname 
FROM Parts 
WHERE pid in (SELECT pid FROM catalogue WHERE sid =(SELECT sid FROM suppliers WHERE sname='Acme widget')
              MINUS SELECT pid FROM catalogue where sir in (select sid from suppliers where snake <> 'Acme widget'));
             
SELECT DISTINCT C.sid FROM Catalog C
WHERE C.cost > ( SELECT AVG (C1.cost)
FROM Catalog C1
WHERE C1.pid = C.pid );

SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX (C1.cost)
		FROM Catalog C1
		WHERE C1.pid = P.pid);

             
             
            


