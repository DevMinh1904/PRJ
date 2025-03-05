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
    <body>
        <div class="login-container">
            <div class="login-form">
                <h2 class="form-title">Login</h2>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="login" />

                    <div class="form-group">
                        <label for="userId">Username</label>
                        <input type="text" id="username" name="txtUsername" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="txtPassword" required />
                    </div>

                    <button type="submit" class="submit-btn">Login</button>
                </form>
                
                <%
                    String message = request.getAttribute("message")+"";
                %>
                <%=message.equals("null")?"":message%>
            </div>
        </div>
    </body>
</html>
