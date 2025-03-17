<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chunks Finance Dashboard | Financial Management & Analytics</title>
    <meta name="description" content="Comprehensive financial dashboard for Chunks Finance featuring real-time analytics, expense tracking, and fund management.">
    <meta name="keywords" content="finance dashboard, financial management, expense tracking, loan management, chunks finance">
    <meta name="author" content="Chunks Finance">
    
    <!-- Open Graph Tags -->
    <meta property="og:title" content="Chunks Finance Dashboard">
    <meta property="og:description" content="Real-time financial analytics and management system">
    <meta property="og:type" content="website">
    
    <!-- Preconnect and Font Loading -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://cdnjs.cloudflare.com" crossorigin>
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
            max-width: 1400px;
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
		    .user-role h4 {
		        text-align: center; /* Center align on mobile */
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

        /* === Card Styles === */
        .card {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .card div {
            text-align: center;
            padding: 15px;
            background-color: #f4f7fa;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .card div:hover {
            background-color: #e0e7ef;
        }

        .stat-title {
            font-size: 14px;
            color: #888;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 18px;
            font-weight: 500;
            color: #2c3e50;
        }

        .stat-value.negative {
            color: #e74c3c;
        }
        
        .stat-value.positive {
            color: #40bb14;
        }

        /* === Responsive Design for Desktop === */
        @media (max-width: 768px) {
            .user-info {
                text-align: center;
            }

            .card {
                grid-template-columns: 1fr;
            }
        }
        .user-role h4 {
		    text-align: center;
		    margin: 0;
		    font-size: 14px; /* Optional: Increase font size for better hierarchy */
		    font-weight: 500; /* Optional: Match dashboard header weight */
		}
    /* Error Page Specific Styles */
    .error-container {
        display: flex;
        align-items: center;
        gap: 30px;
        padding: 40px 20px;
        text-align: center;
    }

    .error-icon {
        font-size: 5rem;
        color: #e74c3c;
        animation: pulse 1.5s infinite;
    }

    .error-content {
        flex: 1;
    }

    .error-title {
        font-size: 1.8rem;
        color: #2c3e50;
        margin-bottom: 1.5rem;
    }

    .error-details {
        background: rgba(241, 241, 241, 0.9);
        padding: 20px;
        border-radius: 8px;
        margin: 20px 0;
    }

    .error-details p {
        margin: 10px 0;
        color: #555;
    }

    .error-code {
        font-weight: 500;
        color: #e74c3c !important;
    }

    .timestamp {
        font-size: 0.9rem;
        color: #777 !important;
    }

    .return-btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 12px 25px;
        background: #2c3e50;
        color: white;
        border-radius: 25px;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .return-btn:hover {
        background: #34495e;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }

    @media (max-width: 768px) {
        .error-container {
            flex-direction: column;
        }
        
        .error-icon {
            font-size: 3.5rem;
        }
        
        .error-title {
            font-size: 1.4rem;
        }
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
            <li><a href="dashboard" class="active">Dashboard</a></li>
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
	            	<li><a href="finance">Finance</a></li>
	            	<li><a href="enrolment">Enrolment</a></li>
	            </c:when>
            </c:choose>
        </ul>
    </nav>

    <!-- Main Content -->
    <main>
	        <div class="content-wrapper">
			    <section id="Content">
			        <h2>${errorCode} Error</h2>
			        <h5>${errorMessage}</h5>
			        <div class="card">
			            <div class="error-container">
			                <div class="error-icon">
			                    <i class="fas fa-exclamation-triangle"></i>
			                </div>
			                <div class="error-content">
			                    <h3 class="error-title">Oops! Something went wrong</h3>
			                    <div class="error-details">
			                        <p>We encountered an unexpected error while processing your request.</p>
			                        <p class="error-code">Error Code: ${errorCode}</p>
			                        <p class="timestamp">Timestamp: ${timestamp}</p>
			                    </div>
			                    <div class="error-actions">
			                        <a href="/dashboard" class="return-btn">
			                            <i class="fas fa-arrow-left"></i>Dashboard
			                        </a>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </section>
			</div>
    </main>

    <!-- Footer -->
    <footer>
        &copy; 2025 Chunks Finance | <a href="#" style="color: white; text-decoration: none;">Privacy Policy</a> | <a href="#" style="color: white; text-decoration: none;">Terms of Service</a>
    </footer>
	<form action="${pageContext.request.contextPath}/perform_logout" method="post" id="financeLogout">
	   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
    <!-- Confirmation Dialog -->
    <div class="logout-confirm">
        <p>Are you sure you want to logout?</p>
        <div class="confirm-buttons">
            <button class="confirm-btn yes">Yes, Logout</button>
            <button class="confirm-btn no">Cancel</button>
        </div>
    </div>

    <!-- Script -->
    <script>
        document.getElementById('logoutTrigger').addEventListener('click', function(e) {
            e.preventDefault();
            const dialog = document.querySelector('.logout-confirm');
            dialog.style.display = 'block';
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
        
        
        
        document.querySelectorAll('.confirm-btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                if (this.classList.contains('yes')) {
                    // Logout.
                    
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