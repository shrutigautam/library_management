import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class ExamResult extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String session1_val=request.getParameter("session1_val");
        String class1_val=request.getParameter("class1_val");
        String section1_val=request.getParameter("section1_val");
        String faculty_code_val=request.getParameter("faculty_code_val");
        String date1_val=request.getParameter("date1_val");
        String all_data=request.getParameter("all_data");
        int count1=Integer.parseInt((request.getParameter("count")));
        String examCode_1=request.getParameter("examCode_1");
        String subject_1=request.getParameter("subject_1");
        String studentsMarks=request.getParameter("MARKS");
        String MARKS2=request.getParameter("MARKS2");
        String []res=all_data.split(",");
       
        String [][]matrix1=new String[count1][4];
        String [][]matrix2=new String[count1][2];
            int t=0,g=0;
            int l=0;
            for(int m=0;m<count1;m++){
             for(int n=0;n<4;n++){
                 if(l<res.length){
                 matrix1[m][n]=res[l];
                 
                }
                else
                break;
                l++;
                }
              }
           Arrays.sort(matrix1, new Comparator<String[]>() {
           public int compare(String[] s1, String[] s2) {
           String numOfKeys1 = s1[3];
           String numOfKeys2 = s2[3];
           return numOfKeys1.compareTo(numOfKeys2);
            }
        });
            
        String []res2=studentsMarks.split(",");
        String []res22=MARKS2.split(",");
        int []arr2=new int[count1];
        for(int i1=0;i1<count1;i1++){
            matrix2[i1][0]=res22[i1];
        }
         for(int i1=0;i1<count1;i1++){
            matrix2[i1][1]=res2[i1];
        }
         
         Arrays.sort(matrix2, new Comparator<String[]>() {
           public int compare(String[] s1, String[] s2) {
           String numOfKeys1 = s1[0];
           String numOfKeys2 = s2[0];
           return numOfKeys1.compareTo(numOfKeys2);
            }
        });
       
        int count2=0;
        try{
         int u;   
         Class.forName("com.mysql.jdbc.Driver");
         Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
         Statement stmt=con.createStatement(); 
         while(count2<count1){
         u=stmt.executeUpdate("insert into Marks_tab values( '"+matrix1[count2][1]+"','"+session1_val+"','"+class1_val+"','"+section1_val+"','"+faculty_code_val+"','"+date1_val+"','"+examCode_1+"','"+subject_1+"','"+matrix2[count2][1]+"','"+matrix1[count2][2]+"','"+matrix1[count2][3]+"')");
         if(u==0){
                 
         }
         else{
                   
         }
                 count2++;
         }
         out.print("successfully inserted"); 
        }
        catch(Exception et){
            
        }
    }

   

}
