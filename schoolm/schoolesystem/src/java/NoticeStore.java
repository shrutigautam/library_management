import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Saumya Joshi
 */
@WebServlet(urlPatterns = {"/NoticeStore"})
public class NoticeStore extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String notice=request.getParameter("editor1");
        String timeStamp=request.getParameter("timeStamp");
        out.print("notice"+notice);
        out.print("timeStamp"+timeStamp);
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
           Statement stmt=con.createStatement();
           int u=stmt.executeUpdate("insert into notice_tab(timeStamp, noticeContent) values( '"+timeStamp+"','"+notice+"')");
            if(u==0){
  /*   out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"popUpCss.css\"  /> ");
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
     out.println("<h3><center>Unsuccessful</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");   
     rd.include(request, response);
    */
                out.println("notice created");
          
          }
                 else
                 {
      /*
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
     out.println("<h3><center>Notice created successfully</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");   
     rd.include(request, response);           
     */
       out.println("unable to create notice");
                 }
        }
        catch(Exception et){
   /*
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
     out.println("<h3><center>Exception</center></h3>"+et);
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");   
     rd.include(request, response);
     */
              out.println("Exception:"+et);
           }
    }

    
}
