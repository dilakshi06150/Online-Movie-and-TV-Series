 package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.QAModel;
import Services.QAService;

@WebServlet("/AddQA")
public class AddQA extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddQA() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Retrieve form data
        QAModel QAMod = new QAModel();
        QAMod.setQAID(request.getParameter("id"));
        QAMod.setQuestion(request.getParameter("que"));
        QAMod.setAnswer(request.getParameter("ans"));

        // Insert into DB
        QAService service = new QAService();
        service.insertData(QAMod);

        // Redirect to ShowFAQServlet to reload the data and display the updated FAQ page
        response.sendRedirect("ShowFAQServlet");
    }
}
