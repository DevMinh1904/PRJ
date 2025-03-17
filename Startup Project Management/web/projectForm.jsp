<%-- 
    Document   : projectForm
    Created on : Mar 5, 2025, 11:23:20 PM
    Author     : ducmi
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Startup Project Management</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            if (user == null || !user.getRole().equals("Founder")) {
        %>
        <div class="page-content">
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this page!</p>
                <a href="MainController?action=viewProjects" class="back-link">Back to Project List</a>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="page-content">
            <div class="form-container">
                <h1>Create New Project</h1>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="createProject"/>

                    <div class="form-group">
                        <label for="txtProjectName">Project Name:</label>
                        <input type="text" id="txtProjectName" name="txtProjectName" required/>
                    </div>

                    <div class="form-group">
                        <label for="txtDescription">Description:</label>
                        <input type="text" id="txtDescription" name="txtDescription" required/>
                    </div>

                    <div class="form-group">
                        <label for="txtStatus">Status:</label>
                        <select name="txtStatus" id="txtStatus" required>
                            <option value="Ideation">Ideation</option>
                            <option value="Development">Development</option>
                            <option value="Launch">Launch</option>
                            <option value="Scaling">Scaling</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="txtLaunchDate">Launch Date:</label>
                        <input type="date" id="txtLaunchDate" name="txtLaunchDate" required/>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Create"/>
                        <input type="reset" value="Reset"/>
                    </div>
                </form>
                <a href="MainController?action=viewProjects" class="back-link">Back to Project List</a>
            </div>
        </div>
        <% } %>
        <%@include file="footer.jsp" %>
    </body>
</html>
