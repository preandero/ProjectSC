CREATE TABLE cs_tb
(
	cs_uid number NOT NULL,
	cs_subject varchar2(50) NOT NULL,
	cs_content clob NOT NULL,
	cs_regdate date DEFAULT SYSDATE,
	mem_uid number NOT NULL,
	PRIMARY KEY (cs_uid)
);

SELECT * FROM cs_tb;

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

SELECT c.CS_UID, c.CS_SUBJECT, m.MEM_ID, c.CS_REGDATE 
FROM cs_tb c , member_tb m
WHERE c.mem_uid = m.mem_uid AND m.mem_uid = 3;