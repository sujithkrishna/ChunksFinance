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


		 .form-container {
		        flex-direction: column;
		        align-items: stretch;
		        padding: 15px;
		    }
		    
		        .radio-group {
			        flex-direction: column;
			    }
		    
		    .form-group input {
		        width: 100%;
		        padding: 20px;
		    }
		    
		    .button-group-view {
		        justify-content: flex-start;
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
		
		/* Form Container */
		.form-container {
		   	display: flex;
		    flex-direction: column; /* Stack children vertically */
		    gap: 0px; /* Increase spacing between form groups */
		    margin-bottom: 20px;
		    background: rgba(255, 255, 255, 0.95);
		    border-radius: 12px;
		    padding: 25px;
		    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05);		    
		}
		
		/* Form Group */
		.form-group {
		     display: flex;
		    flex-direction: column; /* Stack label and radio group vertically */
		    gap: 0px;
		    width: 100%; /* Take full width */
		    position: relative;
		    padding: 5px;
		    border: 1px solid rgba(163, 163, 163, 0.15);
		    border-radius: 10px;
		    margin-bottom: 25px;
		    background: rgba(249, 249, 249, 0.9);
		    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.02);		    
		}
		
		
		.form-group:hover {
		    border-color: rgba(163, 163, 163, 0.3);
		    box-shadow: 0 6px 20px -4px rgba(0, 0, 0, 0.08);
		    transform: translateY(-2px);
		}
		
		
		
		.form-group label {
		        min-width: auto; /* Remove fixed width */
   				 margin-bottom: 0;
			    font-weight: 500;
			    color: #334558;
			    font-size: 15px;
			    margin-bottom: 15px;
			    display: block;
			    position: relative;
			    padding-left: 28px;   				 
		}
		
		
		.form-group label:before {
		    position: absolute;
		    left: 0;
		    top: -2px;
		    font-size: 18px;
		    opacity: 0.8;
		}
		
		
		/* Radio Group */
		.radio-group {
		       display: flex;
			    gap: 0px;
				padding: 0px;
			    border-radius: 8px;
			    margin-left: 24px;
			    margin-top: -24px;
			    border: 1px solid rgba(163, 163, 163, 0.1);			    
		}
		
		.radio-option {
		    display: flex;
		    align-items: center;
		    gap: 8px;
		    cursor: pointer;
		    position: relative;
		    padding-left: 28px; /* Adjust checkmark position */
		    padding: 12px 15px;
		    border-radius: 6px;
		    transition: all 0.2s ease;		    
		}
		
		.radio-option:hover {
		    background: rgba(240, 242, 245, 0.5);
		}
				
		
		.radio-checkmark {
		    position: absolute;
		    left: 0;
		    height: 18px;
		    width: 18px;
		    background-color: #f9f9f9;
		    border: 2px solid #ccc;
		    border-radius: 50%;
		    transition: all 0.3s ease;
		}
		
		.radio-option input:checked ~ .radio-checkmark {
		    border-color: #2c3e50;
		    background-color: #2c3e50;
		    box-shadow: inset 0 0 0 3px white;
		}
		
		.radio-option input {
		    position: absolute;
		    opacity: 0;
		    cursor: pointer;
		}
		
		/* Add to existing CSS */
			.day-time-group {
			    display: flex;
			    gap: 15px;
			    align-items: center;
			    width: 36%;
			}
			
			#approval-cutoff {
			    flex: 2;
			}
			
			#approval-time {
			    flex: 1;
			    width: auto; /* Override previous input-field width */
			}
		
		
		
		/* Input Field */
		.input-field {
		    width: 100%; /* Change from 23% to 100% */
		    padding: 10px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    font-size: 14px;
		    background-color: #f9f9f9;
		    transition: border-color 0.3s ease;
		}
		
		.input-field:focus {
		    border-color: #334558;
		    outline: none;
		}
		
		/* Error Message */
		.error-message {
		    color: #e74c3c;
		    font-size: 0.8rem;
		    margin-top: 0.25rem;
		    display: none;
		    opacity: 0;
		    transform: translateY(-5px);
		    transition: all 0.3s ease;
		}
		
		.error-message.show {
		    display: flex;
		    opacity: 1;
		    transform: translateY(0);
		}
		
		/* Button Group */
		.button-group-view {
		    border-top: 1px solid rgba(163, 163, 163, 0.1);
		    padding-top: 25px;
		    margin-top: 25px !important;
   			 justify-content: flex-end; /* Keep button on the right */
		}
		
		.button-group-view button {
		    background-color: #3D3D3D;
		    color: white;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    height: 40px;
		    background: linear-gradient(135deg, #3D3D3D, #2c2c2c);
		    border: none;
		    padding: 12px 30px;
		    border-radius: 8px;
		    font-weight: 500;
		    transition: all 0.3s ease;		    
		}
		
		.button-group-view button:hover {
		    background-color: #2c2c2c;
 			transform: translateY(-2px);
    		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);		    
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
            <li><a href="revenue">Revenue</a></li>
            <li><a href="expenses">Expenses</a></li>
             <c:choose>
	            <c:when test="${currentUser.role == 'SUPER_ADMIN'}">
		            <li><a href="member">Members</a></li>
		            <li><a href="chits">Chits</a></li>	            
	            	<li><a href="finance">Finance</a></li>
	            </c:when>
            </c:choose>
        </ul>
    </nav>
	
    <!-- Main Content -->
    <main>
        <div class="content-wrapper">
            <section id="Content">
            <h2>Settings</h2>
			 <form method="post"  action="settings" id="formsettings" name="formsettings">
				 <div class="form-container">
				        <div class="form-group">
				            <label>Current Approval process :</label>
				            <div class="radio-group">
				                <label class="radio-option">
				                    <input id="approvalProcessSequential" type="radio" name="approvalProcess" value="approvalProcessSequential">
				                    <span class="radio-checkmark"></span>
				                    Sequential approval
				                </label>
				                <label class="radio-option">
				                    <input id="approvalProcessParallel" type="radio" name="approvalProcess" value="approvalProcessParallel">
				                    <span class="radio-checkmark"></span>
				                   Parallel processing
				                </label>
				            </div>
				        </div>
	
	 					 <div class="form-group">
						    <label>Do you want to allow Secondary users to Login :</label>
						    <div class="radio-group">
						        <label class="radio-option">
						            <input id="loginStatusYes" type="radio" name="secondaryLogin" value="loginStatusYes">
						            <span class="radio-checkmark"></span>
						            Yes  
						        </label>
						        <label class="radio-option">
						            <input id="loginStatusNo" type="radio" name="secondaryLogin" value="loginStatusNo">
						            <span class="radio-checkmark"></span>
						            No
						        </label>
						    </div>
						</div>
						
						 <div class="form-group">
						    <label>Expenses approval time process disabled time line :</label>
						    <div class="radio-group">
						        <label class="radio-option">
						            <input id="expensesStatusYes" type="radio" name="expensesStatus" value="expensesStatusYes">
						            <span class="radio-checkmark"></span>
						            Yes  
						        </label>
						        <label class="radio-option">
						            <input id="expensesStatusNo" type="radio" name="expensesStatus" value="expensesStatusNo">
						            <span class="radio-checkmark"></span>
						            No ( Default Monday to Coming Sunday )
						        </label>
						    </div>
						</div>
						
						 <div class="form-group">
						    <label>Revenue approval time process disabled time line :</label>
						    <div class="radio-group">
						        <label class="radio-option">
						            <input id="revenueStatusYes" type="radio" name="revenueStatus" value="revenueStatusYes">
						            <span class="radio-checkmark"></span>
						            Yes  
						        </label>
						        <label class="radio-option">
						            <input id="revenueStatusNo" type="radio" name="revenueStatus" value="revenueStatusNo">
						            <span class="radio-checkmark"></span>
						            No ( Default Monday to Coming Sunday )
						        </label>
						    </div>
						</div>
						
						
						
					   <div class="form-group">
						    <label> Loan repayment approval Cut off Time:</label>
						    <div class="day-time-group">
						        <select id="approval-cutoff" name="approvalcutoff" class="input-field" required>
						            <option value="" disabled selected>Select day</option>
						            <c:set var="days" value="Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday" />
						            <c:forEach items="${fn:split(days, ',')}" var="day">
						                <option value="${day}" 
						                 ${day == approvalCutOffDayValue ? 'selected' : ''}>
										  ${day}
										</option>
						            </c:forEach>
						        </select>
						        <input type="time" id="approval-time" name="approvaltime" class="input-field" required value="16:00">
						    </div>
						    <div class="error-message" id="approvalcutoff-error">
						        <i class="fas fa-exclamation-circle"></i>
						        <span>Both day and time are required</span>
						    </div>
						</div>
				        <div class="button-group-view">
				              <button type="button" onclick="saveSettings()">
				                <i class="fas fa-save"></i> Save
				            </button>
				        </div>													
				   </div>
				   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>			
				</form>   
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
	    document.addEventListener("DOMContentLoaded", function () {
	    	 // Get values from server-side with proper escaping
	 	let approvalProcess = 'approvalProcessSequential';
	    let secondaryLogin = 'loginStatusNo';
	    
	    let expensesStatus = 'expensesStatusYes';
	    let revenueStatus = 'revenueStatusYes';
	    
	    
	    let approvalCutOffDay = 'Sunday';
	    let approvalCutOffTime = '16:00';
	
	    // Process settings from server
	    <c:forEach items="${allSettings}" var="setting">
	        <c:choose>
	            <c:when test="${setting.settingsName == 'approvalProcess'}">
	                approvalProcess = '<c:out value="${setting.settingsValue}"/>';
	            </c:when>
	            <c:when test="${setting.settingsName == 'secondaryLogin'}">
	                secondaryLogin = '<c:out value="${setting.settingsValue}"/>';
	            </c:when>
	            <c:when test="${setting.settingsName == 'approvalCutOffDay'}">
	                approvalCutOffDay = '<c:out value="${setting.settingsValue}"/>';
	            </c:when>
	            <c:when test="${setting.settingsName == 'approvalCutOffTime'}">
	                approvalCutOffTime = '<c:out value="${setting.settingsValue}"/>';
	            </c:when>
	            
	            <c:when test="${setting.settingsName == 'expensesStatus'}">
	            expensesStatus = '<c:out value="${setting.settingsValue}"/>';
            	</c:when>
            
	            <c:when test="${setting.settingsName == 'revenueStatus'}">
	            	revenueStatus = '<c:out value="${setting.settingsValue}"/>';
	       	 	</c:when>
		            
	            
	        </c:choose>
	    </c:forEach>


        // Set approval process radio button
        if (approvalProcess === 'approvalProcessSequential') {
            document.getElementById('approvalProcessSequential').checked = true;
        } else if (approvalProcess === 'approvalProcessParallel') {
            document.getElementById('approvalProcessParallel').checked = true;
        }

        // Set secondary login radio button
        if (secondaryLogin === 'loginStatusYes') {
            document.getElementById('loginStatusYes').checked = true;
        } else if (secondaryLogin === 'loginStatusNo') {
            document.getElementById('loginStatusNo').checked = true;
        }

        // Set secondary login radio button
        if (expensesStatus === 'expensesStatusYes') {
            document.getElementById('expensesStatusYes').checked = true;
        } else if (expensesStatus === 'expensesStatusNo') {
            document.getElementById('expensesStatusNo').checked = true;
        }
        
        // Set secondary login radio button
        if (revenueStatus === 'revenueStatusYes') {
            document.getElementById('revenueStatusYes').checked = true;
        } else if (revenueStatus === 'revenueStatusNo') {
            document.getElementById('revenueStatusNo').checked = true;
        }
        
        
        
        // Set cutoff day and time
        const daySelect = document.getElementById('approval-cutoff');
        if (approvalCutOffDay) {
            daySelect.value = approvalCutOffDay;
        }
        const timeInput = document.getElementById('approval-time');
        timeInput.value = approvalCutOffTime || '16:00'; // Fallback to 16:00
        
        
        
    });

    
    function saveSettings(){
		 const form = document.getElementById('formsettings');
		    form.method = 'POST';
		    form.action = 'settings'; // Your endpoint URL
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