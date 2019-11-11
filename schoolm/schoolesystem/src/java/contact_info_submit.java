import java.io.*;  
import java.sql.*;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  

@WebServlet(name = "contact_info_submit", urlPatterns = {"/contact_info_submit"})
public class contact_info_submit extends HttpServlet {  
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html"); 
PrintWriter out=response.getWriter();
try{
            HttpSession session = request.getSession();
            String admn =(String)session.getAttribute("ADMN");
            
            

           
        String Address1=request.getParameter("Address1");
        String Address2=request.getParameter("Address2");  
        String PinCode=request.getParameter("PinCode");  
        String City=request.getParameter("City");  
        String Email=request.getParameter("Email");
        String Mno=request.getParameter("Mno");
        String G_name=request.getParameter("G_name");
        String G_ocptn=request.getParameter("G_ocptn");
        String G_ContactNo=request.getParameter("G_ContactNo");
        String G_MobileNo=request.getParameter("G_MobileNo");
        String Relation=request.getParameter("Relation");
        String G_email=request.getParameter("G_email");
        String P_Address1=request.getParameter("P_Address1");
        String P_Address2=request.getParameter("P_Address2");
        String Pin_Code= request.getParameter("Pin_Code");
        String P_City=request.getParameter("P_City");
        String Contact_No=request.getParameter("Contact_No");
        String E_person=request.getParameter("E_person");
        String E_ContactNo=request.getParameter("E_ContactNo");
        String E_MobileNo=request.getParameter("E_MobileNo");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
        Statement stmt=con.createStatement();
        int x=stmt.executeUpdate("UPDATE contact_detail SET std_address1='"+Address1+"', std_address2='"+Address2+"' ,std_pincode='"+PinCode+"' ,"
                + "std_city='"+City+"' ,std_email='"+Email+"' ,std_mobileno='"+ Mno+"' ,guardian_name='"+G_name+"' ,guardian_occupation='"+ G_ocptn+"' ,"
                + "guardian_contactno='"+G_ContactNo+"' ,guardian_mobileno='"+G_MobileNo+"' ,relation='"+Relation+"' ,guardian_email='"+G_email+"' ,"
                + "std_paddress1='"+P_Address1+"' ,std_paddress2='"+P_Address2+"' ,p_pincode='"+Pin_Code+"' ,p_city='"+P_City+"' ,p_contactno='"+Contact_No+"' ,"
                + "emergency_person_name='"+E_person+"' ,emergency_contactno='"+E_ContactNo+"' ,emergency_mobile='"+E_MobileNo+"'  WHERE admission_no='"+admn+"' ");
          
            if(x==0)  
            {
            //    out.print("oops something went wrong");
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
      //out.println("<script type=\"text/javascript\">");
             //out.println("alert('Inserted');");
            // out.println("location='Admission.jsp';");
            // out.println("</script>"); 
            }
      
        }
        catch (ClassNotFoundException | SQLException | NumberFormatException e2)
        {
        //    out.println(e2);
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
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
        }
        }
}

           
            
         
 

    

  
 


           
            
         
 

    

  
 
