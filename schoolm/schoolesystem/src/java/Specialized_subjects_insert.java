import java.io.*;  
import java.io.*;  
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Specialized_subjects_insert extends HttpServlet {  
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html"); 
PrintWriter out=response.getWriter();
try{
String []array=new String[100];
String []array1=new String[100];
String employee_id=request.getParameter("empl_id");
String subjects_sel=request.getParameter("sbz_subs");
int k=0;
List<String> items = Arrays.asList(subjects_sel.split(",<br/>,"));
for(int i=0;i<items.size();i++)
{
    array[i]=items.get(i);
   
    
}
array[items.size()-1]=array[items.size()-1].replace(",<br/>", "");
if(items.size()<=20){
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement stmt=con.createStatement();
int x=stmt.executeUpdate("UPDATE employee_select_subject SET sub_1='"+array[0]+"',sub_2='"+array[1]+"',sub_3='"+array[2]+"',"
                    + "sub_4='"+array[3]+"',sub_5='"+array[4]+"',sub_6='"+array[5]+"',sub_7='"+array[6]+"',"
                    + "sub_8='"+array[7]+"'  WHERE employee_id='"+employee_id+"'");
          
            if(x==0)  
            {
            out.print("not updated");
            }
            else{
            out.println("successfully updated");
            }
    

}
else{
    out.println("maximum number of subjects selected can be 8");
  
}
}

    catch(ArrayIndexOutOfBoundsException et){
        out.print("maximum number of subjects selected can be 8");
    }    
catch (Exception et)
        {
           out.print("maximum number of subjects selected can be 8");
        }
      
}}
  
 
