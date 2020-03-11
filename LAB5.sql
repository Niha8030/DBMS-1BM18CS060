CREATE TABLE AUTHOR
(
AUTHOR_ID NUMBER(10),
NAME VARCHAR2(20),
CITY VARCHAR2(20),
COUNTRY VARCHAR2(20),
PRIMARY KEY(AUTHOR_ID)
);

CREATE TABLE PUBLISHER
(
PUBLISHER_ID NUMBER(10),
NAME VARCHAR2(20),
CITY VARCHAR2(20),
COUNTRY VARCHAR2(20),
PRIMARY KEY (PUBLISHER_ID)
);

CREATE TABLE CATEGORY
(
CATEGORY_ID NUMBER(4),
DESCRIPTION VARCHAR2(20),
PRIMARY KEY(CATEGORY_ID)
);

CREATE TABLE CATALOG
(
BOOK_ID NUMBER(2),
TITLE VARCHAR2(20),
AUTHOR_ID NUMBER(10),
PUBLISHER_ID NUMBER(10),
CATEGORY_ID NUMBER(4),
YEAR NUMBER(4),
PRICE NUMBER(3),
PRIMARY KEY(BOOK_ID),
FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID),
FOREIGN KEY (PUBLISHER_ID) REFERENCES PUBLISHER (PUBLISHER_ID),
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);

CREATE TABLE ORDER_DETAILS
(
ORDER_NO NUMBER(2),
BOOK_ID NUMBER(2),
QUANTITY NUMBER(5),
PRIMARY KEY(ORDER_NO,BOOK_ID),
FOREIGN KEY (BOOK_ID) REFERENCES CATALOG(BOOK_ID)
);

INSERT INTO AUTHOR VALUES (1001,'TERAS CHAN','CA','USA');
INSERT INTO AUTHOR VALUES (1002,'STEVENS','ZOMBI','UGANDA');
INSERT INTO AUTHOR VALUES (1003,'M MANOJ','CAIR','UGANDA');
INSERT INTO AUTHOR VALUES (1004,'KARTHIK S.P.','NEW YORK','USA');
INSERT INTO AUTHOR VALUES (1005,'WILLIAM STALLINGS','LAS VEGAS','USA');

SELECT * FROM AUTHOR;

INSERT INTO PUBLISHER VALUES (1,'PEARSON','NEW YORK','USA');
INSERT INTO PUBLISHER VALUES (2,'EEE','NEW SOUTH VALES','USA');
INSERT INTO PUBLISHER VALUES (3,'PHI','DELHI','INDIA');
INSERT INTO PUBLISHER VALUES (4,'WILLEY','BERLIN','GERMANY');
INSERT INTO PUBLISHER VALUES (5,'MGH','NEW YORK','USA');

SELECT * FROM PUBLISHER;

ALTER TABLE ORDER_DETAILS
DROP CONSTRAINT SYS_C0011110;

ALTER TABLE ORDER_DETAILS
ADD CONSTRAINT SYS_C0011110 FOREIGN KEY (BOOK_ID) REFERENCES CATALOG(BOOK_ID) 
ON DELETE CASCADE;

INSERT INTO CATEGORY VALUES(1001,'COMPUTER SCIENCE');
INSERT INTO CATEGORY VALUES(1002,'ALGORITHM DESIGN');
INSERT INTO CATEGORY VALUES(1003,'ELECTRONICS');
INSERT INTO CATEGORY VALUES(1004,'PROGRAMMING');
INSERT INTO CATEGORY VALUES(1005,'OPERATING SYSTEMS');

SELECT * FROM CATEGORY;

INSERT INTO CATALOG VALUES(11,'UNIX SYSTEM PRG',1001,1,1001,2000,251); 
INSERT INTO CATALOG VALUES(12,'DIGITAL SIGNALS',1002,2,1003,2001,425); 
INSERT INTO CATALOG VALUES(13,'LOGIC DESIGN',1003,3,1002,1999,225); 
INSERT INTO CATALOG VALUES(14,'SERVER PRG',1004,4,1004,2001,333); 
INSERT INTO CATALOG VALUES(15,'LINUX OS',1005,5,1005,2003,326); 
INSERT INTO CATALOG VALUES(16,'C++ BIBLE',1005,5,1001,2000,526); 
INSERT INTO CATALOG VALUES(17,'COBOL HANDBOOK',1004,4,1001,2000,658);

SELECT * FROM CATALOG;

INSERT INTO  ORDER_DETAILS VALUES(1,11,5); 
INSERT INTO  ORDER_DETAILS VALUES(2,12,8);
INSERT INTO  ORDER_DETAILS VALUES(3,13,15);
INSERT INTO  ORDER_DETAILS VALUES(4,14,22);
INSERT INTO  ORDER_DETAILS VALUES(5,15,3);
INSERT INTO  ORDER_DETAILS VALUES(6,17,10);

SELECT * FROM ORDER_DETAILS;

SELECT AUTHOR.AUTHOR_ID,AUTHOR.NAME,AUTHOR.CITY,AUTHOR.COUNTRY,
COUNT(CATALOG.AUTHOR_ID)
FROM AUTHOR,CATALOG
WHERE AUTHOR.AUTHOR_ID = CATALOG.AUTHOR_ID 
GROUP BY CATALOG.AUTHOR_ID, AUTHOR.AUTHOR_ID, AUTHOR.NAME, AUTHOR.CITY, AUTHOR.COUNTRY
HAVING COUNT(CATALOG.AUTHOR_ID) >1;

UPDATE CATALOG
SET CATALOG.PRICE = CATALOG.PRICE * 1.1
WHERE CATALOG.PUBLISHER_ID = (SELECT PUBLISHER.PUBLISHER_ID 
                              FROM PUBLISHER WHERE PUBLISHER.NAME = 'PEARSON' );
COMMIT;                              

