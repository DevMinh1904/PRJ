<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exams - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Exams</h2>
                <c:if test="${user.role == 'Instructor'}">
                    <a href="create-exam" class="btn">Create Exam</a>
                </c:if>
            </div>
            
            <div style="margin-bottom: 20px;">
                <form action="exams" method="get">
                    <label for="categoryId">Filter by Category:</label>
                    <select name="categoryId" id="categoryId" style="padding:5px; margin-right:10px;">
                        <option value="">All Categories</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.categoryId}" ${selectedCategoryId == category.categoryId ? 'selected' : ''}>
                                ${category.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                    <button type="submit" class="btn">Filter</button>
                </form>
            </div>
            
            <c:if test="${empty exams}">
                <p>No exams found.</p>
            </c:if>
            
            <c:if test="${not empty exams}">
                <table>
                    <thead>
                        <tr>
                            <th>Exam Title</th>
                            <th>Subject</th>
                            <th>Category</th>
                            <th>Total Marks</th>
                            <th>Duration (mins)</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="exam" items="${exams}">
                            <tr>
                                <td>${exam.examTitle}</td>
                                <td>${exam.subject}</td>
                                <td>${exam.categoryName}</td>
                                <td>${exam.totalMarks}</td>
                                <td>${exam.duration}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.role == 'Instructor'}">
                                            <a href="add-questions?examId=${exam.examId}" class="btn">Manage Questions</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="take-exam?examId=${exam.examId}" class="btn">Take Exam</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>