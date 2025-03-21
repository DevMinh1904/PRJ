<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Exam - Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        // Simple timer function
        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            var interval = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    clearInterval(interval);
                    alert("Time's up! Your exam will be submitted automatically.");
                    document.getElementById("examForm").submit();
                }
            }, 1000);
        }
        
        window.onload = function () {
            var examDuration = ${exam.duration} * 60;
            var display = document.querySelector('#time');
            startTimer(examDuration, display);
        };
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Exam: ${exam.examTitle}</h2>
                <div style="background: #f2f2f2; padding: 10px; margin-top: 10px;">
                    <p><strong>Subject:</strong> ${exam.subject}</p>
                    <p><strong>Total Marks:</strong> ${exam.totalMarks}</p>
                    <p><strong>Time Remaining:</strong> <span id="time">${exam.duration}:00</span></p>
                </div>
            </div>
            
            <c:if test="${errorMessage != null}">
                <div class="error">
                    ${errorMessage}
                </div>
            </c:if>
            
            <form action="take-exam" method="post" id="examForm">
                <input type="hidden" name="examId" value="${exam.examId}">
                
                <c:if test="${empty questions}">
                    <p>No questions found for this exam.</p>
                </c:if>
                
                <c:if test="${not empty questions}">
                    <c:forEach var="question" items="${questions}" varStatus="status">
                        <div style="border: 1px solid #ddd; padding: 15px; margin-bottom: 15px;">
                            <h3>Question ${status.index + 1}: ${question.questionText}</h3>
                            
                            <div class="form-group">
                                <div>
                                    <label>
                                        <input type="radio" name="answer_${question.questionId}" value="A" required>
                                        A: ${question.optionA}
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input type="radio" name="answer_${question.questionId}" value="B">
                                        B: ${question.optionB}
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input type="radio" name="answer_${question.questionId}" value="C">
                                        C: ${question.optionC}
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input type="radio" name="answer_${question.questionId}" value="D">
                                        D: ${question.optionD}
                                    </label>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <div style="margin-top: 20px;">
                        <button type="submit" class="btn">Submit Exam</button>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>