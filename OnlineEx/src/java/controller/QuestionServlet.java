/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ExamDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import model.Exam;
import model.Question;
import model.User;

/**
 *
 * @author khoa2
 */
@WebServlet(name="add-questions", urlPatterns={"/add-questions"})
public class QuestionServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    private ExamDAO examDAO;
    private QuestionDAO questionDAO;
    
    public void init() {
        examDAO = new ExamDAO();
        questionDAO = new QuestionDAO();
    }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuestionServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            
            if (user.isInstructor()) {
                String examIdParam = request.getParameter("examId");
                
                if (examIdParam != null && !examIdParam.isEmpty()) {
                    int examId = Integer.parseInt(examIdParam);
                    Exam exam = examDAO.getExamById(examId);
                    
                    if (exam != null) {
                        List<Question> questions = questionDAO.getQuestionsByExamId(examId);
                        
                        request.setAttribute("exam", exam);
                        request.setAttribute("questions", questions);
                        request.setAttribute("questionCount", questions.size());
                        request.setAttribute("user", user);
                        
                        request.getRequestDispatcher("/add-questions.jsp").forward(request, response);
                        return;
                    }
                }
                
                response.sendRedirect(request.getContextPath() + "/exams");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            
            if (user.isInstructor()) {
                int examId = Integer.parseInt(request.getParameter("examId"));
                String questionText = request.getParameter("questionText");
                String optionA = request.getParameter("optionA");
                String optionB = request.getParameter("optionB");
                String optionC = request.getParameter("optionC");
                String optionD = request.getParameter("optionD");
               String correctOptionStr = request.getParameter("correctOption");
                char correctOption = correctOptionStr.charAt(0);  

                Question question = new Question();
                question.setExamId(examId);
                question.setQuestionText(questionText);
                question.setOptionA(optionA);
                question.setOptionB(optionB);
                question.setOptionC(optionC);
                question.setOptionD(optionD);
                question.setCorrectOption(correctOption); 
                
                boolean success = questionDAO.addQuestion(question);
                
                if (success) {
                    // Check if the user wants to add more questions or finish
                    String action = request.getParameter("action");
                    
                    if ("finish".equals(action)) {
                        response.sendRedirect(request.getContextPath() + "/exams");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/add-questions?examId=" + examId + "&added=true");
                    }
                } else {
                    request.setAttribute("errorMessage", "Failed to add question");
                    request.setAttribute("user", user);
                    
                    Exam exam = examDAO.getExamById(examId);
                    List<Question> questions = questionDAO.getQuestionsByExamId(examId);
                    
                    request.setAttribute("exam", exam);
                    request.setAttribute("questions", questions);
                    request.setAttribute("questionCount", questions.size());
                    
                    request.getRequestDispatcher("/add-questions.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
