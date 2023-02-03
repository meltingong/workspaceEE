DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;

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



CREATE TABLE userinfo(
		userId                        		VARCHAR2(100)		 NULL ,
		password                      		VARCHAR2(100)		 NULL ,
		name                          		VARCHAR2(100)		 NULL ,
		email                         		VARCHAR2(100)		 NULL 
);


CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 DEFAULT 0		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_desc                        		VARCHAR2(100)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);

ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (userId);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (userId) REFERENCES userinfo (userId);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (userId) REFERENCES userinfo (userId);

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (o_no) REFERENCES orders (o_no) ON DELETE CASCADE;
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

