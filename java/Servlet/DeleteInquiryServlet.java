package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Services.InquiryService;
import Services.UserServices;
import Model.AddUserModel;
import Model.InquiryModel;

@WebServlet("/DeleteInquiry")
public class DeleteInquiryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	InquiryModel dum = new InquiryModel();
		
		dum.setInqID(Integer.parseInt(request.getParameter("IqId")));
		
		InquiryService service = new InquiryService();
		
		service.deleteData(dum);
		
		RequestDispatcher dis = request.getRequestDispatcher("inquiry.jsp");
		dis.forward(request, response);
    }
}
