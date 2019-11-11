package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class ViewStudentInfo extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ArrayList al=new ArrayList();
        try{
            /* TODO output your page here. You may use following sample code. */
            String usercode=request.getParameter("usercode");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            Statement s1=con.createStatement();
            Statement s2=con.createStatement();
            Statement s3=con.createStatement();
            Statement s4=con.createStatement();
            
            ResultSet rs1=s1.executeQuery("select * from admission_tab where Admission_No='"+usercode+"'");
            ResultSet rs2=s2.executeQuery("select * from personal_info where admission_no='"+usercode+"'");
            ResultSet rs3=s3.executeQuery("select * from contact_detail where admission_no='"+usercode+"'");
            ResultSet rs4=s4.executeQuery("select * from education_detail where admission_no='"+usercode+"'");
          
                  
            
          
            while(rs1.next()){
            al.add(rs1.getString(1)+",");
            al.add(rs1.getString(2)+" "+rs1.getString(3)+" "+rs1.getString(4)+",");
            al.add(rs1.getString(5)+",");
            al.add(rs1.getString(6)+",");
            al.add(rs1.getString(7)+",");
            al.add(rs1.getString(8)+",");
            al.add(rs1.getString(9)+",");
            al.add(rs1.getString(11)+",");
            al.add(rs1.getString(12)+",");
            al.add(rs1.getString(13)+",");}
            while(rs2.next()){
            al.add(rs2.getString(2)+",");
            al.add(rs2.getString(3)+",");
            al.add(rs2.getString(4)+",");
            al.add(rs2.getString(5)+",");
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
          } 
          while(rs4.next()){
          al.add(rs4.getString(3)+",");
          al.add(rs4.getString(4)+",");
          al.add(rs4.getString(5)+",");
          al.add(rs4.getString(6)+",");
          al.add(rs4.getString(7)+",");
          al.add(rs4.getString(8)+",");
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


          
        }
        catch(Exception et){
            
        }
    }
}
