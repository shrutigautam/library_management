
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class popUpCorrect extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            /* TODO output your page here. You may use following sample code. */
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"popUpCss.css\"  /> ");
     out.println("<script src=\"jquery-1.2.6.min.js\" type=\"text/javascript\"></script>");
     out.println("<script type=\"text/javascript\">");
     out.println("$(document).ready( function() {");
     out.println(" loadPopupBox();");
     out.println("$('#popupBoxClose').click( function() {");
     out.println("unloadPopupBox();");
     out.println(" });");
     out.println(" $('#container').click( function() {");
     out.println(" unloadPopupBox();");
     out.println(" });");
     out.println("function unloadPopupBox() {  ");
     out.println("$('#popup_box').fadeOut(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"1\" ");
     out.println("});");
     out.println("} ");
     out.println("function loadPopupBox() {  ");
     out.println("$('#popup_box').fadeIn(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"0.3\" ");
     out.println("});");
     out.println("}");
     out.println("});");
     out.println("</script>");
     
     out.println("<div id=\"popup_box\"> ");
     out.println("<h3><center>Successfully Inserted</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
        }
        catch(Exception et){
            
        }
    }
}
