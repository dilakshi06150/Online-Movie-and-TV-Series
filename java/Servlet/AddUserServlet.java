package Servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.AddUserModel;
import Model.MovieModel;
import Services.MovieService;
import Services.UserServices;

@WebServlet("/AddUserServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddUserServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddUserModel aum = new AddUserModel();
		
		aum.setUsername(request.getParameter("username"));  
		aum.setName(request.getParameter("name"));
		aum.setPassword(request.getParameter("password"));   
		aum.setDob(request.getParameter("dob"));
		
		Part filePart = request.getPart("poster"); 
		InputStream imageStream = filePart.getInputStream(); 
		aum.setImage(imageStream);
		
		
		UserServices service = new UserServices();
		service.insertUser(aum);
		
		
		RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		dis.forward(request, response);
	}

}
