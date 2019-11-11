import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class USRMgmtDelete extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
          
           String Uname=request.getParameter("Uname");
           
           Class.forName( "com.mysql.jdbc.Driver");
           Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
           Statement stmt=conn.createStatement(); 
          
            
           int u=stmt.executeUpdate("update usermgmttab set locked='1' WHERE UserName='"+Uname+"'");
          
           if(u==0){
             out.println("oops something went wrong");
           }  
           else
             out.println("user account successfully Locked");  
         
        }
        catch(Exception et){
           out.println("Exception:"+et);     
        }
    }
}
