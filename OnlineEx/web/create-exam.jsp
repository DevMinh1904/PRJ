<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Exam - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Create New Exam</h2>
            </div>
            
            <c:if test="${errorMessage != null}">
                <div class="error">
                    ${errorMessage}
                </div>
            </c:if>
            
            <form action="create-exam" method="post">
                <div class="form-group">
                    <label for="examTitle">Exam Title:</label>
                    <input type="text" class="form-control" id="examTitle" name="examTitle" required>
                </div>
                
                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <input type="text" class="form-control" id="subject" name="subject" required>
                </div>
                
                <div class="form-group">
                    <label for="categoryId">Category:</label>
                    <select class="form-control" id="categoryId" name="categoryId" required>
                        <option value="" selected disabled>Select Category</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.categoryId}">
                                ${category.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="totalMarks">Total Marks:</label>
                    <input type="number" class="form-control" id="totalMarks" name="totalMarks" min="1" required>
                </div>
                
                <div class="form-group">
                    <label for="duration">Duration (minutes):</label>
                    <input type="number" class="form-control" id="duration" name="duration" min="1" required>
                </div>
                
                <button type="submit" class="btn">Create Exam & Continue to Add Questions</button>
                <a href="exams" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>