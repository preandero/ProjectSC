/***************/
/* Drop Tables */
/***************/

DROP TABLE cs_tb CASCADE CONSTRAINTS;
DROP TABLE order_detail CASCADE CONSTRAINTS;
DROP TABLE menu_tb CASCADE CONSTRAINTS;
DROP TABLE order_tb CASCADE CONSTRAINTS;
DROP TABLE storeinfo_tb CASCADE CONSTRAINTS;
DROP TABLE member_tb CASCADE CONSTRAINTS;

/***************/
/* Drop Sequences */
/***************/

DROP SEQUENCE SEQ_cs_uid;
DROP SEQUENCE SEQ_mem_uid;
DROP SEQUENCE SEQ_menu_uid;
DROP SEQUENCE SEQ_order_uid;
DROP SEQUENCE SEQ_store_uid;

/***************/
/* Create Sequences */
/***************/

CREATE SEQUENCE SEQ_cs_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_mem_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_menu_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_store_uid INCREMENT BY 1 START WITH 1;

/***************/
/* Create Tables */
/***************/

/* Customer Table */
CREATE TABLE cs_tb
(
	cs_uid number NOT NULL,
	cs_subject varchar2(50) NOT NULL,
	cs_content clob NOT NULL,
	cs_regdate date DEFAULT SYSDATE,
	mem_uid number NOT NULL,
	PRIMARY KEY (cs_uid)
);

SELECT * FROM CS_TB;

/* Member Table */
CREATE TABLE member_tb
(
	mem_uid number NOT NULL,
	mem_id varchar2(50) NOT NULL UNIQUE,
	mem_pw varchar2(50) NOT NULL,
	mem_phonenum varchar2(20) NOT NULL,
	mem_email varchar2(50) NOT NULL,
	mem_sub_regdate date,
	mem_sub_period number,
	mem_sub_payment number,
	mem_sub_method varchar2(50),
	PRIMARY KEY (mem_uid)
);

SELECT * FROM MEMBER_TB;

/* Store Table */
CREATE TABLE storeinfo_tb
(
	store_uid number NOT NULL,
	store_name varchar2(50) NOT NULL,
	store_loca varchar2(300) NOT NULL,
	store_phonenum varchar2(50) NOT NULL,
	mem_uid number NOT NULL,
	PRIMARY KEY (store_uid)
);

SELECT * FROM STOREINFO_TB;

/* Menu Table */
CREATE TABLE menu_tb
(
	menu_uid number NOT NULL,
	menu_name varchar2(50) NOT NULL,
	menu_price number NOT NULL,
	store_uid number NOT NULL,
	PRIMARY KEY (menu_uid)
);

SELECT * FROM MENU_TB;

/* OrderDetail Table */
CREATE TABLE order_detail
(
	order_uid number NOT NULL,
	menu_uid number NOT NULL,
	menu_quantity number NOT NULL
);

SELECT * FROM ORDER_DETAIL od ;

/* Order Table */
CREATE TABLE order_tb
(
	order_uid number NOT NULL,
	order_regdate date,
	order_totalprice number,
	store_uid number NOT NULL,
	PRIMARY KEY (order_uid)
);

SELECT * FROM ORDER_TB ot ;

/***************/
/* Create Foreign Keys */
/***************/

ALTER TABLE cs_tb
	ADD FOREIGN KEY (mem_uid)
	REFERENCES member_tb (mem_uid)
;

ALTER TABLE storeinfo_tb
	ADD FOREIGN KEY (mem_uid)
	REFERENCES member_tb (mem_uid)
;

ALTER TABLE order_detail
	ADD FOREIGN KEY (menu_uid)
	REFERENCES menu_tb (menu_uid)
;

ALTER TABLE order_detail
	ADD FOREIGN KEY (order_uid)
	REFERENCES order_tb (order_uid)
;

ALTER TABLE menu_tb
	ADD FOREIGN KEY (store_uid)
	REFERENCES storeinfo_tb (store_uid)
;


ALTER TABLE order_tb
	ADD FOREIGN KEY (store_uid)
	REFERENCES storeinfo_tb (store_uid)
;
