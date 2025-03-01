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
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (2, 'ജെയ്‌സൺ  കൊളുത്തുവള്ളി', 'jkraphy@gmail.com', 'amtyYXBoeQ==', '9496017942', '2025-06-03', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (3, 'ജിജിൻ ഫ്രാൻസിസ്', 'jijinfrancisanna@gmail.com', 'amlqaW5mcmFuY2lzYW5uYQ==', '9846417927', '2025-11-18', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (4, 'ജീജോ ജേക്കബ്', 'jeejo1441@gmail.com', 'amVlam8xNDQx', '9809523060', '2025-09-06', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (5, 'ജിജോ ജോൺ', 'jijojohn777@gmail.com', 'amlqb2pvaG43Nzc=', '9895415828', '2025-12-20', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (6, 'ലൂയിസ് ജോസഫ്', 'luisjoseph6551@gmail.com', 'bHVpc2pvc2VwaDY1NTE=', '9947886919', '2025-05-17', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (7, 'മനേഷ് മൈക്കിൽ', 'manesh.micheal@gmail.com', 'bWFuZXNoLm1pY2hlYWw=', '9995227002', '2025-11-07', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (8, 'രാജേഷ്  ദാമോദരൻ', 'rajeshdhamodharan', 'cmFqZXNoZGhhbW9kaGFyYW4=', '9995950402', '2025-12-28', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (9, 'ഷബീന ബഷീർ', 'aalimzayan@gmail.com', 'YWFsaW16YXlhbg==', '9946107720', '2025-11-25', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (10, 'സരിത റഫയൽ', 'saritharaphel@gmail.com', 'c2FyaXRoYXJhcGhlbA==', '7736544685', '2025-05-16', null, null, null, 'Kottayam', 'Kottayam', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (11, 'സിജിൻ  TV', 'sijin.celine@gmail.com', 'c2lqaW4uY2VsaW5l', '8304081488', '2025-12-18', null, null, null, 'Cherthala', 'Alappuzha', 'Kerala', '688537', 'PRIMARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (12, 'സുജിത്ത് കൃഷ്ണാ', 'sujithskrishna@gmail.com', 'c3VqaXRoc2tyaXNobmE=', '9845375129', '2025-07-06', null, 'Kaithavalappil House', 'Parayakad PO', 'Cherthala', 'Alappuzha', 'Kerala', '688540', 'PRIMARY', 'SUPER_ADMIN');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (13, 'ജയേഷ്  കെ കെ', 'jayeshkk', 'amF5ZXNoa2s=', null, null, '6', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (14, 'സീന  പള്ളിപ്പുറം', 'seenapallipuram', 'c2VlbmFwYWxsaXB1cmFt', null, null, '6', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (15, 'ആരതി വിഷ്ണു', 'arathivishnu', 'YXJhdGhpdmlzaG51', null, null, '6', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (16, 'വിനീഷ്  ചെല്ലപ്പൻ', 'vineeshchellappan', 'dmluZWVzaGNoZWxsYXBwYW4=', null, null, '5', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (17, 'റോയ്  മാത്യൂ', 'roymathew', 'cm95bWF0aGV3', null, null, '12', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (18, 'ഷീല ഭാസി', 'sheelabhasi', 'c2hlZWxhYmhhc2k=', null, null, '3', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (19, 'സുജാതാ', 'sujatha', 'c3VqYXRoYQ==', null, null, '10', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (20, 'മേരി മൈക്കിൽ', 'marrymichael', 'bWFycnltaWNoYWVs', null, null, '7', null, null, null, null, null, null, 'SECONDARY', 'USER');
INSERT INTO members (no, member_name, email_id, password, mobile_number, member_dob, reference_member_no, address1, place, taluk, district, state, pincode, member_type, role) VALUES (21, 'അച്ചു', 'achu', 'YWNodQ==', null, null, '10', null, null, null, null, null, null, 'SECONDARY', 'USER');

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


INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('1', '1', '12', 'Sujith Given Advance Money for Chits', '2025-02-27', '14000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('2', '1', '3', 'Jijin Given Advance Monney for Upcoming Loan', '2025-03-01', '15000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('3', '1', '4', 'Jeejo Given Advance Money for Upcoming Loan', '2025-03-02', '20000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('4', '1', '3', 'Money from Jijin for Chits Advance', '2025-03-03', '15000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('5', '1', '11', 'Money from Sijin for Chits Advance ', '2025-03-02', '15000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('6', '1', '6', 'Luie Given Advance Money for Upcoming Loan', '2025-03-01', '50000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('7', '1', '2', 'Fr Jaison Given Advance Money for Upcoming Loan', '2025-03-01', '10000', '8', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('8', '2', '2', 'Fr Jaison Given Advance Money for Upcoming Loan', '2025-03-01', '25000', '3', null, null, null, 'INPROGRESS');
INSERT INTO revenue (revenue_number, finance_id, spender_member_no, spender_details, spend_date, spend_amount, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES ('9', '1', '5', 'John Given Advance Money for Upcoming Loan', '2025-03-01', '10000', '8', null, null, null, 'INPROGRESS');


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

INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 1, 'Passbook Printing Amount', 600, '2025-03-01', 5, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 1, 'Luis Bata Cach for Chits', 750, '2025-03-02', 6, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 1, 'Jeejo Bata Cash', 750, '2025-03-04', 4, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (4, 1, 'Tour Expenses', 25000, '2025-02-28', 7, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (5, 1, 'Money Given for Buying Lottery Ticket', 3000, '2025-03-01', 3, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (6, 1, 'Divident Payout', 5000, '2025-03-01', 1, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (7, 1, 'Divident Payout', 5000, '2025-03-01', 2, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (8, 1, 'Divident Payout', 5000, '2025-03-01', 3, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (9, 1, 'Divident Payout', 5000, '2025-03-01', 4, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (10, 1, 'Divident Payout', 5000, '2025-03-08', 5, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (11, 1, 'Divident Payout', 5000, '2025-03-15', 6, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (12, 1, 'Divident Payout', 5000, '2025-03-29', 7, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (13, 1, 'Divident Payout', 5000, '2025-03-29', 8, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (14, 1, 'Divident Payout', 5000, '2025-04-05', 9, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (15, 1, 'Divident Payout', 5000, '2025-03-01', 10, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (16, 1, 'Divident Payout', 5000, '2025-03-01', 11, 7, null, null, null, 'INPROGRESS');
INSERT INTO expenses (expenses_number, finance_id, spender_details, spend_amount, spend_date, spender_member_no, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (17, 1, 'Divident Payout', 5000, '2025-03-29', 12, 7, null, null, null, 'INPROGRESS');



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


INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 13, 6, '2025-02-23', 5000, 0, 1, 4500, 5000, 500, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 14, 6, '2025-02-23', 10000, 0, 1, 9000, 10000, 1000, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 15, 6, '2025-02-23', 10000, 0, 1, 9000, 10000, 1000, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (4, 16, 5, '2025-02-23', 30000, 0, 1, 27000, 30000, 3000, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (5, 17, 12, '2025-02-23', 10000, 0, 1, 9000, 10000, 1000, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (6, 18, 3, '2025-02-23', 20000, 0, 1, 18000, 20000, 2000, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (7, 19, 10, '2025-02-23', 10000, 0, 1, 9000, 10000, 1000, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (8, 20, 7, '2025-02-23', 5000, 0, 1, 4500, 5000, 500, '2025-03-02', 7, null, null, null, 'REQUESTED');
INSERT INTO loan (loan_no, loan_applicant_name, loan_reference_name, loan_date, loan_amount, received_amount, finance_id, disbursement_amount, yet_to_receive_amount, interest_amount, loan_repayment_date,first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (9, 21, 10, '2025-02-23', 3000, 0, 1, 2700, 3000, 300, '2025-03-02', 7, null, null, null, 'REQUESTED');





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



INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (1, 1, 300, 1, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (2, 2, 300, 1, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (3, 3, 300, 1, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (4, 4, 300, 1, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (5, 5, 300, 1, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (6, 6, 300, 1, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (7, 7, 300, 1, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (8, 8, 300, 1, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (9, 9, 300, 1, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (10, 10, 300, 1, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (11, 11, 300, 1, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (12, 12, 300, 1, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (13, 13, 300, 1, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (14, 14, 300, 1, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (15, 15, 300, 1, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (16, 16, 300, 1, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (17, 17, 200, 1, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (18, 1, 600, 2, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (19, 2, 600, 2, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (20, 3, 600, 2, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (21, 4, 600, 2, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (22, 5, 600, 2, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (23, 6, 600, 2, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (24, 7, 600, 2, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (25, 8, 600, 2, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (26, 9, 600, 2, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (27, 10, 600, 2, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (28, 11, 600, 2, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (29, 12, 600, 2, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (30, 13, 600, 2, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (31, 14, 600, 2, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (32, 15, 600, 2, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (33, 16, 600, 2, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (34, 17, 400, 2, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (35, 1, 600, 3, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (36, 2, 600, 3, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (37, 3, 600, 3, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (38, 4, 600, 3, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (39, 5, 600, 3, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (40, 6, 600, 3, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (41, 7, 600, 3, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (42, 8, 600, 3, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (43, 9, 600, 3, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (44, 10, 600, 3, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (45, 11, 600, 3, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (46, 12, 600, 3, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (47, 13, 600, 3, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (48, 14, 600, 3, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (49, 15, 600, 3, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (50, 16, 600, 3, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (51, 17, 400, 3, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (52, 1, 1800, 4, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (53, 2, 1800, 4, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (54, 3, 1800, 4, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (55, 4, 1800, 4, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (56, 5, 1800, 4, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (57, 6, 1800, 4, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (58, 7, 1800, 4, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (59, 8, 1800, 4, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (60, 9, 1800, 4, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (61, 10, 1800, 4, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (62, 11, 1800, 4, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (63, 12, 1800, 4, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (64, 13, 1800, 4, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (65, 14, 1800, 4, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (66, 15, 1800, 4, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (67, 16, 1800, 4, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (68, 17, 1200, 4, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (69, 1, 600, 5, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (70, 2, 600, 5, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (71, 3, 600, 5, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (72, 4, 600, 5, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (73, 5, 600, 5, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (74, 6, 600, 5, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (75, 7, 600, 5, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (76, 8, 600, 5, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (77, 9, 600, 5, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (78, 10, 600, 5, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (79, 11, 600, 5, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (80, 12, 600, 5, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (81, 13, 600, 5, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (82, 14, 600, 5, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (83, 15, 600, 5, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (84, 16, 600, 5, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (85, 17, 400, 5, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (86, 1, 1200, 6, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (87, 2, 1200, 6, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (88, 3, 1200, 6, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (89, 4, 1200, 6, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (90, 5, 1200, 6, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (91, 6, 1200, 6, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (92, 7, 1200, 6, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (93, 8, 1200, 6, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (94, 9, 1200, 6, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (95, 10, 1200, 6, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (96, 11, 1200, 6, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (97, 12, 1200, 6, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (98, 13, 1200, 6, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (99, 14, 1200, 6, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (100, 15, 1200, 6, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (101, 16, 1200, 6, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (102, 17, 800, 6, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (103, 1, 600, 7, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (104, 2, 600, 7, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (105, 3, 600, 7, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (106, 4, 600, 7, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (107, 5, 600, 7, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (108, 6, 600, 7, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (109, 7, 600, 7, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (110, 8, 600, 7, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (111, 9, 600, 7, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (112, 10, 600, 7, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (113, 11, 600, 7, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (114, 12, 600, 7, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (115, 13, 600, 7, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (116, 14, 600, 7, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (117, 15, 600, 7, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (118, 16, 600, 7, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (119, 17, 400, 7, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (120, 1, 300, 8, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (121, 2, 300, 8, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (122, 3, 300, 8, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (123, 4, 300, 8, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (124, 5, 300, 8, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (125, 6, 300, 8, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (126, 7, 300, 8, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (127, 8, 300, 8, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (128, 9, 300, 8, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (129, 10, 300, 8, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (130, 11, 300, 8, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (131, 12, 300, 8, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (132, 13, 300, 8, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (133, 14, 300, 8, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (134, 15, 300, 8, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (135, 16, 300, 8, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (136, 17, 200, 8, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (137, 1, 180, 9, '2025-03-02', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (138, 2, 180, 9, '2025-03-09', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (139, 3, 180, 9, '2025-03-16', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (140, 4, 180, 9, '2025-03-23', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (141, 5, 180, 9, '2025-03-30', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (142, 6, 180, 9, '2025-04-06', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (143, 7, 180, 9, '2025-04-13', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (144, 8, 180, 9, '2025-04-20', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (145, 9, 180, 9, '2025-04-27', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (146, 10, 180, 9, '2025-05-04', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (147, 11, 180, 9, '2025-05-11', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (148, 12, 180, 9, '2025-05-18', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (149, 13, 180, 9, '2025-05-25', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (150, 14, 180, 9, '2025-06-01', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (151, 15, 180, 9, '2025-06-08', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (152, 16, 180, 9, '2025-06-15', null, null, 7, null, null, null, 'INPROGRESS');
INSERT INTO loan_emi_detail (
    emi_id, emi_number, amount, loan_no, emi_date, paid_on_time, payment_date_time, 
    first_approver_member_no, second_approver_member_no, first_approval_date_time, 
    second_approval_date_time, current_status
) VALUES (153, 17, 120, 9, '2025-06-22', null, null, 7, null, null, null, 'INPROGRESS');





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


INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, total_chits_number, current_status) VALUES (1, 8, '2023-11-21', 1, 300000, 20, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, total_chits_number, current_status) VALUES (2, 5, '2024-02-04', 1, 300000, 20, 'REQUESTED');
INSERT INTO chits (chits_no, chits_name_of, chits_start_date, finance_id, total_chits_amount, total_chits_number, current_status) VALUES (3, 8, '2024-09-01', 1, 300000, 20, 'REQUESTED');


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


INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (1, 1, 15000, 1, '2023-12-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (2, 2, 11550, 1, '2024-01-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (3, 3, 11700, 1, '2024-02-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (4, 4, 11850, 1, '2024-03-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (5, 5, 12150, 1, '2024-04-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (6, 6, 12150, 1, '2024-05-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (7, 7, 12300, 1, '2024-06-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (8, 8, 12450, 1, '2024-07-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (9, 9, 12600, 1, '2024-08-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (10, 10, 12750, 1, '2024-09-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (11, 11, 12900, 1, '2024-10-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (12, 12, 13200, 1, '2024-11-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (13, 13, 13500, 1, '2024-12-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (14, 14, 13800, 1, '2025-01-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (15, 15, 14100, 1, '2025-02-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (16, 16, 14400, 1, '2025-03-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (17, 17, 14550, 1, '2025-04-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (18, 18, 14700, 1, '2025-05-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (19, 19, 14850, 1, '2025-06-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (20, 20, 15000, 1, '2025-07-21', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (21, 1, 15000, 2, '2024-03-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (22, 2, 11550, 2, '2024-04-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (23, 3, 11700, 2, '2024-05-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (24, 4, 11850, 2, '2024-06-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (25, 5, 12150, 2, '2024-07-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (26, 6, 12150, 2, '2024-08-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (27, 7, 12300, 2, '2024-09-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (28, 8, 12450, 2, '2024-10-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (29, 9, 12600, 2, '2024-11-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (30, 10, 12750, 2, '2024-12-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (31, 11, 12900, 2, '2025-01-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (32, 12, 13200, 2, '2025-02-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (33, 13, 13500, 2, '2025-03-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (34, 14, 13800, 2, '2025-04-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (35, 15, 14100, 2, '2025-05-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (36, 16, 14400, 2, '2025-06-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (37, 17, 14550, 2, '2025-07-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (38, 18, 14700, 2, '2025-08-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (39, 19, 14850, 2, '2025-09-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (40, 20, 15000, 2, '2025-10-04', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (41, 1, 15000, 3, '2024-10-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (42, 2, 11550, 3, '2024-11-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (43, 3, 11700, 3, '2024-12-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (44, 4, 11850, 3, '2025-01-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (45, 5, 12150, 3, '2025-02-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (46, 6, 12150, 3, '2025-03-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (47, 7, 12300, 3, '2025-04-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (48, 8, 12450, 3, '2025-05-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (49, 9, 12600, 3, '2025-06-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (50, 10, 12750, 3, '2025-07-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (51, 11, 12900, 3, '2025-08-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (52, 12, 13200, 3, '2025-09-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (53, 13, 13500, 3, '2025-10-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (54, 14, 13800, 3, '2025-11-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (55, 15, 14100, 3, '2025-12-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (56, 16, 14400, 3, '2026-01-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (57, 17, 14550, 3, '2026-02-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (58, 18, 14700, 3, '2026-03-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (59, 19, 14850, 3, '2026-04-01', null, null, 8, null, null, null, 'INPROGRESS');
INSERT INTO chits_emi_detail (emi_id, emi_number, amount, chits_no, emi_date, paid_on_time, payment_date_time, first_approver_member_no, second_approver_member_no, first_approval_date_time, second_approval_date_time, current_status) VALUES (60, 20, 15000, 3, '2026-05-01', null, null, 8, null, null, null, 'INPROGRESS');
