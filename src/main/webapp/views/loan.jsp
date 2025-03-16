<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Chunks Finance Loan Management System - Comprehensive loan tracking and management solution for administrators">
    <meta name="keywords" content="loan management, chunks finance, EMI tracking, loan disbursement, financial administration">
    <title>Loan Management System | Chunks Finance Admin</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>

        .sectionh2 {
            font-size: 24px;
            font-weight: 600;
            color: #334558;
            margin-bottom: 15px;
        }
        /* === Common Start here === */
        /* === Common Global Styles === */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            color: #333;
        }

        /* === Common Header Styles === */
        header {
            background: linear-gradient(135deg, rgba(163, 163, 163, 0.9), rgba(77, 77, 77, 0.9));
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        header p {
            font-size: 14px;
        }

        /* === Common User Profile Styles === */
        .user-profile {
            display: flex;
            align-items: center;
            gap: 15px;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px 15px;
            border-radius: 25px;
            backdrop-filter: blur(5px);
        }

        .user-name {
            font-weight: 500;
            font-size: 14px;
        }

        .user-role {
            font-size: 12px;
            opacity: 0.9;
        }

        .user-avatar {
            position: relative;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 500;
            color: #2c3e50;
        }

        /* === Common Navigation Styles === */
        nav {
            margin-top: 10px;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 10px;
            gap: 10px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            padding: 10px 20px;
            background-color: #b0b0b0;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        nav ul li a.active {
            background-color: #666;
            color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        nav ul li a:hover {
            background-color: #999;
            color: #fff;
            transform: translateY(-2px);
        }

        /* === Common Main Content Styles === */
        main {
            padding: 20px;
            max-width: 1377px;
            margin: 0 auto;
        }

        section {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        section h2 {
            font-size: 24px;
            font-weight: 600;
            color: #334558;
            margin-bottom: 15px;
        }

        section p {
            font-size: 14px;
            color: #555;
        }

        /* === Common Footer Styles === */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 12px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        /* === Common Background Image === */
        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://images.unsplash.com/photo-1537724326059-2ea20251b9c8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover;
            z-index: -1;
            opacity: 0.8; /* Adjust opacity for better readability */
        }

        /* === Logout Button === */
        .logout-container {
            position: absolute;
            bottom: 3px;
            right: 3px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 50%;
            padding: 2px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 33px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 28px;
            height: 29px;
            border-radius: 50%;
            background: #e74c3c;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background: #c0392b;
            transform: scale(1.1);
        }

        .logout-btn i {
            font-size: 12px;
        }

        /* === Confirmation Dialog === */
        .logout-confirm {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 1000;
            display: none;
        }

        .logout-confirm p {
            margin: 0 0 15px;
            color: #2c3e50;
        }

        .confirm-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .confirm-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .confirm-btn.yes {
            background: #e74c3c;
            color: white;
        }

        .confirm-btn.no {
            background: #2c3e50;
            color: white;
        }

        .confirm-btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        /* === Common Responsive Design === */
        @media (max-width: 768px) {
            .form-group {
                align-items: flex-start;
            }		
            nav ul {
                flex-direction: column;
                align-items: center;
            }

            header {
                flex-direction: column;
                text-align: center;
                gap: 20px;
            }

            .user-profile {
                width: auto;
                justify-content: space-between;
                text-align: left;
                padding: 0px 15px;
                flex-direction: row;
            }

            .user-profile div {
                margin-right: 0;
                margin-bottom: 8px;
            }

            .logout-container {
                bottom: -4px;
                right: 4px;
            }

            nav ul li {
                width: 100%;
                display: flex;
                justify-content: center;
                margin-bottom: 10px;
            }

            nav ul li a {
                width: 80%;
                text-align: center;
                display: block;
            }
        }

        /* === Responsive Design for Mobile === */
        @media (max-width: 480px) {
            .user-profile {
                width: auto;
                padding: 0px 15px;
                flex-direction: row;
                gap: 10px;
                justify-content: space-between;
            }

            .user-profile > div:first-child {
                padding-top: 8px;
            }

			.user-role h4 {
				text-align: center; /* Center align on mobile */
			}
            .user-info {
                order: -1;
            }

            .logout-container {
                bottom: -5px;
                right: 4px;
            }
        }

        /* Add desktop-specific adjustment */
        @media (min-width: 769px) {
				 header {
						justify-content: space-between;
						flex-direction: row;
						padding: 30px 313px; /* Add some horizontal padding */
					}

					header > div:first-child {
						margin-left: 40px; /* Adjust this value to move title right */
					}

					/* Remove the old user-profile margin */
					.user-profile {
						margin-left: 0;
						margin-right: 40px; /* Optional: Add right margin for balance */
					}
			}
			
			/* === Added Error Message Styles === */
        .error-message {
            color: #e74c3c;
            font-size: 0.8rem;
            margin-top: 0.25rem;
            display: none;
            align-items: center;
            gap: 0.25rem;
            opacity: 0;
            transform: translateY(-5px);
            transition: all 0.3s ease;
            width: 100%;
        }

			.error-message.show {
				display: flex;
				opacity: 1;
				transform: translateY(0);
			}

			.input-field.error {
				border-color: #e74c3c !important;
				animation: shake 0.4s ease;
			}

			@keyframes shake {
				0%, 100% { transform: translateX(0); }
				25% { transform: translateX(-5px); }
				75% { transform: translateX(5px); }
			}			

			/* Update the CSS for success message */
			.green-success-message {
				background: #4CAF50;
				color: white;
				padding: 15px;
				border-radius: 4px;
				margin: 20px auto;
				display: none;
				align-items: center;
				gap: 15px;
				animation: slideIn 0.3s ease-out;
				max-width: 600px;
			}
			.message-text {
				display: flex;
				flex-direction: column;
				gap: 5px;
			}

			.message-text span {
				font-weight: 600;
			}

			.message-text span {
				font-size: 0.9em;
				opacity: 0.9;
			}

			.green-success-message.show {
				display: flex;
			}

			.green-success-message i {
				font-size: 20px;
			}


			.red-error-message {
				background: #e74c3c;;
				color: white;
				padding: 15px;
				border-radius: 4px;
				margin: 20px auto; /* Changed from 200px to auto for centering */
				display: none;
				align-items: center;
				gap: 10px;
				animation: slideIn 0.3s ease-out;
				max-width: 600px; /* Added for better control */
			}

			.red-error-message.show {
				display: flex;
			}

			.red-error-message i {
				font-size: 20px;
			}
			@keyframes slideIn {
				from {
					opacity: 0;
					transform: translateY(-20px);
				}
				to {
					opacity: 1;
					transform: translateY(0);
				}
			}

			/* Add close button style */
				.close-btn {
					margin-left: auto;
					cursor: pointer;
					padding: 5px;
					border-radius: 50%;
					transition: background 0.3s ease;
				}

			.close-btn:hover {
				background: rgba(255,255,255,0.2);
			}
			
        /* === Common END here === */


        main {
            padding: 2rem;
            max-width: 1377px;
            margin: 0 auto;
        }

        .content-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        section {
            background: rgba(255, 255, 255, 0.9);
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        section:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        section h2 {
            margin-top: 0;
            font-size: 1.8rem;
            font-weight: 500;
            color: #2c3e50;
        }

        .form-group {
			margin-bottom: 15px;
			display: flex;
			align-items: center;
			gap: 15px;
			width: 100%;
        }

        .form-group label {
			flex: 0 0 150px; /* Fixed width for labels */
			text-align: right;
			font-size: 14px;
			color: #555;
			margin-bottom: 0;
        }

        .input-field {
			flex: 1;
			padding: 10px;
			font-size: 14px;
			border: 1px solid #ccc;
			border-radius: 6px;
			background-color: #fafafa;
			color: #333;
			transition: border-color 0.3s ease;
			box-sizing: border-box;
        }

        .input-field:focus {
            border-color: #007bff;
            outline: none;
        }

		.button-group {
					display: flex;
					justify-content: center;
					gap: 10px;
					margin-top: 20px;
		}


        button {
            padding: 10px 20px;
            background-color: #3D3D3D;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        button i {
            font-size: 14px;
            transition: transform 0.2s ease;
        }

        button:hover i {
            transform: scale(1.1);
        }

        button:hover {
            background-color: #2c2c2c;
        }


        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            header p {
                font-size: 1rem;
            }

            nav ul {
                flex-direction: column;
                align-items: center;
            }

            .content-wrapper {
                grid-template-columns: 1fr;
            }

            .form-group {
				flex-direction: column;
				align-items: flex-start;
				gap: 5px;
            }

            .form-group label {
				flex: none;
				width: 100%;
				text-align: left;
            }

            .input-field {
				width: 100%;
				flex: none;
            }
        }
		/* Add desktop-specific adjustment */
        @media (min-width: 769px) {
            header {
                justify-content: space-between;
                flex-direction: row;
                padding: 30px 313px;
            }

            header > div:first-child {
                margin-left: 40px;
            }

        /* Split form into two columns */
        .form-container {
            display: flex;
            justify-content: space-between;
            gap: 20px; /* Space between columns */
        }

        .form-left,
        .form-right {
            width: 48%; /* Each column takes 48% of the container width */
        }

        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
            }

            .form-left,
            .form-right {
                width: 100%;
            }
        }

        /* EMI Section */
        .emi-section {
            margin-top: 20px;
        }

        .emi-section h3 {
            font-size: 22px;
            font-weight: 500;
            color: #003366;
            margin-bottom: 15px;
        }

        .emi-section .form-group {
            margin-bottom: 10px;
        }
        .user-role h4 {
		    text-align: center;
		    margin: 0;
		    font-size: 14px; /* Optional: Increase font size for better hierarchy */
		    font-weight: 500; /* Optional: Match dashboard header weight */
		}        
    </style>
</head>
<body>
    <!-- Background Image -->
    <div class="background-image"></div>

    <!-- Header -->
    <header>
        <div>
            <h1>Chunks Finance Dashboard</h1>
            <p>Your financial overview at a glance</p>
        </div>
        <div class="user-profile">
            <div>
                <div class="user-name"><c:out value="${currentUser.memberName}" /></div>
                <div class="user-role">
            	  <c:choose>
				    <c:when test="${currentUser.role == 'SUPER_ADMIN'}">
				        <h4><a href="settings" style="color: inherit; text-decoration: none;">SuperAdmin</a></h4>
				    </c:when>
				    <c:otherwise>
				        Contributor
				    </c:otherwise>
				</c:choose>
				</div>
            </div>
            <div class="user-avatar">
                <div class="logout-container">
                    <a href="#" class="logout-btn" id="logoutTrigger">
                        <i class="fas fa-power-off"></i>
                    </a>
                </div>
            </div>
        </div>
    </header>

	<!-- Navigation -->
	<nav>
		<ul>
			<li><a href="dashboard">Dashboard</a></li>
			<li><a href="approvals">Approvals</a></li>
			<li><a href="payments">Payments</a></li>
			<li><a href="reports">Reports</a></li>
			<li><a href="loan" class="active">Loans</a></li>
			<li><a href="loan-enquires">Enquires</a></li>
			<li><a href="revenue">Revenue</a></li>
			<li><a href="expenses">Expenses</a></li>
			<c:choose>
				<c:when test="${currentUser.role == 'SUPER_ADMIN'}">
					<li><a href="member">Members</a></li>
					<li><a href="chits">Chits</a></li>
					<li><a href="finance">Finance</a></li>
					<li><a href="enrolment">Enrolment</a></li>
				</c:when>
			</c:choose>
		</ul>
	</nav>

    <!-- Main Content -->
    <main>
        <div class="content-wrapper">
            <section>
                <h2 class="sectionh2">Loans</h2>
				<!-- Update the success message section -->
				<div class="green-success-message" id="greenSuccessMessage">
					<i class="fas fa-check-circle"></i>
					<div class="message-text">
						<span><c:out value="${success}" /></span>
					</div>
					<div class="close-btn" onclick="closeGreenSuccessMessage()">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<!-- Error Message -->
				<div class="red-error-message" id="redErrorMessage">
					<i class="fas fa-check-circle"></i>
					<div class="message-text">
						<span><c:out value="${error}" /></span>
					</div>
					<div class="close-btn" onclick="closeRedErrorMessage()">
						<i class="fas fa-times"></i>
					</div>
				</div>				
                <form method="post"  action="loan" id="formloan" name="formloan">
                    <!-- Split into two columns -->
                    <div class="form-container">
                        <div class="form-left">
							<!-- Loan No -->
                            <div class="form-group">
                                <label for="loan-no">Loan No</label>
                                <input type="text" id="loan-no" name="loanNo" class="input-field" placeholder="LoanNo" required readonly>
								<div class="error-message" id="loan-number-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Loan Number is required</span>
								</div>								
                            </div>
                            
                            
		                    <div class="form-group">
		                        <label for="finance-type">Finance Type</label>
		                        <select name="financeType" id="ownerOfFund" class="input-field">
		                            <option value="" disabled selected>Finance Type</option>
		                            <c:forEach items="${AllFinance}" var="financeItem">
		                            	<option value="${financeItem.id}">${financeItem.financeName} by ${financeItem.financeOwner.memberName}</option> 
		                            </c:forEach>
		                        </select>
		                        <div class="error-message" id="financeType-error">
		                            <i class="fas fa-exclamation-circle"></i>
		                            <span>Please select a finance type</span>
		                        </div>
		                    </div>                        
                        
                            <!-- Finance Source -->
							<div class="form-group">
								<label for="finance-source">Loan Reference Name</label>
								<select id="finance-source" name="loanReferenceName" class="input-field" required>
									<option value="" disabled selected>Loan Reference Name</option>
							        <c:forEach items="${primaryMembers}" var="member">
							            <option value="${member.no}">${member.memberName}</option>
							        </c:forEach>
								</select>
								<div class="error-message" id="finance-source-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Reference Name is required</span>
								</div>
							</div>

                            <!-- Loan Applicant Name -->
                            <div class="form-group">
                                <label for="applicant-name">Loan Applicant Name</label>
								 <select id="applicant-name" name="loanApplicantName" class="input-field" required>
		        					<option value="" disabled selected>Select Applicant</option>
		   						 </select>	
								<div class="error-message" id="applicant-name-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Applicant Name is required</span>
								</div>								
																
                            </div>

                            <!-- Loan Amount -->
                            <div class="form-group">
                                <label for="loan-amount">Loan Amount</label>
                                <input type="number" id="loan-amount" name="loanAmount" class="input-field" placeholder="Enter loan amount" required>
							<div class="error-message" id="loan-amount-error">
								<i class="fas fa-exclamation-circle"></i>
								<span>Loan Amount is required</span>
							</div>								
                            </div>

                            <!-- Loan Date -->
                            <div class="form-group">
                                <label for="loan-date">Loan Date</label>
                                <input type="date" id="loan-date" name="loanDate" class="input-field" required onchange="handleLoanDateChange()">
								<div class="error-message" id="loan-date-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Loan Date is required</span>
								</div>								
                            </div>


                            <!-- Loan Date -->
                            <div class="form-group">
                                <label for="loan-repayment-date">Loan repayment start date</label>
                                <input type="date" id="loan-repayment-date" name="loanStartDate" class="input-field" required>
								<div class="error-message" id="loan-repayment-date-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Loan repayment date is required</span>
								</div>								
                            </div>                            
                            
                            
                        </div>

                        <div class="form-right">
								<!-- Loan Disbursement Amount -->
								<div class="form-group">
									<label for="disbursement-amount">Loan Disbursement Amount</label>
									<input type="number" id="disbursement-amount" name="disbursementAmount" class="input-field" placeholder="Enter disbursement amount" readonly>
								</div>

								<!-- Interest Amount -->
								<div class="form-group">
									<label for="interest-amount">Interest Amount</label>
									<input type="number" id="interest-amount" name="interestAmount" class="input-field" placeholder="Enter interest amount" readonly>
								</div>
							

                            <!-- Received and Yet to Receive Amount -->
                            <div class="form-group">
                                <label for="received-amount">Received Amount</label>
                                <input type="number" id="received-amount" name="receivedAmount" class="input-field" placeholder="Enter received amount" readonly>
                            </div>

                            <div class="form-group">
                                <label for="pending-amount">Yet to Receive Amount</label>
                                <input type="number" id="pending-amount" name="remainingBalance" class="input-field" placeholder="Enter yet to receive amount" readonly>
                            </div>
                        </div>
                    </div>

                    <!-- EMI Section -->
                    <div class="emi-section">
                        <h3>EMI Details</h3>
                        <div class="form-container">
                            <div class="form-left">
                                <!-- EMI 1 to EMI 9 -->
                                <div class="form-group">
                                    <label for="emi-1">EMI 1</label>
                                    <input type="number" id="emi-1" name="emi-1" class="input-field" placeholder="Enter EMI 1 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-2">EMI 2</label>
                                    <input type="number" id="emi-2" name="emi-2" class="input-field" placeholder="Enter EMI 2 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-3">EMI 3</label>
                                    <input type="number" id="emi-3" name="emi-3" class="input-field" placeholder="Enter EMI 3 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-4">EMI 4</label>
                                    <input type="number" id="emi-4" name="emi-4" class="input-field" placeholder="Enter EMI 4 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-5">EMI 5</label>
                                    <input type="number" id="emi-5" name="emi-5" class="input-field" placeholder="Enter EMI 5 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-6">EMI 6</label>
                                    <input type="number" id="emi-6" name="emi-6" class="input-field" placeholder="Enter EMI 6 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-7">EMI 7</label>
                                    <input type="number" id="emi-7" name="emi-7" class="input-field" placeholder="Enter EMI 7 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-8">EMI 8</label>
                                    <input type="number" id="emi-8" name="emi-8" class="input-field" placeholder="Enter EMI 8 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-9">EMI 9</label>
                                    <input type="number" id="emi-9" name="emi-9" class="input-field" placeholder="Enter EMI 9 amount" readonly>
                                </div>
                            </div>

                            <div class="form-right">
                                <!-- EMI 10 to EMI 17 -->
                                <div class="form-group">
                                    <label for="emi-10">EMI 10</label>
                                    <input type="number" id="emi-10" name="emi-10" class="input-field" placeholder="Enter EMI 10 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-11">EMI 11</label>
                                    <input type="number" id="emi-11" name="emi-11" class="input-field" placeholder="Enter EMI 11 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-12">EMI 12</label>
                                    <input type="number" id="emi-12" name="emi-12" class="input-field" placeholder="Enter EMI 12 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-13">EMI 13</label>
                                    <input type="number" id="emi-13" name="emi-13" class="input-field" placeholder="Enter EMI 13 amount" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="emi-14">EMI 14</label>
                                    <input type="number" id="emi-14" name="emi-14" class="input-field" placeholder="Enter EMI 14 amount" readonly>
                                </div>
								<div class="form-group">
								  <label for="emi-15">EMI 15</label>
								  <input type="number" id="emi-15" name="emi-15" class="input-field" placeholder="Enter EMI 15 amount" readonly>
								</div>
								<div class="form-group">
								  <label for="emi-16">EMI 16</label> 
								  <input type="number" id="emi-16" name="emi-16" class="input-field" placeholder="Enter EMI 16 amount" readonly>
								</div>
								<div class="form-group">
								  <label for="emi-17">EMI 17</label>
								  <input type="number" id="emi-17" name="emi-17" class="input-field" placeholder="Enter EMI 17 amount" readonly>
								</div>
							  </div>
							</div>
						  </div>

          				<!-- Buttons -->
          				<div class="button-group">
							<button type="button" onclick="validateLoanForm()"><i class="fas fa-hand-holding-usd"></i> Add Loan</button>
							<button type="button"> <i class="fas fa-edit"></i>Edit</button>
							<button type="button" style="background-color: #e74c3c;"><i class="fas fa-trash-alt"></i> Delete</button>	
          				</div>
          	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>			
        </form>
      </section>
    </div>
  </main>

  <!-- Footer Section -->
  <footer>
    &copy; 2025 Chunks Finance | <a href="#" style="color: white; text-decoration: none;">Privacy Policy</a> | <a href="#" style="color: white; text-decoration: none;">Terms of Service</a>
  </footer>
	<form action="${pageContext.request.contextPath}/perform_logout" method="post" id="financeLogout">
	   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>  
	<div class="logout-confirm">
		<p>Are you sure you want to logout?</p>
		<div class="confirm-buttons">
			<button class="confirm-btn yes">Yes, Logout</button>
			<button class="confirm-btn no">Cancel</button>
		</div>
	</div>
	
  <script>
  
 
	  // Convert secondary members to JS array
	  const secondaryMembers = [
	      <c:forEach items="${secondaryMembers}" var="secMember" varStatus="loop">
	          { 
	              no: "${secMember.referenceMember.no}", 
	              memberNo: "${secMember.no}",
	              memberName: "${secMember.memberName}" 
	          }<c:if test="${not loop.last}">,</c:if>
	      </c:forEach>
	  ];

	  document.getElementById('finance-source').addEventListener('change', function() {
	        const primaryMemberNo = this.value;
	        const primaryMemberName = this.options[this.selectedIndex].text;
	        const applicantSelect = document.getElementById('applicant-name');
	        
	        // Clear existing options
	        applicantSelect.innerHTML = '<option value="" disabled selected>Select Applicant</option> <option value="'+primaryMemberNo+'">'+primaryMemberName+'</option>';
	        
	        // Filter and populate secondary members
	        secondaryMembers
	            .filter(member => member.no === primaryMemberNo)
	            .forEach(member => {
	                const option = new Option(member.memberName, member.memberNo);
	                applicantSelect.add(option);
	            });
	    });
	  
	  function handleLoanDateChange() {
		    const loandateInput = document.getElementById('loan-date');
		    const dateRepaymentInput = document.getElementById('loan-repayment-date');

		    const selectedLoanDate = new Date(loandateInput.value);
		    let istLoanDate = new Date(selectedLoanDate.toLocaleString("en-US", { timeZone: "Asia/Kolkata" }));

		    if (isNaN(istLoanDate)) {
		        console.error("Invalid loan date selected");
		        return;
		    }

		    const dayOfWeek = istLoanDate.getDay(); // 0 = Sunday, 1 = Monday, ..., 6 = Saturday
		    let repaymentDate = new Date(istLoanDate.toLocaleString("en-US", { timeZone: "Asia/Kolkata" })); // Clone the selected date

		    
		    if (dayOfWeek === 1 || dayOfWeek === 2) {
	    		repaymentDate.setDate((istLoanDate.getDate() - dayOfWeek)+7);
	    	} else {
	    		repaymentDate.setDate((istLoanDate.getDate() + (7 - dayOfWeek) % 7)+7);
	    	}
		    dateRepaymentInput.value = repaymentDate.toISOString().split('T')[0];
		}
	  
	  
	  
  
	  document.getElementById('loan-amount').addEventListener('input', function() {
		    const loanAmount = parseFloat(this.value) || 0;
		    const disbursementAmount = loanAmount * 0.90; // 95% of loan amount
		    const interestAmount = loanAmount * 0.10; // 5% of loan amount
		    const emiAmount = loanAmount * 0.06; // 5% of loan amount
		    const currentReceivedAmount = 0; // 5% of loan amount
		   
		    
		 // Format numbers with smart decimal handling
		    const formatNumber = num => {
		        // Round to 2 decimal places first to fix floating point issues
		        const rounded = Math.round(num * 100) / 100;
		        // Convert to string and remove trailing zeros
		        return rounded.toFixed(2).replace(/\.?0+$/, '');
		    };
		    
		    
		    document.getElementById('disbursement-amount').value = formatNumber(disbursementAmount);
		    document.getElementById('interest-amount').value = formatNumber(interestAmount);
		    
		    document.getElementById('received-amount').value = formatNumber(currentReceivedAmount);

		    const receivedAmount = parseFloat(document.getElementById('interest-amount').value) || 0;
		    document.getElementById('pending-amount').value = formatNumber(disbursementAmount + receivedAmount);
		    
		    document.getElementById('emi-1').value = formatNumber(emiAmount);
		    document.getElementById('emi-2').value = formatNumber(emiAmount);
		    document.getElementById('emi-3').value = formatNumber(emiAmount);
		    document.getElementById('emi-4').value = formatNumber(emiAmount);
		    document.getElementById('emi-5').value = formatNumber(emiAmount);
		    document.getElementById('emi-6').value = formatNumber(emiAmount);
		    document.getElementById('emi-7').value = formatNumber(emiAmount);
		    document.getElementById('emi-8').value = formatNumber(emiAmount);
		    document.getElementById('emi-9').value = formatNumber(emiAmount);
		    document.getElementById('emi-10').value = formatNumber(emiAmount);
		    document.getElementById('emi-11').value = formatNumber(emiAmount);
		    document.getElementById('emi-12').value = formatNumber(emiAmount);
		    document.getElementById('emi-13').value = formatNumber(emiAmount);
		    document.getElementById('emi-14').value = formatNumber(emiAmount);
		    document.getElementById('emi-15').value = formatNumber(emiAmount);
		    document.getElementById('emi-16').value = formatNumber(emiAmount);
		    const lastEmi= 16 * formatNumber(emiAmount);
		    document.getElementById('emi-17').value = formatNumber(loanAmount - lastEmi);
		});	  
	  
	  
	  
	  
	 // Check for success message on page load
  	document.addEventListener('DOMContentLoaded', function() {
  	
  	    const dateInput = document.getElementById('loan-date');
	  	  const options = { timeZone: 'Asia/Kolkata' };
	      const today = new Date().toLocaleDateString('en-CA', options);
	      dateInput.value = today;
        
        const dateRepaymentInput = document.getElementById('loan-repayment-date');
        const todayRepayment = new Date(new Date().toLocaleString("en-US", { timeZone: "Asia/Kolkata" }));
    	const dayOfWeek = todayRepayment.getDay(); // 0 = Sunday, 1 = Monday, ..., 6 = Saturday
    	let repaymentDate = new Date(todayRepayment); // Clone todayRepayment's date
    	if (dayOfWeek === 1 || dayOfWeek === 2) {
    		
    		repaymentDate.setDate((todayRepayment.getDate() - dayOfWeek)+7);
    	} else {
    		
    		repaymentDate.setDate((todayRepayment.getDate() + (7 - dayOfWeek) % 7)+7);
    	}
    	dateRepaymentInput.value = repaymentDate.toISOString().split('T')[0];
        
        
        
        
        
        
	
        document.getElementById('loan-no').value = '${loanNumber}';
  	
	        <c:if test="${not empty success}">
	            showSuccessMessage();
	        </c:if>	  
	        <c:if test="${not empty error}">
	       		 showErrorMessage();
	   		 </c:if>	             
  	});
  
         function showErrorMessage() {
            const errorMsg = document.getElementById('redErrorMessage');
            errorMsg.classList.add('show');
            setTimeout(() => {
                errorMsg.classList.remove('show');
            }, 5000); // Auto-hide after 5 seconds
        }
		
		function closeRedErrorMessage() {
            document.getElementById('redErrorMessage').classList.remove('show');
        }

	    document.getElementById('ownerOfFund').addEventListener('change', function() {
	        clearError(this, 'financeType-error');
	    });
		
	    document.getElementById('loan-date').addEventListener('change', function() {
	        clearError(this, 'loan-date-error');
	    });	    
	    
	    document.getElementById('loan-date').addEventListener('change', function() {
	        clearError(this, 'loan-date-error');
	    });	
	    
	    
        function showSuccessMessage() {
            const successMsg = document.getElementById('greenSuccessMessage');
            successMsg.classList.add('show');
            setTimeout(() => {
                successMsg.classList.remove('show');
            }, 5000); // Auto-hide after 5 seconds
        }
		
        function closeGreenSuccessMessage() {
            document.getElementById('greenSuccessMessage').classList.remove('show');
        } 
       
		
		function validateLoanForm() {
        const mandatoryFields = [
            { id: 'finance-source', errorId: 'finance-source-error' },
            { id: 'loan-no', errorId: 'loan-number-error' },
            { id: 'ownerOfFund', errorId: 'financeType-error' },
            { id: 'applicant-name', errorId: 'applicant-name-error' },
            { id: 'loan-amount', errorId: 'loan-amount-error' },
            { id: 'loan-date', errorId: 'loan-date-error' },
            { id: 'loan-repayment-date', errorId: 'loan-repayment-date-error' }
        ];

        let isValid = true;

        mandatoryFields.forEach(field => {
            const input = document.getElementById(field.id);
            const error = document.getElementById(field.errorId);
            
            if (!input.value.trim()) {
                input.classList.add('error');
                error.classList.add('show');
                isValid = false;
            } else {
                input.classList.remove('error');
                error.classList.remove('show');
            }
        });

        if (isValid) {
         // Submit the form or handle valid data
         
        		 const form = document.getElementById('formloan');
			    form.method = 'POST';
			    form.action = 'loan'; // Your endpoint URL

			    // Add CSRF token (required for Spring Security)
			    const csrfToken = document.querySelector('input[name="_csrf"]').value;
			    const csrfInput = document.createElement('input');
			    csrfInput.type = 'hidden';
			    csrfInput.name = '_csrf';
			    csrfInput.value = csrfToken;
			    form.appendChild(csrfInput);
			    document.body.appendChild(form);
			    form.submit();		
         
         
         
        }
    }

    function showError(input, errorElement) {
        input.classList.add('error');
        errorElement.classList.add('show');
    }

    function clearError(input, errorElement) {
        input.classList.remove('error');
        errorElement.classList.remove('show');
    }

    // Add input event listeners to clear errors
    document.querySelectorAll('.input-field').forEach(input => {
        input.addEventListener('input', function() {
            const errorId = this.id + '-error';
            const errorElement = document.getElementById(errorId);
            if (errorElement) {
                clearError(this, errorElement);
            }
        });
    });  

    

    
        // Function to handle button click
        function handleButtonClick(event) {
            const button = event.target;

            // Add the 'clicked' class to simulate the button being pressed
            button.classList.add('clicked');

            // Remove the 'clicked' class after 10 seconds
            setTimeout(() => {
                button.classList.remove('clicked');
            }, 10000); // 10 seconds delay
        }

        // Add click event listeners to all buttons
        document.querySelectorAll('.button-group button, button').forEach(button => {
            button.addEventListener('click', handleButtonClick);
        });  
  
    // Select all navigation links
    const navLinks = document.querySelectorAll('nav ul li a');

    // Add click event listener to each link
    navLinks.forEach(link => {
      link.addEventListener('click', function() {
        // Remove the 'active' class from all links
        navLinks.forEach(link => link.classList.remove('active'));
        // Add 'active' class to the clicked link
        this.classList.add('active');
      });
    });
	
	
		document.getElementById('logoutTrigger').addEventListener('click', function(e) {
			e.preventDefault();
			const dialog = document.querySelector('.logout-confirm');
			dialog.style.display = 'block';
		});

		document.querySelectorAll('.confirm-btn').forEach(btn => {
			btn.addEventListener('click', function(e) {
				e.preventDefault();
				if(this.classList.contains('yes')) {
					const form = document.getElementById('financeLogout');
     			    form.method = 'POST';
     			    form.action = 'perform_logout'; // Your endpoint URL

	     			    // Add CSRF token (required for Spring Security)
	     			    const csrfToken = document.querySelector('input[name="_csrf"]').value;
	     			    const csrfInput = document.createElement('input');
	     			    csrfInput.type = 'hidden';
	     			    csrfInput.name = '_csrf';
	     			    csrfInput.value = csrfToken;
	     			    form.appendChild(csrfInput);
	     			    document.body.appendChild(form);
	     			    form.submit();	
				}
				document.querySelector('.logout-confirm').style.display = 'none';
			});
		});		
  </script>
</body>
</html>