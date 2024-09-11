<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="test.css">
    <title>Modern Login Page | AsmrProg</title>
    <style>
        /* Add styles for the error message */
        .error-message {
            display: none; /* Hidden by default */
            color:  #800020;
            font-weight:800;
            font-size: 20px;
            margin-top: 10px;
            text-align: center;
            animation: shake 0.5s; /* Add shaking animation */
        }
        /* Success message styling */
        .success-message {
            display: none; /* Hidden by default */
            color: #28a745;
            font-weight: 800;
            font-size: 20px;
            margin-top: 10px;
            text-align: center;
        }

        @keyframes shake {
            0% { transform: translateX(-10px); }
            25% { transform: translateX(10px); }
            50% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
            100% { transform: translateX(0); }
        }
    </style>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
           <form action="RegisterServlet" method="post">
                <h1>Create Account</h1>
                
                <span>or use your email for registration</span>
                <input type="text" placeholder="username" name="txtName" required>
                <input type="email" placeholder="Email" name="txtEmail" required>
                <input type="password" placeholder="Password" name="txtPwd" required>
                <button type="submit">Sign Up</button>
            </form>
        </div>
        
        
        <div class="form-container sign-in">
            <form action="LoginServlet" method="post">
                <h1>Sign In</h1>
                
                <span>or use your username and password</span>
                <input type="text" placeholder="username" name="txtName" required>
                <input type="password" placeholder="Password" name="txtPwd" required>
                <a href="#">Forget Your Password?</a>
                <button type="submit">Sign In</button>
                <!-- Error message div -->
                <div class="error-message" id="error-message">
                    Invalid username or password !! . Please try again or Signup .
                </div>
                <!-- Success message div -->
                <div class="success-message" id="success-message">
                    Successfully registered! You can now sign in.
                </div>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Welcome Back!</h1>
                    <p>Enter your personal details to use all of site features</p>
                    <button class="hidden" id="login">Sign In</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Hello, Friend!</h1>
                    <p>Register with your personal details to use all of site features</p>
                    <button class="hidden" id="register">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('register');
    const loginBtn = document.getElementById('login');
    const errorMessage = document.getElementById('error-message');
    const successMessage = document.getElementById('success-message');

    if (registerBtn && loginBtn) {
        registerBtn.addEventListener('click', () => {
            container.classList.add("active");
        });

        loginBtn.addEventListener('click', () => {
            container.classList.remove("active");
        });
    }

    // Show the error or success message based on the query parameters
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('error')) {
        errorMessage.style.display = 'block';
    }
    if (urlParams.has('success')) {
        successMessage.style.display = 'block';
    }
    </script>

</body>

</html>
