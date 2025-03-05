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
