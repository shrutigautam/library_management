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
public class ResultDisplay extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         String session1_val=request.getParameter("session1_val");
         String class1_val=request.getParameter("class1_val");
         String section1_val=request.getParameter("section1_val");
         String examCode=request.getParameter("exam_code");
         String subject1_sel=request.getParameter("subject1_sel");
         String faculty1_sel=request.getParameter("faculty1_sel");  
         PrintWriter out = response.getWriter();
       //  out.print("session: "+session1_val+"class1_val: "+class1_val+"section1_val: "+section1_val+"subject1_sel: "+subject1_sel+"faculty1_sel:"+faculty1_sel);
          try{
                int i=1,count=0;
                 int ACount[]=new int[200];
                 ArrayList<String> arr=new ArrayList<String>();   
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 String query_s1 = "select admission_no, name, roll_no, session, class, section, date1, faculty, exam_code, subject, marks FROM marks_tab  WHERE session='"+session1_val+"' AND class='"+class1_val+"' AND section='"+section1_val+"' AND subject='"+subject1_sel+"'  ";
                 ResultSet rs = stmt.executeQuery(query_s1);
                 while(rs.next())
                 {
                 arr.add(i+","+rs.getString("roll_no")+","+rs.getString("name")+","+rs.getString("admission_no")+","+rs.getString("marks"));    
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
            out.print("exception: "+et);
        }
               
    }

    
}
