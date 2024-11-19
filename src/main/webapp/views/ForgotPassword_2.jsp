<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Your Email - Cusana</title>
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
        .check-email-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .icon {
            margin-bottom: 20px;
        }
        .icon img {
            width: 60px;
            height: 60px;
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
        .btn {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #555;
        }
        .resend-link {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
        .resend-link a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="check-email-container">
        <div class="icon">
            <img src="${pageContext.request.contextPath}/image/email-icon.png" alt="Email Icon"> <!-- Replace with actual email icon path -->
        </div>
        <div class="title">Check your email</div>
        <div class="subtitle">We sent a password reset link to your email. Please check your inbox.</div>
        
        <button class="btn">Open Gmail</button>
        
        <div class="resend-link">
            Didn’t receive the email? <a href="#">Resend</a>
        </div>
    </div>
</body>
</html>

