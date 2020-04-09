/* Drop Tables */

DROP TABLE IF EXISTS "t_account" CASCADE;
DROP TABLE IF EXISTS "t_client" CASCADE;
DROP TABLE IF EXISTS "t_credit_card" CASCADE;
DROP TABLE IF EXISTS "t_disposition" CASCADE;
DROP TABLE IF EXISTS "t_district" CASCADE;
DROP TABLE IF EXISTS "t_loan" CASCADE;
DROP TABLE IF EXISTS "t_permanent_order" CASCADE;
DROP TABLE IF EXISTS "t_transaction" CASCADE;

/* Sequences */

CREATE SEQUENCE seq_account
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9000000000000000000
	START 1
	CACHE 1;

CREATE SEQUENCE seq_client
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9000000000000000000
	START 1
	CACHE 1;

CREATE SEQUENCE seq_disposition
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9000000000000000000
	START 1
	CACHE 1;

CREATE SEQUENCE seq_loan
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9000000000000000000
	START 1
	CACHE 1;

/* Create Tables */

CREATE TABLE "t_account"(
	account_bk bigint NOT NULL,
	frequency varchar(20) NULL,
	date date NULL,
	district_id bigint NULL,
	account_tk bigint NOT NULL DEFAULT nextval('seq_account'::regclass),
	version bigint,
	date_from timestamp without time zone,
	date_to timestamp without time zone,
	last_update timestamp without time zone);

CREATE TABLE "t_client"(
	client_bk bigint NOT NULL,
	birth_number varchar(6) NULL,
	district_id bigint NULL,
	client_tk bigint NOT NULL DEFAULT nextval('seq_client'::regclass),
	version bigint,
	date_from timestamp without time zone,
	date_to timestamp without time zone,
	last_update timestamp without time zone);

CREATE TABLE "t_credit_card"(
	card_bk bigint NOT NULL,
	type varchar(20) NULL,
	issued date NULL,
	disp_id bigint NULL);

CREATE TABLE "t_disposition"
(
	disp_bk bigint NOT NULL,
	type varchar(20) NULL,
	account_id bigint NULL,
	client_id bigint NULL,
	disp_tk bigint NOT NULL DEFAULT nextval('seq_disposition'::regclass),
	version bigint,
	date_from timestamp without time zone,
	date_to timestamp without time zone,
	last_update timestamp without time zone);

CREATE TABLE "t_district"(
	district_bk bigint NOT NULL,
	district_name varchar(20) NULL,
	region varchar(20) NULL,
	inhabitants integer NULL,
	municipalities1 integer NULL,
	municipalities2 integer NULL,
	municipalities3 integer NULL,
	municipalities4 integer NULL,
	cities integer NULL,
	ratio_of_urban double precision NULL,
	salary integer NULL,
	unemployment95 double precision NULL,
	unemployment96 double precision NULL,
	enterpreneurs integer NULL,
	crimes95 integer NULL,
	crimes96 integer NULL);

CREATE TABLE "t_loan"(
	loan_bk bigint NOT NULL,
	date date NULL,
	amount integer NULL,
	duration integer NULL,
	payments double precision NULL,
	status char(1) NULL,
	account_id bigint NULL,
	loan_tk bigint NOT NULL DEFAULT nextval('seq_loan'::regclass),
	version bigint,
	date_from timestamp without time zone,
	date_to timestamp without time zone,
	last_update timestamp without time zone);

CREATE TABLE "t_permanent_order"(
	order_bk bigint NOT NULL,
	bank_to varchar(2) NULL,
	account_to varchar(50) NULL,
	amount double precision NULL,
	k_symbol varchar(20) NULL,
	account_id bigint NULL);

CREATE TABLE "t_transaction"(
	trans_bk integer NOT NULL,
	date date NULL,
	type varchar(20) NULL,
	operation varchar(20) NULL,
	amount double precision NULL,
	balance double precision NULL,
	k_symbol varchar(20) NULL,
	bank varchar(2) NULL,
	account varchar(50) NULL,
	account_id bigint NULL);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "t_account" ADD CONSTRAINT "PK_t_account" PRIMARY KEY (account_tk);

CREATE INDEX "IXFK_t_account_t_district" ON "t_account" (district_id ASC);

ALTER TABLE "t_client" ADD CONSTRAINT "PK_t_client" PRIMARY KEY (client_tk);

CREATE INDEX "IXFK_t_client_t_district" ON "t_client" (district_id ASC);

ALTER TABLE "t_credit_card" ADD CONSTRAINT "PK_t_credit_card" PRIMARY KEY (card_bk);

CREATE INDEX "IXFK_t_credit_card_t_disposition" ON "t_credit_card" (disp_id ASC);

ALTER TABLE "t_disposition" ADD CONSTRAINT "PK_t_disposition" PRIMARY KEY (disp_tk);

CREATE INDEX "IXFK_t_disposition_t_account" ON "t_disposition" (account_id ASC);

CREATE INDEX "IXFK_t_disposition_t_client" ON "t_disposition" (client_id ASC);

ALTER TABLE "t_district" ADD CONSTRAINT "PK_t_district" PRIMARY KEY (district_bk);

ALTER TABLE "t_loan" ADD CONSTRAINT "PK_t_loan" PRIMARY KEY (loan_tk);

CREATE INDEX "IXFK_t_loan_t_account" ON "t_loan" (account_id ASC);

ALTER TABLE "t_permanent_order" ADD CONSTRAINT "PK_t_permanent_order" PRIMARY KEY (order_bk);

CREATE INDEX "IXFK_t_permanent_order_t_account" ON "t_permanent_order" (account_id ASC);

ALTER TABLE "t_transaction" ADD CONSTRAINT "PK_t_transaction" PRIMARY KEY (trans_bk);

CREATE INDEX "IXFK_t_transaction_t_account" ON "t_transaction" (account_id ASC);

/* Create Foreign Key Constraints */

ALTER TABLE "t_account" ADD CONSTRAINT "FK_t_account_t_district" FOREIGN KEY (district_id) REFERENCES "t_district" (district_bk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_client" ADD CONSTRAINT "FK_t_client_t_district" FOREIGN KEY (district_id) REFERENCES "t_district" (district_bk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_credit_card" ADD CONSTRAINT "FK_t_credit_card_t_disposition" FOREIGN KEY (disp_id) REFERENCES "t_disposition" (disp_tk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_disposition" ADD CONSTRAINT "FK_t_disposition_t_account" FOREIGN KEY (account_id) REFERENCES "t_account" (account_tk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_disposition" ADD CONSTRAINT "FK_t_disposition_t_client" FOREIGN KEY (client_id) REFERENCES "t_client" (client_tk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_loan" ADD CONSTRAINT "FK_t_loan_t_account" FOREIGN KEY (account_id) REFERENCES "t_account" (account_tk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_permanent_order" ADD CONSTRAINT "FK_t_permanent_order_t_account" FOREIGN KEY (account_id) REFERENCES "t_account" (account_tk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE "t_transaction" ADD CONSTRAINT "FK_t_transaction_t_account" FOREIGN KEY (account_id) REFERENCES "t_account" (account_tk) ON DELETE No Action ON UPDATE No Action;
