<%-- 
    Document   : example04
    Created on : Feb 10, 2025, 1:36:54 PM
    Author     : ducmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- In ra bảng cửu chương -->
        <%
            for(int i = 1; i <= 10; i++){
                for(int j = 1; j <= 10; j++){
                    %><%=i%> * <%=j%> = <%=i*j%> <br/>
                    <%
                }%><hr><%
            }
        %>
    </body>
</html>
