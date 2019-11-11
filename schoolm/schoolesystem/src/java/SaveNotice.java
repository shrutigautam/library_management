/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class SaveNotice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String notice=request.getParameter("editor1");
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());
        try{
            /* TODO output your page here. You may use following sample code. */
          Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
        Statement stmt=con.createStatement();
        int u=stmt.executeUpdate("insert into notice_tab(timeStamp, noticeContent) values( '"+timestamp.toString()+"','"+notice+"')");
        if(u==0)
        {
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
     out.println("<h3><center>Something went wrong</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");   // S2 is the alias name of second Servlet, Billing
    
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
     out.println("<h3><center>Sucessfully Inserted</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");   // S2 is the alias name of second Servlet, Billing
    
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
     
     RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
      }    
        }
    }

   