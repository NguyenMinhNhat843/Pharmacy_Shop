<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create a New Password - Cusana</title>
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
        .reset-password-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .back-link {
            text-align: left;
            font-size: 14px;
            color: #666;
            text-decoration: none;
            display: block;
            margin-bottom: 20px;
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
            text-align: left;
            position: relative;
            margin-bottom: 15px;
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
            /* padding-right: 40px; Space for the eye icon */
        }
        .input-hint {
            font-size: 12px;
            color: #888;
            margin-top: 5px;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
            font-size: 18px;
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
    </style>
</head>
<body>
    <div class="reset-password-container">
        <a href="#" class="back-link">&larr; Back</a>
        <div class="title">Create a New Password</div>
        <div class="subtitle">Enter your new password below to complete the reset process. Ensure it’s strong and secure.</div>
        
        <form>
            <div class="input-group">
                <label for="new-password" style="font-weight: bold;">New Password</label>
                <input type="password" id="new-password" placeholder="Enter your password" required>
                <span class="toggle-password" onclick="togglePasswordVisibility('new-password', this)">👁️</span> <!-- Open eye icon -->
                <div class="input-hint">Must be at least 10 characters.</div>
            </div>
            <div class="input-group">
                <label for="repeat-password" style="font-weight: bold;">Repeat New Password</label>
                <input type="password" id="repeat-password" placeholder="Enter your password" required>
                <span class="toggle-password" onclick="togglePasswordVisibility('repeat-password', this)">👁️</span> <!-- Open eye icon -->
                <div class="input-hint">Must be at least 10 characters.</div>
            </div>
            <button type="submit" class="btn">Submit</button>
        </form>
    </div>

    <script>
        function togglePasswordVisibility(id, icon) {
            const passwordField = document.getElementById(id);
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.innerHTML = "🙈";  // Closed eye icon to indicate hidden
            } else {
                passwordField.type = "password";
                icon.innerHTML = "👁️";  // Open eye icon to indicate visible
            }
        }
    </script>
</body>
</html>

