<%-- 
    Document   : header
    Created on : Mar 5, 2025, 11:08:45 PM
    Author     : ducmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <style>
            .navbar {
                background-color: #2c3e50;
                padding: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            .logo {
                color: #ffffff;
                font-weight: bold;
                font-size: 24px;
            }
            nav ul {
                list-style: none;
                display: flex;
                gap: 20px;
            }
            nav ul li a {
                color: #ffffff;
                text-decoration: none;
                font-weight: bold;
            }
            nav ul li a:hover {
                color: #3498db;
            }
        </style>
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
