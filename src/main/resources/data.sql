CREATE TABLE members (
    no INTEGER NOT NULL,
	member_name VARCHAR(255) NOT NULL,
	email_id VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	mobile_number VARCHAR(255),
	member_dob DATE,
    reference_member_no INTEGER,
    address1 VARCHAR(255),
    place VARCHAR(255),	
    taluk VARCHAR(255),	
    district VARCHAR(255),
    state VARCHAR(255),	
    pincode VARCHAR(255),
    member_type ENUM('PRIMARY', 'SECONDARY') NOT NULL,
    role ENUM('SUPER_ADMIN', 'USER') NOT NULL,
    PRIMARY KEY (no),
    CONSTRAINT uniq_member_composite UNIQUE (member_name, member_type, reference_member_no)
);


INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (1, 'അഭിലാഷ്  KP', 'kannandevoos@gmail.com', 'a2FubmFuZGV2b29z', '8893840092', '2025-09-12', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (2, 'ജെയ്‌സൺ  കൊളുത്തുവള്ളി', 'jkraphy@gmail.com', 'amtyYXBoeQ==', '9496017942', '2025-06-03', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (3, 'ജിജിൻ ഫ്രാൻസിസ്', 'jijinfrancisanna@gmail.com', 'amlqaW5mcmFuY2lzYW5uYQ==', '9846417927', '2025-11-18', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (4, 'ജീജോ ജേക്കബ്', 'jeejo1441@gmail.com', 'amVlam8xNDQx', '9809523060', '2025-09-06', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (5, 'ജിജോ ജോൺ', 'jijojohn777@gmail.com', 'amlqb2pvaG43Nzc=', '9895415828', '2025-12-20', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (6, 'ലൂയിസ് ജോസഫ്', 'luisjoseph6551@gmail.com', 'bHVpc2pvc2VwaDY1NTE=', '9947886919', '2025-05-17', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (7, 'മനേഷ് മൈക്കിൽ', 'manesh.micheal@gmail.com', 'bWFuZXNoLm1pY2hlYWw=', '9995227002', '2025-11-07', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (8, 'രാജേഷ്  ദാമോദരൻ', 'rajeshdhamodharan', 'cmFqZXNoZGhhbW9kaGFyYW4=', '9995950402', '2025-12-28', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (9, 'ഷബീന ബഷീർ', 'aalimzayan@gmail.com', 'YWFsaW16YXlhbg==', '9946107720', '2025-11-25', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (10, 'സരിത റഫയൽ', 'saritharaphel@gmail.com', 'c2FyaXRoYXJhcGhlbA==', '7736544685', '2025-05-16', null, null, null, 'Kottayam', 'Kottayam', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (11, 'സിജിൻ  TV', 'sijin.celine@gmail.com', 'c2lqaW4uY2VsaW5l', '8304081488', '2025-12-18', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (12, 'സുജിത്ത് കൃഷ്ണാ', 'sujithskrishna@gmail.com', 'c3VqaXRoc2tyaXNobmE=', '9845375129', '2025-07-06', null, 'Kaithavalappil House', 'Parayakad PO', 'Cherthala', 'Alappuzha', 'Kerala', '688540', 'PRIMARY', 'SUPER_ADMIN');


CREATE TABLE LOAN_ENQUIRES (
    LOAN_ENQUIRES_ID INTEGER NOT NULL, 
	LOAN_ENQUIRES_REFERENCE_NAME INTEGER, 
	ENQUIRES_APPLICANT_NAME VARCHAR(255), 
	LOAN_AMOUNT NUMERIC(19,2), 
    LOAN_ENQUIRES_DATE DATE, 
    CURRENT_STATUS VARCHAR(10) NOT NULL, 
    PRIMARY KEY (LOAN_ENQUIRES_ID),
    CHECK (CURRENT_STATUS IN ('CLOSE', 'OPEN'))
);



INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (1, 1, 'അഭിലാഷ് Friend', 10000.00, '2025-03-09', 'OPEN');
INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (2, 12, 'സുജിത്ത് Friend', 6000.00, '2025-03-16', 'OPEN');
INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (3, 12, 'സുജിത്ത് Friend', 5000.00, '2025-03-16', 'OPEN');
INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (4, 11, 'സിജിൻ Friend', 25000.00, '2025-03-09', 'OPEN');
INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (5, 12, 'സുജിത്ത് Friend', 15000.00, '2025-03-16', 'OPEN');
INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (6, 11, 'സിജിൻ Friend', 10000.00, '2025-03-09', 'OPEN');
INSERT INTO LOAN_ENQUIRES (LOAN_ENQUIRES_ID, LOAN_ENQUIRES_REFERENCE_NAME, ENQUIRES_APPLICANT_NAME, LOAN_AMOUNT, LOAN_ENQUIRES_DATE, CURRENT_STATUS) VALUES (7, 11, 'സിജിൻ New Frioend', 8000.00, '2025-03-09', 'OPEN');



CREATE TABLE finance (
	id INTEGER NOT NULL,	
	finance_name VARCHAR(255) NOT NULL,
	finance_owner_no INTEGER,
	finance_creationdate DATE NOT NULL,
	finance_amount DOUBLE PRECISION,
	current_balance DOUBLE PRECISION,    
    loan_priority_order_number INTEGER,
    finance_type ENUM('PRIMARY', 'SECONDARY') NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uniq_finance_composite UNIQUE (finance_type, finance_name, finance_owner_no)
);

insert into finance (loan_priority_order_number,current_balance,finance_amount,finance_creationdate,finance_name,finance_owner_no,finance_type,id) values (2,16000,300,'2023-12-17','Chunks Finance',7,'PRIMARY',1);
insert into finance (loan_priority_order_number,current_balance,finance_amount,finance_creationdate,finance_name,finance_owner_no,finance_type,id) values (1,60000,0,'2024-09-01','Onam Fund',2,'SECONDARY',2);


CREATE TABLE revenue (
    revenue_number INTEGER NOT NULL,
	finance_id INTEGER,	
	spender_member_no INTEGER,
	spender_details VARCHAR(255),
	spend_date DATE NOT NULL,
    spend_amount FLOAT(53) NOT NULL,
	first_approver_member_no INTEGER,
    second_approver_member_no INTEGER,
    first_approval_date_time TIMESTAMP(6),
    second_approval_date_time TIMESTAMP(6),
    current_status ENUM('COMPLETED', 'INITIAL_APPROVAL', 'INPROGRESS', 'REJECTED') NOT NULL,
    PRIMARY KEY (revenue_number)
);


INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('1', '1', '12', 'Advance for LOAN', '2025-03-01', '25000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('2', '1', '12', 'Advance for Loan', '2025-03-03', '30000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('3', '1', '12', 'Advance for Loan', '2025-03-08', '40000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('4', '1', '3', 'Advance for Loan', '2025-03-01', '10000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('5', '1', '3', 'Advance for Loan', '2025-03-03', '15000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('6', '1', '3', 'Advance for Loan', '2025-03-08', '16000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('7', '1', '7', 'Advance for Loan', '2025-03-01', '5000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('8', '1', '7', 'Advance for Loan', '2025-03-03', '6000', '7', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('9', '1', '7', 'Advance for Loan', '2025-03-08', '7000', '7', null, null, null, 'INPROGRESS');




CREATE TABLE expenses (
    expenses_number INTEGER NOT NULL,
    finance_id INTEGER,
	spender_details VARCHAR(255),
    spend_amount FLOAT(53) NOT NULL,
    spend_date DATE NOT NULL,
    spender_member_no INTEGER,
    first_approver_member_no INTEGER,
    second_approver_member_no INTEGER,
    first_approval_date_time TIMESTAMP(6),
    second_approval_date_time TIMESTAMP(6),
    current_status VARCHAR(20) CHECK (current_status IN ('COMPLETED', 'INITIAL_APPROVAL', 'INPROGRESS', 'REJECTED')) NOT NULL,
    PRIMARY KEY (expenses_number)
);


INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 1, 'Bata Cash', 1000, '2025-03-01', 12, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 1, 'Divident Payout', 5000, '2025-03-03', 12, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 1, 'Lottry', 6000, '2025-03-08', 12, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (4, 1, 'Bata Cash', 2000, '2025-03-01', 3, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (5, 1, 'Divident Payout', 15000, '2025-03-03', 3, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (6, 1, 'Dubai Lotty', 16000, '2025-03-08', 3, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (7, 1, 'Bata Cash', 3000, '2025-03-01', 7, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (8, 1, 'Divident Payout', 30000, '2025-03-03', 7, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (9, 1, 'Super Lotto', 35000, '2025-03-08', 7, 7, null, null, null, 'INPROGRESS');



CREATE TABLE loan (
    loan_no INTEGER NOT NULL PRIMARY KEY,
	loan_applicant_name INTEGER,
	loan_reference_name INTEGER,
	loan_date DATE,
	loan_start_date DATE,
    loan_end_date DATE,
	loan_preclosure_date DATE,
	loan_amount NUMERIC(19,2),
	disbursement_amount NUMERIC(19,2),
	interest_amount NUMERIC(19,2),
    finance_id INTEGER,
    preclosure_amount NUMERIC(19,2),
    received_amount NUMERIC(19,2),
    remaining_balance NUMERIC(19,2),
	first_approver_member_no INTEGER,
	first_approval_date_time TIMESTAMP(6),
    second_approver_member_no INTEGER,
    second_approval_date_time TIMESTAMP(6),
    current_status VARCHAR(20) CHECK (current_status IN ('CLOSED', 'INITIAL_APPROVAL', 'INPROGRESS', 'PRE_CLOSED', 'REJECTED', 'REQUESTED'))
);





CREATE TABLE loan_emi_detail (
	emi_id INTEGER NOT NULL PRIMARY KEY,
	loan_no INTEGER,
	emi_number INTEGER,
	emi_date DATE,
	amount NUMERIC(19,2),
	paid_on_time BOOLEAN,
    first_approver_member_no INTEGER,
	first_approval_date_time TIMESTAMP(6),
    second_approver_member_no INTEGER,
	second_approval_date_time TIMESTAMP(6),
    payment_date_time TIMESTAMP(6),
    current_status VARCHAR(20) CHECK (current_status IN ('INITIAL_APPROVAL', 'INPROGRESS', 'PAID', 'PRECLOSE', 'REQUESTED')),
    FOREIGN KEY (loan_no) REFERENCES loan(loan_no) ON DELETE CASCADE
);









CREATE TABLE chits (
	chits_no INTEGER NOT NULL,
    chits_name_of INTEGER,
    chits_start_date DATE,
    finance_id INTEGER,
    total_chits_amount INTEGER,
    total_chits_number INTEGER,
	first_approver_member_no INTEGER,
	second_approver_member_no INTEGER,
	first_approval_date_time TIMESTAMP(6),
	second_approval_date_time TIMESTAMP(6),    
    current_status VARCHAR(20) CHECK (current_status IN ('CLOSED', 'INITIAL_APPROVAL', 'INPROGRESS', 'REJECTED', 'REQUESTED')) NOT NULL,
    PRIMARY KEY (chits_no)
);



CREATE TABLE chits_emi_detail (
    emi_id INTEGER NOT NULL,
	emi_number INTEGER,
	amount NUMERIC(19, 2),
    chits_no INTEGER,
    emi_date DATE,
    paid_on_time BOOLEAN,    
	payment_date_time TIMESTAMP(6),
    first_approver_member_no INTEGER,
    second_approver_member_no INTEGER,
    first_approval_date_time TIMESTAMP(6),
    second_approval_date_time TIMESTAMP(6),
    current_status VARCHAR(20) CHECK (current_status IN ('INITIAL_APPROVAL', 'INPROGRESS', 'PAID','REQUESTED')) NOT NULL,
    PRIMARY KEY (emi_id)
);





INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, first_approver_member_no,second_approver_member_no,first_approval_date_time,second_approval_date_time,total_chits_number, current_status) VALUES (1, 7, '2023-10-21', 1, 300000, 20, 7, null, null, null, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, first_approver_member_no,second_approver_member_no,first_approval_date_time,second_approval_date_time,total_chits_number, current_status) VALUES (2, 7, '2023-10-08', 1, 400000, 20, 7, null, null, null, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, first_approver_member_no,second_approver_member_no,first_approval_date_time,second_approval_date_time,total_chits_number, current_status) VALUES (3, 4, '2024-01-04', 1, 500000, 20, 7, null, null, null, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, first_approver_member_no,second_approver_member_no,first_approval_date_time,second_approval_date_time,total_chits_number, current_status) VALUES (4, 7, '2024-08-01', 1, 700000, 20, 7, null, null, null, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, first_approver_member_no,second_approver_member_no,first_approval_date_time,second_approval_date_time,total_chits_number, current_status) VALUES (5, 1, '2023-03-03', 1, 800000, 20, 7, null, null, null, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, first_approver_member_no,second_approver_member_no,first_approval_date_time,second_approval_date_time,total_chits_number, current_status) VALUES (6, 6, '2023-03-09', 2, 700000, 20, 2, null, null, null, 'REQUESTED');



INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 1, 15000, 1, '2023-11-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 2, 11550, 1, '2023-12-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 3, 11700, 1, '2024-01-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (4, 4, 11850, 1, '2024-02-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (5, 5, 12150, 1, '2024-03-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (6, 6, 12150, 1, '2024-04-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (7, 7, 12300, 1, '2024-05-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (8, 8, 12450, 1, '2024-06-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (9, 9, 12600, 1, '2024-07-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (10, 10, 12750, 1, '2024-08-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (11, 11, 12900, 1, '2024-09-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (12, 12, 13200, 1, '2024-10-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (13, 13, 13500, 1, '2024-11-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (14, 14, 13800, 1, '2024-12-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (15, 15, 14100, 1, '2025-01-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (16, 16, 14400, 1, '2025-02-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (17, 17, 14550, 1, '2025-03-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (18, 18, 14700, 1, '2025-04-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (19, 19, 14850, 1, '2025-05-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (20, 20, 15000, 1, '2025-06-21', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (21, 1, 20000, 2, '2023-11-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (22, 2, 15400, 2, '2023-12-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (23, 3, 15600, 2, '2024-01-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (24, 4, 15800, 2, '2024-02-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (25, 5, 16200, 2, '2024-03-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (26, 6, 16200, 2, '2024-04-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (27, 7, 16400, 2, '2024-05-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (28, 8, 16600, 2, '2024-06-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (29, 9, 16800, 2, '2024-07-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (30, 10, 17000, 2, '2024-08-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (31, 11, 17200, 2, '2024-09-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (32, 12, 17600, 2, '2024-10-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (33, 13, 18000, 2, '2024-11-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (34, 14, 18400, 2, '2024-12-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (35, 15, 18800, 2, '2025-01-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (36, 16, 19200, 2, '2025-02-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (37, 17, 19400, 2, '2025-03-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (38, 18, 19600, 2, '2025-04-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (39, 19, 19800, 2, '2025-05-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (40, 20, 20000, 2, '2025-06-08', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (41, 1, 25000, 3, '2024-02-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (42, 2, 19250, 3, '2024-03-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (43, 3, 19500, 3, '2024-04-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (44, 4, 19750, 3, '2024-05-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (45, 5, 20250, 3, '2024-06-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (46, 6, 20250, 3, '2024-07-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (47, 7, 20500, 3, '2024-08-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (48, 8, 20750, 3, '2024-09-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (49, 9, 21000, 3, '2024-10-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (50, 10, 21250, 3, '2024-11-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (51, 11, 21500, 3, '2024-12-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (52, 12, 22000, 3, '2025-01-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (53, 13, 22500, 3, '2025-02-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (54, 14, 23000, 3, '2025-03-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (55, 15, 23500, 3, '2025-04-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (56, 16, 24000, 3, '2025-05-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (57, 17, 24250, 3, '2025-06-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (58, 18, 24500, 3, '2025-07-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (59, 19, 24750, 3, '2025-08-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (60, 20, 25000, 3, '2025-09-04', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (61, 1, 35000, 4, '2024-09-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (62, 2, 26950, 4, '2024-10-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (63, 3, 27300, 4, '2024-11-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (64, 4, 27650, 4, '2024-12-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (65, 5, 28350, 4, '2025-01-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (66, 6, 28350, 4, '2025-02-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (67, 7, 28700, 4, '2025-03-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (68, 8, 29050, 4, '2025-04-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (69, 9, 29400, 4, '2025-05-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (70, 10, 29750, 4, '2025-06-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (71, 11, 30100, 4, '2025-07-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (72, 12, 30800, 4, '2025-08-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (73, 13, 31500, 4, '2025-09-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (74, 14, 32200, 4, '2025-10-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (75, 15, 32900, 4, '2025-11-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (76, 16, 33600, 4, '2025-12-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (77, 17, 33950, 4, '2026-01-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (78, 18, 34300, 4, '2026-02-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (79, 19, 34650, 4, '2026-03-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (80, 20, 35000, 4, '2026-04-01', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (81, 1, 40000, 5, '2023-04-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (82, 2, 30800, 5, '2023-05-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (83, 3, 31200, 5, '2023-06-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (84, 4, 31600, 5, '2023-07-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (85, 5, 32400, 5, '2023-08-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (86, 6, 32400, 5, '2023-09-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (87, 7, 32800, 5, '2023-10-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (88, 8, 33200, 5, '2023-11-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (89, 9, 33600, 5, '2023-12-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (90, 10, 34000, 5, '2024-01-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (91, 11, 34400, 5, '2024-02-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (92, 12, 35200, 5, '2024-03-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (93, 13, 36000, 5, '2024-04-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (94, 14, 36800, 5, '2024-05-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (95, 15, 37600, 5, '2024-06-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (96, 16, 38400, 5, '2024-07-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (97, 17, 38800, 5, '2024-08-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (98, 18, 39200, 5, '2024-09-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (99, 19, 39600, 5, '2024-10-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (100, 20, 40000, 5, '2024-11-03', null, null, 7, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (101, 1, 35000, 6, '2023-04-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (102, 2, 26950, 6, '2023-05-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (103, 3, 27300, 6, '2023-06-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (104, 4, 27650, 6, '2023-07-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (105, 5, 28350, 6, '2023-08-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (106, 6, 28350, 6, '2023-09-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (107, 7, 28700, 6, '2023-10-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (108, 8, 29050, 6, '2023-11-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (109, 9, 29400, 6, '2023-12-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (110, 10, 29750, 6, '2024-01-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (111, 11, 30100, 6, '2024-02-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (112, 12, 30800, 6, '2024-03-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (113, 13, 31500, 6, '2024-04-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (114, 14, 32200, 6, '2024-05-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (115, 15, 32900, 6, '2024-06-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (116, 16, 33600, 6, '2024-07-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (117, 17, 33950, 6, '2024-08-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (118, 18, 34300, 6, '2024-09-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (119, 19, 34650, 6, '2024-10-09', null, null, 2, null, null, null, 'REQUESTED');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (120, 20, 35000, 6, '2024-11-09', null, null, 2, null, null, null, 'REQUESTED');





CREATE TABLE settings (
    no INTEGER NOT NULL PRIMARY KEY,
    last_updated_date TIMESTAMP(6),
    settings_name VARCHAR(255),
    settings_value VARCHAR(255),
    last_updated_member_no INTEGER
);

INSERT INTO settings (no, last_updated_date, settings_name, settings_value, last_updated_member_no) 
VALUES (1, '2025-03-06 02:22:37.0538', 'approvalProcess', 'approvalProcessParallel', 12);

INSERT INTO settings (no, last_updated_date, settings_name, settings_value, last_updated_member_no) 
VALUES (2, '2025-03-06 02:22:37.0538', 'secondaryLogin', 'loginStatusNo', 12);

INSERT INTO settings (no, last_updated_date, settings_name, settings_value, last_updated_member_no) 
VALUES (3, '2025-03-06 02:22:37.0538', 'approvalCutOffDay', 'Sunday', 12);

INSERT INTO settings (no, last_updated_date, settings_name, settings_value, last_updated_member_no) 
VALUES (4, '2025-03-06 02:22:37.0538', 'approvalCutOffTime', '16:00', 12);

INSERT INTO settings (no, last_updated_date, settings_name, settings_value, last_updated_member_no) 
VALUES (5, '2025-03-06 02:22:37.0538', 'expensesStatus', 'expensesStatusNo', 12);

INSERT INTO settings (no, last_updated_date, settings_name, settings_value, last_updated_member_no) 
VALUES (6, '2025-03-06 02:22:37.0538', 'revenueStatus', 'revenueStatusNo', 12);




INSERT INTO "PUBLIC"."LOAN" VALUES(1, 4, 4, DATE '2025-01-05', DATE '2025-01-12', DATE '2025-05-04', NULL, 5000.00, 4500.00, 500.00, 1, NULL, 0.00, 5000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(2, 5, 5, DATE '2025-01-05', DATE '2025-01-12', DATE '2025-05-04', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(3, 6, 6, DATE '2025-01-05', DATE '2025-01-12', DATE '2025-05-04', NULL, 15000.00, 13500.00, 1500.00, 1, NULL, 0.00, 15000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(4, 5, 5, DATE '2025-01-05', DATE '2025-01-12', DATE '2025-05-04', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(5, 3, 3, DATE '2025-01-12', DATE '2025-01-19', DATE '2025-05-11', NULL, 30000.00, 27000.00, 3000.00, 1, NULL, 0.00, 30000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(6, 3, 3, DATE '2025-01-12', DATE '2025-01-19', DATE '2025-05-11', NULL, 25000.00, 22500.00, 2500.00, 1, NULL, 0.00, 25000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(7, 7, 7, DATE '2025-01-12', DATE '2025-01-19', DATE '2025-05-11', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(8, 6, 6, DATE '2025-01-19', DATE '2025-01-26', DATE '2025-05-18', NULL, 20000.00, 18000.00, 2000.00, 1, NULL, 0.00, 20000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(9, 7, 7, DATE '2025-01-19', DATE '2025-01-26', DATE '2025-05-18', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(10, 6, 6, DATE '2025-01-26', DATE '2025-02-02', DATE '2025-05-25', NULL, 60000.00, 54000.00, 6000.00, 1, NULL, 0.00, 60000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(11, 5, 5, DATE '2025-02-02', DATE '2025-02-09', DATE '2025-06-01', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(12, 3, 3, DATE '2025-02-02', DATE '2025-02-09', DATE '2025-06-01', NULL, 20000.00, 18000.00, 2000.00, 1, NULL, 0.00, 20000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(13, 9, 9, DATE '2025-02-09', DATE '2025-02-16', DATE '2025-06-08', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(14, 6, 6, DATE '2025-02-09', DATE '2025-02-16', DATE '2025-06-08', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(15, 11, 11, DATE '2025-02-16', DATE '2025-02-23', DATE '2025-06-15', NULL, 15000.00, 13500.00, 1500.00, 1, NULL, 0.00, 15000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(16, 2, 2, DATE '2025-02-16', DATE '2025-02-23', DATE '2025-06-15', NULL, 50000.00, 45000.00, 5000.00, 1, NULL, 0.00, 50000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(17, 3, 3, DATE '2025-02-16', DATE '2025-02-23', DATE '2025-06-15', NULL, 20000.00, 18000.00, 2000.00, 1, NULL, 0.00, 20000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(18, 3, 3, DATE '2025-02-16', DATE '2025-02-23', DATE '2025-06-15', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(19, 6, 6, DATE '2025-02-23', DATE '2025-03-02', DATE '2025-06-22', NULL, 5000.00, 4500.00, 500.00, 1, NULL, 0.00, 5000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(20, 6, 6, DATE '2025-02-23', DATE '2025-03-02', DATE '2025-06-22', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(21, 6, 6, DATE '2025-02-23', DATE '2025-03-02', DATE '2025-06-22', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(22, 3, 3, DATE '2025-03-02', DATE '2025-03-09', DATE '2025-06-29', NULL, 50000.00, 45000.00, 5000.00, 1, NULL, 0.00, 50000.00, 7, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN" VALUES(23, 5, 5, DATE '2025-03-02', DATE '2025-03-09', DATE '2025-06-29', NULL, 10000.00, 9000.00, 1000.00, 1, NULL, 0.00, 10000.00, 7, NULL, NULL, NULL, 'REQUESTED');


INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(1, 1, 1, DATE '2025-01-12', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(2, 1, 2, DATE '2025-01-19', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(3, 1, 3, DATE '2025-01-26', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(4, 1, 4, DATE '2025-02-02', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(5, 1, 5, DATE '2025-02-09', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(6, 1, 6, DATE '2025-02-16', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(7, 1, 7, DATE '2025-02-23', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(8, 1, 8, DATE '2025-03-02', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(9, 1, 9, DATE '2025-03-09', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(10, 1, 10, DATE '2025-03-16', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(11, 1, 11, DATE '2025-03-23', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(12, 1, 12, DATE '2025-03-30', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(13, 1, 13, DATE '2025-04-06', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(14, 1, 14, DATE '2025-04-13', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(15, 1, 15, DATE '2025-04-20', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(16, 1, 16, DATE '2025-04-27', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(17, 1, 17, DATE '2025-05-04', 200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(18, 2, 1, DATE '2025-01-12', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(19, 2, 2, DATE '2025-01-19', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(20, 2, 3, DATE '2025-01-26', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(21, 2, 4, DATE '2025-02-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(22, 2, 5, DATE '2025-02-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(23, 2, 6, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(24, 2, 7, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(25, 2, 8, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(26, 2, 9, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(27, 2, 10, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(28, 2, 11, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(29, 2, 12, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(30, 2, 13, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(31, 2, 14, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(32, 2, 15, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(33, 2, 16, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(34, 2, 17, DATE '2025-05-04', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(35, 3, 1, DATE '2025-01-12', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(36, 3, 2, DATE '2025-01-19', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(37, 3, 3, DATE '2025-01-26', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(38, 3, 4, DATE '2025-02-02', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(39, 3, 5, DATE '2025-02-09', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(40, 3, 6, DATE '2025-02-16', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(41, 3, 7, DATE '2025-02-23', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(42, 3, 8, DATE '2025-03-02', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(43, 3, 9, DATE '2025-03-09', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(44, 3, 10, DATE '2025-03-16', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(45, 3, 11, DATE '2025-03-23', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(46, 3, 12, DATE '2025-03-30', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(47, 3, 13, DATE '2025-04-06', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(48, 3, 14, DATE '2025-04-13', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(49, 3, 15, DATE '2025-04-20', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(50, 3, 16, DATE '2025-04-27', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(51, 3, 17, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(52, 4, 1, DATE '2025-01-12', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(53, 4, 2, DATE '2025-01-19', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(54, 4, 3, DATE '2025-01-26', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(55, 4, 4, DATE '2025-02-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(56, 4, 5, DATE '2025-02-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(57, 4, 6, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(58, 4, 7, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(59, 4, 8, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(60, 4, 9, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(61, 4, 10, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(62, 4, 11, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(63, 4, 12, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(64, 4, 13, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(65, 4, 14, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(66, 4, 15, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(67, 4, 16, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(68, 4, 17, DATE '2025-05-04', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(69, 5, 1, DATE '2025-01-19', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(70, 5, 2, DATE '2025-01-26', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(71, 5, 3, DATE '2025-02-02', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(72, 5, 4, DATE '2025-02-09', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(73, 5, 5, DATE '2025-02-16', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(74, 5, 6, DATE '2025-02-23', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(75, 5, 7, DATE '2025-03-02', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(76, 5, 8, DATE '2025-03-09', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(77, 5, 9, DATE '2025-03-16', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(78, 5, 10, DATE '2025-03-23', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(79, 5, 11, DATE '2025-03-30', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(80, 5, 12, DATE '2025-04-06', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(81, 5, 13, DATE '2025-04-13', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(82, 5, 14, DATE '2025-04-20', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(83, 5, 15, DATE '2025-04-27', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(84, 5, 16, DATE '2025-05-04', 1800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(85, 5, 17, DATE '2025-05-11', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(86, 6, 1, DATE '2025-01-19', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(87, 6, 2, DATE '2025-01-26', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(88, 6, 3, DATE '2025-02-02', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(89, 6, 4, DATE '2025-02-09', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(90, 6, 5, DATE '2025-02-16', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(91, 6, 6, DATE '2025-02-23', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(92, 6, 7, DATE '2025-03-02', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(93, 6, 8, DATE '2025-03-09', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(94, 6, 9, DATE '2025-03-16', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(95, 6, 10, DATE '2025-03-23', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(96, 6, 11, DATE '2025-03-30', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(97, 6, 12, DATE '2025-04-06', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(98, 6, 13, DATE '2025-04-13', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(99, 6, 14, DATE '2025-04-20', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(100, 6, 15, DATE '2025-04-27', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(101, 6, 16, DATE '2025-05-04', 1500.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(102, 6, 17, DATE '2025-05-11', 1000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(103, 7, 1, DATE '2025-01-19', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(104, 7, 2, DATE '2025-01-26', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(105, 7, 3, DATE '2025-02-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(106, 7, 4, DATE '2025-02-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(107, 7, 5, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(108, 7, 6, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(109, 7, 7, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(110, 7, 8, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(111, 7, 9, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(112, 7, 10, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(113, 7, 11, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(114, 7, 12, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(115, 7, 13, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(116, 7, 14, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(117, 7, 15, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(118, 7, 16, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(119, 7, 17, DATE '2025-05-11', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(120, 8, 1, DATE '2025-01-26', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(121, 8, 2, DATE '2025-02-02', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(122, 8, 3, DATE '2025-02-09', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(123, 8, 4, DATE '2025-02-16', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(124, 8, 5, DATE '2025-02-23', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(125, 8, 6, DATE '2025-03-02', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(126, 8, 7, DATE '2025-03-09', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(127, 8, 8, DATE '2025-03-16', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(128, 8, 9, DATE '2025-03-23', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(129, 8, 10, DATE '2025-03-30', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(130, 8, 11, DATE '2025-04-06', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(131, 8, 12, DATE '2025-04-13', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(132, 8, 13, DATE '2025-04-20', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(133, 8, 14, DATE '2025-04-27', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(134, 8, 15, DATE '2025-05-04', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(135, 8, 16, DATE '2025-05-11', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(136, 8, 17, DATE '2025-05-18', 800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(137, 9, 1, DATE '2025-01-26', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(138, 9, 2, DATE '2025-02-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(139, 9, 3, DATE '2025-02-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(140, 9, 4, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(141, 9, 5, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(142, 9, 6, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(143, 9, 7, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(144, 9, 8, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(145, 9, 9, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(146, 9, 10, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(147, 9, 11, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(148, 9, 12, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(149, 9, 13, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(150, 9, 14, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(151, 9, 15, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(152, 9, 16, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(153, 9, 17, DATE '2025-05-18', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(154, 10, 1, DATE '2025-02-02', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(155, 10, 2, DATE '2025-02-09', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(156, 10, 3, DATE '2025-02-16', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(157, 10, 4, DATE '2025-02-23', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(158, 10, 5, DATE '2025-03-02', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(159, 10, 6, DATE '2025-03-09', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(160, 10, 7, DATE '2025-03-16', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(161, 10, 8, DATE '2025-03-23', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(162, 10, 9, DATE '2025-03-30', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(163, 10, 10, DATE '2025-04-06', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(164, 10, 11, DATE '2025-04-13', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(165, 10, 12, DATE '2025-04-20', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(166, 10, 13, DATE '2025-04-27', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(167, 10, 14, DATE '2025-05-04', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(168, 10, 15, DATE '2025-05-11', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(169, 10, 16, DATE '2025-05-18', 3600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(170, 10, 17, DATE '2025-05-25', 2400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(171, 11, 1, DATE '2025-02-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(172, 11, 2, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(173, 11, 3, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(174, 11, 4, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(175, 11, 5, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(176, 11, 6, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(177, 11, 7, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(178, 11, 8, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(179, 11, 9, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(180, 11, 10, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(181, 11, 11, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(182, 11, 12, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(183, 11, 13, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(184, 11, 14, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(185, 11, 15, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(186, 11, 16, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(187, 11, 17, DATE '2025-06-01', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(188, 12, 1, DATE '2025-02-09', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(189, 12, 2, DATE '2025-02-16', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(190, 12, 3, DATE '2025-02-23', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(191, 12, 4, DATE '2025-03-02', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(192, 12, 5, DATE '2025-03-09', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(193, 12, 6, DATE '2025-03-16', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(194, 12, 7, DATE '2025-03-23', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(195, 12, 8, DATE '2025-03-30', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(196, 12, 9, DATE '2025-04-06', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(197, 12, 10, DATE '2025-04-13', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(198, 12, 11, DATE '2025-04-20', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(199, 12, 12, DATE '2025-04-27', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(200, 12, 13, DATE '2025-05-04', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(201, 12, 14, DATE '2025-05-11', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(202, 12, 15, DATE '2025-05-18', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(203, 12, 16, DATE '2025-05-25', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(204, 12, 17, DATE '2025-06-01', 800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(205, 13, 1, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(206, 13, 2, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(207, 13, 3, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(208, 13, 4, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(209, 13, 5, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(210, 13, 6, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(211, 13, 7, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(212, 13, 8, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(213, 13, 9, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(214, 13, 10, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(215, 13, 11, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(216, 13, 12, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(217, 13, 13, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(218, 13, 14, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(219, 13, 15, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(220, 13, 16, DATE '2025-06-01', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(221, 13, 17, DATE '2025-06-08', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(222, 14, 1, DATE '2025-02-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(223, 14, 2, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(224, 14, 3, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(225, 14, 4, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(226, 14, 5, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(227, 14, 6, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(228, 14, 7, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(229, 14, 8, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(230, 14, 9, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(231, 14, 10, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(232, 14, 11, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(233, 14, 12, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(234, 14, 13, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(235, 14, 14, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(236, 14, 15, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(237, 14, 16, DATE '2025-06-01', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(238, 14, 17, DATE '2025-06-08', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(239, 15, 1, DATE '2025-02-23', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(240, 15, 2, DATE '2025-03-02', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(241, 15, 3, DATE '2025-03-09', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(242, 15, 4, DATE '2025-03-16', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(243, 15, 5, DATE '2025-03-23', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(244, 15, 6, DATE '2025-03-30', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(245, 15, 7, DATE '2025-04-06', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(246, 15, 8, DATE '2025-04-13', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(247, 15, 9, DATE '2025-04-20', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(248, 15, 10, DATE '2025-04-27', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(249, 15, 11, DATE '2025-05-04', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(250, 15, 12, DATE '2025-05-11', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(251, 15, 13, DATE '2025-05-18', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(252, 15, 14, DATE '2025-05-25', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(253, 15, 15, DATE '2025-06-01', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(254, 15, 16, DATE '2025-06-08', 900.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(255, 15, 17, DATE '2025-06-15', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(256, 16, 1, DATE '2025-02-23', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(257, 16, 2, DATE '2025-03-02', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(258, 16, 3, DATE '2025-03-09', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(259, 16, 4, DATE '2025-03-16', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(260, 16, 5, DATE '2025-03-23', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(261, 16, 6, DATE '2025-03-30', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(262, 16, 7, DATE '2025-04-06', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(263, 16, 8, DATE '2025-04-13', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(264, 16, 9, DATE '2025-04-20', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(265, 16, 10, DATE '2025-04-27', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(266, 16, 11, DATE '2025-05-04', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(267, 16, 12, DATE '2025-05-11', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(268, 16, 13, DATE '2025-05-18', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(269, 16, 14, DATE '2025-05-25', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(270, 16, 15, DATE '2025-06-01', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(271, 16, 16, DATE '2025-06-08', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(272, 16, 17, DATE '2025-06-15', 2000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(273, 17, 1, DATE '2025-02-23', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(274, 17, 2, DATE '2025-03-02', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(275, 17, 3, DATE '2025-03-09', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(276, 17, 4, DATE '2025-03-16', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(277, 17, 5, DATE '2025-03-23', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(278, 17, 6, DATE '2025-03-30', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(279, 17, 7, DATE '2025-04-06', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(280, 17, 8, DATE '2025-04-13', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(281, 17, 9, DATE '2025-04-20', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(282, 17, 10, DATE '2025-04-27', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(283, 17, 11, DATE '2025-05-04', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(284, 17, 12, DATE '2025-05-11', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(285, 17, 13, DATE '2025-05-18', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(286, 17, 14, DATE '2025-05-25', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(287, 17, 15, DATE '2025-06-01', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(288, 17, 16, DATE '2025-06-08', 1200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(289, 17, 17, DATE '2025-06-15', 800.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(290, 18, 1, DATE '2025-02-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(291, 18, 2, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(292, 18, 3, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(293, 18, 4, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(294, 18, 5, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(295, 18, 6, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(296, 18, 7, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(297, 18, 8, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(298, 18, 9, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(299, 18, 10, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(300, 18, 11, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(301, 18, 12, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(302, 18, 13, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(303, 18, 14, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(304, 18, 15, DATE '2025-06-01', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(305, 18, 16, DATE '2025-06-08', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(306, 18, 17, DATE '2025-06-15', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(307, 19, 1, DATE '2025-03-02', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(308, 19, 2, DATE '2025-03-09', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(309, 19, 3, DATE '2025-03-16', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(310, 19, 4, DATE '2025-03-23', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(311, 19, 5, DATE '2025-03-30', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(312, 19, 6, DATE '2025-04-06', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(313, 19, 7, DATE '2025-04-13', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(314, 19, 8, DATE '2025-04-20', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(315, 19, 9, DATE '2025-04-27', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(316, 19, 10, DATE '2025-05-04', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(317, 19, 11, DATE '2025-05-11', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(318, 19, 12, DATE '2025-05-18', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(319, 19, 13, DATE '2025-05-25', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(320, 19, 14, DATE '2025-06-01', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(321, 19, 15, DATE '2025-06-08', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(322, 19, 16, DATE '2025-06-15', 300.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(323, 19, 17, DATE '2025-06-22', 200.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(324, 20, 1, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(325, 20, 2, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(326, 20, 3, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(327, 20, 4, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(328, 20, 5, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(329, 20, 6, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(330, 20, 7, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(331, 20, 8, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(332, 20, 9, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(333, 20, 10, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(334, 20, 11, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(335, 20, 12, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(336, 20, 13, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(337, 20, 14, DATE '2025-06-01', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(338, 20, 15, DATE '2025-06-08', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(339, 20, 16, DATE '2025-06-15', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(340, 20, 17, DATE '2025-06-22', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(341, 21, 1, DATE '2025-03-02', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(342, 21, 2, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(343, 21, 3, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(344, 21, 4, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(345, 21, 5, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(346, 21, 6, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(347, 21, 7, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(348, 21, 8, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(349, 21, 9, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(350, 21, 10, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(351, 21, 11, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(352, 21, 12, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(353, 21, 13, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(354, 21, 14, DATE '2025-06-01', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(355, 21, 15, DATE '2025-06-08', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(356, 21, 16, DATE '2025-06-15', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(357, 21, 17, DATE '2025-06-22', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(358, 22, 1, DATE '2025-03-09', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(359, 22, 2, DATE '2025-03-16', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(360, 22, 3, DATE '2025-03-23', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(361, 22, 4, DATE '2025-03-30', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(362, 22, 5, DATE '2025-04-06', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(363, 22, 6, DATE '2025-04-13', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(364, 22, 7, DATE '2025-04-20', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(365, 22, 8, DATE '2025-04-27', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(366, 22, 9, DATE '2025-05-04', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(367, 22, 10, DATE '2025-05-11', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(368, 22, 11, DATE '2025-05-18', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(369, 22, 12, DATE '2025-05-25', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(370, 22, 13, DATE '2025-06-01', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(371, 22, 14, DATE '2025-06-08', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(372, 22, 15, DATE '2025-06-15', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(373, 22, 16, DATE '2025-06-22', 3000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(374, 22, 17, DATE '2025-06-29', 2000.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(375, 23, 1, DATE '2025-03-09', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(376, 23, 2, DATE '2025-03-16', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(377, 23, 3, DATE '2025-03-23', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(378, 23, 4, DATE '2025-03-30', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(379, 23, 5, DATE '2025-04-06', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(380, 23, 6, DATE '2025-04-13', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(381, 23, 7, DATE '2025-04-20', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(382, 23, 8, DATE '2025-04-27', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(383, 23, 9, DATE '2025-05-04', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(384, 23, 10, DATE '2025-05-11', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(385, 23, 11, DATE '2025-05-18', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(386, 23, 12, DATE '2025-05-25', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(387, 23, 13, DATE '2025-06-01', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(388, 23, 14, DATE '2025-06-08', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(389, 23, 15, DATE '2025-06-15', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(390, 23, 16, DATE '2025-06-22', 600.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
INSERT INTO "PUBLIC"."LOAN_EMI_DETAIL" VALUES(391, 23, 17, DATE '2025-06-29', 400.00, NULL, 7, NULL, NULL, NULL, NULL, 'REQUESTED');
