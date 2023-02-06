DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;

CREATE TABLE category(
		ca_no                         		NUMBER(10)		 NULL ,
		ca_name                       		VARCHAR2(50)		 NULL 
);


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(50)		 NOT NULL,
		p_price                       		NUMBER(20)		 NOT NULL,
		p_desc                        		VARCHAR2(300)		 NOT NULL,
		p_image                       		VARCHAR2(100)		 NOT NULL,
		p_option                      		VARCHAR2(20)		 NOT NULL,
		ca_no                         		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (ca_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (ca_no) REFERENCES category (ca_no);

