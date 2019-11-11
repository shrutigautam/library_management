
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "destroy_Session", urlPatterns = {"/destroy_Session"})
public class destroy_Session extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
	HttpSession session = request.getSession();
        session.removeAttribute("ADMN");
        response.sendRedirect("Admission.jsp");
        }
}