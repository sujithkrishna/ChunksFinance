<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Chunks Finance Dashboard - Comprehensive financial management system for tracking collections, approvals, loans, and expenses">
    <meta name="keywords" content="finance management, chunks finance, loan tracking, expense tracking, financial dashboard">
    <title>Reports | Chunks Finance</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
			margin-top: 20px;
			justify-content: center;
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
		/* Form Container Styles */
		.form-container {
			display: flex;
			flex-wrap: wrap;
			gap: 20px; /* Space between form elements */
			margin-bottom: 20px;
		}

		.form-group {
			flex: 1; /* Allow form groups to grow and take equal space */
			min-width: 200px; /* Minimum width for better responsiveness */
		}

		.form-group label {
			display: block;
			margin-bottom: 5px;
			font-size: 14px;
			color: #555;
		}

		.form-group input,
		.form-group select {
			width: 100%;
			padding: 10px;
			border: 1px solid #ddd;
			border-radius: 5px;
			font-size: 14px;
			background-color: #f9f9f9;
			transition: border-color 0.3s ease;
		}

		.form-group input:focus,
		.form-group select:focus {
			border-color: #334558;
			outline: none;
		}

		/* Responsive Design for Form */
		@media (max-width: 768px) {
			.form-container {
				flex-direction: column;
			}

			.form-group {
				width: 100%;
			}
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

    /* Report Card Styles */
    .report-card {
        background: #fff;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .report-card h3 {
        color: #2c3e50;
        margin-bottom: 25px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    /* Metric Grid */
    .metric-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
    }

    .metric-card {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        border-left: 4px solid #2c3e50;
    }

    .metric-value {
        font-size: 24px;
        font-weight: 600;
        color: #2c3e50;
        margin-bottom: 8px;
    }

    .metric-label {
        color: #666;
        font-size: 14px;
        margin-bottom: 12px;
    }

    .metric-trend {
        font-size: 12px;
        padding: 4px 8px;
        border-radius: 4px;
        display: inline-block;
    }

    .metric-trend.up {
        background: #e8f5e9;
        color: #43a047;
    }

    .metric-trend.down {
        background: #ffebee;
        color: #e53935;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .tab-nav {
            flex-direction: column;
            padding: 0;
        }

        .tab-link {
            border-bottom: 1px solid #eee;
        }

        .tab-link.active:after {
            display: none;
        }
    }
	 .chart-container {
	        position: relative;
	        height: 400px;
	        padding: 20px;
	        background: #fff;
	        border-radius: 8px;
	        margin-top: 20px;
	    }
	
	    /* Chart color scheme matching your dashboard */
	    .chart-legend {
	        display: flex;
	        gap: 15px;
	        margin-top: 20px;
	        flex-wrap: wrap;
	    }
	
	    .legend-item {
	        display: flex;
	        align-items: center;
	        gap: 8px;
	    }
	
	    .legend-color {
	        width: 20px;
	        height: 20px;
	        border-radius: 4px;
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
		/* Add this to your existing styles */
		.form-container {
		    display: flex;
		    gap: 15px;
		    align-items: flex-end; /* Align items at the bottom */
		    margin-bottom: 20px;
		}
		
		.form-group {
		    flex: 0 0 auto; /* Prevent form groups from growing */
		    margin-bottom: 0;
		}
		
		.form-group input {
		    width: 200px; /* Fixed width for date input */
		    height: 40px; /* Match button height */
		    padding: 8px 12px;
		}
		
		.button-group-view {
		    margin-top: 0;
		    flex: 0 0 auto;
		}
		
		/* Mobile responsiveness */
		@media (max-width: 768px) {
		    .form-container {
		        flex-direction: column;
		        align-items: stretch;
		    }
		    
		    .form-group input {
		        width: 100%;
		    }
		    
		    .button-group-view {
		        justify-content: flex-start;
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
            <li><a href="approvals">Approvals</a></li>
            <li><a href="finance-uploads">Finance Upload</a></li>
            <li><a href="reports" class="active">Reports</a></li>
            <li><a href="loan">Loans</a></li>
            <li><a href="revenue">Revenue</a></li>
            <li><a href="expenses">Expenses</a></li>
            <li><a href="member">Members</a></li>
            <li><a href="new-chits">Chits</a></li>
            <li><a href="finance">Create Finance</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <!-- Main Content -->
<main>
<!-- Add this inside the <section id="finance-collection"> -->
		<section id="finance-collection">
		    <h2>Reports</h2>
		    <div class="form-container">
		        <!-- Tabbed Navigation -->
		        <div class="tabbed-panel">
		            <!-- Tab Headers -->
		            <div class="tab-nav">
		                <button class="tab-link active" data-tab="financial-summary">Financial Summary</button>
		                <button class="tab-link" data-tab="loan-reports">Loan Reports</button>
		                <button class="tab-link" data-tab="revenue-analysis">Revenue Analysis</button>
		                <button class="tab-link" data-tab="expense-breakdown">Expense Breakdown</button>
		                <button class="tab-link" data-tab="submission-breakdown">My Submission</button>
		            </div>
		
		            <!-- Tab Content -->
		            <div class="tab-content">
						<!-- Update the Financial Summary Tab content -->
						<div id="financial-summary" class="tab-pane active">
						    <div class="report-card">
						        <h3><i class="fas fa-chart-line"></i> Financial Overview</h3>
						        <div class="chart-container">
						            <canvas id="financialChart"></canvas>
						        </div>
						    </div>
						</div>
		
		                <!-- Loan Reports Tab -->
		                <div id="loan-reports" class="tab-pane">
		                    <div class="report-card">
		                        <h3><i class="fas fa-hand-holding-usd"></i> Loan Portfolio</h3>
		                        <div class="loan-stats">
		                            <div class="stat-item">
		                                <div class="stat-value">15</div>
		                                <div class="stat-label">Active Loans</div>
		                            </div>
		                            <div class="stat-item">
		                                <div class="stat-value">₹ 85,000</div>
		                                <div class="stat-label">Total Disbursed</div>
		                            </div>
		                            <div class="stat-item">
		                                <div class="stat-value">₹ 23,500</div>
		                                <div class="stat-label">Pending EMI</div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		
		                <!-- Revenue Analysis Tab -->
		                <div id="revenue-analysis" class="tab-pane">
		                    <div class="report-card">
		                        <h3><i class="fas fa-money-bill-wave"></i> Revenue Sources</h3>
		                        <div class="revenue-chart">
		                            <!-- Add chart container here -->
		                            <div class="chart-placeholder">Monthly Revenue Chart</div>
		                        </div>
		                    </div>
		                </div>
		
		                <!-- Expense Breakdown Tab -->
		                <div id="expense-breakdown" class="tab-pane">
		                    <div class="report-card">
		                        <h3><i class="fas fa-file-invoice-dollar"></i> Expense Categories</h3>
		                        <div class="expense-categories">
		                            <div class="category-item">
		                                <div class="category-label">Operational</div>
		                                <div class="category-amount">₹ 45,000</div>
		                                <div class="category-progress" style="width: 60%"></div>
		                            </div>
		                            <div class="category-item">
		                                <div class="category-label">Staff</div>
		                                <div class="category-amount">₹ 32,000</div>
		                                <div class="category-progress" style="width: 45%"></div>
		                            </div>
		                            <div class="category-item">
		                                <div class="category-label">Miscellaneous</div>
		                                <div class="category-amount">₹ 15,500</div>
		                                <div class="category-progress" style="width: 25%"></div>
		                            </div>
		                        </div>
		                    </div>
		                </div>

		                <!-- Expense Breakdown Tab -->
		                <div id="submission-breakdown" class="tab-pane">
		                    <div class="report-card">
		                        <h3><i class="fas fa-file-invoice-dollar"></i> My Submissions </h3>
								<div class="form-container">
									<div class="form-group">
										<label for="approval-date">Filter Date:</label> <input type="date" id="approval-date" name="approval-date" required>
									</div>
									<div class="button-group-view">
										<button onclick="validateViewForm()" aria-label="View request">
											<i class="fas fa-eye"></i> View
										</button>
									</div>					
								</div>
							        <div class="table-container">
							            <!-- Header Row -->
							            <div class="table-row header">
							                <div class="table-cell">Name</div>
							                <div class="table-cell">Request Type</div>
							                <div class="table-cell">Amount</div>
							                <div class="table-cell">Date Submitted</div>
							                <div class="table-cell">Current Status</div>
							            </div>
							            <!-- Data Rows -->
							            <div class="table-row">
							                <div class="table-cell">Sujith</div>
							                <div class="table-cell">Bus Fare</div>
							                <div class="table-cell">₹300</div>
							                <div class="table-cell">2025-02-19</div>
							                <div class="table-cell">Approved</div>
							            </div>
							        	<div class="table-row">
							                <div class="table-cell">Jijin</div>
							                <div class="table-cell">Bata Cash</div>
							                <div class="table-cell">₹600</div>
							                <div class="table-cell">2025-02-19</div>
							                <div class="table-cell">In Progress</div>
							            </div>
							        	<div class="table-row">
							                <div class="table-cell">Jeejo</div>
							                <div class="table-cell">Bata Cash</div>
							                <div class="table-cell">₹600</div>
							                <div class="table-cell">2025-02-19</div>
							                <div class="table-cell">Approved</div>
							            </div>
							        	<div class="table-row">
							                <div class="table-cell">Saritha</div>
							                <div class="table-cell">Miscellaneous  Cash</div>
							                <div class="table-cell">₹600</div>
							                <div class="table-cell">2025-02-19</div>
							                <div class="table-cell">Rejected</div>
							            </div>
							            <div class="table-row">
							                <div class="table-cell"></div>
							                <div class="table-cell"></div>
							                <div class="table-cell"><h4>Total Collection: ₹2100</h4></div>
							            </div>
							        </div>


		                    </div>
		                </div>		                
		                
		                
		            </div>
		        </div>
		    </div>
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

 // Financial Chart Configuration
    const financialCtx = document.getElementById('financialChart').getContext('2d');

    // Calculate profit data
    const revenueData = [65000, 75000, 82000, 88000, 91000, 150000];
    const expenseData = [25000, 20000, 20000, 21000, 20000, 23000];
    const profitData = revenueData.map((rev, idx) => rev - expenseData[idx]);

    // Create color array for profit line
    const profitColors = profitData.map(profit => 
        profit >= 0 ? '#43a047' : '#e53935'
    );

    // Gradient setups
    const revenueGradient = financialCtx.createLinearGradient(0, 0, 0, 400);
    revenueGradient.addColorStop(0, 'rgba(147, 208, 131, 0.8)');
    revenueGradient.addColorStop(1, 'rgba(187, 242, 172, 0.2)');

    const expenseGradient = financialCtx.createLinearGradient(0, 0, 0, 400);
    expenseGradient.addColorStop(0, 'rgba(213, 134, 134, 0.8)');
    expenseGradient.addColorStop(1, 'rgba(247, 156, 156, 0.2)');

    new Chart(financialCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [
                {
                    label: 'Total Chunks Revenue',
                    data: revenueData,
                    borderColor: '#93d083',
                    backgroundColor: revenueGradient,
                    fill: true,
                    tension: 0.3,
                    borderWidth: 2
                },
                {
                    label: 'Total Chunks Expenses',
                    data: expenseData,
                    borderColor: '#d58686',
                    backgroundColor: expenseGradient,
                    fill: true,
                    tension: 0.3,
                    borderWidth: 2
                },
                {
                    label: 'Profit',
                    data: profitData,
                    borderColor: profitColors,
                    backgroundColor: 'transparent',
                    borderWidth: 3,
                    tension: 0.3,
                    pointBackgroundColor: profitColors,
                    pointBorderColor: '#fff',
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    borderDash: [5, 5] // Dashed line for better differentiation
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        color: '#2c3e50',
                        font: { size: 14 }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(44, 62, 80, 0.95)',
                    titleColor: '#fff',
                    bodyColor: '#fff',
                    callbacks: {
                        label: function(context) {
                            let label = context.dataset.label || '';
                            if (label) label += ': ';
                            if (context.parsed.y !== null) {
                                label += new Intl.NumberFormat('en-IN', {
                                    style: 'currency',
                                    currency: 'INR'
                                }).format(context.parsed.y);
                                
                                // Add +/- indicator for profit
                                if (context.dataset.label === 'Profit') {
                                    label += context.parsed.y >= 0 ? ' ▲' : ' ▼';
                                }
                            }
                            return label;
                        }
                    }
                }
            },
            scales: {
                x: {
                    grid: { color: '#f0f0f0' },
                    ticks: { color: '#666' }
                },
                y: {
                    grid: { color: '#f0f0f0' },
                    ticks: {
                        color: '#666',
                        callback: function(value) {
                            return '₹' + value.toLocaleString();
                        }
                    }
                }
            }
        }
    });
    
    
    
    
    
    
    
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
		   	
		   	  const dateInput = document.getElementById('financeStatusdate');
		         const today = new Date();
		         dateInput.value = today.toISOString().split('T')[0];
			
		   	
			        <c:if test="${not empty success}">
			            showSuccessMessage();
			        </c:if>	  
			        <c:if test="${not empty error}">
			       		 showErrorMessage();
			   		 </c:if>	             
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