<%-- 
    Document   : dashboard
    Created on : Mar 17, 2025, 10:24:33 AM
    Author     : ducmi
--%>

<%@page import="dto.ExamDTO"%>
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
            <h2>Welcome, <%= ((UserDTO) session.getAttribute("user")).getUsername()%></h2>

            <% if (((UserDTO) session.getAttribute("user")).getRole().equals("Instructor")) { %>
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
                <% List<ExamDTO> exams = (List<ExamDTO>) request.getAttribute("projects");
                    if (exams != null) {
                        for (ExamDTO exam : exams) {%>
                <tr>
                    <td><%= exam.getExam_title()%></td>
                    <td><%= exam.getSubject()%></td>
                    <td><%= exam.getCategory_id()%></td>
                    <td><%= exam.getTotal_marks()%></td>
                    <td><%= exam.getDuration()%></td>
                    <% if (((UserDTO) session.getAttribute("user")).getRole().equals("Founder")) {%>
                    <td>
                        <form action="MainController" method="post">
                            <input type="hidden" name="action" value="updateProjectStatus">
                            <input type="hidden" name="txtProjectId" value="<%= exam.getExam_id()%>">
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
