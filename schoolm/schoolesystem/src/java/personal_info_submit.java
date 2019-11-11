import java.io.*;  
import java.sql.*;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  

@WebServlet(name = "personal_info_submit", urlPatterns = {"/personal_info_submit"})
public class personal_info_submit extends HttpServlet {  
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html"); 
PrintWriter out=response.getWriter();
try{
            HttpSession session = request.getSession();
            String admn =(String)session.getAttribute("ADMN");
            
         out.print(admn);   

            String RNo=request.getParameter("RNo");
            String ENo=request.getParameter("ENo");
            String Gender=request.getParameter("Gender");
            String FOccupation=request.getParameter("FOccupation");
            String PIncome=request.getParameter("PIncome");
            String IncomeAmt=request.getParameter("IncomeAmt");
            String Mname=request.getParameter("Mname");
            String MOccupation=request.getParameter("MOccupation");
            String CasteC=request.getParameter("CasteC");
            String ToStudent=request.getParameter("ToStudent");
            String DState=request.getParameter("DState");
            String Nation=request.getParameter("Nation");
            String Religion=request.getParameter("Religion");
            String BGroup=request.getParameter("BGroup");
            String PDisability=request.getParameter("PDisability");
            String Vision=request.getParameter("Vision");
            String Hobbies=request.getParameter("Hobbies");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            Statement stmt=con.createStatement();
            int x=stmt.executeUpdate("UPDATE personal_info SET std_rollno='"+RNo+"',std_enrollno='"+ENo+"',std_gender='"+Gender+"',"
                    + "std_foccupation='"+FOccupation+"',std_parentincm='"+PIncome+"',std_income='"+IncomeAmt+"',std_mname='"+Mname+"',"
                    + "std_moccupation='"+MOccupation+"',std_caste='"+CasteC+"',std_type='"+ToStudent+"',std_nationality='"+Nation+"',"
                    + "std_blood='"+BGroup+"',std_disability='"+PDisability+"',std_vision='"+Vision+"',std_hobbies='"+Hobbies+"',"
                    + "std_domicile='"+DState+"' WHERE admission_no='"+admn+"' ");
          
            if(x==0)  
            {
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
                 //String message="successfully entered personal details";
                 //request.setAttribute("message5",message);
                 //request.getRequestDispatcher("Admission.jsp").forward(request, response);
             //out.println("<script type=\"text/javascript\">");
             //out.println("alert('Inserted');");
            // out.println("location='Admission.jsp';");
            // out.println("</script>");            
            }
      
        }
        catch (ClassNotFoundException | SQLException | NumberFormatException e2)
        {
         //   out.println(e2);
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

           
            
         
 

    

  
 
