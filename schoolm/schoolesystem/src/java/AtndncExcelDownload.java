

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class AtndncExcelDownload extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/xls");
      
       
        
        PrintWriter out = response.getWriter();
        String filename = "test.xls";   
        String filepath = "F:\\";   
        response.setContentType("application/xls");   
        response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
        FileInputStream fileInputStream = new FileInputStream(filepath + filename);  
            
        int i;   
        while ((i=fileInputStream.read()) != -1) {  
        out.write(i);   
        }   
        fileInputStream.close();   
        out.close();   
}
}