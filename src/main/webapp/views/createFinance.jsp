<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Finance Account | Chunks Finance Management System</title>
    <meta name="description" content="Create new financial accounts and manage fund types through Chunks Finance comprehensive financial management interface">
    <meta name="keywords" content="finance creation, account setup, fund management, chunks finance, financial administration">
    <meta name="author" content="Chunks Finance">
    
    <!-- Open Graph Tags -->
    <meta property="og:title" content="Financial Account Creation - Chunks Finance">
    <meta property="og:description" content="Professional interface for creating and managing financial accounts">
    <meta property="og:type" content="website">
    
    <!-- Preconnected Resources -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://cdnjs.cloudflare.com" crossorigin>
    
    <!-- External Resources -->
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
        .sectionh2 {
            font-size: 24px;
            font-weight: 600;
            color: #334558;
            margin-bottom: 15px;
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
			
			tab-nav {
		        flex-direction: column;
		        padding: 0;
		    }
		
		    .tab-link {
		        border-bottom: 1px solid #eee;
		        width: 100%;
		        text-align: left;
		        padding: 12px 20px;
		    }
		
		    .tab-link.active:after {
		        display: none;
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
            background-color: #6E6E6F;
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
		#interest-group {
		    display: none;
		    overflow: hidden;
		    transition: all 0.3s ease;
		    opacity: 0;
		    height: 0;
		}
		
		#interest-group.visible {
		    display: block;
		    opacity: 1;
		    height: auto;
		}
		/* Tabbed Panel Styles */
		.tabbed-panel {
		    background: rgba(255, 255, 255, 0.95);
		    border-radius: 10px;
		    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		    width: 100%;
		}
		
		.tab-nav {
		    display: flex;
		    border-bottom: 2px solid #f0f0f0;
		    padding: 0 20px;
		}
		
		.tab-link {
		    padding: 15px 30px;
		    background: none;
		    border: none;
		    cursor: pointer;
		    font-size: 14px;
		    color: #666;
		    position: relative;
		    transition: all 0.3s ease;
		}
		
		.tab-link.active {
		    color: #2c3e50;
		    font-weight: 500;
		}
		
		.tab-link.active:after {
		    content: '';
		    position: absolute;
		    bottom: -2px;
		    left: 0;
		    right: 0;
		    height: 3px;
		    background: linear-gradient(135deg, #a3a3a3, #4d4d4d);
		}
		
		.tab-link:hover:not(.active) {
		    color: #007bff;
		    background: rgba(0, 123, 255, 0.05);
		}
		
		.tab-pane {
		    display: none;
		    padding: 25px;
		}
		
		.tab-pane.active {
		    display: block;
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

	<!-- Header -->
	<header>
		<div>
			<h1>Chunks Finance Dashboard</h1>
			<p>Your financial overview at a glance</p>
		</div>
		<div class="user-profile">
			<div>
				<div class="user-name">
					<c:out value="${currentUser.memberName}" />
				</div>
				<div class="user-role">
					<c:choose>
						<c:when test="${currentUser.role == 'SUPER_ADMIN'}">
							<h4>
								<a href="settings" style="color: inherit; text-decoration: none;">SuperAdmin</a>
							</h4>
						</c:when>
						<c:otherwise>
				       <c:choose>
							<c:when test="${not empty financeOwner}">Finance Owner</c:when>
							<c:otherwise>Contributor</c:otherwise>
						</c:choose>
				        
				    </c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="user-avatar">
				<div class="logout-container">
					<a href="#" class="logout-btn" id="logoutTrigger"> <i class="fas fa-power-off"></i>
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
			<li><a href="loan">Loans</a></li>
			<li><a href="loan-preclosure">Preclosure</a></li>
			<li><a href="loan-enquires" >Enquires</a></li>
			<li><a href="revenue">Revenue</a></li>
			<li><a href="expenses">Expenses</a></li>
			<c:choose>
				<c:when test="${currentUser.role == 'SUPER_ADMIN'}">
					<li><a href="member">Members</a></li>
					<li><a href="chits">Chits</a></li>
				</c:when>
			</c:choose>	
					<li><a href="finance" class="active">Finance</a></li>
			<c:choose>
				<c:when test="${currentUser.role == 'SUPER_ADMIN'}">		
					<li><a href="enrolment">Enrolment</a></li>
				</c:when>	
			</c:choose>		
		</ul>
	</nav>

    <!-- Main Content Section -->
    <main>
        <div class="content-wrapper">
            <section>
                <h2 class="sectionh2">Finance</h2>
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
                
                	<div class="tabbed-panel">
							<!-- Tab Headers -->
							<div class="tab-nav">
								<c:choose>
								    <c:when test="${not empty financeTransfer}"><button class="tab-link" data-tab="financial-creation">Finance Creation</button><button class="tab-link active" data-tab="financial-transfer">Finance Inter transfer</button></c:when>
								    <c:otherwise><button class="tab-link active" data-tab="financial-creation">Finance Creation</button><button class="tab-link" data-tab="financial-transfer">Finance Inter transfer</button></c:otherwise>
								</c:choose>							
							</div>
							<!-- Tab Content -->
							<div class="tab-content">
								<!-- First Tab Content -->
								
								<c:choose>
								    <c:when test="${not empty financeTransfer}"><div id="financial-creation" class="tab-pane"></c:when>
								    <c:otherwise><div id="financial-creation" class="tab-pane active"></c:otherwise>
								</c:choose>								
									<div class="report-card">
										<form action="finance" id="formcreateFinance" name="formcreateFinance"	>
							                    <!-- Finance Type -->
							                    <div class="form-group">
							                        <label for="finance-type">Finance Type</label>
							                        <select id="finance-type" name="financeType" class="input-field" required>
							                            <option value="" disabled selected>Select Finance Type</option>
							                            <option value="PRIMARY">Primary</option>
							                            <option value="SECONDARY">Secondary</option>
							                        </select>
							                        <div class="error-message" id="finance-type-error">
							                            <i class="fas fa-exclamation-circle"></i>
							                            <span>Finance Type is required</span>
							                        </div>
							                    </div>
							
							                    <!-- Finance Name -->
							                    <div class="form-group">
							                        <label for="finance-name">Finance Name</label>
							                        <input type="text" id="finance-name" name="financeName" class="input-field" placeholder="Enter finance Name" required>
							                        <div class="error-message" id="finance-name-error">
							                            <i class="fas fa-exclamation-circle"></i>
							                            <span>Finance Name is required</span>
							                        </div>
							                    </div>
							                    <!-- Finance Owner Name -->
							                    <div class="form-group">
							                        <label for="finance-owner">Finance Owner Name</label>
							                        <select id="finance-owner" name="financeOwner" class="input-field" required>
							                            <option value="" disabled selected>Select Person</option>
												        <c:forEach items="${primaryMembers}" var="member">
												            <option value="${member.no}">${member.memberName}</option>
												        </c:forEach>  
							                        </select>
							                        
							                        <div class="error-message" id="finance-owner-error">
							                            <i class="fas fa-exclamation-circle"></i>
							                            <span>Finance Owner Name is required</span>
							                        </div>
							                    </div>
							
							                    <!-- Finance Date -->
							                    <div class="form-group">
							                        <label for="finance-date">Finance Creation Date</label>
							                        <input type="date" id="finance-date"  name="financeCreationDate" class="input-field" required>
							                        <div class="error-message" id="finance-date-error">
							                            <i class="fas fa-exclamation-circle"></i>
							                            <span>Finance Date is required</span>
							                        </div>
							                    </div>
							
							                    <!-- Finance Amount (Optional) -->
							                    <div class="form-group">
							                        <label for="finance-amount">Finance Amount</label>
							                        <input type="number" id="finance-amount"  name="financeAmount" class="input-field" placeholder="Enter finance amount">
												    <!-- Add this error message -->
												    <div class="error-message" id="finance-amount-error">
												        <i class="fas fa-exclamation-circle"></i>
												        <span>Finance Amount is required for Primary accounts</span>
												    </div>                        
							                    </div>
							                    
							                    <div class="form-group">
							                        <label for="loan-priority-order-number">Loan Priority Order</label>
							                        <input type="number" id="loanPriorityOrderNumber"  name="loanPriorityOrderNumber" class="input-field" placeholder="Enter loan Priority Order Number">
												    <!-- Add this error message -->
												    <div class="error-message" id="finance-loan-priority-order-number-error">
												        <i class="fas fa-exclamation-circle"></i>
												        <span>loan Priority Order Number is required</span>
												    </div>                        
							                    </div>  
							                    
							                    <div id="interest-group">
												    <div class="form-group">
												        <label for="finance-interest">Interest providing</label>
												        <input type="number" id="interest-amount" name="interestAmount" class="input-field"  placeholder="Enter the interest Amount">
												        <div class="error-message" id="interest-amount-error">
												            <i class="fas fa-exclamation-circle"></i>
												            <span>Interest amount is required for Secondary accounts</span>
												        </div>
												    </div>
												</div>                                     
							
							                    <!-- Submit Button -->
							                    <div class="button-group">
							                        <button type="button" onclick="validateForm()"><i class="fa-solid fa-receipt"></i> Add Finance</button>
							                        <button type="button"><i class="fas fa-edit"></i> Edit</button>
							                        <button type="button" style="background-color: #e74c3c;"><i class="fas fa-trash-alt"></i> Delete</button>
							                    </div>
							                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							                </form>
										
									</div>
								</div>
				
								
	
				
								<!-- Second Tab Content -->
								
								<c:choose>
								    <c:when test="${not empty financeTransfer}"><div id="financial-transfer" class="tab-pane active"></c:when>
								    <c:otherwise><div id="financial-transfer" class="tab-pane"></c:otherwise>
								</c:choose>							
									<div class="report-card">
										 <form method="post" action="finance-transfer" id="formfinancetransfer" name="formfinancetransfer">
										 	  <div class="form-group">
							                        <label for="finance-type">Source Fund</label>
							                        <select name="sourceFinanceType" id="finance-source" class="input-field">
							                            <option value="" disabled selected>Finance Type</option>
							                            <c:forEach items="${sourceFinance}" var="financeItem">
							                            	<option value="${financeItem.id}">${financeItem.financeName} by ${financeItem.financeOwner.memberName}</option> 
							                            </c:forEach>
							                        </select>
							                        <div class="error-message" id="finance-source-error">
							                            <i class="fas fa-exclamation-circle"></i>
							                            <span>Please select a finance type</span>
							                        </div>
							                   </div>  
											  <div class="form-group">
								                        <label for="finance-type">Destination Fund</label>
								                        <select name="destinationFinanceType" id="finance-destination" class="input-field">
								                            <option value="" disabled selected>Finance Type</option>
								                            <c:forEach items="${destinationFinance}" var="financeItem">
								                            	<option value="${financeItem.id}">${financeItem.financeName} by ${financeItem.financeOwner.memberName}</option> 
								                            </c:forEach>
								                        </select>
								                        <div class="error-message" id="finance-destination-error">
								                            <i class="fas fa-exclamation-circle"></i>
								                            <span>Please select a finance type</span>
								                        </div>
								              </div> 
								              
										 		<!-- Finance Amount (Optional) -->
							                    <div class="form-group">
							                        <label for="finance-transfer-amount">Finance Amount</label>
							                        <input type="number" id="finance-transfer-amount"  name="financeAmount" class="input-field" placeholder="Enter finance amount">
												    <!-- Add this error message -->
												    <div class="error-message" id="finance-transfer-amount-error">
												        <i class="fas fa-exclamation-circle"></i>
												        <span>Finance Amount is required for finance transfer</span>
												    </div>                        
							               		</div>
							               		
							               		  <div class="button-group">
							                        <button type="button" onclick="financeValidateForm()"><i class="fa-solid fa-receipt"></i> Transfer Fund</button>
							                    </div>
							               		
										 	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										 </form>
										 
									</div>
								</div>
													
								
								
							</div>
						</div>
                
                
                
                
                
                
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
	
		    // Tabbed Panel Functionality
		    document.querySelectorAll('.tab-link').forEach(link => {
		        link.addEventListener('click', function(e) {
		            e.preventDefault();
		            
		            // Remove active classes
		            document.querySelectorAll('.tab-link, .tab-pane').forEach(el => {
		                el.classList.remove('active');
		            });
		            
		            // Add active classes
		            this.classList.add('active');
		            const tabId = this.getAttribute('data-tab');
		            document.getElementById(tabId).classList.add('active');
		        });
		    });
			 // Check for success message on page load
		    document.addEventListener('DOMContentLoaded', function() {
		    	
		    	const sourceSelect = document.getElementById("finance-source");
		        const destinationSelect = document.getElementById("finance-destination");
		     // Store the original options of the destination combo box
		        let originalOptions = Array.from(destinationSelect.options).map(option => ({
		            value: option.value,
		            text: option.text
		        }));

		        function updateDestinationOptions() {
		            let selectedValue = sourceSelect.value;

		            // Clear the destination combo box
		            destinationSelect.innerHTML = "";

		            // Re-add all original options except the selected one
		            originalOptions.forEach(option => {
		                if (option.value !== selectedValue) {
		                    let newOption = document.createElement("option");
		                    newOption.value = option.value;
		                    newOption.textContent = option.text;
		                    destinationSelect.appendChild(newOption);
		                }
		            });
		        }
		        // Attach event listener to the source combo box
		        sourceSelect.addEventListener("change", updateDestinationOptions);
		    	
		    	
		    	handleFinanceType();
		    	const dateInput = document.getElementById('finance-date');
		    	const options = { timeZone: 'Asia/Kolkata' };
		        const today = new Date().toLocaleDateString('en-CA', options);
		        dateInput.value = today;
		    	
		        document.getElementById('finance-type').addEventListener('change', handleFinanceType);
		        
		        <c:if test="${not empty success}">
		            showSuccessMessage();
		        </c:if>	  
		        <c:if test="${not empty error}">
		        showErrorMessage();
		    </c:if>	             
		    });    
			 
		    function handleFinanceType() {
		    	 const financeTypeSelect = document.getElementById('finance-type');
		    	    const selectedValue = financeTypeSelect.value;
		    	    const interestGroup = document.getElementById('interest-group');
		    	    const interestInput = document.getElementById('interest-amount');

		    	    if (selectedValue === 'SECONDARY') {
		    	        interestGroup.classList.add('visible');
		    	        interestInput.required = true;
		    	    } else {
		    	        interestGroup.classList.remove('visible');
		    	        interestInput.required = false;
		    	        interestInput.value = '';
		    	        clearError(interestInput, 'interest-amount-error');
		    	    }
		    }
		    
		 document.getElementById('finance-type').addEventListener('change', handleFinanceType);	
		 function financeValidateForm() {
			 let isValid = true;
			 
			 
			 const financeSource = document.getElementById("finance-source");
	         const financeDestination = document.getElementById("finance-destination");
	         const financeTransferAmount = document.getElementById("finance-transfer-amount"); 
	         
	         clearError(financeSource, 'finance-type-error');
	         clearError(financeDestination, 'finance-name-error');
	         clearError(financeTransferAmount, 'finance-transfer-amount-error');
			 
	         if (!financeSource.value.trim()) {
	                showError(financeSource, 'finance-source-error');
	                isValid = false;
	         }
	         
	         if (!financeDestination.value.trim()) {
	                showError(financeDestination, 'finance-destination-error');
	                isValid = false;
	          }
	         
	         if (!financeTransferAmount.value.trim()) {
	                showError(financeTransferAmount, 'finance-transfer-amount-error');
	                isValid = false;
	          }	   
	         if (isValid) {
	        	  const form = document.getElementById('formfinancetransfer');
				    form.method = 'POST';
				    form.action = 'finance-transfer'; // Your endpoint URL

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
    
        function validateForm() {

        	 const financeTypeElement = document.getElementById("finance-type"); 
        	 const selectedFinanceType = financeTypeElement.value; // Get the value here
            
            const financeName = document.getElementById("finance-name");
            const financeOwner = document.getElementById("finance-owner");
            const financeDate = document.getElementById("finance-date");
            const financeAmount = document.getElementById("finance-amount"); 
            let isValid = true;

            // Clear previous errors
            clearError(financeTypeElement, 'finance-type-error');
            clearError(financeName, 'finance-name-error');
            clearError(financeOwner, 'finance-owner-error');
            clearError(financeDate, 'finance-date-error');

            // Validate Finance Type
            if (!financeTypeElement.value.trim()) {
                showError(financeTypeElement, 'finance-type-error');
                isValid = false;
            }

            // Validate Finance Name
            if (!financeName.value.trim()) {
                showError(financeName, 'finance-name-error');
                isValid = false;
            }

            // Validate Finance Owner Name
            if (!financeOwner.value.trim()) {
                showError(financeOwner, 'finance-owner-error');
                isValid = false;
            }

            // Validate Finance Date
            if (!financeDate.value.trim()) {
                showError(financeDate, 'finance-date-error');
                isValid = false;
            }
            if (selectedFinanceType === "PRIMARY" && !financeAmount.value.trim()) {
                showError(financeAmount, 'finance-amount-error');
                isValid = false;
            }
            
            const interestAmount = document.getElementById('interest-amount');
            
            if (selectedFinanceType === 'SECONDARY' && !interestAmount.value.trim()) {
                showError(interestAmount, 'interest-amount-error');
                isValid = false;
            }
            
            
            if (isValid) {
                // You can add form submission logic here			
               // showSuccessMessage();
				//showErrorMessage();
				// Create a hidden form
			    const form = document.getElementById('formcreateFinance');
			    form.method = 'POST';
			    form.action = 'finance'; // Your endpoint URL

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
		
		document.getElementById('finance-amount').addEventListener('input', function() {
		    clearError(this, 'finance-amount-error');
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
        // Function to show error message
        function showError(input, errorId) {
            const errorMessage = document.getElementById(errorId);
            input.classList.add('error');
            errorMessage.classList.add('show');
        }

        // Function to clear error message
        function clearError(input, errorId) {
            const errorMessage = document.getElementById(errorId);
            input.classList.remove('error');
            errorMessage.classList.remove('show');
        }

        // Add input event listeners to clear errors when typing
        document.getElementById('finance-type').addEventListener('input', function() {
            clearError(this, 'finance-type-error');
        });

        document.getElementById('finance-name').addEventListener('input', function() {
            clearError(this, 'finance-name-error');
        });

        document.getElementById('finance-owner').addEventListener('input', function() {
            clearError(this, 'finance-owner-error');
        });

        document.getElementById('finance-date').addEventListener('input', function() {
            clearError(this, 'finance-date-error');
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
                    // Replace with actual logout logic
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