DROP TABLE boardcomment CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

CREATE TABLE userinfo(
		userId                        		VARCHAR2(100)		 NULL ,
		password                      		VARCHAR2(100)		 NULL ,
		name                          		VARCHAR2(100)		 NULL ,
		email                         		VARCHAR2(100)		 NULL ,
		phone                         		VARCHAR2(50)		 NULL ,
		address                       		VARCHAR2(100)		 NULL 
);


CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_desc                        		VARCHAR2(100)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE category(
		ca_no                         		NUMBER(10)		 NULL ,
		ca_name                       		VARCHAR2(50)		 NULL 
);


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(50)		 NOT NULL,
		p_price                       		NUMBER(20)		 DEFAULT 0		 NOT NULL,
		p_desc                        		VARCHAR2(300)		 NULL ,
		p_image                       		VARCHAR2(100)		 NOT NULL,
		p_option                      		VARCHAR2(20)		 NULL ,
		ca_no                         		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 DEFAULT 0		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE board(
		boardno                       		NUMBER		 NULL ,
		title                         		VARCHAR2(100)		 NOT NULL,
		userId                        		VARCHAR2(100)		 NULL ,
		content                       		VARCHAR2(2000)		 NOT NULL,
		regdate                       		DATE		 DEFAULT sysdate		 NULL ,
		readcount                     		NUMBER		 DEFAULT 0		 NULL ,
		groupno                       		NUMBER		 NOT NULL,
		step                          		NUMBER		 NOT NULL,
		depth                         		NUMBER		 DEFAULT 0		 NULL 
);

DROP SEQUENCE board_boardno_SEQ;

CREATE SEQUENCE board_boardno_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE boardcomment(
		commentno                     		NUMBER		 NULL ,
		boardno                       		NUMBER		 NULL ,
		userId                        		VARCHAR2(100)		 NULL ,
		c_content                     		VARCHAR2(500)		 NOT NULL,
		c_regdate                     		DATE		 DEFAULT sysdate		 NULL 
);

DROP SEQUENCE boardcomment_commentno_SEQ;

CREATE SEQUENCE boardcomment_commentno_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (userId);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (userId) REFERENCES userinfo (userId) on delete cascade;

ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (ca_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (ca_no) REFERENCES category (ca_no) on delete cascade;

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (userId) REFERENCES userinfo (userId) on delete cascade;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (o_no) REFERENCES orders (o_no) on delete cascade;

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (boardno);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (userId) REFERENCES userinfo (userId) on delete cascade;

ALTER TABLE boardcomment ADD CONSTRAINT IDX_boardcomment_PK PRIMARY KEY (commentno);
ALTER TABLE boardcomment ADD CONSTRAINT IDX_boardcomment_FK0 FOREIGN KEY (boardno) REFERENCES board (boardno) on delete cascade;
ALTER TABLE boardcomment ADD CONSTRAINT IDX_boardcomment_FK1 FOREIGN KEY (userId) REFERENCES userinfo (userId) on delete cascade;