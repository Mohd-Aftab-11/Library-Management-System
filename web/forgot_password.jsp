<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Library Management System</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto+Slab:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --light-color: #f8f9fa;
            --dark-color: #2c3e50;
            --gradient-primary: linear-gradient(135deg, #2c3e50, #4a6491);
            --gradient-secondary: linear-gradient(135deg, #3498db, #2ecc71);
            --gradient-accent: linear-gradient(135deg, #e74c3c, #f39c12);
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 10px 30px rgba(0, 0, 0, 0.2);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .forgot-password-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow);
            overflow: hidden;
            max-width: 500px;
            width: 100%;
            animation: fadeInUp 0.8s ease-out;
            transition: var(--transition);
        }

        .forgot-password-card:hover {
            box-shadow: var(--shadow-hover);
            transform: translateY(-5px);
        }

        .card-header {
            background: var(--gradient-primary);
            padding: 2rem;
            text-align: center;
            position: relative;
        }

        .brand-icon {
            background: white;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: var(--secondary-color);
            font-size: 2rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: var(--transition);
        }

        .forgot-password-card:hover .brand-icon {
            transform: scale(1.05) rotate(5deg);
        }

        .card-header h3 {
            color: white;
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin: 0;
            font-size: 1.8rem;
        }

        .card-header p {
            color: rgba(255,255,255,0.9);
            margin: 0.5rem 0 0;
            font-size: 0.9rem;
        }

        .card-body {
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            display: block;
        }

        .input-group {
            position: relative;
        }

        .input-group-text {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 10px 0 0 10px;
            padding: 0.75rem 1rem;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .btn-send {
            background: var(--gradient-secondary);
            color: white;
            border: none;
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            font-size: 1rem;
            width: 100%;
            transition: var(--transition);
            cursor: pointer;
        }

        .btn-send:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
        }

        .btn-send:active {
            transform: translateY(0);
        }

        .back-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .back-link a {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link a:hover {
            color: var(--primary-color);
            transform: translateX(-5px);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Alert Styles */
        .alert {
            border-radius: 10px;
            margin-bottom: 1.5rem;
            padding: 1rem;
            display: none;
        }

        .alert.show {
            display: block;
            animation: fadeInUp 0.5s ease-out;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .card-body {
                padding: 1.5rem;
            }
            
            .card-header {
                padding: 1.5rem;
            }
            
            .brand-icon {
                width: 60px;
                height: 60px;
                font-size: 1.5rem;
            }
            
            .card-header h3 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="forgot-password-card">
        <div class="card-header">
            <div class="brand-icon">
                <i class="fas fa-key"></i>
            </div>
            <h3>Forgot Password</h3>
            <p>Enter your credentials to reset password</p>
        </div>
        <div class="card-body">
            <!-- Alert Messages (Optional - for JSP integration) -->
            <div id="errorAlert" class="alert alert-danger" role="alert" style="display: none;"></div>
            <div id="successAlert" class="alert alert-success" role="alert" style="display: none;"></div>
            
            <form action="ForgotPasswordServlet21" method="post" id="forgotPasswordForm">
                <div class="form-group">
                    <label for="username">
                        <i class="fas fa-user mr-2"></i>Username
                    </label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-user"></i>
                            </span>
                        </div>
                        <input type="text" 
                               id="username" 
                               name="username" 
                               class="form-control" 
                               placeholder="Enter your username" 
                               required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">
                        <i class="fas fa-envelope mr-2"></i>Email Address
                    </label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-envelope"></i>
                            </span>
                        </div>
                        <input type="email" 
                               id="email" 
                               name="email" 
                               class="form-control" 
                               placeholder="Enter your registered email" 
                               required>
                    </div>
                </div>
                
                <button type="submit" class="btn-send" id="submitBtn">
                    <i class="fas fa-paper-plane mr-2"></i>Send Reset Link
                </button>
            </form>
            
            <div class="back-link">
                <a href="index.html">
                    <i class="fas fa-arrow-left"></i> Back to Login
                </a>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        $(document).ready(function() {
            // Form submission with AJAX (optional)
            $('#forgotPasswordForm').on('submit', function(e) {
                e.preventDefault();
                
                var form = $(this);
                var submitBtn = $('#submitBtn');
                var originalText = submitBtn.html();
                
                // Show loading state
                submitBtn.html('<i class="fas fa-spinner fa-spin mr-2"></i>Sending...');
                submitBtn.prop('disabled', true);
                
                // Hide any previous alerts
                $('#errorAlert, #successAlert').removeClass('show').hide();
                
                // Simulate AJAX request
                setTimeout(function() {
                    $.ajax({
                        url: form.attr('action'),
                        type: 'POST',
                        data: form.serialize(),
                        success: function(response) {
                            // Handle success response from server
                            $('#successAlert')
                                .html('<i class="fas fa-check-circle mr-2"></i>Password reset link has been sent to your email!')
                                .addClass('show')
                                .show();
                            
                            // Reset form
                            form[0].reset();
                            
                            // Redirect after 3 seconds
                            setTimeout(function() {
                                window.location.href = 'index.html';
                            }, 3000);
                        },
                        error: function(xhr, status, error) {
                            // Handle error response
                            var errorMessage = 'Username or email not found. Please try again.';
                            if (xhr.responseJSON && xhr.responseJSON.message) {
                                errorMessage = xhr.responseJSON.message;
                            }
                            
                            $('#errorAlert')
                                .html('<i class="fas fa-exclamation-triangle mr-2"></i>' + errorMessage)
                                .addClass('show')
                                .show();
                        },
                        complete: function() {
                            // Reset button state
                            submitBtn.html(originalText);
                            submitBtn.prop('disabled', false);
                        }
                    });
                }, 1000);
            });
            
            // Input field focus animations
            $('.form-control').on('focus', function() {
                $(this).parent().find('.input-group-text').css('background', 'var(--gradient-secondary)');
            }).on('blur', function() {
                $(this).parent().find('.input-group-text').css('background', 'var(--gradient-primary)');
            });
            
            // Live validation
            $('#username, #email').on('input', function() {
                if ($(this).val().trim() !== '') {
                    $(this).removeClass('is-invalid').addClass('is-valid');
                } else {
                    $(this).removeClass('is-valid');
                }
            });
        });
    </script>
</body>
</html>