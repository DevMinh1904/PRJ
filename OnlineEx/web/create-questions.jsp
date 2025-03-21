<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Questions - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Add Questions to Exam: ${exam.examTitle}</h2>
            </div>
            
            <c:if test="${param.added == 'true'}">
                <div class="success">
                    Question added successfully!
                </div>
            </c:if>
            
            <c:if test="${errorMessage != null}">
                <div class="error">
                    ${errorMessage}
                </div>
            </c:if>
            
            <div style="margin-bottom: 20px;">
                <h3>Exam Details</h3>
                <p><strong>Questions Added:</strong> ${questionCount}</p>
                <p><strong>Subject:</strong> ${exam.subject}</p>
                <p><strong>Total Marks:</strong> ${exam.totalMarks}</p>
                <p><strong>Duration:</strong> ${exam.duration} minutes</p>
            </div>
            
            <form action="add-questions" method="post">
                <input type="hidden" name="examId" value="${exam.examId}">
                
                <div class="form-group">
                    <label for="questionText">Question Text:</label>
                    <textarea class="form-control" id="questionText" name="questionText" rows="3" required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="optionA">Option A:</label>
                    <input type="text" class="form-control" id="optionA" name="optionA" required>
                </div>
                
                <div class="form-group">
                    <label for="optionB">Option B:</label>
                    <input type="text" class="form-control" id="optionB" name="optionB" required>
                </div>
                
                <div class="form-group">
                    <label for="optionC">Option C:</label>
                    <input type="text" class="form-control" id="optionC" name="optionC" required>
                </div>
                
                <div class="form-group">
                    <label for="optionD">Option D:</label>
                    <input type="text" class="form-control" id="optionD" name="optionD" required>
                </div>
                
                <div class="form-group">
                    <label>Correct Option:</label>
                    <div>
                        <label><input type="radio" name="correctOption" value="A" required> Option A</label>
                        <label style="margin-left: 10px;"><input type="radio" name="correctOption" value="B"> Option B</label>
                        <label style="margin-left: 10px;"><input type="radio" name="correctOption" value="C"> Option C</label>
                        <label style="margin-left: 10px;"><input type="radio" name="correctOption" value="D"> Option D</label>
                    </div>
                </div>
                
                <button type="submit" name="action" value="add" class="btn">Add Question</button>
                <button type="submit" name="action" value="finish" class="btn btn-primary">Finish</button>
            </form>
            
            <!-- Display existing questions -->
            <c:if test="${not empty questions}">
                <hr style="margin: 20px 0;">
                <h3>Added Questions</h3>
                <div style="margin-top: 15px;">
                    <c:forEach var="question" items="${questions}" varStatus="status">
                        <div style="border: 1px solid #ddd; padding: 10px; margin-bottom: 10px;">
                            <h4>Question ${status.index + 1}: ${question.questionText}</h4>
                            <p><strong>A:</strong> ${question.optionA} ${question.correctOption == 'A' ? '(Correct)' : ''}</p>
                            <p><strong>B:</strong> ${question.optionB} ${question.correctOption == 'B' ? '(Correct)' : ''}</p>
                            <p><strong>C:</strong> ${question.optionC} ${question.correctOption == 'C' ? '(Correct)' : ''}</p>
                            <p><strong>D:</strong> ${question.optionD} ${question.correctOption == 'D' ? '(Correct)' : ''}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>