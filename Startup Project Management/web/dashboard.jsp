<%-- 
    Document   : dashboard
    Created on : Mar 5, 2025, 11:06:17 PM
    Author     : ducmi
--%>

<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
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
        <div class="dashboard-container">
            <h2>Welcome, <%= ((UserDTO) session.getAttribute("user")).getName()%></h2>

            <% if (((UserDTO) session.getAttribute("user")).getRole().equals("Founder")) { %>
            <form action="MainController" method="get">
                <a href="projectForm.jsp">
                    Add Project
                </a>
            </form>
            <% } %>

            <form action="MainController" method="get">
                <input type="hidden" name="action" value="searchProjects">
                <input type="text" name="txtSearchTerm" placeholder="Search Project Name">
                <button type="submit">Search</button>
            </form>

            <% if (request.getAttribute("message") != null) {%>
            <div class="success"><%= request.getAttribute("message")%></div>
            <% } %>

            <table border="1">
                <tr>
                    <th>Project Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Estimated Launch</th>
                        <% if (((UserDTO) session.getAttribute("user")).getRole().equals("Founder")) { %>
                    <th>Update Status</th>
                        <% } %>
                </tr>
                <% List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("projects");
                    if (projects != null) {
                        for (ProjectDTO project : projects) {%>
                <tr>
                    <td><%= project.getProject_name()%></td>
                    <td><%= project.getDescription()%></td>
                    <td><%= project.getStatus()%></td>
                    <td><%= project.getEstimated_launch()%></td>
                    <% if (((UserDTO) session.getAttribute("user")).getRole().equals("Founder")) {%>
                    <td>
                        <form action="MainController" method="post">
                            <input type="hidden" name="action" value="updateProjectStatus">
                            <input type="hidden" name="txtProjectId" value="<%= project.getProject_id()%>">
                            <select name="txtStatus">
                                <option value="Ideation">Ideation</option>
                                <option value="Development">Development</option>
                                <option value="Launch">Launch</option>
                                <option value="Scaling">Scaling</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                    </td>
                    <% } %>
                </tr>
                <% }
                    }%>
            </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
