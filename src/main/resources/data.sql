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
    current_status VARCHAR(20) CHECK (current_status IN ('INITIAL_APPROVAL', 'INPROGRESS', 'PAID')) NOT NULL,
    PRIMARY KEY (emi_id)
);





CREATE TABLE settings (
    no INT NOT NULL PRIMARY KEY,
    last_updated_member_no INT,
    last_updated_date DATE,
    settings TEXT
);

INSERT INTO settings (no, last_updated_member_no, last_updated_date, settings)
VALUES (1, 12,'2025-03-03', '{"secondaryLogin":"loginStatusYes","approvalCutOffDay":"Sunday","approvalProcess":"approvalProcessParallel","approvalCutOffTime":"16:00"}');


