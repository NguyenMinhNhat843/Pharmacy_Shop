<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Cusana</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f5f5f5;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .logo {
            margin-bottom: 20px;
        }
        .logo img {
            width: 50px;
            height: 50px;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .subtitle {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .input-group label {
            display: block;
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }
        .options a {
            color: #666;
            text-decoration: none;
        }
        .btn {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #555;
        }
        .separator {
            display: flex;
            align-items: center;
            text-align: center;
            color: #666;
            margin: 20px 0;
        }
        .separator::before,
        .separator::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #ddd;
            margin: 0 10px;
        }
        .social-login {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .social-login button {
            flex: 1;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            background-color: #fff;
        }
        .social-login button img {
            width: 20px;
            height: 20px;
            margin-right: 8px;
            vertical-align: middle;
        }
        .register-link {
            margin-top: 20px;
            font-size: 14px;
        }
        .register-link a {
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="Logo"> <!-- Replace with actual logo path -->
        </div>
        <div class="title">Welcome Back to Cusana</div>
        <div class="subtitle">Enter your username and password to continue.</div>
        
        <form>
            <div class="input-group">
                <label for="email" style="font-weight: bold;">Email</label>
                <input type="email" id="email" placeholder="Enter your email address" required>
            </div>
            <div class="input-group">
                <label for="password" style="font-weight: bold;">Password</label>
                <input type="password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="options">
                <label><input type="checkbox"> Remember me</label>
                <a href="./ForgotPassword_1.jsp" style="font-weight: bold;">Forgot password</a>
            </div>
            <button type="submit" class="btn">Sign In</button>
        </form>
        
        <div class="separator">Or login with</div>
        
        <div class="social-login">
            <button><img src="${pageContext.request.contextPath}/image/google-icon.png" alt="Google"> Google</button> <!-- Replace with actual Google icon path -->
            <button><img src="${pageContext.request.contextPath}/image/apple-icon.png" alt="Apple"> Apple</button> <!-- Replace with actual Apple icon path -->
        </div>
        
        <div class="register-link">
            Don’t have an account? <a href="./register.jsp" style="font-weight: bold;">Register</a>
        </div>
    </div>
</body>
</html>
