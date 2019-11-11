import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class UserMgMtEmp extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
          StringBuilder emp_nos=new StringBuilder("");
          StringBuilder emp_list=new StringBuilder("");
          StringBuilder emp_names=new StringBuilder("");
          StringBuilder emp_name_list=new StringBuilder("");
          Class.forName("com.mysql.jdbc.Driver");
          Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
          Statement stmt=con.createStatement();
          ResultSet rs=stmt.executeQuery("select empl_code from employee_tab");
          while(rs.next())
          {
          emp_nos.append(rs.getString("empl_code")+",");  
          }
          String []array=new String[20]; 
          List<String> items = Arrays.asList(emp_nos.toString().split(","));
          for(int i=0;i<items.size();i++)
          {
           array[i]=items.get(i);
           emp_list.append(array[i]+",");
          }
         Statement stmt1=con.createStatement();
         for(int j=0;j<items.size();j++){
         ResultSet rs1=stmt1.executeQuery("select empl_name from employee_tab WHERE empl_code='"+array[j]+"'");
         while(rs1.next()){
         emp_names.append(rs1.getString("empl_name")+",");  
         }}
         String []array2=new String[20];
         List<String> items2 = Arrays.asList(emp_names.toString().split(","));
         for(int i=0;i<items2.size();i++)
         {
           array2[i]=items2.get(i);
           emp_list.append(array2[i]+",");
         }
     
         out.println(emp_list.toString().replaceAll(",$",""));
        }
        catch(Exception et){
            
        }
    }
}
