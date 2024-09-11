<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="test.css">
    <title>Welcome | AsmrProg</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background.jpg');
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .glass {
            backdrop-filter: blur(4px) brightness(100%);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .greeting {
            position: absolute;
            top: 60px;
            left: 43px;
            padding: 35px 48px;
            background: rgba(255, 255, 255, 0.4);
            color: #DFFF00;
            font-size: 24px;
            font-weight: 800;
        }

        .centered {
            text-align: center;
            background: rgba(255, 255, 255, 0.4);
            color: #333;
            font-size: 1.5em;
            padding: 20px;
            max-width: 500px;
            width: 90%;
        }

        h1 {
            margin: 0;
            font-size: 2em;
            color: #333;
        }

        p {
            margin: 10px 0;
            color: #666;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div class="greeting glass">
        <% 
            String username = request.getParameter("username");
            if (username == null || username.isEmpty()) {
                out.println("Username parameter is missing.");
            } else {
                out.println("Hi, " + username + "!");
            }
        %>
    </div>

    <div class="centered glass">
        <h1>Your Project is Ready</h1>
        <p>We're glad to have you here!</p>
        <a href="login.jsp" class="button">Sign Out</a>
    </div>

</body>

</html>
