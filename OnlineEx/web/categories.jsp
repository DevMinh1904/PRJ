<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Categories - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Exam Categories</h2>
                <c:if test="${user.role == 'Instructor'}">
                    <a href="#" onclick="document.getElementById('addCategoryForm').style.display='block'" class="btn">Add Category</a>
                </c:if>
            </div>
            
            <c:if test="${errorMessage != null}">
                <div class="error">
                    ${errorMessage}
                </div>
            </c:if>
            
            <c:if test="${empty categories}">
                <p>No exam categories found.</p>
            </c:if>
            
            <c:if test="${not empty categories}">
                <table>
                    <thead>
                        <tr>
                            <th>Category Name</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td>${category.categoryName}</td>
                                <td>${category.description}</td>
                                <td>
                                    <a href="exams?categoryId=${category.categoryId}" class="btn">View Exams</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            
            <!-- Add Category Form -->
            <c:if test="${user.role == 'Instructor'}">
                <div id="addCategoryForm" style="display:none; margin-top:20px; border-top:1px solid #ddd; padding-top:20px;">
                    <h3>Add New Category</h3>
                    <form action="categories" method="post">
                        <div class="form-group">
                            <label for="categoryName">Category Name:</label>
                            <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn">Add Category</button>
                        <button type="button" class="btn btn-secondary" onclick="document.getElementById('addCategoryForm').style.display='none'">Cancel</button>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>