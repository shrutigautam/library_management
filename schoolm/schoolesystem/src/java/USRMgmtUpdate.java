import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class USRMgmtUpdate extends HttpServlet {

  
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
           String UType=request.getParameter("UType");
           String Uname=request.getParameter("Uname");
           String usrcode=request.getParameter("usrcode");
           String fullName=request.getParameter("fullName");
           
           String Cpass=request.getParameter("Cpass");
           String Photo1=request.getParameter("Photo1");
           String ChangePwd=request.getParameter("ChangePwd");
           String Disable1=request.getParameter("Disable1");
           
           String Admin_rights=request.getParameter("Admin_rights");
           String adm_details=request.getParameter("adm_details");
           String adm_pers_details=request.getParameter("adm_pers_details");
           String adm_cntct_details=request.getParameter("adm_cntct_details");
           
           String adm_edu_details=request.getParameter("adm_edu_details");
           String adm_chck_list=request.getParameter("adm_chck_list");
           String adm_welf_conc=request.getParameter("adm_welf_conc");
           String Emp_details=request.getParameter("Emp_details");
           String Emp_faculty=request.getParameter("Emp_faculty");
           String atndnc_mark=request.getParameter("atndnc_mark");
           String atndnc_view=request.getParameter("atndnc_view");
           String exam_create=request.getParameter("exam_create");
            String marks_upload=request.getParameter("marks_upload");
           String exam_view_result=request.getParameter("exam_view_result");
           String notice1=request.getParameter("notice1");
           String master1=request.getParameter("master1");
           String rep_generation=request.getParameter("rep_generation");
            String idCard_generation=request.getParameter("idCard_generation");
           String student_search=request.getParameter("student_search");
           String Enquiry1=request.getParameter("Enquiry1");
           String lib_mst=request.getParameter("lib_mst");
           String lib_reg=request.getParameter("lib_reg");
           String lib_purchase=request.getParameter("lib_purchase");
           String lib_accession=request.getParameter("lib_accession");
           String lib_issue=request.getParameter("lib_issue");
           String lib_opac=request.getParameter("lib_opac");
            
           Class.forName( "com.mysql.jdbc.Driver");
           Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
           Statement stmt=conn.createStatement(); 
           int u=stmt.executeUpdate("UPDATE usermgmttab SET userType='"+UType+"',Username='"+Uname+"',FullName='"+fullName+"',Password='"+Cpass+"',PhotoPath='"+Photo1+"',authorityChngPwd='"+ChangePwd+"',disabled='"+Disable1+"',adminRights='"+Admin_rights+"',Adm_adm_details='"+adm_details+"',Adm_prsnl_Info='"+adm_pers_details+"',Adm_cntct_details='"+adm_cntct_details+"',Adm_edu_details='"+adm_edu_details+"',Adm_doc_chkList='"+adm_chck_list+"',Adm_welfare_Concession='"+adm_welf_conc+"',Emp_details='"+Emp_details+"',Emp_faculty='"+Emp_faculty+"',Atndnc_Mark='"+atndnc_mark+"',Atndnc_View='"+atndnc_view+"',Exam_create='"+exam_create+"',Exam_upload_marks='"+marks_upload+"',Exam_ViewResult='"+exam_view_result+"',Notice='"+notice1+"',Master='"+master1+"',ReportGeneration='"+rep_generation+"',idcard_generation='"+idCard_generation+"',student_search='"+student_search+"',enquiry1='"+Enquiry1+"',lib_mst='"+lib_mst+"',lib_reg='"+lib_reg+"',lib_purchase='"+lib_purchase+"',lib_access='"+lib_accession+"',lib_issue='"+lib_issue+"',lib_opac='"+lib_opac+"' WHERE Usercode='"+usrcode+"'");
           if(u==0){
             out.println("oops something went wrong");
           }  
           else
             out.println("user account successfully updated");
          
        }
        catch(Exception et){
           out.println("Exception:"+et);  
        }
    }
}
