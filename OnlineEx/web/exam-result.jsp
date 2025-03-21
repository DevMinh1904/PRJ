<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Result - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .result-header {
            background-color: #f2f2f2;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }
        .score {
            font-size: 24px;
            font-weight: bold;
            color: #3a5795;
        }
        .percentage {
            font-size: 18px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Exam Result</h2>
            </div>
            
            <div class="result-header">
                <h3>${result.examTitle}</h3>
                <p><strong>Date Taken:</strong> <fmt:formatDate value="${result.dateTaken}" pattern="dd-MM-yyyy HH:mm" /></p>
                <p>
                    <span class="score">Score: ${result.score}/${result.totalMarks}</span>
                    <span class="percentage">(<fmt:formatNumber value="${result.getPercentage()}" maxFractionDigits="1"/>%)</span>
                </p>
            </div>
            
            <div>
                <c:choose>
                    <c:when test="${result.getPercentage() >= 80}">
                        <p style="color: green; font-weight: bold;">Excellent job! You have performed very well on this exam.</p>
                    </c:when>
                    <c:when test="${result.getPercentage() >= 60}">
                        <p style="color: blue; font-weight: bold;">Good job! You have passed the exam with a good score.</p>
                    </c:when>
                    <c:when test="${result.getPercentage() >= 40}">
                        <p style="color: orange; font-weight: bold;">You have passed the exam, but there is room for improvement.</p>
                    </c:when>
                    <c:otherwise>
                        <p style="color: red; font-weight: bold;">You need to improve. Please review the subject material and try again.</p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div style="margin-top: 20px;">
                <a href="exams" class="btn">Back to Exams</a>
                <a href="dashboard" class="btn btn-secondary">Go to Dashboard</a>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>