package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AddUserModel;
import Model.DeleteUserModel;
import Services.MovieService;
import Services.UserServices;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteUserServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddUserModel dum = new AddUserModel();
		
		dum.setUsername(request.getParameter("username"));
		
		UserServices service = new UserServices();
		
		service.deleteUser(dum);
		
		RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
		dis.forward(request, response);
	}

}
