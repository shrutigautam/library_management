package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class loginCheck extends HttpServlet {

  
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
           String userName=request.getParameter("username");
           String passWord=request.getParameter("password");
           String pWd="";
           String type="";
           String usrCode="";
           String Adm_adm_details="";
           String Adm_prsnl_Info="";
           String Adm_cntct_details="";
           String Adm_edu_details="";
           String Adm_doc_chkList="";
           String Adm_welfare_Concession="";
           String Emp_details="";
           String Emp_faculty="";
           String Atndnc_Mark="";
           String Atndnc_View="";
           String Exam_create="";
           String Exam_upload_marks="";
           String Exam_ViewResult="";
           String Notice="";
           String Master="";
           String ReportGeneration="";
           String idCard_generation="";
           String student_search="";
           String Enquiry1="";
           String lib_mst="";
           String lib_reg="";
           String lib_purchase="";
           String lib_accession="";
           String lib_issue="";
           String lib_opac="";
           String locked="";
           int count_num=0;
           HttpSession LoginSession=request.getSession();  
           Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
           Statement stmt=con.createStatement();
           ResultSet rs1=stmt.executeQuery("SELECT COUNT(*) FROM `school_info_tab`" );
            while (rs1.next()) {
           count_num = rs1.getInt(1) + 1;
             }
           if(count_num==1){
               response.sendRedirect("oneTimeForm.jsp");
           } 
           else{
               
           }
           ResultSet rs=stmt.executeQuery("select Password, userType, UserCode, Adm_adm_details, Adm_prsnl_Info, Adm_cntct_details, Adm_edu_details, Adm_doc_chkList, Adm_welfare_Concession, Emp_details, Emp_faculty, Atndnc_Mark, Atndnc_View, Exam_create, Exam_upload_marks, Exam_ViewResult, Notice, Master, ReportGeneration,idCard_generation,student_search,Enquiry1,lib_mst,lib_reg,lib_purchase,lib_access,lib_issue,lib_opac,locked from usermgmttab where UserName='"+userName+"'" );
           while(rs.next()){
              pWd=rs.getString("Password");
              type=rs.getString("userType");
              usrCode=rs.getString("UserCode");
              
              Adm_adm_details=Integer.toString(rs.getInt("Adm_adm_details"));
              Adm_prsnl_Info=Integer.toString(rs.getInt("Adm_prsnl_Info"));
              Adm_cntct_details=Integer.toString(rs.getInt("Adm_cntct_details"));
              Adm_edu_details=Integer.toString(rs.getInt("Adm_edu_details"));
              Adm_doc_chkList=Integer.toString(rs.getInt("Adm_doc_chkList"));
              Adm_welfare_Concession=Integer.toString(rs.getInt("Adm_welfare_Concession"));
              Emp_details=Integer.toString(rs.getInt("Emp_details"));
              Emp_faculty=Integer.toString(rs.getInt("Emp_faculty"));
              Atndnc_Mark=Integer.toString(rs.getInt("Atndnc_Mark"));
              Atndnc_View=Integer.toString(rs.getInt("Atndnc_View"));
              Exam_create=Integer.toString(rs.getInt("Exam_create"));
              Exam_upload_marks=Integer.toString(rs.getInt("Exam_upload_marks"));
              Exam_ViewResult=Integer.toString(rs.getInt("Exam_ViewResult"));
              Notice=Integer.toString(rs.getInt("Notice"));
              Master=Integer.toString(rs.getInt("Master"));
              ReportGeneration=Integer.toString(rs.getInt("ReportGeneration"));
              
              idCard_generation=Integer.toString(rs.getInt("idCard_generation"));
              student_search=Integer.toString(rs.getInt("student_search"));
              Enquiry1=Integer.toString(rs.getInt("Enquiry1"));
              lib_mst=Integer.toString(rs.getInt("lib_mst"));
              lib_reg=Integer.toString(rs.getInt("lib_reg"));
              lib_purchase=Integer.toString(rs.getInt("lib_purchase"));
              lib_accession=Integer.toString(rs.getInt("lib_access"));
              lib_issue=Integer.toString(rs.getInt("lib_issue"));
              lib_opac=Integer.toString(rs.getInt("lib_opac"));
              locked=Integer.toString(rs.getInt("locked"));
           }
           if(pWd.equals(passWord) && locked.equals("0")){
              if(type.equals("Admin")){
               LoginSession.setAttribute("USERNAME",userName);     
               LoginSession.setAttribute("TYPE",type);     
               LoginSession.setAttribute("Adm_adm_details",Adm_adm_details);     
               LoginSession.setAttribute("Adm_prsnl_Info", Adm_prsnl_Info);  
               LoginSession.setAttribute("Adm_cntct_details",Adm_cntct_details);  
               LoginSession.setAttribute("Adm_edu_details",Adm_edu_details);     
               LoginSession.setAttribute("Adm_doc_chkList",Adm_doc_chkList);  
               LoginSession.setAttribute("Adm_welfare_Concession",Adm_welfare_Concession);  
               LoginSession.setAttribute("Emp_details",Emp_details);     
               LoginSession.setAttribute("Emp_faculty",Emp_faculty);  
               LoginSession.setAttribute("Atndnc_Mark", Atndnc_Mark);  
               LoginSession.setAttribute("Atndnc_View",Atndnc_View);     
               LoginSession.setAttribute("Exam_create",Exam_create);  
               LoginSession.setAttribute("Exam_upload_marks",Exam_upload_marks);  
               LoginSession.setAttribute("Exam_ViewResult",Exam_ViewResult);     
               LoginSession.setAttribute("Notice", Notice);  
               LoginSession.setAttribute("Master", Master);  
               LoginSession.setAttribute("ReportGeneration",ReportGeneration);    
               LoginSession.setAttribute("idCard_generation", idCard_generation);  
               LoginSession.setAttribute("student_search", student_search);  
               LoginSession.setAttribute("Enquiry1",Enquiry1); 
               LoginSession.setAttribute("lib_mst",lib_mst);
               LoginSession.setAttribute("lib_reg",lib_reg);
               LoginSession.setAttribute("lib_purchase",lib_purchase);
               LoginSession.setAttribute("lib_accession",lib_accession);
               LoginSession.setAttribute("lib_issue",lib_issue);
               LoginSession.setAttribute("lib_opac",lib_opac);
                LoginSession.setAttribute("locked",locked);
               response.sendRedirect("dashboard.jsp");  
           }
               if(type.equals("student")){
               LoginSession.setAttribute("USERNAME",userName);     
               LoginSession.setAttribute("TYPE",type);  
               LoginSession.setAttribute("USERCODE",usrCode);  
               LoginSession.setAttribute("Adm_adm_details",Adm_adm_details);     
               LoginSession.setAttribute("Adm_prsnl_Info", Adm_prsnl_Info);  
               LoginSession.setAttribute("Adm_cntct_details",Adm_cntct_details);  
               LoginSession.setAttribute("Adm_edu_details",Adm_edu_details);     
               LoginSession.setAttribute("Adm_doc_chkList",Adm_doc_chkList);  
               LoginSession.setAttribute("Adm_welfare_Concession",Adm_welfare_Concession);  
               LoginSession.setAttribute("Emp_details",Emp_details);     
               LoginSession.setAttribute("Emp_faculty",Emp_faculty);  
               LoginSession.setAttribute("Atndnc_Mark", Atndnc_Mark);  
               LoginSession.setAttribute("Atndnc_View",Atndnc_View);     
               LoginSession.setAttribute("Exam_create",Exam_create);  
               LoginSession.setAttribute("Exam_upload_marks",Exam_upload_marks);  
               LoginSession.setAttribute("Exam_ViewResult",Exam_ViewResult);     
               LoginSession.setAttribute("Notice", Notice);  
               LoginSession.setAttribute("Master", Master);  
               LoginSession.setAttribute("ReportGeneration",ReportGeneration);     
               LoginSession.setAttribute("idCard_generation", idCard_generation);  
               LoginSession.setAttribute("student_search", student_search);  
               LoginSession.setAttribute("Enquiry1",Enquiry1);
                 LoginSession.setAttribute("lib_mst",lib_mst);
               LoginSession.setAttribute("lib_reg",lib_reg);
               LoginSession.setAttribute("lib_purchase",lib_purchase);
               LoginSession.setAttribute("lib_accession",lib_accession);
               LoginSession.setAttribute("lib_issue",lib_issue);
               LoginSession.setAttribute("lib_opac",lib_opac);
                LoginSession.setAttribute("locked",locked);
                   System.out.println(locked);
                   response.sendRedirect("studentDashboard.jsp");
//               
//               RequestDispatcher rd=request.getRequestDispatcher("studentDashboard.jsp");  
//               rd.include(request, response);  
           }
               if(type.equals("employee")){
               LoginSession.setAttribute("USERNAME",userName);     
               LoginSession.setAttribute("TYPE",type);
               LoginSession.setAttribute("USERCODE",usrCode);  
               
               LoginSession.setAttribute("Adm_adm_details",Adm_adm_details);     
               LoginSession.setAttribute("Adm_prsnl_Info", Adm_prsnl_Info);  
               LoginSession.setAttribute("Adm_cntct_details",Adm_cntct_details);  
               LoginSession.setAttribute("Adm_edu_details",Adm_edu_details);     
               LoginSession.setAttribute("Adm_doc_chkList",Adm_doc_chkList);  
               LoginSession.setAttribute("Adm_welfare_Concession",Adm_welfare_Concession);  
               LoginSession.setAttribute("Emp_details",Emp_details);     
               LoginSession.setAttribute("Emp_faculty",Emp_faculty);  
               LoginSession.setAttribute("Atndnc_Mark", Atndnc_Mark);  
               LoginSession.setAttribute("Atndnc_View",Atndnc_View);     
               LoginSession.setAttribute("Exam_create",Exam_create);  
               LoginSession.setAttribute("Exam_upload_marks",Exam_upload_marks);  
               LoginSession.setAttribute("Exam_ViewResult",Exam_ViewResult);     
               LoginSession.setAttribute("Notice", Notice);  
               LoginSession.setAttribute("Master", Master);  
               LoginSession.setAttribute("ReportGeneration",ReportGeneration);     
               LoginSession.setAttribute("idCard_generation", idCard_generation);  
               LoginSession.setAttribute("student_search", student_search);  
               LoginSession.setAttribute("Enquiry1",Enquiry1);
                 LoginSession.setAttribute("lib_mst",lib_mst);
               LoginSession.setAttribute("lib_reg",lib_reg);
               LoginSession.setAttribute("lib_purchase",lib_purchase);
               LoginSession.setAttribute("lib_accession",lib_accession);
               LoginSession.setAttribute("lib_issue",lib_issue);
               LoginSession.setAttribute("lib_opac",lib_opac);
                LoginSession.setAttribute("locked",locked);
              response.sendRedirect("EmployeeDashboard.jsp");
           }
           }
           else
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
               out.println("<h3><center>Incorrect username or password</center></h3>");
               out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
               out.println("</div>");
               RequestDispatcher rd=request.getRequestDispatcher("LoginForm.jsp");  
               rd.include(request, response);  
           }
         }
        catch(Exception et){
             out.println("EXCEPTION:"+ et);
        }
    }
}
