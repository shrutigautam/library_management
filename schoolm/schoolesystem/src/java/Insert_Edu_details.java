
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "Insert_Edu_details", urlPatterns = {"/Insert_Edu_details"})
public class Insert_Edu_details extends HttpServlet {
    

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
            response.setContentType("text/html");
             HttpSession session = request.getSession();
            String admn =(String)session.getAttribute("ADMN");
            
	PrintWriter out=response.getWriter();
        String spec_info=request.getParameter("spec_info");
        String class2=request.getParameter("CLASS2");
        String school2=request.getParameter("SCHOOL2");
        String board2=request.getParameter("BOARD2");
        String Stream2=request.getParameter("STREAM2");
        String Year2=request.getParameter("YEAR2");
        String percent2=request.getParameter("PERCENT2");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
        Statement stmt=con.createStatement();
        int u=stmt.executeUpdate("UPDATE education_detail SET specific_detail='"+spec_info+"',sno_class='"+class2+"',school_name='"+school2+"',board='"+board2+"', stream='"+Stream2+"',Year='"+Year2+"',percentage='"+percent2+"' WHERE admission_no='"+admn+"' ");
if(u==0)
{
//    out.println("something went wrong");
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
     out.println("<h3><center>Sucessfully Inserted</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd1 = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd1.include(request, response);
}
else{
    
                     
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
     out.println("<h3><center>Sucessfully Inserted</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd1 = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd1.include(request, response);
  
}
        
        }
        catch(Exception et){
            out.println(et);
            
    
        }
    
       
	
       
        
      
        
	}
	}