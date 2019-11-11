

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import static java.sql.JDBCType.NULL;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author sunil
 */
public class schoolInfoSubmit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String school_name="";
    String school_logo="";
    String school_phone_number="";
    String school_web_site="";
    String director_sign="";
    String school_address="";
    
    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
       try{
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                     if(item.isFormField())
                    {
                        if(item.getFieldName().equals("school_name")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((school_name=br.readLine())!=null){
                        sb.append(school_name);
                        }
                        school_name=sb.toString();}
                        
                         if(item.getFieldName().equals("school_phone_number")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((school_phone_number=br.readLine())!=null){
                        sb.append(school_phone_number);
                        }
                       school_phone_number=sb.toString();}
                        
                         if(item.getFieldName().equals("school_web_site")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((school_web_site=br.readLine())!=null){
                        sb.append(school_web_site);
                        }
                        school_web_site=sb.toString();}
                        
                       if(item.getFieldName().equals("school_address")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((school_address=br.readLine())!=null){
                        sb.append(school_address);
                        }
                       school_address=sb.toString();}
                     }
                    if (!item.isFormField()) {                                                     
                      String fileName = item.getName();

                      if(item.getFieldName().equals("school_logo")){
                      File path_emp_P = new File( "F:/schoolDetails");
                        
                        if (!path_emp_P.exists()) {
                            boolean status = path_emp_P.mkdirs();
                             }
                       fileName=school_logo+".JPG";
                     String UPLOADPpath="F:/schoolDetails/" + fileName;
                     File uploadedFile = new File(path_emp_P + "/" + fileName);
                     System.out.println(uploadedFile.getAbsolutePath());
                     item.write(uploadedFile);}
                  
                     school_logo=fileName;
                }
                     
                     if (!item.isFormField()) {                                                     
                      String fileName = item.getName();

                      if(item.getFieldName().equals("director_sign")){
                      File path_emp_P = new File( "F:/schoolDetails");
                        
                        if (!path_emp_P.exists()) {
                            boolean status = path_emp_P.mkdirs();
                             }
                     fileName=director_sign+".JPG";
                     String UPLOADPpath="F:/schoolDetails/" + fileName;
                     File uploadedFile = new File(path_emp_P + "/" + fileName);
                     System.out.println(uploadedFile.getAbsolutePath());
                     item.write(uploadedFile);}
                  
                     director_sign=fileName;
                }
                }
        }}
                catch(Exception e){
                        
                        }
    
try{
  
         
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement stmt=con.createStatement();
int u=stmt.executeUpdate("Insert INTO school_info_tab(school_name,school_logo,school_address,school_phn_no,Director_sign,school_website) values('"+school_name+"','"+school_logo+"','"+school_address+"','"+school_phone_number+"','"+director_sign+"','"+school_web_site+"')");   
if(u==0){
    out.println("oops something went wrong");
        }
        else{
     response.sendRedirect("popUpCorrect");
     }   
     }

catch(Exception et){
      out.println("An Exception occurred:"+et);
}
 
}}










