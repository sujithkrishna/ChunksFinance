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

CREATE TABLE finance (
    id INTEGER NOT NULL,
	finance_name VARCHAR(255) NOT NULL,
	finance_owner_no INTEGER,
    finance_creationdate DATE NOT NULL,	
    finance_amount FLOAT(53),
	current_balance FLOAT(53),
    finance_type ENUM('PRIMARY', 'SECONDARY') NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uniq_finance_composite UNIQUE (finance_type, finance_name, finance_owner_no)
);

insert into finance (current_balance,finance_amount,finance_creationdate,finance_name,finance_owner_no,finance_type,id) values (0,300,'2023-12-17','Chunks Finance',7,'PRIMARY',1);
insert into finance (current_balance,finance_amount,finance_creationdate,finance_name,finance_owner_no,finance_type,id) values (0,0,'2024-09-01','Onam Fund',2,'SECONDARY',2);


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




CREATE TABLE loan (
    loan_no INTEGER NOT NULL,
	loan_applicant_name VARCHAR(255),
	loan_reference_name VARCHAR(255),
	loan_date DATE,
	loan_amount NUMERIC(19, 2),
	received_amount NUMERIC(19, 2),
	finance_id INTEGER,
	disbursement_amount NUMERIC(19, 2),
    yet_to_receive_amount NUMERIC(19, 2),    
    interest_amount NUMERIC(19, 2),
    loan_repayment_date DATE,    
    first_approver_member_no INTEGER,
    second_approver_member_no INTEGER,
    first_approval_date_time TIMESTAMP(6),
    second_approval_date_time TIMESTAMP(6),
    current_status VARCHAR(20) CHECK (current_status IN ('CLOSED', 'INITIAL_APPROVAL', 'INPROGRESS', 'PRE_CLOSED', 'REJECTED', 'REQUESTED')) NOT NULL,
    PRIMARY KEY (loan_no)
);






CREATE TABLE loan_emi_detail (
    emi_id INTEGER NOT NULL,
	emi_number INTEGER,
	amount NUMERIC(19, 2),
	loan_no INTEGER,
    emi_date DATE,
	paid_on_time BOOLEAN,
    payment_date_time TIMESTAMP(6),	
    first_approver_member_no INTEGER,
    second_approver_member_no INTEGER,
    first_approval_date_time TIMESTAMP(6),
    second_approval_date_time TIMESTAMP(6),
    current_status VARCHAR(20) CHECK (current_status IN ('INITIAL_APPROVAL', 'INPROGRESS', 'PAID', 'PRECLOSE')) NOT NULL,
    PRIMARY KEY (emi_id)
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


INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, total_chits_number, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 7, '2023-10-21', 1, 300000, 20, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, total_chits_number, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 4, '2024-01-04', 1, 300000, 20, 7, null, null, null , 'INPROGRESS');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, total_chits_number, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 7, '2024-08-01', 1, 300000, 20, 7, null, null, null ,'INPROGRESS');


INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 1, 15000, 1, '2023-11-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 2, 11550, 1, '2023-12-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 3, 11700, 1, '2024-01-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (4, 4, 11850, 1, '2024-02-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (5, 5, 12150, 1, '2024-03-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (6, 6, 12150, 1, '2024-04-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (7, 7, 12300, 1, '2024-05-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (8, 8, 12450, 1, '2024-06-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (9, 9, 12600, 1, '2024-07-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (10, 10, 12750, 1, '2024-08-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (11, 11, 12900, 1, '2024-09-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (12, 12, 13200, 1, '2024-10-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (13, 13, 13500, 1, '2024-11-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (14, 14, 13800, 1, '2024-12-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (15, 15, 14100, 1, '2025-01-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (16, 16, 14400, 1, '2025-02-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (17, 17, 14550, 1, '2025-03-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (18, 18, 14700, 1, '2025-04-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (19, 19, 14850, 1, '2025-05-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (20, 20, 15000, 1, '2025-06-21', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (21, 1, 15000, 2, '2024-02-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (22, 2, 11550, 2, '2024-03-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (23, 3, 11700, 2, '2024-04-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (24, 4, 11850, 2, '2024-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (25, 5, 12150, 2, '2024-06-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (26, 6, 12150, 2, '2024-07-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (27, 7, 12300, 2, '2024-08-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (28, 8, 12450, 2, '2024-09-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (29, 9, 12600, 2, '2024-10-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (30, 10, 12750, 2, '2024-11-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (31, 11, 12900, 2, '2024-12-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (32, 12, 13200, 2, '2025-01-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (33, 13, 13500, 2, '2025-02-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (34, 14, 13800, 2, '2025-03-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (35, 15, 14100, 2, '2025-04-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (36, 16, 14400, 2, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (37, 17, 14550, 2, '2025-06-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (38, 18, 14700, 2, '2025-07-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (39, 19, 14850, 2, '2025-08-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (40, 20, 15000, 2, '2025-09-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (41, 1, 15000, 3, '2024-09-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (42, 2, 11550, 3, '2024-10-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (43, 3, 11700, 3, '2024-11-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (44, 4, 11850, 3, '2024-12-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (45, 5, 12150, 3, '2025-01-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (46, 6, 12150, 3, '2025-02-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (47, 7, 12300, 3, '2025-03-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (48, 8, 12450, 3, '2025-04-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (49, 9, 12600, 3, '2025-05-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (50, 10, 12750, 3, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (51, 11, 12900, 3, '2025-07-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (52, 12, 13200, 3, '2025-08-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (53, 13, 13500, 3, '2025-09-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (54, 14, 13800, 3, '2025-10-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (55, 15, 14100, 3, '2025-11-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (56, 16, 14400, 3, '2025-12-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (57, 17, 14550, 3, '2026-01-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (58, 18, 14700, 3, '2026-02-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (59, 19, 14850, 3, '2026-03-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (60, 20, 15000, 3, '2026-04-01', null, null, 7, null, null, null, 'INPROGRESS');



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


