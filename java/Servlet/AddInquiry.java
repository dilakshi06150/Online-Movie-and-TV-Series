package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InquiryModel;
import Model.QAModel;
import Services.InquiryService;
import Services.QAService;

@WebServlet("/AddInquiry")
public class AddInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddInquiry() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InquiryModel IqMod = new InquiryModel();
        //IqMod.setInqID(Integer.parseInt(request.getParameter("IqId")));
        IqMod.setInquiry(request.getParameter("inquiry"));
        IqMod.setUsername(request.getParameter("username"));

        // Insert into DB
        InquiryService service = new InquiryService();
        service.insertInquiry(IqMod);

        // Redirect to ShowFAQServlet to reload the data and display the updated FAQ page
        response.sendRedirect("inquiry.jsp");
		
		
	}

}
