
package package1;

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
public class employee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String employee_id="";
    String empl_name="";
    String empl_fname="";
    String empl_spouse="";
    String empl_dob="";
    String empl_category="";
    String empl_mstatus="";
    String empl_gender="";
    String empl_email="";
    String empl_pan_no="";
    String empl_phone="";
    String empl_mobile="";
    String empl_permanent_address="";
    String empl_p_city=""; 
    String empl_p_state="";
    String empl_p_pin="";
    String empl_t_address="";
    String check_box="";
    String empl_t_city="";
    String empl_t_state="";
    String empl_t_pin="";
    String empl_dept="";
    String empl_designation="";
    String empl_code="";
    String empl_j_date="";
    String empl_type="";
    String empl_b_salary="";
    String empl_photo="";
    String empl_status="";
    String staff_type="";
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
                        if(item.getFieldName().equals("employee_id")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((employee_id=br.readLine())!=null){
                        sb.append(employee_id);
                        }
                        employee_id=sb.toString();}
                        
                         if(item.getFieldName().equals("empl_name")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_name=br.readLine())!=null){
                        sb.append(empl_name);
                        }
                        empl_name=sb.toString();}
                        
                         if(item.getFieldName().equals("empl_fname")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_fname=br.readLine())!=null){
                        sb.append(empl_fname);
                        }
                        empl_fname=sb.toString();}
                        
                          if(item.getFieldName().equals("empl_spouse")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_spouse=br.readLine())!=null){
                        sb.append(empl_spouse);
                        }
                        empl_spouse=sb.toString();}
                        
                         if(item.getFieldName().equals("empl_dob")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_dob=br.readLine())!=null){
                        sb.append(empl_dob);
                        }
                        empl_dob=sb.toString();}
                        
                         if(item.getFieldName().equals("empl_category")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_category=br.readLine())!=null){
                        sb.append(empl_category);
                        }
                        empl_category=sb.toString();}
                        
                          if(item.getFieldName().equals("empl_mstatus")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_mstatus=br.readLine())!=null){
                        sb.append(empl_mstatus);
                        }
                        empl_mstatus=sb.toString();}
                        
                           if(item.getFieldName().equals("empl_gender")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_gender=br.readLine())!=null){
                        sb.append(empl_gender);
                        }
                        empl_gender=sb.toString();}
                        
                            if(item.getFieldName().equals("empl_email")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_email=br.readLine())!=null){
                        sb.append(empl_email);
                        }
                        empl_email=sb.toString();}
                        
                             if(item.getFieldName().equals("empl_pan_no")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_pan_no=br.readLine())!=null){
                        sb.append(empl_pan_no);
                        }
                        empl_pan_no=sb.toString();}
                        
                              if(item.getFieldName().equals("empl_phone")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_phone=br.readLine())!=null){
                        sb.append(empl_phone);
                        }
                        empl_phone=sb.toString();}
                        
                               if(item.getFieldName().equals("empl_mobile")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_mobile=br.readLine())!=null){
                        sb.append(empl_mobile);
                        }
                        empl_mobile=sb.toString();}
                        
                                if(item.getFieldName().equals("empl_permanent_address")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_permanent_address=br.readLine())!=null){
                        sb.append(empl_permanent_address);
                        }
                        empl_permanent_address=sb.toString();}
                        
                                 if(item.getFieldName().equals("empl_p_city")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_p_city=br.readLine())!=null){
                        sb.append(empl_p_city);
                        }
                        empl_p_city=sb.toString();}
                        
                                  if(item.getFieldName().equals("empl_p_state")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_p_state=br.readLine())!=null){
                        sb.append(empl_p_state);
                        }
                       empl_p_state=sb.toString();}
                        
                                   if(item.getFieldName().equals("empl_p_pin")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_p_pin=br.readLine())!=null){
                        sb.append(empl_p_pin);
                        }
                        empl_p_pin=sb.toString();}
                        
                                    if(item.getFieldName().equals("empl_t_address")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_t_address=br.readLine())!=null){
                        sb.append(empl_t_address);
                        }
                        empl_t_address=sb.toString();}
                        
                                     if(item.getFieldName().equals("empl_t_city")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_t_city=br.readLine())!=null){
                        sb.append(empl_t_city);
                        }
                        empl_t_city=sb.toString();}
                        
                                      if(item.getFieldName().equals("empl_t_state")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_t_state=br.readLine())!=null){
                        sb.append(empl_t_state);
                        }
                        empl_t_state=sb.toString();}
                        
                                       if(item.getFieldName().equals("empl_t_pin")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_t_pin=br.readLine())!=null){
                        sb.append(empl_t_pin);
                        }
                        empl_t_pin=sb.toString();}
                        
                                        if(item.getFieldName().equals("empl_dept")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_dept=br.readLine())!=null){
                        sb.append(empl_dept);
                        }
                        empl_dept=sb.toString();}
                        
                                         if(item.getFieldName().equals("empl_designation")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_designation=br.readLine())!=null){
                        sb.append(empl_designation);
                        }
                        empl_designation=sb.toString();}
                        
                                          if(item.getFieldName().equals("empl_code")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_code=br.readLine())!=null){
                        sb.append(empl_code);
                        }
                        empl_code=sb.toString();}
                        
                                           if(item.getFieldName().equals("empl_j_date")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_j_date=br.readLine())!=null){
                        sb.append(empl_j_date);
                        }
                        empl_j_date=sb.toString();}
                        
                        if(item.getFieldName().equals("empl_type")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_type=br.readLine())!=null){
                        sb.append(empl_type);
                        }
                        empl_type=sb.toString();}
                                           
                        if(item.getFieldName().equals("staff_type")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((staff_type=br.readLine())!=null){
                        sb.append(staff_type);
                        }
                        staff_type=sb.toString();}
                        
                                             if(item.getFieldName().equals("empl_b_salary")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_b_salary=br.readLine())!=null){
                        sb.append(empl_b_salary);
                        }
                        empl_b_salary=sb.toString();}
                                             
                                             if(item.getFieldName().equals("empl_status")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((empl_status=br.readLine())!=null){
                        sb.append(empl_status);
                        }
                        empl_status=sb.toString()+"YOYO";}
                        
                                              if(item.getFieldName().equals("check_box")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((check_box=br.readLine())!=null){
                        sb.append(check_box);
                        }
                        check_box=sb.toString();}
                     }
                    if (!item.isFormField()) {                                                     
                      String fileName = item.getName();

                      if(item.getFieldName().equals("empl_photo")){
                      File path_emp_P = new File( "F:/employee_photo");
                        
                        if (!path_emp_P.exists()) {
                            boolean status = path_emp_P.mkdirs();
                             }
                       fileName=employee_id+".JPG";
                     String UPLOADPpath="F:/employee_photo/" + fileName;
                     File uploadedFile = new File(path_emp_P + "/" + fileName);
                     System.out.println(uploadedFile.getAbsolutePath());
                     item.write(uploadedFile);}
                  
                     empl_photo=fileName;
                }
                
                }
        }}
                catch(Exception e){
                        
                        }
    
try{
  
      HttpSession session = request.getSession();
            session.setAttribute("EMPLID", employee_id);   
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
String query="{CALL employee_details_pro(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";  
CallableStatement stmt=con.prepareCall(query);
            stmt.setString(1,employee_id);
            stmt.setString(2,empl_name);
            stmt.setString(3,empl_fname);
            stmt.setString(4,empl_spouse);
            stmt.setString(5,empl_dob);
            stmt.setString(6,empl_category);
            stmt.setString(7,empl_mstatus);
            stmt.setString(8,empl_gender);
            stmt.setString(9,empl_email);
            stmt.setString(10,empl_pan_no);
            stmt.setString(11,empl_phone);
            stmt.setString(12,empl_mobile);
            stmt.setString(13,empl_p_city);
            stmt.setString(14,empl_p_state);
            stmt.setString(15,empl_p_pin);
            stmt.setString(16,empl_permanent_address);
            stmt.setString(17,empl_t_city);
            stmt.setString(18,empl_t_state);
            stmt.setString(19,empl_t_pin);
            stmt.setString(20,empl_t_address);
            stmt.setString(21,empl_dept);
            stmt.setString(22,empl_designation);
            stmt.setString(23,empl_code);
            stmt.setString(24,staff_type);
            stmt.setString(25,empl_j_date);
            stmt.setString(26,empl_status);
            stmt.setString(27,empl_type);
            stmt.setString(28,empl_b_salary);
            stmt.setString(29,empl_photo);
           
   int u=stmt.executeUpdate();
if(u==0){
     out.println("oops something went wrong");
        }
        else{
     response.sendRedirect("emplPopUpCorrect");
     }   
     }

catch(Exception et){
     out.println("An Exception occurred:"+et);
}
 
}}










