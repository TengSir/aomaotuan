
/* Drop Tables */

DROP TABLE COLLECTORS;
DROP TABLE ITEMS;
DROP TABLE SHOPCART;
DROP TABLE GOODS;
DROP TABLE ORDERS;
DROP TABLE USERS;




/* Create Tables */

CREATE TABLE COLLECTORS
(
	COLLECTID INT NOT NULL AUTO_INCREMENT,
	COLLECTTIME VARCHAR(20) NOT NULL,
	CLASSIFY VARCHAR(20),
	GOODSID INT NOT NULL,
	PRIMARY KEY (COLLECTID)
);


CREATE TABLE GOODS
(
	GOODSID INT NOT NULL AUTO_INCREMENT,
	GOODSNAME VARCHAR(20) NOT NULL,
	GOODSTYPE VARCHAR(20),
	GOODSPRICE DECIMAL(10,2) NOT NULL,
	GOODSNUMBER INT NOT NULL,
	GOODSPIC VARCHAR(256),
	PRIMARY KEY (GOODSID)
);


CREATE TABLE ITEMS
(
	ITEMID INT NOT NULL AUTO_INCREMENT,
	ITEMNUMBER INT NOT NULL,
	GOODSID INT NOT NULL,
	ORDERID VARCHAR(50) NOT NULL,
	PRIMARY KEY (ITEMID)
);


CREATE TABLE ORDERS
(
	ORDERID VARCHAR(50) NOT NULL,
	ORDERDATE VARCHAR(20) NOT NULL,
	ORDERSTATUS VARCHAR(20) NOT NULL,
	ADDRESS VARCHAR(100) NOT NULL,
	REMARKS VARCHAR(100),
	USERID INT NOT NULL,
	NAME VARCHAR(20),
	PRIMARY KEY (ORDERID)
);


CREATE TABLE SHOPCART
(
	CARID INT NOT NULL AUTO_INCREMENT,
	CARNUMBER INT NOT NULL,
	USERID INT NOT NULL,
	GOODSID INT NOT NULL,
	PRIMARY KEY (CARID)
);


CREATE TABLE USERS
(
	USERID INT NOT NULL AUTO_INCREMENT,
	USERNAME VARCHAR(20) NOT NULL,
	PASSWORD VARCHAR(20) NOT NULL,
	NICHENG VARCHAR(20) NOT NULL,
	IMAGE VARCHAR(200),
	SEX CHAR(2),
	AGE INT,
	PRIMARY KEY (USERID)
);



/* Create Foreign Keys */

ALTER TABLE COLLECTORS
	ADD FOREIGN KEY (GOODSID)
	REFERENCES GOODS (GOODSID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ITEMS
	ADD FOREIGN KEY (GOODSID)
	REFERENCES GOODS (GOODSID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SHOPCART
	ADD FOREIGN KEY (GOODSID)
	REFERENCES GOODS (GOODSID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ITEMS
	ADD FOREIGN KEY (ORDERID)
	REFERENCES ORDERS (ORDERID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ORDERS
	ADD FOREIGN KEY (USERID)
	REFERENCES USERS (USERID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SHOPCART
	ADD FOREIGN KEY (USERID)
	REFERENCES USERS (USERID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



