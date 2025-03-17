/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamCategoryDAO;
import dao.ExamDAO;
import dao.QuestionDAO;
import dao.UserDAO;
import dto.ExamCategoryDTO;
import dto.ExamDTO;
import dto.QuestionDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ducmi
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String DASHBOARD_PAGE = "dashboard.jsp";
    private static final String ERROR_PAGE = "error.jsp";
    private static final String EXAM_CATEGORIES_PAGE = "examCategories.jsp";
    private static final String EXAMS_PAGE = "exams.jsp";
    private static final String CREATE_EXAM_PAGE = "createExam.jsp";
    private static final String ADD_QUESTIONS_PAGE = "addQuestions.jsp";
    private static final String TAKE_EXAM_PAGE = "takeExam.jsp";
    private static final String EXAM_RESULTS_PAGE = "examResults.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        String url = LOGIN_PAGE;
        
        try {
            if (action == null || action.isEmpty()) {
                url = LOGIN_PAGE;
            } else {
                switch (action) {
                    case "login":
                        url = login(request);
                        break;
                    case "logout":
                        url = logout(request);
                        break;
                    case "viewExamCategories":
                        url = viewExamCategories(request);
                        break;
                    case "viewExamsByCategory":
                        url = viewExamsByCategory(request);
                        break;
                    case "showCreateExamForm":
                        url = showCreateExamForm(request);
                        break;
                    case "createExam":
                        url = createExam(request);
                        break;
                    case "showAddQuestionsForm":
                        url = showAddQuestionsForm(request);
                        break;
                    case "addQuestion":
                        url = addQuestion(request);
                        break;
                    case "showTakeExam":
                        url = showTakeExam(request);
                        break;
                    case "submitExam":
                        url = submitExam(request);
                        break;
                    default:
                        request.setAttribute("ERROR", "Action not supported: " + action);
                        url = ERROR_PAGE;
                        break;
                }
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", "Error processing request: " + e.getMessage());
            url = ERROR_PAGE;
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }
    
    private String login(HttpServletRequest request) {
        String username = request.getParameter("txtusername");
        String password = request.getParameter("txtpassword");
        
        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.checkLogin(username, password);
        
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("USER", user);
            session.setAttribute("USERNAME", user.getUsername());
            session.setAttribute("NAME", user.getName());
            session.setAttribute("ROLE", user.getRole());
            
            return DASHBOARD_PAGE;
        } else {
            request.setAttribute("ERROR", "Invalid username or password");
            return LOGIN_PAGE;
        }
    }
    
    private String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return LOGIN_PAGE;
    }
    
    private String viewExamCategories(HttpServletRequest request) {
        ExamCategoryDAO categoryDAO = new ExamCategoryDAO();
        List<ExamCategoryDTO> categories = categoryDAO.readAll();
        
        request.setAttribute("CATEGORIES", categories);
        return EXAM_CATEGORIES_PAGE;
    }
    
    private String viewExamsByCategory(HttpServletRequest request) {
        String categoryId = request.getParameter("categoryId");
        
        ExamDAO examDAO = new ExamDAO();
        List<ExamDTO> exams;
        
        if (categoryId != null && !categoryId.isEmpty()) {
            exams = examDAO.getExamsByCategory(categoryId);
            request.setAttribute("SELECTED_CATEGORY", categoryId);
        } else {
            exams = examDAO.readAll();
        }
        
        // Load all categories for the filter dropdown
        ExamCategoryDAO categoryDAO = new ExamCategoryDAO();
        List<ExamCategoryDTO> categories = categoryDAO.readAll();
        
        request.setAttribute("EXAMS", exams);
        request.setAttribute("CATEGORIES", categories);
        return EXAMS_PAGE;
    }
    
    private String showCreateExamForm(HttpServletRequest request) {
        // Check if user is an instructor
        HttpSession session = request.getSession(false);
        if (session != null && "Instructor".equals(session.getAttribute("ROLE"))) {
            ExamCategoryDAO categoryDAO = new ExamCategoryDAO();
            List<ExamCategoryDTO> categories = categoryDAO.readAll();
            
            request.setAttribute("CATEGORIES", categories);
            return CREATE_EXAM_PAGE;
        } else {
            request.setAttribute("ERROR", "Access denied. Only instructors can create exams.");
            return ERROR_PAGE;
        }
    }
    
    private String createExam(HttpServletRequest request) {
        // Check if user is an instructor
        HttpSession session = request.getSession(false);
        if (session != null && "Instructor".equals(session.getAttribute("ROLE"))) {
            String examTitle = request.getParameter("examTitle");
            String subject = request.getParameter("subject");
            String categoryId = request.getParameter("categoryId");
            String totalMarksStr = request.getParameter("totalMarks");
            String durationStr = request.getParameter("duration");
            
            try {
                int totalMarks = Integer.parseInt(totalMarksStr);
                int duration = Integer.parseInt(durationStr);
                int categoryIdInt = Integer.parseInt(categoryId);
                
                ExamDTO exam = new ExamDTO();
                exam.setExam_title(examTitle);
                exam.setSubject(subject);
                exam.setCategory_id(categoryIdInt);
                exam.setTotal_marks(totalMarks);
                exam.setDuration(duration);
                
                ExamDAO examDAO = new ExamDAO();
                boolean result = examDAO.create(exam);
                
                if (result) {
                    request.setAttribute("SUCCESS", "Exam created successfully!");
                    // Redirect to add questions to this exam
                    request.setAttribute("EXAM_ID", examDAO.getLastInsertedId());
                    return ADD_QUESTIONS_PAGE;
                } else {
                    request.setAttribute("ERROR", "Failed to create exam.");
                    return CREATE_EXAM_PAGE;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("ERROR", "Invalid numeric values provided.");
                return CREATE_EXAM_PAGE;
            }
        } else {
            request.setAttribute("ERROR", "Access denied. Only instructors can create exams.");
            return ERROR_PAGE;
        }
    }
    
    private String showAddQuestionsForm(HttpServletRequest request) {
        // Check if user is an instructor
        HttpSession session = request.getSession(false);
        if (session != null && "Instructor".equals(session.getAttribute("ROLE"))) {
            String examId = request.getParameter("examId");
            
            if (examId != null && !examId.isEmpty()) {
                ExamDAO examDAO = new ExamDAO();
                ExamDTO exam = examDAO.readById(examId);
                
                if (exam != null) {
                    request.setAttribute("EXAM", exam);
                    
                    // Get existing questions for this exam
                    QuestionDAO questionDAO = new QuestionDAO();
                    List<QuestionDTO> questions = questionDAO.getQuestionsByExamId(Integer.parseInt(examId));
                    request.setAttribute("QUESTIONS", questions);
                    
                    return ADD_QUESTIONS_PAGE;
                }
            }
            request.setAttribute("ERROR", "Invalid exam selected.");
        } else {
            request.setAttribute("ERROR", "Access denied. Only instructors can add questions.");
        }
        return ERROR_PAGE;
    }
    
    private String addQuestion(HttpServletRequest request) {
        // Check if user is an instructor
        HttpSession session = request.getSession(false);
        if (session != null && "Instructor".equals(session.getAttribute("ROLE"))) {
            String examId = request.getParameter("examId");
            String questionText = request.getParameter("questionText");
            String optionA = request.getParameter("optionA");
            String optionB = request.getParameter("optionB");
            String optionC = request.getParameter("optionC");
            String optionD = request.getParameter("optionD");
            String correctOption = request.getParameter("correctOption");
            
            try {
                int examIdInt = Integer.parseInt(examId);
                char correctOptionChar = correctOption.charAt(0);
                
                QuestionDTO question = new QuestionDTO();
                question.setExam_id(examIdInt);
                question.setQuestion_text(questionText);
                question.setOption_a(optionA);
                question.setOption_b(optionB);
                question.setOption_c(optionC);
                question.setOption_d(optionD);
                question.setCorrect_option(correctOptionChar);
                
                QuestionDAO questionDAO = new QuestionDAO();
                boolean result = questionDAO.create(question);
                
                if (result) {
                    request.setAttribute("SUCCESS", "Question added successfully!");
                } else {
                    request.setAttribute("ERROR", "Failed to add question.");
                }
                
                // Redirect back to the add questions page for the same exam
                request.setAttribute("EXAM_ID", examId);
                return showAddQuestionsForm(request);
                
            } catch (Exception e) {
                request.setAttribute("ERROR", "Error adding question: " + e.getMessage());
                return ERROR_PAGE;
            }
        } else {
            request.setAttribute("ERROR", "Access denied. Only instructors can add questions.");
            return ERROR_PAGE;
        }
    }
    
    private String showTakeExam(HttpServletRequest request) {
        // Check if user is a student
        HttpSession session = request.getSession(false);
        if (session != null && "Student".equals(session.getAttribute("ROLE"))) {
            String examId = request.getParameter("examId");
            
            if (examId != null && !examId.isEmpty()) {
                ExamDAO examDAO = new ExamDAO();
                ExamDTO exam = examDAO.readById(examId);
                
                if (exam != null) {
                    request.setAttribute("EXAM", exam);
                    
                    // Get questions for this exam
                    QuestionDAO questionDAO = new QuestionDAO();
                    List<QuestionDTO> questions = questionDAO.getQuestionsByExamId(Integer.parseInt(examId));
                    request.setAttribute("QUESTIONS", questions);
                    
                    return TAKE_EXAM_PAGE;
                }
            }
            request.setAttribute("ERROR", "Invalid exam selected.");
        } else {
            request.setAttribute("ERROR", "Access denied. Only students can take exams.");
        }
        return ERROR_PAGE;
    }
    
    private String submitExam(HttpServletRequest request) {
        // Check if user is a student
        HttpSession session = request.getSession(false);
        if (session != null && "Student".equals(session.getAttribute("ROLE"))) {
            String examId = request.getParameter("examId");
            
            try {
                ExamDAO examDAO = new ExamDAO();
                ExamDTO exam = examDAO.readById(examId);
                
                if (exam != null) {
                    // Get questions for this exam
                    QuestionDAO questionDAO = new QuestionDAO();
                    List<QuestionDTO> questions = questionDAO.getQuestionsByExamId(Integer.parseInt(examId));
                    
                    int totalQuestions = questions.size();
                    int correctAnswers = 0;
                    
                    // Check each answer
                    Map<Integer, String> userAnswers = new HashMap<>();
                    Map<Integer, Boolean> answerResults = new HashMap<>();
                    
                    for (QuestionDTO question : questions) {
                        int questionId = question.getQuestion_id();
                        String userAnswer = request.getParameter("answer_" + questionId);
                        userAnswers.put(questionId, userAnswer);
                        
                        if (userAnswer != null && userAnswer.charAt(0) == question.getCorrect_option()) {
                            correctAnswers++;
                            answerResults.put(questionId, true);
                        } else {
                            answerResults.put(questionId, false);
                        }
                    }
                    
                    // Calculate score
                    double score = 0;
                    if (totalQuestions > 0) {
                        score = ((double) correctAnswers / totalQuestions) * exam.getTotal_marks();
                    }
                    
                    // Store results in session for results page
                    request.setAttribute("EXAM", exam);
                    request.setAttribute("QUESTIONS", questions);
                    request.setAttribute("USER_ANSWERS", userAnswers);
                    request.setAttribute("ANSWER_RESULTS", answerResults);
                    request.setAttribute("CORRECT_ANSWERS", correctAnswers);
                    request.setAttribute("TOTAL_QUESTIONS", totalQuestions);
                    request.setAttribute("SCORE", score);
                    
                    return EXAM_RESULTS_PAGE;
                }
                request.setAttribute("ERROR", "Invalid exam data.");
            } catch (Exception e) {
                request.setAttribute("ERROR", "Error processing exam submission: " + e.getMessage());
            }
        } else {
            request.setAttribute("ERROR", "Access denied. Only students can submit exams.");
        }
        return ERROR_PAGE;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
