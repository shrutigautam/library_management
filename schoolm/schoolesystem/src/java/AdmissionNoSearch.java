
import java.io.*;  
import java.sql.*;  
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  

@WebServlet(name = "AdmissionNoSearch", urlPatterns = {"/AdmissionNoSearch"})
public class AdmissionNoSearch extends HttpServlet {  
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html"); 
PrintWriter out=response.getWriter();
String Adm_No=request.getParameter("na2");
HttpSession session = request.getSession();
session.setAttribute("ADMN", Adm_No);
ArrayList al=new ArrayList();

try{
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement s1=con.createStatement();
Statement s2=con.createStatement();
Statement s3=con.createStatement();
Statement s4=con.createStatement();
Statement s5=con.createStatement();
Statement s6=con.createStatement();
ResultSet rs1=s1.executeQuery("select * from admission_tab where Admission_No='"+Adm_No+"'");
ResultSet rs2=s2.executeQuery("select * from personal_info where admission_no='"+Adm_No+"'");
ResultSet rs3=s3.executeQuery("select * from contact_detail where admission_no='"+Adm_No+"'");
ResultSet rs4=s4.executeQuery("select * from education_detail where admission_no='"+Adm_No+"'");
ResultSet rs5=s5.executeQuery("select * from welfare_tab where admission_no='"+Adm_No+"'");
ResultSet rs6=s6.executeQuery("select * from document_check_list where admission_no='"+Adm_No+"'");
while(rs1.next()){
al.add(rs1.getString(1)+",");
al.add(rs1.getString(2)+",");
al.add(rs1.getString(3)+",");
al.add(rs1.getString(4)+",");
al.add(rs1.getString(5)+",");
al.add(rs1.getString(6)+",");
al.add(rs1.getString(7)+",");
al.add(rs1.getString(8)+",");
al.add(rs1.getString(9)+",");
al.add(rs1.getString(10)+",");
al.add(rs1.getString(11)+",");
al.add(rs1.getString(12)+",");
al.add(rs1.getString(13)+",");}
  while(rs2.next()){
al.add(rs2.getString(2)+",");
al.add(rs2.getString(3)+",");
al.add(rs2.getString(4)+",");
al.add(rs2.getString(5)+",");
al.add(rs2.getString(6)+",");
al.add(rs2.getString(7)+",");
al.add(rs2.getString(8)+",");
al.add(rs2.getString(9)+",");
al.add(rs2.getString(10)+",");
al.add(rs2.getString(11)+",");
al.add(rs2.getString(18)+",");
al.add(rs2.getString(12)+",");
al.add(rs2.getString(13)+",");
al.add(rs2.getString(14)+",");
al.add(rs2.getString(15)+",");
al.add(rs2.getString(16)+",");
al.add(rs2.getString(17)+",");
  }
 while(rs3.next()){
al.add(rs3.getString(2)+",");
al.add(rs3.getString(3)+",");
al.add(rs3.getString(4)+",");
al.add(rs3.getString(5)+",");
al.add(rs3.getString(6)+",");
al.add(rs3.getString(7)+",");
al.add(rs3.getString(8)+",");
al.add(rs3.getString(9)+",");
al.add(rs3.getString(10)+",");
al.add(rs3.getString(11)+",");
al.add(rs3.getString(12)+",");
al.add(rs3.getString(13)+",");
al.add(rs3.getString(14)+",");
al.add(rs3.getString(15)+",");
al.add(rs3.getString(16)+",");
al.add(rs3.getString(17)+",");
al.add(rs3.getString(18)+",");
al.add(rs3.getString(19)+",");
al.add(rs3.getString(20)+",");
al.add(rs3.getString(21)+",");
 } 
while(rs4.next()){
al.add(rs4.getString(2)+",");
al.add(rs4.getString(3)+",");
al.add(rs4.getString(4)+",");
al.add(rs4.getString(5)+",");
al.add(rs4.getString(6)+",");
al.add(rs4.getString(7)+",");
al.add(rs4.getString(8)+",");
}
while(rs5.next()){
al.add(rs5.getString(2)+",");
al.add(rs5.getString(3)+",");
al.add(rs5.getString(4)+",");
al.add(rs5.getString(5)+",");
al.add(rs5.getString(6)+",");
al.add(rs5.getString(7)+",");
}
while(rs6.next()){
al.add(rs6.getString(2)+",");
al.add(rs6.getString(3)+",");
al.add(rs6.getString(4)+",");
al.add(rs6.getString(5)+",");
al.add(rs6.getString(6)+",");
al.add(rs6.getString(7)+",");
al.add(rs6.getString(8)+",");
al.add(rs6.getString(9)+",");
al.add(rs6.getString(10)+",");
al.add(rs6.getString(11)+",");
al.add(rs6.getString(12)+",");
al.add(rs6.getString(13)+",");
al.add(rs6.getString(14)+",");
al.add(rs6.getString(15)+",");
al.add(rs6.getString(16)+",");
al.add(rs6.getString(17)+",");
al.add(rs6.getString(18)+",");
al.add(rs6.getString(19)+",");
al.add(rs6.getString(20)+",");
al.add(rs6.getString(21)+",");
al.add(rs6.getString(22)); 
} 

Iterator it=al.iterator();

while(it.hasNext())
{
out.print(it.next());
}
s1.close();
s2.close();
s3.close();
s4.close();
s5.close();
s6.close();
  }
catch (Exception et)
        {
           out.print(et);
        }


}
}
  
 
