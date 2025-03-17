<%-- 
    Document   : login
    Created on : Mar 5, 2025, 6:04:01 PM
    Author     : ducmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Startup Project Management</title>
        <style>
            .login-container {
                width: 400px;
                margin: 100px auto;
                padding: 40px;
                border-radius: 10px;
                background: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                text-align: center;
            }
            h2 {
                color: #2c3e50;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }
            input[type="text"], input[type="password"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                background-color: #3498db;
                color: #ffffff;
                border: none;
                padding: 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #2980b9;
            }
            .error {
                color: #e74c3c;
                margin-top: 10px;
            }
        </style>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login">
                <label>Username:</label>
                <input type="text" name="txtUserID" required>
                <label>Password:</label>
                <input type="password" name="txtPassword" required>
                <button type="submit">Sign in</button>
            </form>
            <% if (request.getAttribute("message") != null) {%>
            <div class="error"><%= request.getAttribute("message")%></div>
            <% }%>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
