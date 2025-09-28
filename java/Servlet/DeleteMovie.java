package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DeleteModel;
import Model.UpdateModel;
import Services.MovieService;


@WebServlet("/DeleteMovie")
public class DeleteMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteMovie() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DeleteModel dMod = new DeleteModel();
		
		dMod.setTitle(request.getParameter("title"));
		
		MovieService service = new MovieService();
		
		service.deleteData(dMod);
		
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		
		
		
		dis.forward(request, response);
	}

}
