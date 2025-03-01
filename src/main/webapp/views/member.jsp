<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Chunks Finance Member Management System - Comprehensive member administration and profile management">
    <meta name="keywords" content="member management, chunks finance, user administration, financial members, profile system">
    <title>Member Management System | Chunks Finance Admin</title>
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
			/* Transition for referenceMemberGroup */
			#referenceMemberGroup {
			    transition: opacity 0.3s ease, height 0.3s ease;
			    opacity: 0;
			    height: 0;
			    overflow: hidden;
			}
			
			#referenceMemberGroup.show {
			    opacity: 1;
			    height: auto;
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
				        <h4>SuperAdmin</h4>
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
            <li><a href="member" class="active">Members</a></li>
            <li><a href="chits">Chits</a></li>
            <li><a href="finance">Create Finance</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main>
        <section>
            <h2>Member Management</h2>
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
            <form method="post" action="member" id="member" name="member">
                <div class="form-group">
                    <label for="memberType">Member Type:</label>
                    <select id="memberType" name="memberType" class="input-field" required>
                        <option value="" disabled>Member Type</option>
                        <option value="PRIMARY">Primary</option>
                        <option value="SECONDARY" selected>Secondary</option>
                    </select>
                    <div class="error-message" id="memberType-error">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Please select a member type</span>
                    </div>					
                </div>
				<div class="form-group" id="referenceMemberGroup" style="display: none;">
				    <label for="referenceMember">Reference Member:</label>
				    <select id="referenceMember" name="referenceMember" class="input-field" required>
				        <option value="" disabled selected>Reference Member</option>
				        <c:forEach items="${primaryMembers}" var="member">
				            <option value="${member.no}">${member.memberName}</option>
				        </c:forEach>
				    </select>
				    <div class="error-message" id="referenceMember-error">
				        <i class="fas fa-exclamation-circle"></i>
				        <span>Please select a Reference Member</span>
				    </div>
				</div>
                
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input id="memberName" name="memberName" type="text"  class="input-field" placeholder="Enter member name" required>
                    <div class="error-message" id="name-error">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Please enter member name</span>
                    </div>					
                </div>

                <div class="form-group">
                    <label for="email">Email/Login:</label>
                    <input id="emailId" name="emailId" type="email"  class="input-field" placeholder="Enter email" required>
                    <div class="error-message" id="emailId-error">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Please enter a valid email</span>
                    </div>					
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input id="password" name="password" type="password"  class="input-field" placeholder="Enter password" required>
                    <div class="error-message" id="password-error">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Please enter a password</span>
                    </div>					
                </div>
                
                <div class="form-group">
                    <label for="memberDOB">Date of Birth:</label>
                    <input id="memberDOB" name="memberDOB" type="date"  class="input-field" required>
                </div>

                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input id="mobileNumber" name="mobileNumber" type="text"  class="input-field" placeholder="Enter mobile number" required>
                </div>

                <div class="form-group">
                    <label for="address1">Address 1:</label>
                    <input id="address1" name="address1" type="text"  class="input-field" placeholder="Enter address" required>
                </div>

                <div class="form-group">
                    <label for="area">Area/Place:</label>
                    <input id="place" name="place" type="text"  class="input-field" placeholder="Enter area" required>
                </div>

                <div class="form-group">
                    <label for="taluk">Taluk:</label>
                    <input id="taluk"  name="taluk" type="text"  class="input-field" placeholder="Enter taluk" required>
                </div>

                <div class="form-group">
                    <label for="district">District:</label>
                    <input id="district" name="district" type="text"  class="input-field" placeholder="Enter district" required>
                </div>

                <div class="form-group">
                    <label for="state">State:</label>
                    <input id="state"  name="state" type="text"  class="input-field" placeholder="Enter state" required>
                </div>

                <div class="form-group">
                    <label for="pin">PINCode:</label>
                    <input id="pincode" name="pincode" type="text"  class="input-field" placeholder="Enter PINCode" required>
                </div>

                <!-- Button Group for Save, Update, Delete -->
                <div class="button-group">
                    <button type="submit" onclick="validateForm()"><i class="fas fa-user-plus"></i> Add Member</button>
                    <button type="button"> <i class="fas fa-edit"></i>Edit</button>
                    <button type="button" style="background-color: #e74c3c;"><i class="fas fa-trash-alt"></i> Delete</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
            </form>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        &copy; 2025 Chunks Finance | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
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

	 // Check for success message on page load
	    document.addEventListener('DOMContentLoaded', function() {
            const memberTypeSelect = document.getElementById('memberType');
            const referenceMemberGroup = document.getElementById('referenceMemberGroup');

            memberTypeSelect.addEventListener('change', function() {
                if (this.value === 'SECONDARY') {
                    referenceMemberGroup.style.display = ''; // Fix: Remove inline display:none
                    setTimeout(() => {
                        referenceMemberGroup.classList.add('show');
                    }, 10);
                } else {
                    referenceMemberGroup.classList.remove('show');
                    setTimeout(() => {
                        referenceMemberGroup.style.display = 'none';
                    }, 300);
                }
            });
            
            memberTypeSelect.dispatchEvent(new Event('change'));
            
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
		
        // Validation functions
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
		
		   function validateForm() {
            let isValid = true;
            
            // Clear previous errors
            clearError(document.getElementById('referenceMember'), 'referenceMember-error');
            clearError(document.getElementById('memberType'), 'memberType-error');
            clearError(document.getElementById('memberName'), 'name-error');
            clearError(document.getElementById('emailId'), 'emailId-error');
            clearError(document.getElementById('password'), 'password-error');

            // Validate Finance Type
            const memberType = document.getElementById('memberType');
            if (!memberType.value) {
                showError(memberType, 'memberType-error');
                isValid = false;
            }

            // Validate Reference Member if Secondary
            if (memberType.value === 'SECONDARY') {
                const referenceMember = document.getElementById('referenceMember');
                if (!referenceMember.value) {
                    showError(referenceMember, 'referenceMember-error');
                    isValid = false;
                }
            }else{
            	const referenceMemberSelect = document.getElementById('referenceMember');
                referenceMemberSelect.value = "PRIMARY";
            }
            
            // Validate Name
            const name = document.getElementById('memberName');
            if (!name.value.trim()) {
                showError(name, 'name-error');
                isValid = false;
            }

            // Validate Email
            const email = document.getElementById('emailId');
			
			if (!email.value.trim()) {
                showError(email, 'emailId-error');
                isValid = false;
            }
			
			

            // Validate Password
            const password = document.getElementById('password');
            if (!password.value.trim()) {
                showError(password, 'password-error');
                isValid = false;
            }

			if (isValid) {
				// Create a hidden form
			    const form = document.getElementById('member');
			    form.method = 'POST';
			    form.action = 'member'; // Your endpoint URL

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


            return isValid;
        }
		
        // Add input listeners for real-time validation
        document.getElementById('memberType').addEventListener('change', function() {
            clearError(this, 'memberType-error');
        });

        document.getElementById('referenceMember').addEventListener('change', function() {
            clearError(this, 'referenceMember-error');
        });
        
        document.getElementById('memberName').addEventListener('input', function() {
            clearError(this, 'name-error');
        });

        document.getElementById('emailId').addEventListener('input', function() {
            clearError(this, 'emailId-error');
        });

        document.getElementById('password').addEventListener('input', function() {
            clearError(this, 'password-error');
        });		
	
        // Function to handle button click
        function handleButtonClick(event) {
            const button = event.target;
            button.classList.add('clicked');
            setTimeout(() => {
                button.classList.remove('clicked');
            }, 10000); // 10 seconds delay
        }

        // Add click event listeners to all buttons
        document.querySelectorAll('.button-group button').forEach(button => {
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