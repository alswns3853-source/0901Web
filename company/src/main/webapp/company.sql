CREATE TABLE boards(
	num NUMBER PRIMARY KEY,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	id varchar2(10) NOT NULL,
	postdate DATE DEFAULT sysdate NOT NULL,
	visitcount NUMBER(6)
);

CREATE TABLE members(
	id varchar2(10) NOT NULL,
	name varchar2(30) NOT NULL,
	pass varchar2(10) NOT NULL,
	checkpass varchar2(10) NOT NULL,
	PRIMARY KEY(id)
);
