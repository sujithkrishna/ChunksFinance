<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Chunks Finance Upload Portal - Secure financial document management system for administrators">
    <meta name="keywords" content="finance upload, chunks finance, document management, financial records, admin portal">
    <title>Financial Document Upload | Chunks Finance Admin</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
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
			padding: 6px;
			gap: 8px;
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
            padding: 11px;
            max-width: 1450px;
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
        
        .sectionh2 {
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
				 .table-row input[type="text"] {
     			   max-width: 150px;
    			}

				/* Remove the old user-profile margin */
				.user-profile {
					margin-left: 0;
					margin-right: 40px; /* Optional: Add right margin for balance */
				}
			}
			
			/* === Add Error Styles === */
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
			
			/* === Error Styles END === */			
			
        /* === Common END here === */

        main {
            padding: 11px;
            max-width: 1450px;
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
            justify-content: space-between;
			flex-direction: column;
            gap: 5px;
        }

		.form-group label {
			flex: 1;
			margin-right: 10px;
			text-align: left;
			font-size: 14px;
			color: #555;
		}

			.input-field {
			flex: 1.025; /* Changed from 2 to 1.5 for 3:2 ratio */
			width: 100%;
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
				display: flex;
				align-items: center;
				justify-content: space-between;
				width: 100%;
				gap: 10px;
            }

            .form-group label {
                margin-bottom: 5px;
            }

            .input-field {
                width: 100%;
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

            .user-profile {
                margin-left: 0;
                margin-right: 40px;
            }

            /* New styles for form alignment */
            .form-group {
			    display: grid;
				grid-template-columns: 1fr 2fr;
				align-items: start;
				gap: 15px;
				margin-bottom: 20px;
            }

            .form-group label {
				text-align: right;
				padding-right: 20px;
				grid-column: 1;
				align-self: center;
            }


            .input-field {
				grid-column: 2;
				max-width: 400px;
				width: 100%;
			}

            .error-message {
				grid-column: 2;
				max-width: 400px;
				margin-left: 0;
				justify-content: flex-start;
            }
        }
	        .user-role h4 {
			    text-align: center;
			    margin: 0;
			    font-size: 14px; /* Optional: Increase font size for better hierarchy */
			    font-weight: 500; /* Optional: Match dashboard header weight */
			} 
/* Div-based Table Styles */
.table-container {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.table-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 0px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.table-row.header {
	background-color: #334558;
	color: white;
	font-weight: bold;
}

.table-row.header .table-cell {
	border-bottom: none;
}


.table-row.header .table-cell:nth-child(2) { /* Request Type */
    flex: 3;
    text-align: left;
    padding-left: 30px; /* Increased from 20px */
}

.table-row:not(.header) .table-cell:nth-child(2) {
    flex: 3;
    text-align: left;
    padding-left: 30px; /* Increased from 20px */
    align-items: flex-start; /* Ensure content starts from left */
}


.table-row.header .table-cell:nth-child(3) { /* Amount */
    flex: 0 1 150px;
    text-align: right;
    padding-right: 61px;
    justify-content: flex-end; /* Add this line */
    display: flex; /* Add this line */
}

.table-row:not(.header) .table-cell:nth-child(3) {
    flex: 0 1 150px;
    text-align: right;
    padding-right: 35px;
    justify-content: flex-end; /* Add this line */
    display: flex; /* Add this line */
}

.table-row.header .table-cell:nth-child(5) {
	padding-right: 22px;
}
.table-row.header .table-cell:nth-child(4) { /* Date Submitted */
    flex: 1;
    text-align: right;
    padding-right:  68px;
}

.table-row:not(.header) .table-cell:nth-child(4) {
    flex: 1;
    text-align: right;
    padding-right: 15px;
}

.table-cell {
   padding: 8px 0; /* Adjust cell padding */
}

.table-cell:last-child {
	text-align: right;
}

.button-group-approved {
    display: flex;
    gap: 8px;
    flex-wrap: nowrap; /* Prevent wrapping to new line */
    padding: 2px 0;
    justify-content: flex-end; /* Align to right */
    width: 100%; /* Take full available width */
}

.button-group-approved button {
    padding: 6px 12px;
    font-size: 12px;
    height: 30px;
    margin: 0; /* Remove any margin */
    background-color: #3D3D3D;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: inline-flex;
    white-space: nowrap; /* Prevent text wrapping */
}

.button-group-approved button i {
	font-size: 12px;
	transition: transform 0.2s ease;
	margin-right: 5px;
}

.button-group-approved button:hover i {
	transform: scale(1.1);
}

.button-group-approved button:hover {
	background-color: #2c2c2c;
}

/* Specific style for delete button */
.button-group-approved button.delete-btn {
	background-color: #e74c3c;
}

.button-group-approved button.delete-btn:hover {
	background-color: #c0392b;
}

.button-group-view {
	display: flex;
	gap: 10px;
	justify-content: flex-end;
}

.button-group-view button {
	padding: 10px 25px;
	background-color: #3D3D3D;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	white-space: nowrap;
	height: 40px; /* Match input height */
}

.button-group-view button i {
	font-size: 14px;
	transition: transform 0.2s ease;
}

.button-group-view button:hover i {
	transform: scale(1.1);
}

.button-group-view button:hover {
	background-color: #2c2c2c;
}

/* Specific style for delete button */
.button-group-view button.delete-btn {
	background-color: #e74c3c;
}

.button-group-view button.delete-btn:hover {
	background-color: #c0392b;
}		        

/* Apply consistent input field styling */
.table-row input[type="text"] {
    width: 70%;
    padding: 10px;
    font-size: 14px;
    border: 2px solid #ccc;
    border-radius: 6px;
    background-color: #fafafa;
    color: #333;
    transition: border-color 0.3s ease;
    box-sizing: border-box;
    max-width: 120px; /* Adjust based on your needs */
    text-align: right;
}

/* Focus state */
.table-row input[type="text"]:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

/* Error states */
.table-row input.error {
    border-color: #e74c3c !important;
    animation: shake 0.4s ease;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    .table-row input[type="text"] {
        width: 100%;
        max-width: none;
    }
    
    .table-row .table-cell:nth-child(5) {
        flex: 1;
        justify-content: flex-start;
    }
}        
    </style>
</head>
<body>
    <!-- Background Image -->
    <div class="background-image"></div>

    <!-- Add this HTML for confirmation dialog -->
    <div class="logout-confirm">
        <p>Are you sure you want to logout?</p>
        <div class="confirm-buttons">
            <button class="confirm-btn yes">Yes, Logout</button>
            <button class="confirm-btn no">Cancel</button>
        </div>
    </div>

    <!-- Corrected Header Section -->
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
			<li><a href="payments" class="active">Payments</a></li>
			<li><a href="reports">Reports</a></li>
			<li><a href="loan">Loans</a></li>
			<li><a href="loan-preclosure">Preclosure</a></li>
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

    <!-- Main Content Section -->
    <main>
        <div class="content-wrapper">
            <section>
                <h2 class="sectionh2">Payments on <span class="formattedStartDate">${upcomgingPaymentDate}</span></h2>
				<!-- Update the success message section -->
				<div class="green-success-message" id="greenSuccessMessage">
					<i class="fas fa-check-circle"></i>
					<div class="message-text">
						<span>Finance created successfully!</span>
					</div>
					<div class="close-btn" onclick="closeGreenSuccessMessage()">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<!-- Error Message -->
				<div class="red-error-message" id="redErrorMessage">
					<i class="fas fa-check-circle"></i>
					<div class="message-text">
						<span>Finance created successfully!</span>
					</div>
					<div class="close-btn" onclick="closeRedErrorMessage()">
						<i class="fas fa-times"></i>
					</div>
				</div>				
               		 <form method="post"  action="payments" id="formpayments" name="formpayments">
	                    <div class="table-container">
			            <!-- Header Row -->
						<c:choose>
						    <c:when test="${fn:length(allLoansEMI) > 0}">
						         <div class="table-row header">
					                <div class="table-cell">Loan No</div>
					                <div class="table-cell">Name</div>
					                <div class="table-cell">Finance</div>
					                <div class="table-cell">EMI AMT</div>
					                <div class="table-cell">Payment</div>
					            </div>
						    </c:when>
						    <c:otherwise><input name="loanEMIName" type="hidden" value="${loanEMI.id}"><input name="loanEMITxt" type="hidden" value="${loanEMI.emiAmount - loanEMI.paidAmount}"></c:otherwise>
						</c:choose>			            
			            <!-- Data Rows -->
			           <c:forEach items="${allLoansEMI}" var="loanEMI">
							  <c:choose>
							 	 <c:when test="${loanEMI.loan.financeType.id == '1'}"><div class="table-row" style="background: linear-gradient(135deg, rgba(139, 181, 140, 0.9), rgba(147, 191, 127, 0.9))"></c:when>
							  	 <c:when test="${loanEMI.loan.financeType.id == '2'}"><div class="table-row" style="background: linear-gradient(135deg, rgba(184, 212, 185, 0.9), rgba(206, 237, 207, 0.9))"></c:when>
							  </c:choose>
									<div class="table-cell">${loanEMI.loan.loanNo}</div>
									<div class="table-cell">${loanEMI.loan.loanApplicantName.memberName}</div>
									<div class="table-cell">${loanEMI.loan.financeType.financeName}</div>
									<div class="table-cell">₹${loanEMI.emiAmount}</div>
									<div class="table-cell"><input name="loanEMIName" type="hidden" value="${loanEMI.id}"><input name="loanEMITxt" type="text" value="${loanEMI.emiAmount - loanEMI.paidAmount}"></div>
								</div>
						</c:forEach>
						<div class="table-row header">
			                <div class="table-cell">Sl No</div>
			                <div class="table-cell">Name</div>
			                <div class="table-cell">Finance</div>
			                <div class="table-cell">Finance AMT</div>
			                <div class="table-cell">Payment</div>
			            </div>
			            <c:choose>
						    <c:when test="${fn:length(pendingPrimaryPayment) > 0}">
						    </c:when>
						    <c:otherwise><input name="pendingAmountPrimaryName"  type="hidden" value="${pendingPaymentFin.id}"><input name="pendingAmountPrimaryTxt"  type="hidden" value="${pendingPaymentFin.totalAmount - pendingPaymentFin.paidAmount}"></c:otherwise>
						</c:choose>	
						<c:set var="counter" value="1" />
						<c:forEach items="${pendingPrimaryPayment}" var="pendingPaymentFin">
								<div class="table-row" style="background: linear-gradient(135deg, rgba(194, 194, 194, 0.9), rgba(238, 238, 238, 0.9))">	
									<div class="table-cell">${counter}</div><c:set var="counter" value="${counter + 1}" />
									<div class="table-cell">${currentUser.memberName}</div>
									<div class="table-cell">${pendingPaymentFin.financeType.financeName}</div>
									<div class="table-cell">₹${pendingPaymentFin.totalAmount}</div>
									<div class="table-cell"><input name="pendingAmountPrimaryName"  type="hidden" value="${pendingPaymentFin.id}"><input name="pendingAmountPrimaryTxt"  type="text" value="${pendingPaymentFin.totalAmount - pendingPaymentFin.paidAmount}"></div>
								</div>
						</c:forEach>
						<c:choose>
						    <c:when test="${fn:length(pendingSecondaryPayment) > 0}">
						    </c:when>
						    <c:otherwise><input name="pendingAmountSecondaryName" type="hidden" value="${pendingSecondaryPaymentFin.id}"><input name="pendingAmountSecondaryTxt" type="hidden" value="${pendingSecondaryPaymentFin.totalAmount}"></c:otherwise>
						</c:choose>
						<c:forEach items="${pendingSecondaryPayment}" var="pendingSecondaryPaymentFin">
								<div class="table-row" style="background: linear-gradient(135deg, rgba(194, 194, 194, 0.9), rgba(238, 238, 238, 0.9))">	
									<div class="table-cell">${counter}</div><c:set var="counter" value="${counter + 1}" />
									<div class="table-cell">${pendingSecondaryPaymentFin.accountHolderName.memberName}</div>
									<div class="table-cell">${pendingSecondaryPaymentFin.financeType.financeName}</div>
									<div class="table-cell">₹${pendingSecondaryPaymentFin.totalAmount}</div>
									<div class="table-cell"><input name="pendingAmountSecondaryName" type="hidden" value="${pendingSecondaryPaymentFin.id}"><input name="pendingAmountSecondaryTxt" type="text" value="${pendingSecondaryPaymentFin.totalAmount}"></div>
								</div>								
						</c:forEach>
						
						<!-- Total Row -->
						<div class="table-row header" style="background: #2c3e50;">
						    <div class="table-cell"></div>
						    <div class="table-cell"></div>
						    <div class="table-cell"></div>
						    <div class="table-cell">Total</div>
						    <div class="table-cell" id="totalAmount">₹0.00</div>
						</div>

						
	     			</div>  
                    <!-- Submit Button -->
					<div class="button-group">
                        <button type="button" onclick="validateForm()"><i class="fas fa-file-upload"></i> Pay</button>
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
    <script>
    
	 // Check for success message on page load
    document.addEventListener('DOMContentLoaded', function() {
    	
    	  const dateInput = document.getElementById('finance-date');
    	  const options = { timeZone: 'Asia/Kolkata' };
	        const today = new Date().toLocaleDateString('en-CA', options);
	        dateInput.value = today;
	
    	
	        <c:if test="${not empty success}">
	            showSuccessMessage();
	        </c:if>	  
	        <c:if test="${not empty error}">
	       		 showErrorMessage();
	   		 </c:if>	             
    	});
	 

    function calculateTotal() {
        let total = 0;
        
        // Get all input values
        const loanInputs = document.getElementsByName('loanEMITxt');
        const primaryInputs = document.getElementsByName('pendingAmountPrimaryTxt');
        const secondaryInputs = document.getElementsByName('pendingAmountSecondaryTxt');

        // Sum loan inputs
        Array.from(loanInputs).forEach(input => {
            total += parseFloat(input.value) || 0;
        });

        // Sum primary inputs
        Array.from(primaryInputs).forEach(input => {
            total += parseFloat(input.value) || 0;
        });

        // Sum secondary inputs
        Array.from(secondaryInputs).forEach(input => {
            total += parseFloat(input.value) || 0;
        });

        // Update total display
        document.getElementById('totalAmount').textContent = " \u20B9 "+ total;
    }

    // Add event listeners to all inputs
    function addInputListeners() {
        const allInputs = [
            ...document.getElementsByName('loanEMITxt'),
            ...document.getElementsByName('pendingAmountPrimaryTxt'),
            ...document.getElementsByName('pendingAmountSecondaryTxt')
        ];

        allInputs.forEach(input => {
            input.addEventListener('input', calculateTotal);
        });
    }

    // Initial calculation and setup
    document.addEventListener('DOMContentLoaded', function() {
        calculateTotal();
        addInputListeners();
    });
	 
	 
	 
	 
	 
	    function formatDate(date) {
	        var d = new Date(date);
	        // Format using specific locale and time zone (e.g., 'en-US' for USA and 'Asia/Kolkata' for IST)
	        var formattedDate = d.toLocaleDateString('en-GB', { timeZone: 'Asia/Kolkata' });
	        return formattedDate.replace(/\//g, '-');
	    }
	
	    const dateElements = document.getElementsByClassName('formattedStartDate');
	    for (let i = 0; i < dateElements.length; i++) {
	        const dateElement = dateElements[i];
	        const rawDate = dateElement.innerText; // Get the raw date
	        const formattedDate = formatDate(rawDate); // Format the date
	        dateElement.innerText = formattedDate; // Set the formatted date back to the element
	    }

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

// Updated JavaScript
        function validateForm() {
			alert("1");          
            let isValid = true;
            const paymentInputs = [
                ...document.getElementsByName('loanEMITxt'),
                ...document.getElementsByName('pendingAmountPrimaryTxt'),
                ...document.getElementsByName('pendingAmountSecondaryTxt'),
            ];
            alert("2");
            paymentInputs.forEach(input => {
                const value = parseFloat(input.value);
                if (isNaN(value) || value < 0) {
                    input.classList.add('error');
                    isValid = false;
                } else {
                    input.classList.remove('error');
                }
            });
            alert("3");
            alert("isValid"+isValid);
            if (isValid) {
            // Submit the form or handle valid data
                const form = document.getElementById('formpayments');
			    form.method = 'POST';
			    form.action = 'payments'; // Your endpoint URL

			    // Add CSRF token (required for Spring Security)
			    const csrfToken = document.querySelector('input[name="_csrf"]').value;
			    const csrfInput = document.createElement('input');
			    csrfInput.type = 'hidden';
			    csrfInput.name = '_csrf';
			    csrfInput.value = csrfToken;
			    form.appendChild(csrfInput);
			    document.body.appendChild(form);
			    alert("4");
			    form.submit();		
            
               //showSuccessMessage();
			   //showErrorMessage();
            }
        }

        function showError(input, errorId) {
            const errorMessage = document.getElementById(errorId);
            input.classList.add('error');
            errorMessage.classList.add('show');
        }

        function clearError(input, errorId) {
            const errorMessage = document.getElementById(errorId);
            input.classList.remove('error');
            errorMessage.classList.remove('show');
        }

        // Add input event listeners to clear errors
        document.querySelectorAll('.input-field').forEach(input => {
            input.addEventListener('input', function() {
                const errorId = `${this.id}-error`;
                clearError(this, errorId);
            });
        });

        // Add change listeners for select elements
        document.querySelectorAll('select.input-field').forEach(select => {
            select.addEventListener('change', function() {
                const errorId = `${this.id}-error`;
                clearError(this, errorId);
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