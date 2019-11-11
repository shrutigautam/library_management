import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
import java.io.*;  
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;

public class Admission extends HttpServlet {  
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html"); 
PrintWriter out=response.getWriter();
try{
String a=request.getParameter("na1");

//if (a != null) {
ArrayList al=new ArrayList();  
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from enquiry_tab where enquiry_id='"+a+"'");

    while(rs.next()){
        al.add(rs.getString("std_name")+",");
        al.add(rs.getString("std_dob")+",");
        al.add(rs.getString("std_fname")+",");
        al.add(rs.getString("std_mname")+",");
        al.add(rs.getString("std_school")+",");
        al.add(rs.getString("std_class")+",");
        al.add(rs.getString("std_gender")+",");
        al.add(rs.getString("std_foccupation")+",");
        al.add(rs.getString("std_fincome")+",");
        al.add(rs.getString("std_category")+",");
        al.add(rs.getString("std_address")+",");
        al.add(rs.getString("std_city")+",");
        al.add(rs.getString("std_email")+",");
        al.add(rs.getString("std_mobile"));
        
 

    Iterator it=al.iterator();
    
    while(it.hasNext())
    {
        out.print(it.next());
    }
//PreparedStatement pst=con.prepareStatement("select (std_name,std_dob,std_fname,std_mname,std_admissionmode,std_school,std_class) from enquiry_tab where enquiry_id=?");
    }
//out.println("rahul");
//out.println(al);
    
//out.println("rahul");
//out.println(al);
}
catch (Exception et)
        {
           out.print(et);
        }
      
}}
  
 
