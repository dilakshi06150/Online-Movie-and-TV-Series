package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InquiryModel;
import Services.InquiryService;




@WebServlet("/EditInquiry")
public class EditInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditInquiry() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the comment ID and new comment text from the form

    		InquiryModel im = new InquiryModel();
    		
    		// Fetch the current username but keep it unchanged
    		im.setInqID(Integer.parseInt(request.getParameter("IqId")));
    		im.setUsername(request.getParameter("username"));	
    		im.setInquiry(request.getParameter("inquiry"));   
    		

    		InquiryService service = new InquiryService();
    		service.updateInquiry(im);

    		RequestDispatcher dis = request.getRequestDispatcher("inquiry.jsp");
    		dis.forward(request, response);
	}	

}
