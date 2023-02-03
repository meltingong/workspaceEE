DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

CREATE TABLE userinfo(
		userId                        		VARCHAR2(100)		 NULL ,
		password                      		VARCHAR2(100)		 NULL ,
		name                          		VARCHAR2(100)		 NULL ,
		email                         		VARCHAR2(100)		 NULL 
);


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(50)		 NOT NULL,
		p_price                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		p_image                       		VARCHAR2(100)		 DEFAULT 'images/no_image.jpg'		 NOT NULL,
		p_desc                        		VARCHAR2(200)		 NULL ,
		p_click_count                 		VARCHAR2(10)		 DEFAULT 0		 NOT NULL
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (userId);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (userId) REFERENCES userinfo (userId);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

