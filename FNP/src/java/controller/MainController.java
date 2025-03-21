//package controller;
//
//import dao.CategoryDAO;
//import dao.UserDAO;
//import dto.BookDTO;
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
//public class MainController extends HttpServlet {
//
//    private static final String LOGIN_PAGE = "auth/login.jsp";
//
//    public UserDTO getUser(String strUserID) {
//        UserDAO udao = new UserDAO();
//        return udao.readById(strUserID);
//    }
//
//    public boolean isValidLogin(String strUserID, String strPassword) {
//        UserDTO user = getUser(strUserID);
//        return user != null && user.getPassword().equals(strPassword);
//    }
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String url = LOGIN_PAGE;
//        
//        try {
//            String action = request.getParameter("action");
//            HttpSession session = request.getSession();
//
//            if (action == null) {
//                url = LOGIN_PAGE;
//            } else {
//                if (action.equals("login")) {
//                    String strUserID = request.getParameter("txtUserID");
//                    String strPassword = request.getParameter("txtPassword");
//
//                    if (isValidLogin(strUserID, strPassword)) {
//                        url = "store.jsp";
//                        UserDTO user = getUser(strUserID);
//                        session.setAttribute("user", user);
//                        session.setAttribute("isLoggedIn", true);
//                    } else {
//                        request.getSession().setAttribute("mess", "Incorrect User or Password!");
//                        url = "login.jsp";
//                    }
//
//                } else if (action.equals("logout")) {
//                    session.invalidate();  // huy bo session
//                    url = "login.jsp";
//                }else  if (action.equals("search")) {
//                    CategoryDAO bdao = new CategoryDAO();
//                    String searchTerm = request.getParameter("searchTerm");
//                    List<BookDTO> books = bdao.searchByTitle(searchTerm);
//                    request.setAttribute("books", books);
//                    url = "search.jsp";
//                }
//            }
//        } catch (Exception e) {
//            log("Error at MainController: " + e.toString());
//        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Main Controller Servlet";
//    }
//}
