<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
    <title>Chunks Finance Dashboard - Secure Login</title>
    <meta name="description" content="Secure login to access your Chunks Finance Dashboard for comprehensive financial management and analytics">
    <meta name="keywords" content="finance dashboard, financial management, login, personal finance, money tracking">
    <meta name="author" content="Chunks Finance">
    
    <!-- Open Graph Tags -->
    <meta property="og:title" content="Chunks Finance Dashboard">
    <meta property="og:description" content="Secure login for your financial management dashboard">
    <meta property="og:type" content="website">
    
    <!-- Font Awesome with preconnect -->
    <link rel="preconnect" href="https://cdnjs.cloudflare.com/ajax/libs">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* Add new error styles */
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

        /* Base styles (Mobile First) */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header */
        header {
            background: linear-gradient(135deg, rgba(163, 163, 163, 0.9), rgba(77, 77, 77, 0.9));
            color: white;
            padding: 1.5rem 1rem;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        header p {
            font-size: 0.9rem;
            margin-top: 0.25rem;
        }

        /* Main Content */
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem;
        }

        /* Login Section */
        .login-section {
            background-color: white;
            width: 100%;
            max-width: 500px;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            margin: 1rem;
        }

        .login-section h2 {
            font-size: 1.75rem;
            color: #334558;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 0.5rem;
        }

        .input-field {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 0.9rem;
            background-color: #fafafa;
        }

        .input-field:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
        }

        /* Buttons */
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
            margin-top: 1.5rem;
        }

        button {
            width: 100%;
            padding: 0.8rem;
            background-color: #3D3D3D;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: auto;
        }

        footer a {
            color: white;
            text-decoration: none;
            margin: 0 0.5rem;
        }

        /* Background Image */
        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://images.unsplash.com/photo-1537724326059-2ea20251b9c8');
            background-size: cover;
            background-position: center;
            z-index: -1;
            filter: blur(5px);
        }

        /* Desktop Styles */
        @media (min-width: 768px) {
            header {
                padding: 1.5rem;
            }

            header h1 {
                font-size: 1.75rem;
            }

            header p {
                font-size: 0.95rem;
            }

            .login-section {
                max-width: 400px;
                padding: 2rem 1.5rem;
                margin: 1.5rem;
                border-radius: 6px;
            }

            .login-section h2 {
                font-size: 1.5rem;
                margin-bottom: 1.25rem;
            }

            .form-group {
                margin-bottom: 1.25rem;
            }

            label {
                font-size: 0.85rem;
                margin-bottom: 0.4rem;
            }

            .input-field {
                padding: 0.7rem;
                font-size: 0.9rem;
                border-radius: 4px;
            }

            .button-group {
                flex-direction: row;
                gap: 10px;
                margin-top: 20px;
                justify-content: center;
            }

            button {
                padding: 10px 20px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }

            .button-group button i {
                font-size: 14px;
                transition: transform 0.2s ease;
            }

            .button-group button:hover i {
                transform: scale(1.1);
            }

            .button-group button:hover {
                background-color: #2c2c2c;
            }

            .button-group button.delete-btn {
                background-color: #e74c3c;
            }
            
            .button-group button.delete-btn:hover {
                background-color: #c0392b;
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
    </style>
</head>
<body>
    <!-- Background Image -->
    <div class="background-image"></div>

    <!-- Header -->
    <header>
        <h1>Chunks Finance Dashboard</h1>
        <p>Your financial overview at a glance</p>
    </header>

    <!-- Main Content -->
    <main>
        <section class="login-section">
            <h2>Login</h2>
			<!-- Update the success message section -->
			<div class="green-success-message" id="greenSuccessMessage">
				<i class="fas fa-check-circle"></i>
				<div class="message-text">
					<span>Finance created successfully!</span>
					<span>Finance created by Sujith!</span>
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
					<span>Finance created by Sujith!</span>
				</div>
				<div class="close-btn" onclick="closeRedErrorMessage()">
					<i class="fas fa-times"></i>
				</div>
			</div>				
            <form action="dashboard">
                <!-- Username -->
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" class="input-field" placeholder="Enter your username" required>
                    <div class="error-message" id="username-error">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Username is required</span>
                    </div>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" class="input-field" placeholder="Enter your password" required>
                    <div class="error-message" id="password-error">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Password is required</span>
                    </div>
                </div>

                <!-- Submit and Cancel Button -->
                <div class="button-group">
                    <button type="button" onclick="validateForm()">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </button>
                    <button type="button" style="background-color: #e74c3c;">
                        <i class="fas fa-times-circle"></i> Cancel
                    </button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        &copy; 2025 Chunks Finance | 
        <a href="#">Privacy Policy</a> | 
        <a href="#">Terms of Service</a>
    </footer>

    <script>
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
        function validateForm() {
            const username = document.getElementById("username");
            const password = document.getElementById("password");
            let isValid = true;

            // Clear previous errors
            clearError(username, 'username-error');
            clearError(password, 'password-error');

            // Validate username
            if (!username.value.trim()) {
                showError(username, 'username-error');
                isValid = false;
            }

            // Validate password
            if (!password.value.trim()) {
                showError(password, 'password-error');
                isValid = false;
            }

            if (isValid) {
                // Submit the form or handle valid data			
		        //showSuccessMessage();
				//showErrorMessage();			
                window.location.href = 'dashboard';
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

        // Add input event listeners
        document.getElementById('username').addEventListener('input', function() {
            clearError(this, 'username-error');
        });

        document.getElementById('password').addEventListener('input', function() {
            clearError(this, 'password-error');
        });
    </script>
</body>
</html>