import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class AttendanceResult extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
            /* TODO output your page here. You may use following sample code. */
            String session1_val=request.getParameter("session1_val");
            String class1_val=request.getParameter("class1_val");
            String section1_val=request.getParameter("section1_val");
            String faculty_code_val=request.getParameter("faculty_code_val");
            String date1_val=request.getParameter("date1_val");
            String all_data=request.getParameter("all_data");
            int count1=Integer.parseInt(request.getParameter("count1"));
            String student_status =request.getParameter("student_status");
            
            String []res2=student_status.split(",");
            String chk_arr[]=new String[count1];
            PrintWriter out=response.getWriter();
            
           
            String []res=all_data.split(",");
            String [][]matrix1=new String[count1][4];
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
            int val1;
            for(int k=0;k<count1;k++){
              val1=Integer.parseInt(matrix1[k][3]);
              for (String value : res2) {
                   if(Integer.parseInt(value)==val1){
                       chk_arr[k]="P";
                       break;
                   }
                   else
                   {
                       chk_arr[k]="A";   
                   }
            }
            }
            int count2=0;
            try{
                 int u;
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 while(count2<count1){
                // out.print(" chk_arr[k]: "+ chk_arr[count2]);
                 u=stmt.executeUpdate("insert into attendance_tab values( '"+matrix1[count2][1]+"','"+matrix1[count2][2]+"','"+matrix1[count2][3]+"','"+chk_arr[count2]+"','"+session1_val+"','"+class1_val+"','"+section1_val+"','"+date1_val+"','"+faculty_code_val+"')");
                
                 if(u==0){
                 
     
                    
                
                 }
                 else
                 {
                   
                 }
                 count2++;
                 }
            out.println("Inserted"+student_status);
            }
            catch(Exception et){
                  
     
                  
            }
        }
    }

  