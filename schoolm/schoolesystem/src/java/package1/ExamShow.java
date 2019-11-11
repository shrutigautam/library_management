package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class ExamShow extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            /* TODO output your page here. You may use following sample code. */
           
         
           String session1=request.getParameter("session1_sel");
           String class1=request.getParameter("class1_sel");
           
           String[] subject1=request.getParameterValues("subjects_id");
           String exam_code=request.getParameter("exam_CODE");
           String max_marks=request.getParameter("maximum_MARKS");
           String min_marks=request.getParameter("minimum_MARKS");
           StringBuilder sb=new StringBuilder();
           for(int i=0;i<subject1.length;i++)
           {
             sb.append(subject1[i]+",");
             
           }
        
           Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
           Statement stmt=con.createStatement();
           int u=stmt.executeUpdate("insert into exam_tab(session, class, subject, exam_code, max_marks, min_marks) values('"+session1+"','"+class1+"','"+sb.toString()+"','"+exam_code+"','"+max_marks+"','"+min_marks+"')");
            if(u==0){
                 
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
                 out.println("<h3><center>INVALID</center></h3>");
                 out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
                 out.println("</div>");
     
                 RequestDispatcher rd = request.getRequestDispatcher("examPage.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
                 rd.include(request, response);
                    
                
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
                 out.println("<h3><center>Successfully Inserted</center></h3>");
                 out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
                 out.println("</div>");
     
                 RequestDispatcher rd = request.getRequestDispatcher("examPage.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
                 rd.include(request, response);
                 }
            
        }
        catch(Exception et){
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
                 out.println("<h3><center>Exception:</center></h3>"+et);
                 out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
                 out.println("</div>");
     
                 RequestDispatcher rd = request.getRequestDispatcher("examPage.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
                 rd.include(request, response);
        }
    }
}
   