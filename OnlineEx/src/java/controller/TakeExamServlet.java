/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ExamDAO;
import dao.QuestionDAO;
import dao.ResultDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Exam;
import model.Question;
import model.User;


@WebServlet(name="take-exam", urlPatterns={"/take-exam"})
public class TakeExamServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    private ExamDAO examDAO;
    private QuestionDAO questionDAO;
    private ResultDAO resultDAO;
    
    public void init() {
        examDAO = new ExamDAO();
        questionDAO = new QuestionDAO();
        resultDAO = new ResultDAO();
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
            out.println("<title>Servlet TakeExamServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TakeExamServlet at " + request.getContextPath () + "</h1>");
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
            
            if (user.isStudent()) {
                String examIdParam = request.getParameter("examId");
                
                if (examIdParam != null && !examIdParam.isEmpty()) {
                    int examId = Integer.parseInt(examIdParam);
                    Exam exam = examDAO.getExamById(examId);
                    
                    if (exam != null) {
                        List<Question> questions = questionDAO.getQuestionsByExamId(examId);
                        
                        request.setAttribute("exam", exam);
                        request.setAttribute("questions", questions);
                        request.setAttribute("user", user);
                        
                        request.getRequestDispatcher("/take-exam.jsp").forward(request, response);
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
            
            if (user.isStudent()) {
                int examId = Integer.parseInt(request.getParameter("examId"));
                List<Question> questions = questionDAO.getQuestionsByExamId(examId);
                
                Map<Integer, Character> answers = new HashMap<>();
                
                for (Question question : questions) {
                    String answerParam = request.getParameter("answer_" + question.getQuestionId());
                    
                    if (answerParam != null && !answerParam.isEmpty()) {
                        answers.put(question.getQuestionId(), answerParam.charAt(0));
                    }
                }
                
                int resultId = resultDAO.saveExamResult(user.getUsername(), examId, answers);
                
                if (resultId > 0) {
                    response.sendRedirect(request.getContextPath() + "/exam-result?resultId=" + resultId);
                } else {
                    request.setAttribute("errorMessage", "Failed to submit exam");
                    request.setAttribute("user", user);
                    
                    Exam exam = examDAO.getExamById(examId);
                    
                    request.setAttribute("exam", exam);
                    request.setAttribute("questions", questions);
                    
                    request.getRequestDispatcher("/take-exam.jsp").forward(request, response);
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
