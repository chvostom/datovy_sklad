/* Drop Tables */

DROP TABLE IF EXISTS account CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS disposition CASCADE;
DROP TABLE IF EXISTS district CASCADE;
DROP TABLE IF EXISTS loan CASCADE;
DROP TABLE IF EXISTS permanent_order CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

/* Create Tables */

CREATE TABLE account
(
	account_id integer NOT NULL,
	district_id integer NULL,
	frequency varchar(20) NULL,
	date date NULL
);

CREATE TABLE client
(
	client_id integer NOT NULL,
	district_id integer NULL,
	birth_number varchar(6) NULL
);

CREATE TABLE credit_card
(
	card_id integer NOT NULL,
	disp_id integer NULL,
	type varchar(20) NULL,
	issued date NULL
);

CREATE TABLE disposition
(
	disp_id integer NOT NULL,
	client_id integer NULL,
	account_id integer NULL,
	type varchar(20) NULL
);

CREATE TABLE district
(
	district_id integer NOT NULL,
	"district _name" varchar(20) NULL,
	region varchar(20) NULL,
	inhabitants integer NULL,
	municipalities1 integer NULL,
	municipalities2 integer NULL,
	municipalities3 integer NULL,
	municipalities4 integer NULL,
	cities integer NULL,
	ratio_of_urban double precision NULL,
	salary integer NULL,
	unemployment95 varchar(10) NULL,
	unemployment96 double precision NULL,
	enterpreneurs integer NULL,
	crimes95 varchar(10) NULL,
	crimes96 integer NULL
);

CREATE TABLE loan
(
	loan_id integer NOT NULL,
	account_id integer NULL,
	date date NULL,
	amount integer NULL,
	duration integer NULL,
	payments double precision NULL,
	status char(1) NULL
);

CREATE TABLE permanent_order
(
	order_id integer NOT NULL,
	account_id integer NULL,
	bank_to varchar(2) NULL,
	account_to varchar(50) NULL,
	amount double precision NULL,
	k_symbol varchar(20) NULL
);

CREATE TABLE transaction
(
	trans_id integer NOT NULL,
	account_id integer NULL,
	date date NULL,
	type varchar(20) NULL,
	operation varchar(20) NULL,
	amount double precision NULL,
	balance double precision NULL,
	k_symbol varchar(20) NULL,
	bank varchar(2) NULL,
	account varchar(50) NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE account ADD CONSTRAINT "PK_account"
	PRIMARY KEY (account_id);

ALTER TABLE client ADD CONSTRAINT "PK_client"
	PRIMARY KEY (client_id);

ALTER TABLE credit_card ADD CONSTRAINT "PK_credit_card"
	PRIMARY KEY (card_id);

ALTER TABLE disposition ADD CONSTRAINT "PK_disposition"
	PRIMARY KEY (disp_id);

ALTER TABLE district ADD CONSTRAINT "PK_district"
	PRIMARY KEY (district_id);

ALTER TABLE loan ADD CONSTRAINT "PK_loan"
	PRIMARY KEY (loan_id);

ALTER TABLE permanent_order ADD CONSTRAINT "PK_permanent_order"
	PRIMARY KEY (order_id);

ALTER TABLE transaction ADD CONSTRAINT "PK_transaction"
	PRIMARY KEY (trans_id);
