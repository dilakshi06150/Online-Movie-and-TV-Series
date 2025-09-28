  package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.QADeleteModel;
import Services.QAService;

 

@WebServlet("/DeleteQA")
public class DeleteQA extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteQA() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		QADeleteModel dMod = new QADeleteModel();
		
		dMod.setQAID(request.getParameter("id"));
		
		QAService service = new QAService();
		
		service.deleteData(dMod);
		
		RequestDispatcher dis = request.getRequestDispatcher("DeleteSuceessful.jsp");
		
		
		
		dis.forward(request, response);
	}

}


