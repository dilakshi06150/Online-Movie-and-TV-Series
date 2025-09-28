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

import Model.MovieModel;
import Services.MovieService;

@WebServlet("/AddMovie")
@MultipartConfig(maxFileSize = 16177215) 
public class AddMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddMovie() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		
		MovieModel mMod = new MovieModel();
		
		mMod.setTitle(request.getParameter("title"));
		mMod.setGenre(request.getParameter("genre"));  
		mMod.setType(request.getParameter("type"));   
		mMod.setYear(Integer.parseInt(request.getParameter("year")));
		mMod.setDescription(request.getParameter("dec"));  

		
		
		Part filePart = request.getPart("poster"); 
		InputStream imageStream = filePart.getInputStream(); 
		mMod.setImage(imageStream);
		
		MovieService service = new MovieService();
		service.insertData(mMod);
		
		
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		dis.forward(request, response);
	}
}
