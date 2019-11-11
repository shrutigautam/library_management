package package1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saumya Joshi
 */
public class Logout extends HttpServlet {

   
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
          HttpSession LoginSession=request.getSession();  
          LoginSession.invalidate();    
          RequestDispatcher rd=request.getRequestDispatcher("LoginForm.jsp");  
          rd.include(request, response);   
        }
        catch(Exception et){
            
        }
    }
}
