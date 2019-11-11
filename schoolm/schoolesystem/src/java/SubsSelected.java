import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
import java.io.*;  
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;

public class SubsSelected extends HttpServlet {  
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
ResultSet rs=stmt.executeQuery("select * from subject_tab");

    while(rs.next()){
        al.add(rs.getInt(1)+",");
        al.add(rs.getString(2));
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
out.println(rs);
}
catch (Exception et)
        {
           out.print(et);
        }
      
}}
  
 
