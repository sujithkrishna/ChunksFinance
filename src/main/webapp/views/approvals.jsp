<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Approval Management System | Chunks Finance Dashboard</title>
    <meta name="description" content="Manage financial approvals and requests through Chunks Finance comprehensive approval system with real-time tracking and decision-making capabilities">
    <meta name="keywords" content="finance approvals, request management, chunks finance, financial authorization, expense approval">
    <meta name="author" content="Chunks Finance">
    
    <!-- Open Graph Tags -->
    <meta property="og:title" content="Approval Management System - Chunks Finance">
    <meta property="og:description" content="Streamlined financial request approval system with real-time tracking">
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
        /* === Common END here === */

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
            padding: 15px;
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

        .table-cell {
            padding: 10px;
            flex: 1;
            text-align: left;
        }

        .table-cell:last-child {
            text-align: right;
        }

        .button-group-approved {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .button-group-approved button {
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

		.button-group-approved button i {
			font-size: 14px;
			transition: transform 0.2s ease;
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


        /* Responsive Design */
        @media (max-width: 768px) {
            .table-row {
                flex-direction: column;
                align-items: flex-start;
                padding: 20px;
            }

            .table-cell {
                width: 100%;
                text-align: left;
                padding: 10px 0;
            }

            .table-cell:last-child {
                text-align: left;
            }

            .button-group-approved {
                flex-direction: row;
                justify-content: flex-start;
                width: 100%;
                gap: 10px;
                margin-top: 10px;
            }

            .button-group-approved button {
                width: 48%;
                padding: 12px;
                font-size: 14px;
            }

            .button-group-approved button i {
                margin-right: 5px;
            }
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

        /* Updated Date Input Styles */
        input[type="date"] {
            width: 200px; /* Adjust width as needed */
            height: 40px; /* Adjust height as needed */
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            color: #333;
            cursor: pointer;
        }

        input[type="date"]:focus {
            outline: none;
            border-color: #334558;
            box-shadow: 0 0 5px rgba(51, 69, 88, 0.5);
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
                <div class="user-role">Administrator</div>
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
            <li><a href="approvals" class="active">Approvals</a></li>
            <li><a href="finance-uploads">Finance Upload</a></li>
            <li><a href="finance-status">Finance Status</a></li>
            <li><a href="loan">Loans</a></li>
            <li><a href="revenue">Revenue</a></li>
            <li><a href="expenses">Expenses</a></li>
            <li><a href="member">Members</a></li>
            <li><a href="new-chits">Chits</a></li>
            <li><a href="load-finance">Create Finance</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main>
        <section id="approvals">
            <h2>Pending Approvals</h2>
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
			<form method="post" action="createApproval" id="formcreateApproval" name="formcreateApproval">
	            <div class="form-container">
	                <div class="form-group">
	                    <label for="approval-date">Filter Date:</label>
	                    <input type="date" id="approval-date" name="approval-date" required>
	                </div>
	            </div>
	            <div class="table-container">
	                <!-- Table Header -->
	                <div class="table-row header">
	                    <div class="table-cell">Requester</div>
	                    <div class="table-cell">Request Type</div>
	                    <div class="table-cell">Amount</div>
	                    <div class="table-cell">Date Submitted</div>
	                    <div class="table-cell">Authorization</div>
	                </div>
	                <!-- Approval Rows -->
		                 <c:choose>
			    			<c:when test="${nonApprovedRevenueList == null}">
								<div class="table-row" style="background: linear-gradient(135deg, rgba(194, 163, 69, 0.9), rgba(245, 206, 88, 0.9))">
			        	            <h3> You don't have any items to approve.</h3>
		   			            </div>
			    			</c:when>
			    			 <c:otherwise>
				                     <c:forEach items="${nonApprovedRevenueList}" var="ApprovalItem">
				               		            <div class="table-row" style="background: linear-gradient(135deg, rgba(147, 208, 131, 0.9), rgba(187, 242, 172, 0.9))">
								                    <div class="table-cell">${ApprovalItem.spenderName}</div>
								                    <div class="table-cell">${ApprovalItem.spenderDetails}</div>
								                    <div class="table-cell">&#8377;${ApprovalItem.spendAmount}</div>
								                    <div class="table-cell">${ApprovalItem.spendDate}</div>
								                    <div class="table-cell">
								                        <div class="button-group-approved">
								                            <button onclick="validateForm('${ApprovalItem.revenueNumber}','REVENUE','APPROVED')" aria-label="Approve request"><i class="fas fa-check"></i> Approve</button>
								                            <button onclick="validateForm('${ApprovalItem.revenueNumber}','REVENUE','REJECTED')" style="background-color: #e74c3c;" aria-label="Reject request"><i class="fas fa-times"></i> Reject</button>
								                        </div>
								                    </div>
								                </div>
							 				
				                      </c:forEach>		    			 
			    			 </c:otherwise>
			    		</c:choose>	
	            </div>
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
           </form>	
        </section>
    </main>

    <!-- Footer -->
    <footer>
        &copy; 2025 Chunks Finance | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
    </footer>
	
    <div class="logout-confirm">
        <p>Are you sure you want to logout?</p>
        <div class="confirm-buttons">
            <button class="confirm-btn yes">Yes, Logout</button>
            <button class="confirm-btn no">Cancel</button>
        </div>
    </div>
	
    <script>
    
		 // Check for success message on page load
	    document.addEventListener('DOMContentLoaded', function() {
	    	setCurrentDate();
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
		
	    function closeGreenSuccessMessage() {
	        document.getElementById('greenSuccessMessage').classList.remove('show');
	    }
        // Function to set the current date in the date input field
        function setCurrentDate() {
            const dateInput = document.getElementById('approval-date');
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0'); // Months are zero-based
            const day = String(today.getDate()).padStart(2, '0');
            const formattedDate = `${year}-${month}-${day}`;
            dateInput.value = formattedDate;
        }

        function validateForm(currentId,currentType,status) {
        	// Create a hidden form
		    const form = document.getElementById('formcreateApproval');
		    form.method = 'POST';
		    form.action = 'create-approval'; // Your endpoint URL
		    // Add CSRF token (required for Spring Security)
		    const csrfToken = document.querySelector('input[name="_csrf"]').value;
		    const csrfInput = document.createElement('input');
		    csrfInput.type = 'hidden';
		    csrfInput.name = '_csrf';
		    csrfInput.value = csrfToken;
		    
		    let idInput = form.querySelector('input[name="currentId"]');
		    if (!idInput) {
		        idInput = document.createElement('input');
		        idInput.type = 'hidden';
		        idInput.name = 'currentId';
		        idInput.value = currentId;
		        form.appendChild(idInput);
		    }
		    
		    let idTypeInput = form.querySelector('input[name="currentType"]');
		    if (!idTypeInput) {
		    	idTypeInput = document.createElement('input');
		    	idTypeInput.type = 'hidden';
		    	idTypeInput.name = 'currentType';
		    	idTypeInput.value = currentType;
		        form.appendChild(idTypeInput);
		    }
		    
		    let statusInput = form.querySelector('input[name="status"]');
		    if (!statusInput) {
		    	statusInput = document.createElement('input');
		    	statusInput.type = 'hidden';
		    	statusInput.name = 'status';
		    	statusInput.value = status;
		        form.appendChild(statusInput);
		    }
		    
		    
		    
		    form.appendChild(csrfInput);
		    document.body.appendChild(form);
		    form.submit();	
        }

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
        document.querySelectorAll('.button-group-approved button').forEach(button => {
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
                if (this.classList.contains('yes')) {
                    window.location.href = 'financeLogin';
                }
                document.querySelector('.logout-confirm').style.display = 'none';
            });
        });
    </script>
</body>
</html>