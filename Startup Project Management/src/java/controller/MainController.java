package controller;

import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private UserDAO userDAO = new UserDAO();
    private ProjectDAO projectDAO = new ProjectDAO();

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String DASHBOARD_PAGE = "dashboard.jsp";

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUserID = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");

        if (AuthUtils.isValidLogin(strUserID, strPassword)) {
            UserDTO user = userDAO.readById(strUserID);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                List<ProjectDTO> projects = projectDAO.readAll();
                request.setAttribute("projects", projects);

                url = DASHBOARD_PAGE;
            } else {
                request.setAttribute("message", "User not found");
            }
        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
        }
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        return LOGIN_PAGE;
    }

    private String processViewProjects(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            List<ProjectDTO> projects = projectDAO.readAll();
            request.setAttribute("projects", projects);
            return DASHBOARD_PAGE;
        }
        return LOGIN_PAGE;
    }

    private String processCreateProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null && "Founder".equals(user.getRole())) {
            try {
                String projectName = request.getParameter("txtProjectName");
                String description = request.getParameter("txtDescription");
                String status = request.getParameter("txtStatus");
                String launchDateStr = request.getParameter("txtLaunchDate");

                boolean hasError = false;
                if (projectName == null || projectName.trim().isEmpty()) {
                    request.setAttribute("projectNameError", "Project name cannot be empty");
                    hasError = true;
                }

                Date launchDate = null;
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    launchDate = sdf.parse(launchDateStr);
                } catch (ParseException e) {
                    request.setAttribute("launchDateError", "Invalid date format");
                    hasError = true;
                }

                if (!hasError) {
                    ProjectDTO newProject = new ProjectDTO();
                    newProject.setProject_name(projectName);
                    newProject.setDescription(description);
                    newProject.setStatus(status);
                    newProject.setEstimated_launch(launchDate);

                    if (projectDAO.create(newProject)) {
                        request.setAttribute("message", "Project created successfully");
                        return processViewProjects(request, response);
                    } else {
                        request.setAttribute("message", "Failed to create project");
                    }
                }
                return "createProject.jsp";
            } catch (Exception e) {
                request.setAttribute("message", "Error creating project: " + e.getMessage());
                return "createProject.jsp";
            }
        }
        return LOGIN_PAGE;
    }

    private String processUpdateProjectStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null && "Founder".equals(user.getRole())) {
            try {
                String projectId = request.getParameter("txtProjectId");
                String newStatus = request.getParameter("txtStatus");

                ProjectDTO project = projectDAO.readById(projectId);
                if (project != null) {
                    project.setStatus(newStatus);
                    if (projectDAO.update(project)) {
                        request.setAttribute("message", "Project status updated successfully");
                        return processViewProjects(request, response);
                    } else {
                        request.setAttribute("message", "Failed to update project status");
                    }
                }
                return DASHBOARD_PAGE;
            } catch (Exception e) {
                request.setAttribute("message", "Error updating project status: " + e.getMessage());
                return DASHBOARD_PAGE;
            }
        }
        return LOGIN_PAGE;
    }

    private String processSearchProjects(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            String searchTerm = request.getParameter("txtSearchTerm");
            List<ProjectDTO> projects = projectDAO.search(searchTerm);
            request.setAttribute("projects", projects);
            request.setAttribute("searchTerm", searchTerm);
            return DASHBOARD_PAGE;
        }
        return LOGIN_PAGE;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                switch (action) {
                    case "login":
                        url = processLogin(request, response);
                        break;
                    case "logout":
                        url = processLogout(request, response);
                        break;
                    case "viewProjects":
                        url = processViewProjects(request, response);
                        break;
                    case "createProject":
                        url = processCreateProject(request, response);
                        break;
                    case "updateProjectStatus":
                        url = processUpdateProjectStatus(request, response);
                        break;
                    case "searchProjects":
                        url = processSearchProjects(request, response);
                        break;
                    default:
                        url = LOGIN_PAGE;
                }
            }
        } catch (Exception e) {
            log("Error in MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
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
     * @throws IOException if an I/O error occurs
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
