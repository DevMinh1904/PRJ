<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <nav>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/exams">Exams</a>
            <c:if test="${user.role == 'Instructor'}">
                <a href="${pageContext.request.contextPath}/create-exam">Create Exam</a>
            </c:if>
        </div>
        <div class="user-info">
            ${user.name} (${user.role}) | 
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </nav>
</header>