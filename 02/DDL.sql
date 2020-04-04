/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.1 		*/
/*  Created On : 04-dub-2020 17:24:56 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS "Account" CASCADE
;

DROP TABLE IF EXISTS "Client" CASCADE
;

DROP TABLE IF EXISTS "Credit_card" CASCADE
;

DROP TABLE IF EXISTS "Disposition" CASCADE
;

DROP TABLE IF EXISTS "District" CASCADE
;

DROP TABLE IF EXISTS "Loan" CASCADE
;

DROP TABLE IF EXISTS "Permanent_order" CASCADE
;

DROP TABLE IF EXISTS "Transaction" CASCADE
;

/* Create Tables */

CREATE TABLE "Account"
(
	account_id integer NOT NULL,
	frequency varchar(20) NULL,
	date date NULL,
	district_id integer NULL
)
;

CREATE TABLE "Client"
(
	client_id integer NOT NULL,
	birth_number date NULL,
	district_id integer NULL
)
;

CREATE TABLE "Credit_card"
(
	card_id integer NOT NULL,
	type varchar(20) NULL,
	issued date NULL,
	disp_id integer NULL
)
;

CREATE TABLE "Disposition"
(
	disp_id integer NOT NULL,
	type varchar(20) NULL,
	account_id integer NULL,
	client_id integer NULL
)
;

CREATE TABLE "District"
(
	district_id integer NOT NULL,
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
	crimes96 integer NULL
)
;

CREATE TABLE "Loan"
(
	loan_id integer NOT NULL,
	date date NULL,
	amount integer NULL,
	duration integer NULL,
	payments double precision NULL,
	status char(1) NULL,
	account_id integer NULL
)
;

CREATE TABLE "Permanent_order"
(
	order_id integer NOT NULL,
	bank_to varchar(2) NULL,
	account_to varchar(50) NULL,
	amount double precision NULL,
	k_symbol varchar(20) NULL,
	account_id integer NULL
)
;

CREATE TABLE "Transaction"
(
	trans_id integer NOT NULL,
	date date NULL,
	type varchar(20) NULL,
	operation varchar(20) NULL,
	amount double precision NULL,
	balance double precision NULL,
	k_symbol varchar(20) NULL,
	bank varchar(2) NULL,
	account varchar(50) NULL,
	account_id integer NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "Account" ADD CONSTRAINT "PK_Account"
	PRIMARY KEY (account_id)
;

CREATE INDEX "IXFK_Account_District" ON "Account" (district_id ASC)
;

ALTER TABLE "Client" ADD CONSTRAINT "PK_Client"
	PRIMARY KEY (client_id)
;

CREATE INDEX "IXFK_Client_District" ON "Client" (district_id ASC)
;

ALTER TABLE "Credit_card" ADD CONSTRAINT "PK_Credit_card"
	PRIMARY KEY (card_id)
;

CREATE INDEX "IXFK_Credit_card_Disposition" ON "Credit_card" (disp_id ASC)
;

ALTER TABLE "Disposition" ADD CONSTRAINT "PK_Disposition"
	PRIMARY KEY (disp_id)
;

CREATE INDEX "IXFK_Disposition_Account" ON "Disposition" (account_id ASC)
;

CREATE INDEX "IXFK_Disposition_Client" ON "Disposition" (client_id ASC)
;

ALTER TABLE "District" ADD CONSTRAINT "PK_District"
	PRIMARY KEY (district_id)
;

ALTER TABLE "Loan" ADD CONSTRAINT "PK_Loan"
	PRIMARY KEY (loan_id)
;

CREATE INDEX "IXFK_Loan_Account" ON "Loan" (account_id ASC)
;

ALTER TABLE "Permanent_order" ADD CONSTRAINT "PK_Permanent_order"
	PRIMARY KEY (order_id)
;

CREATE INDEX "IXFK_Permanent_order_Account" ON "Permanent_order" (account_id ASC)
;

ALTER TABLE "Transaction" ADD CONSTRAINT "PK_Transaction"
	PRIMARY KEY (trans_id)
;

CREATE INDEX "IXFK_Transaction_Account" ON "Transaction" (account_id ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE "Account" ADD CONSTRAINT "FK_Account_District"
	FOREIGN KEY (district_id) REFERENCES "District" (district_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Client" ADD CONSTRAINT "FK_Client_District"
	FOREIGN KEY (district_id) REFERENCES "District" (district_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Credit_card" ADD CONSTRAINT "FK_Credit_card_Disposition"
	FOREIGN KEY (disp_id) REFERENCES "Disposition" (disp_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Disposition" ADD CONSTRAINT "FK_Disposition_Account"
	FOREIGN KEY (account_id) REFERENCES "Account" (account_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Disposition" ADD CONSTRAINT "FK_Disposition_Client"
	FOREIGN KEY (client_id) REFERENCES "Client" (client_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Loan" ADD CONSTRAINT "FK_Loan_Account"
	FOREIGN KEY (account_id) REFERENCES "Account" (account_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Permanent_order" ADD CONSTRAINT "FK_Permanent_order_Account"
	FOREIGN KEY (account_id) REFERENCES "Account" (account_id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Transaction" ADD CONSTRAINT "FK_Transaction_Account"
	FOREIGN KEY (account_id) REFERENCES "Account" (account_id) ON DELETE No Action ON UPDATE No Action
;
