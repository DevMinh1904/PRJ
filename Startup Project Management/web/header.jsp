<%-- 
    Document   : header
    Created on : Mar 5, 2025, 11:08:45 PM
    Author     : ducmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <div class="navbar">
            <div class="logo">Startup Project Management</div>
            <nav>
                <ul>
                    <% if (session.getAttribute("user") != null) { %>
                    <li><a href="MainController?action=logout">Logout</a></li>
                        <% }%>
                </ul>
            </nav>
        </div>
    </header>
</html>
