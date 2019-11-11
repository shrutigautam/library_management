
package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class marksShow extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
           String session1_val=request.getParameter("session1_val");
           String class1_val=request.getParameter("class1_val");
           String section1_val=request.getParameter("section1_val");
           String subject_1=request.getParameter("subject_1");
           String examCode=request.getParameter("examCode");
           String date1_val=request.getParameter("date1_val");
           String faculty=request.getParameter("faculty");
        try{
           int i=1,count=0;
                 int ACount[]=new int[200];
                 ArrayList<String> arr=new ArrayList<String>();   
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 
              
              
                 String query_s1 = "select admission_no, student_id, roll_no, session, class, section, date, faculty FROM attendance_tab  WHERE session='"+session1_val+"' AND class='"+class1_val+"' AND section='"+section1_val+"'";
                 ResultSet rs = stmt.executeQuery(query_s1);
                 while(rs.next())
                 {
                 arr.add(i+","+rs.getString("roll_no")+","+rs.getString("student_id")+","+rs.getString("admission_no")+","+rs.getString("cnt"));    
                 arr.add(",");
                 i++;
                 count++;
                 }
                 StringBuilder builder = new StringBuilder();
                 for (String value : arr) 
                 {
                 builder.append(value);
                 }
                 String text = builder.toString();
                 out.print(text+"   "+count);
                 
                
                 
        }
        catch(Exception et){
            
        }
    
             }

}