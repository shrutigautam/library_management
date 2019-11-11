import java.io.*;  
import java.sql.*;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.http.*;  


public class Admissionf extends HttpServlet {  
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html"); 
PrintWriter out=response.getWriter();
try{

            String Adm_No=request.getParameter("Admission_No");
            String _Student_Na=request.getParameter("Name");
            String Mi_name=request.getParameter("Middle_Name");
            String la_name=request.getParameter("Last_Name");
            String _DOB=request.getParameter("DOB");
            String fa_name=request.getParameter("Father_Name");
            String Mo_name=request.getParameter("Mother_Name");
            String Adm_Date=request.getParameter("Admission_Date");
            String Adm_Mode=request.getParameter("Admission_Mode");
            
            String _School=request.getParameter("School");
            String _Class=request.getParameter("Class1");
            String _Section=request.getParameter("Section1");
            String Year_=request.getParameter("Year");
            
            
            HttpSession session = request.getSession();
            session.setAttribute("ADMN", Adm_No);   
            
            
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
    
            String query="{CALL admission_insert(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement stmt=con.prepareCall(query);
            stmt.setString(1,Adm_No);
            stmt.setString(2,_Student_Na);
            stmt.setString(3,Mi_name);
            stmt.setString(4,la_name);
            stmt.setString(5,_DOB);
            stmt.setString(6,fa_name);
            stmt.setString(7,Mo_name);
            stmt.setString(8, Adm_Date);
            stmt.setString(9,Adm_Mode);
            stmt.setString(10,_School);
            stmt.setString(11,_Class);
            stmt.setString(12,_Section);
            stmt.setString(13,Year_);
          
            int u=stmt.executeUpdate();
if(u==0){
   // out.print("oops something went wrong");
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
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
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
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
  
}
            
            
         
 

    }
catch (Exception et)
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
     out.println("<h3><center>INVALID</center></h3>"+et);
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
         //  out.print(et);
        }

      
}}
  
 
