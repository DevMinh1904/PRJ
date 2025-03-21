<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Welcome, ${user.name}!</h2>
            </div>
            <div>
                <h3>Examination Dashboard</h3>
                <p>Choose one of the following options:</p>
                
                <ul>
                    <li><a href="categories">View Exam Categories</a> - View all available exam categories.</li>
                    <li><a href="exams">View Exams</a> - View all exams or filter by category.</li>
                    <c:if test="${user.role == 'Instructor'}">
                        <li><a href="create-exam">Create New Exam</a> - Create a new exam with multiple-choice questions.</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>