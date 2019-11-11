package package1;

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
public class ExamSubSelect extends HttpServlet {
   public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
          String subjects="";
          StringBuilder subject_id_list=new StringBuilder("");
          StringBuilder subject_names=new StringBuilder("");
          StringBuilder subject_list=new StringBuilder("");
          String ExamCode=request.getParameter("ExamCode");
          String session1=request.getParameter("session1");
          String class1=request.getParameter("class1");
          Class.forName("com.mysql.jdbc.Driver");
          Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
          Statement stmt=con.createStatement();
          ResultSet rs=stmt.executeQuery("select subject from exam_tab WHERE session='"+session1+"' AND class='"+class1+"' AND exam_code='"+ExamCode+"'");
          while(rs.next())
          {
          subjects=rs.getString("subject");  
          }
         String []array=new String[20]; 
         List<String> items = Arrays.asList(subjects.split(","));
         for(int i=0;i<items.size();i++)
          {
           array[i]=items.get(i);
          }
         array[items.size()-1]=array[items.size()-1].replace(",", "");
         for(int k=0;k<items.size();k++){
         subject_id_list.append(array[k]+" ");
         }
         Statement stmt1=con.createStatement();
         for(int j=0;j<items.size();j++){
         ResultSet rs1=stmt1.executeQuery("select subject_id, subject_name from subject_tab WHERE subject_id='"+array[j]+"'");
         while(rs1.next()){
         subject_names.append(rs1.getString("subject_name")+",");  
         }}
         String []array2=new String[20];
         List<String> items2 = Arrays.asList(subject_names.toString().split(","));
         for(int i=0;i<items2.size();i++)
         {
           array2[i]=items2.get(i);
         }
         for(int k=0;k<items2.size();k++){
         subject_list.append(array2[k]+" ");
         }
         out.println(subject_id_list+""+subject_list);
         }
         catch(Exception et){
            out.print("exception"+et);
         }
    }
}
