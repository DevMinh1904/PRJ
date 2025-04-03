<%-- 
    Document   : login
    Created on : Mar 11, 2022, 9:02:11 PM
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->

        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            userID <input type="text" name="txtUserID"/><br/>
            password <input type="password" name="txtPassword"/><br/>            
            <input type="submit" value="Login"/>
        </form>
    </body>
    
</html>

