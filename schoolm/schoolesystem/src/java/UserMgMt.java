import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author This PC
 */
@WebServlet(name = "UserMgMt", urlPatterns = {"/UserMgMt"})
public class UserMgMt extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
          StringBuilder adm_nos=new StringBuilder("");
          StringBuilder adm_list=new StringBuilder("");
          StringBuilder student_names=new StringBuilder("");
          StringBuilder student_list=new StringBuilder("");
          Class.forName("com.mysql.jdbc.Driver");
          Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
          Statement stmt=con.createStatement();
        
          ResultSet rs=stmt.executeQuery("select Admission_No from admission_tab");
          while(rs.next())
          {
          adm_nos.append(rs.getString("Admission_No")+",");  
          }
         String []array=new String[20]; 
         List<String> items = Arrays.asList(adm_nos.toString().split(","));
         for(int i=0;i<items.size();i++)
          {
           array[i]=items.get(i);
           adm_list.append(array[i]+",");
          }
         Statement stmt1=con.createStatement();
         for(int j=0;j<items.size();j++){
         ResultSet rs1=stmt1.executeQuery("select Student_Name,Middle_Name, Last_Name from admission_tab WHERE Admission_No='"+array[j]+"'");
         while(rs1.next()){
         student_names.append(rs1.getString("Student_Name")+" "+rs1.getString("Middle_Name")+" "+rs1.getString("Last_Name")+",");  
         }}
         String []array2=new String[20];
         List<String> items2 = Arrays.asList(student_names.toString().split(","));
         for(int i=0;i<items2.size();i++)
         {
           array2[i]=items2.get(i);
           adm_list.append(array2[i]+",");
         }
     
         out.println(adm_list.toString().replaceAll(",$",""));
       
              }
              
         catch(Exception et){
            out.print("exception"+et);
         }
    }

}
