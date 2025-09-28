package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.AddUserModel;
import Services.UserServices;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserServices userService = new UserServices();
        AddUserModel user = userService.validateUser(username, password);

        if (user != null) {
            
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            if ("admin".equalsIgnoreCase(user.getUsername())) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("profile.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}


