package Servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InquiryModel;
import Services.InquiryService;

@WebServlet("/inquiryPage")
public class InquiryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InquiryService inquiryService = new InquiryService();
        List<InquiryModel> inquiries = inquiryService.getAllInquiries(); // Fetching all inquiries from the database

        request.setAttribute("inquiries", inquiries); // Set inquiries as a request attribute
        request.getRequestDispatcher("inquiry.jsp").forward(request, response); // Forward to JSP page
    }
}
