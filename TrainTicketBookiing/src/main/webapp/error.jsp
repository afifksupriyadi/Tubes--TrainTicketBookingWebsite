<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: red;
        }
        p {
            font-size: 18px;
            color: #555;
        }
        .back-link {
            text-decoration: none;
            padding: 10px 20px;
            color: white;
            background-color: #0C77AC;
            border-radius: 5px;
        }
        .back-link:hover {
            background-color: #005f8b;
        }
    </style>
</head>
<body>
    <h1>Error!</h1>
    <p>There was an issue processing your request.</p>
    <a href="homepage.jsp" class="back-link">Back to Homepage</a>
</body>
</html>
