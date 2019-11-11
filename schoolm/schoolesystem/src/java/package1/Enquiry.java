package package1;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Enquiry extends HttpServlet {

   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
             {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
      try {
            String u=request.getParameter("enq_id");
            String a=request.getParameter("Name");
            String b=request.getParameter("DOB");
            String c=request.getParameter("FName");
            String d=request.getParameter("FOccupation");
            String e=request.getParameter("MName");
            String f=request.getParameter("Address");
            String g=request.getParameter("City");
            String h=request.getParameter("Gender");
            String i=request.getParameter("Email_ID");
            String j=request.getParameter("Class");
            String k=request.getParameter("School");
            String l=request.getParameter("Parents");
            String m=request.getParameter("Mobile_No");
            String n=request.getParameter("Landline_No");
            String o=request.getParameter("Alternate_No");
            String p=request.getParameter("Category");
            String q=request.getParameter("Family_Income");            
            String r=request.getParameter("Admission_Mode");
            String s=request.getParameter("Admission_Place");
            String t=request.getParameter("Remark");
            String u1=request.getParameter("date_ID");
            String B=b.toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            Statement stmt=(Statement) con.createStatement();
            int up1= stmt.executeUpdate("insert into enquiry_tab values('"+u+"','"+a+"','"+B+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"','"+j+"','"+k+"','"+l+"','"+m+"','"+n+"','"+o+"','"+p+"','"+q+"','"+r+"','"+s+"','"+t+"','"+u1+"')");
            if(up1==0){
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
     out.println("<h3><center>Something went wrong!!</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("Enquiry.jsp");   
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
     
     RequestDispatcher rd = request.getRequestDispatcher("Enquiry.jsp");   
     rd.include(request, response);
       }
           
        }          
          catch(Exception et)
          {
        out.println(et);      
        }
   }
        
    }
