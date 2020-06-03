
/* Drop Triggers */

DROP TRIGGER TRI_inventory_tb_inv_uid;
DROP TRIGGER TRI_member_tb_mem_uid;
DROP TRIGGER TRI_menu_tb_menu_uid;
DROP TRIGGER TRI_order_tb_order_uid;
DROP TRIGGER TRI_sales_tb_sales_uid;
DROP TRIGGER TRI_storeinfo_tb_store_uid;



/* Drop Tables */

DROP TABLE cs_tb CASCADE CONSTRAINTS;
DROP TABLE menu_tb CASCADE CONSTRAINTS;
DROP TABLE orderlist CASCADE CONSTRAINTS;
DROP TABLE order_tb CASCADE CONSTRAINTS;
DROP TABLE storeinfo_tb CASCADE CONSTRAINTS;
DROP TABLE subscribe_tb CASCADE CONSTRAINTS;
DROP TABLE member_tb CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_inventory_tb_inv_uid;
DROP SEQUENCE SEQ_mem_uid;
DROP SEQUENCE SEQ_menu_tb_menu_uid;
DROP SEQUENCE SEQ_order_tb_order_uid;
DROP SEQUENCE SEQ_sales_tb_sales_uid;
DROP SEQUENCE SEQ_storeinfo_tb_store_uid;
DROP SEQUENCE SEQ_subscribe_uid;




/* Create Sequences */

CREATE SEQUENCE SEQ_inv_uid;
CREATE SEQUENCE SEQ_mem_uid;
CREATE SEQUENCE SEQ_menu_uid;
CREATE SEQUENCE SEQ_order_uid;
CREATE SEQUENCE SEQ_sales_uid;
CREATE SEQUENCE SEQ_store_uid;
CREATE SEQUENCE SEQ_subscribe_uid;



/* Create Tables */

CREATE TABLE cs_tb
(
	cs_uid number NOT NULL,
	cs_subject varchar2(50) NOT NULL,
	cs_name varchar2(50) NOT NULL,
	cs_content clob NOT NULL,
	cs_regdate date DEFAULT SYSDATE,
	mem_uid number NOT NULL,
	PRIMARY KEY (cs_uid)
);


CREATE TABLE member_tb
(
	mem_uid number NOT NULL,
	mem_id varchar2(50) NOT NULL,
	mem_pw varchar2(50) NOT NULL,
	mem_name varchar2(50) NOT NULL,
	mem_email varchar2(50) NOT NULL,
	PRIMARY KEY (mem_uid)
);


CREATE TABLE menu_tb
(
	menu_uid number NOT NULL,
	menu_name varchar2(50) NOT NULL,
	menu_price number NOT NULL,
	store_uid number NOT NULL,
	PRIMARY KEY (menu_uid)
);


CREATE TABLE orderlist
(
	order_uid number NOT NULL,
	orderlist_uid number NOT NULL,
	store_uid number NOT NULL
);


CREATE TABLE order_tb
(
	order_uid number NOT NULL,
	store_uid number NOT NULL,
	order_regdate date,
	order_totalprice number,
	PRIMARY KEY (order_uid)
);


CREATE TABLE storeinfo_tb
(
	store_uid number NOT NULL,
	store_name varchar2(50) NOT NULL,
	store_loca varchar2(100) NOT NULL,
	store_phonenum number NOT NULL,
	mem_uid number NOT NULL,
	PRIMARY KEY (store_uid)
);


CREATE TABLE subscribe_tb
(
	sub_uid number NOT NULL,
	sub_regdate date,
	sub_period number,
	sub_payment number,
	sub_method varchar2(10),
	sub_email varchar2(50),
	mem_uid number NOT NULL,
	PRIMARY KEY (sub_uid)
);




/* Create Foreign Keys */

ALTER TABLE cs_tb
	ADD FOREIGN KEY (mem_uid)
	REFERENCES member_tb (mem_uid)
;


ALTER TABLE storeinfo_tb
	ADD FOREIGN KEY (mem_uid)
	REFERENCES member_tb (mem_uid)
;


ALTER TABLE subcribe_tb
	ADD FOREIGN KEY (mem_uid)
	REFERENCES member_tb (mem_uid)
;


ALTER TABLE orderlist
	ADD FOREIGN KEY (order_uid)
	REFERENCES order_tb (order_uid)
;


ALTER TABLE menu_tb
	ADD FOREIGN KEY (store_uid)
	REFERENCES storeinfo_tb (store_uid)
;


ALTER TABLE orderlist
	ADD FOREIGN KEY (store_uid)
	REFERENCES storeinfo_tb (store_uid)
;


ALTER TABLE order_tb
	ADD FOREIGN KEY (store_uid)
	REFERENCES storeinfo_tb (store_uid)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_inventory_tb_inv_uid BEFORE INSERT ON inventory_tb
FOR EACH ROW
BEGIN
	SELECT SEQ_inventory_tb_inv_uid.nextval
	INTO :new.inv_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member_tb_mem_uid BEFORE INSERT ON member_tb
FOR EACH ROW
BEGIN
	SELECT SEQ_member_tb_mem_uid.nextval
	INTO :new.mem_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_menu_tb_menu_uid BEFORE INSERT ON menu_tb
FOR EACH ROW
BEGIN
	SELECT SEQ_menu_tb_menu_uid.nextval
	INTO :new.menu_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_order_tb_order_uid BEFORE INSERT ON order_tb
FOR EACH ROW
BEGIN
	SELECT SEQ_order_tb_order_uid.nextval
	INTO :new.order_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sales_tb_sales_uid BEFORE INSERT ON sales_tb
FOR EACH ROW
BEGIN
	SELECT SEQ_sales_tb_sales_uid.nextval
	INTO :new.sales_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_storeinfo_tb_store_uid BEFORE INSERT ON storeinfo_tb
FOR EACH ROW
BEGIN
	SELECT SEQ_storeinfo_tb_store_uid.nextval
	INTO :new.store_uid
	FROM dual;
END;

/

SELECT * FROM SUBSCRIBE_TB;
SELECT * FROM MEMBER_TB;
INSERT INTO MEMBER_TB VALUES (SEQ_mem_uid.nextval, 'skuley', '1234', 'sung', 'skuleyandpotato@gmail.com');



