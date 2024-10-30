<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Success</title>
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
        .success-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .success-icon {
            margin-bottom: 20px;
        }
        .success-icon img {
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
            line-height: 1.6;
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
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            <img src="${pageContext.request.contextPath}/image/check-icon.png" alt="Success Icon"> <!-- Replace with actual path to the check icon -->
        </div>
        <div class="title">Your password has been successfully reset!</div>
        <div class="subtitle">You can now log in with your new password. If you encounter any issues, please contact support.</div>
        <button class="btn">Back to Login</button>
    </div>
</body>
</html>

