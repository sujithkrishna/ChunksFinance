<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Chunks Finance Chits Management System - Comprehensive chit fund administration and tracking">
    <meta name="keywords" content="chit funds management, chunks finance, chit schemes, financial administration, chit tracking">
    <title>Chit Fund Management System | Chunks Finance Admin</title>
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
            max-width: 1200px;
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
            max-width: 1200px;
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

        /* Chits Section */
        .chits-section {
            margin-top: 20px;
        }

        .chits-section h3 {
            font-size: 22px;
            font-weight: 500;
            color: #003366;
            margin-bottom: 15px;
        }

        .chits-section .form-group {
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
            <li><a href="finance-uploads">Finance Upload</a></li>
            <li><a href="reports">Reports</a></li>
            <li><a href="loan">Loans</a></li>
            <li><a href="revenue">Revenue</a></li>
            <li><a href="expenses">Expenses</a></li>
            <li><a href="member">Members</a></li>
            <li><a href="chits" class="active">Chits</a></li>
             <c:choose>
	            <c:when test="${currentUser.role == 'SUPER_ADMIN'}">
	            	<li><a href="finance">Create Finance</a></li>
	            </c:when>
            </c:choose>
        </ul>
    </nav>

    <!-- Main Content -->
    <main>
        <div class="content-wrapper">
            <section>
                <h2>Chits Details</h2>
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
                <form method="post" action="chits" id="formchits" name="formchits">
                    <!-- Split into two columns -->
                    <div class="form-container">
                        <div class="form-left">
                            <!-- Chits No -->
                            <div class="form-group">
                                <label for="chits-number">Chits No:</label>
                                <input type="text" name="chitsNo" id="chits-number" class="input-field" placeholder="Enter Chits number" required readonly>
								<div class="error-message" id="chits-number-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Chits number is required</span>
								</div>								
                            </div>

 							<div class="form-group">
								<label for="chits-name">Chits in the name of:</label>
								<select id="chits-name" name="chitsNameOf" class="input-field" required>
									<option value="" disabled selected>Chits in the name of</option>
							        <c:forEach items="${primaryMembers}" var="member">
							            <option value="${member.no}">${member.memberName}</option>
							        </c:forEach>
								</select>
								<div class="error-message" id="chits-name-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Chits name is required</span>
								</div>
							</div>                           
                            
                            <!-- Start Date -->
                            <div class="form-group">
                                <label for="start-date">Start Date:</label>
                                <input name="chitsStartDate" type="date" id="start-date" class="input-field" required>
								<div class="error-message" id="start-date-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Start date is required</span>
								</div>								
                            </div>

                            <!-- Total Chits -->
                            <div class="form-group">
                                <label for="total-chits">Total Chits:</label>
                                <input name="totalChitsNo" type="number" id="total-chits" class="input-field" placeholder="Enter total number of chits" required>
								<div class="error-message" id="total-chits-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Total chits is required</span>
								</div>								
                            </div>
							
							<!-- Total Amount -->
							<div class="form-group">
							    <label for="total-amount">Total Amount:</label>
							    <input name="totalChitsAmount" type="number" id="total-amount" class="input-field" placeholder="Enter total amount" required>
								<div class="error-message" id="total-amount-error">
									<i class="fas fa-exclamation-circle"></i>
									<span>Total amount is required</span>
								</div>								
							</div>

		                    <div class="form-group">
		                        <label for="finance-type">EMI should deduct from</label>
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
							 
                        </div>

                        <div class="form-right">
                            <!-- Empty space for alignment -->
                        </div>
                    </div>

                    <!-- Chits 1 to Chits 10 -->
                    <div class="chits-section">
                        <h4 id="chitsTotalAmountPaying">Chits Details with the total Amount of 0</h4>
                        
                        <div class="form-container">
                            <div class="form-left">
                                <!-- Chits 1 to Chits 5 -->
                                <div class="form-group">
                                    <label for="chits-1">Chits 1:</label>
                                    <input type="text" name="chits-1" id="chits-1" class="input-field" placeholder="Enter Chits 1 details" required>
									<div class="error-message" id="chits-1-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 1 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-2">Chits 2:</label>
                                    <input type="text" name="chits-2" id="chits-2" class="input-field" placeholder="Enter Chits 2 details" required>
									<div class="error-message" id="chits-2-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 2 details required</span>
									</div>										
                                </div>
                                <div class="form-group">
                                    <label for="chits-3">Chits 3:</label>
                                    <input type="text" name="chits-3" id="chits-3" class="input-field" placeholder="Enter Chits 3 details" required>
									<div class="error-message" id="chits-3-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 3 details required</span>
									</div>										
                                </div>
                                <div class="form-group">
                                    <label for="chits-4">Chits 4:</label>
                                    <input type="text" name="chits-4" id="chits-4" class="input-field" placeholder="Enter Chits 4 details" required>
									<div class="error-message" id="chits-4-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 4 details required</span>
									</div>										
                                </div>
                                <div class="form-group">
                                    <label for="chits-5">Chits 5:</label>
                                    <input type="text" name="chits-5" id="chits-5" class="input-field" placeholder="Enter Chits 5 details" required>
									<div class="error-message" id="chits-5-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 5 details required</span>
									</div>										
                                </div>
                            </div>

                            <div class="form-right">
                                <!-- Chits 6 to Chits 10 -->
                                <div class="form-group">
                                    <label for="chits-6">Chits 6:</label>
                                    <input type="text" name="chits-6" id="chits-6" class="input-field" placeholder="Enter Chits 6 details" required>
									<div class="error-message" id="chits-6-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 6 details required</span>
									</div>										
                                </div>
                                <div class="form-group">
                                    <label for="chits-7">Chits 7:</label>
                                    <input type="text" name="chits-7" id="chits-7" class="input-field" placeholder="Enter Chits 7 details" required>
									<div class="error-message" id="chits-7-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 7 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-8">Chits 8:</label>
                                    <input type="text" name="chits-8" id="chits-8" class="input-field" placeholder="Enter Chits 8 details" required>
									<div class="error-message" id="chits-8-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 8 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-9">Chits 9:</label>
                                    <input type="text" name="chits-9" id="chits-9" class="input-field" placeholder="Enter Chits 9 details" required>
									<div class="error-message" id="chits-9-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 9 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-10">Chits 10:</label>
                                    <input type="text" name="chits-10" id="chits-10" class="input-field" placeholder="Enter Chits 10 details" required>
									<div class="error-message" id="chits-10-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 10 details required</span>
									</div>									
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Chits 11 to Chits 20 -->
                    <div class="chits-section">
                        <div class="form-container">
                            <div class="form-left">
                                <!-- Chits 11 to Chits 15 -->
                                <div class="form-group">
                                    <label for="chits-11">Chits 11:</label>
                                    <input type="text" name="chits-11" id="chits-11" class="input-field" placeholder="Enter Chits 11 details" required>
									<div class="error-message" id="chits-11-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 11 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-12">Chits 12:</label>
                                    <input type="text" name="chits-12" id="chits-12" class="input-field" placeholder="Enter Chits 12 details" required>
									<div class="error-message" id="chits-12-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 12 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-13">Chits 13:</label>
                                    <input type="text" name="chits-13" id="chits-13" class="input-field" placeholder="Enter Chits 13 details" required>
									<div class="error-message" id="chits-13-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 13 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-14">Chits 14:</label>
                                    <input type="text" name="chits-14" id="chits-14" class="input-field" placeholder="Enter Chits 14 details" required>
									<div class="error-message" id="chits-14-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 14 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-15">Chits 15:</label>
                                    <input type="text" name="chits-15" id="chits-15" class="input-field" placeholder="Enter Chits 15 details" required>
									<div class="error-message" id="chits-15-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 15 details required</span>
									</div>									
                                </div>
                            </div>

                            <div class="form-right">
                                <!-- Chits 16 to Chits 20 -->
                                <div class="form-group">
                                    <label for="chits-16">Chits 16:</label>
                                    <input type="text" name="chits-16" id="chits-16" class="input-field" placeholder="Enter Chits 16 details" required>
									<div class="error-message" id="chits-16-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 16 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-17">Chits 17:</label>
                                    <input type="text" name="chits-17" id="chits-17" class="input-field" placeholder="Enter Chits 17 details" required>
									<div class="error-message" id="chits-17-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 17 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-18">Chits 18:</label>
                                    <input type="text" name="chits-18" id="chits-18" class="input-field" placeholder="Enter Chits 18 details" required>
									<div class="error-message" id="chits-18-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 18 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-19">Chits 19:</label>
                                    <input type="text" name="chits-19" id="chits-19" class="input-field" placeholder="Enter Chits 19 details" required>
									<div class="error-message" id="chits-19-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 19 details required</span>
									</div>									
                                </div>
                                <div class="form-group">
                                    <label for="chits-20">Chits 20:</label>
                                    <input type="text" name="chits-20" id="chits-20" class="input-field" placeholder="Enter Chits 20 details" required>
									<div class="error-message" id="chits-20-error">
										<i class="fas fa-exclamation-circle"></i>
										<span>Chits 20 details required</span>
									</div>									
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="button-group">
						<button type="button" onclick="validateForm()"><i class="fa-solid fa-landmark"></i> Add Chits</button>
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
    <!-- JavaScript for Form Validation -->
    <script>
    
	    document.getElementById('ownerOfFund').addEventListener('change', function() {
	        clearError(this, 'financeType-error');
	    });
    
	    // Check for success message on page load
	    document.addEventListener('DOMContentLoaded', function() {
	    	
	    	const dateInput = document.getElementById('start-date');
	        const today = new Date();
	        dateInput.value = today.toISOString().split('T')[0];
	    	
	    	document.getElementById('chits-number').value = '${chitsNumber}';
	    	document.getElementById('total-chits').value = 20;
	    	document.getElementById('chits-name').value =   '${currentUser.memberName}';
	    	
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

        function showSuccessMessage() {
            const successMsg = document.getElementById('greenSuccessMessage');
            successMsg.classList.add('show');
            setTimeout(() => {
                successMsg.classList.remove('show');
            }, 5000); // Auto-hide after 5 seconds
        }
		
        
        
        
        document.getElementById('total-amount').addEventListener('input', function() {
            const chitsAmount = parseFloat(this.value) || 0;
            const formatNumber = num => {
                const rounded = Math.round(num * 100) / 100;
                return rounded.toFixed(2).replace(/\.?0+$/, '');
            };
            
            const percentages = [0.05, 0.0385, 0.039, 0.0395, 0.0405, 0.0405, 0.041, 0.0415, 0.042, 0.0425,
                0.043, 0.044, 0.045, 0.046, 0.047, 0.048, 0.0485, 0.049, 0.0495, 0.05];
            let totalPayable = 0;
            
            percentages.forEach((percent, index) => {
                const emiAmount = chitsAmount * percent;
                const inputId = 'chits-'+(index + 1);
                const inputField = document.getElementById(inputId);
                if (inputField) {  
                    inputField.value = formatNumber(emiAmount);
                } else {
                    console.error(`Element #${index + 1} (ID: ${inputId}) not found!`);
                }
                totalPayable += emiAmount;
            });
            
            document.getElementById('chitsTotalAmountPaying').textContent = "Chits Details with the total Amount of " + formatNumber(totalPayable);
        });
        
        
        
        
        function closeGreenSuccessMessage() {
            document.getElementById('greenSuccessMessage').classList.remove('show');
        }
		
			function validateForm() {
				const mandatoryFields = [
                // Main form fields
                { id: 'chits-number', errorId: 'chits-number-error' },
                { id: 'chits-name', errorId: 'chits-name-error' },
                { id: 'start-date', errorId: 'start-date-error' },
                { id: 'total-chits', errorId: 'total-chits-error' },
				{ id: 'total-amount', errorId: 'total-amount-error' },
                { id: 'ownerOfFund', errorId: 'financeType-error' },
                
                // Chits details fields
                { id: 'chits-1', errorId: 'chits-1-error' },
				{ id: 'chits-2', errorId: 'chits-2-error' },
				{ id: 'chits-3', errorId: 'chits-3-error' },
				{ id: 'chits-4', errorId: 'chits-4-error' },
				{ id: 'chits-5', errorId: 'chits-5-error' },
				{ id: 'chits-6', errorId: 'chits-6-error' },
				{ id: 'chits-7', errorId: 'chits-7-error' },
				{ id: 'chits-8', errorId: 'chits-8-error' },
				{ id: 'chits-9', errorId: 'chits-9-error' },
				{ id: 'chits-10', errorId: 'chits-10-error' },
				{ id: 'chits-11', errorId: 'chits-11-error' },
				{ id: 'chits-12', errorId: 'chits-12-error' },
				{ id: 'chits-13', errorId: 'chits-13-error' },
				{ id: 'chits-14', errorId: 'chits-14-error' },
				{ id: 'chits-15', errorId: 'chits-15-error' },
				{ id: 'chits-16', errorId: 'chits-16-error' },
				{ id: 'chits-17', errorId: 'chits-17-error' },
				{ id: 'chits-18', errorId: 'chits-18-error' },
				{ id: 'chits-19', errorId: 'chits-19-error' },
				{ id: 'chits-20', errorId: 'chits-20-error' }
                // ... Add entries for chits 3-20 following same pattern
            ];
            let isValid = true;

            mandatoryFields.forEach(field => {
                const input = document.getElementById(field.id);
                const error = document.getElementById(field.errorId);
                
                if (!input.value.trim()) {
                    showError(input, error);
                    isValid = false;
                } else {
                    clearError(input, error);
                }
            });
            if (isValid) {
            	// Submit the form or handle valid data
		       // showSuccessMessage();
				//showErrorMessage();	

				// Create a hidden form
			    const form = document.getElementById('formchits');
			    form.method = 'POST';
			    form.action = 'chits'; // Your endpoint URL

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