import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.*;

@WebServlet(name = "upload_docPhoto", urlPatterns = {"/upload_docPhoto"})
 
public class upload_docPhoto extends HttpServlet {
    private static final long serialVersionUID = -3208409086358916855L;
    String PhotoRadioReq="";
    String  PSel="";
    String TCMREQ="";
    String TSEL="";
    String ReqMArkSRReq="";
    String MSel="";
    String ReqBirthCRReq="";
    String BSel="";
    String ReqCharacterCR="";
    String ReqCasteCR="";
    String CSel="";
    String Ctsel="";
    String ReqDomicileCR="";
    String DSel=""; 
    String PhotoReq="";
    String UPLOADPpath="";
    String UPLOADMigpath="";
    String UPLOADMarkpath="";
    String UPLOADBirthpath="";
    String UPLOADCharpath="";
    String UPLOADCastepath="";
    String UPLOADDomicilepath="";
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        PrintWriter out=response.getWriter();
         response.setContentType("text/html");
        HttpSession session = request.getSession();
        String admn=(String)session.getAttribute("ADMN");
        
try {
    
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();

                   
                     if(item.isFormField())
                    {
                        if(item.getFieldName().equals("ReqSubphotoR")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        StringBuilder sb=new StringBuilder();
                        while((PhotoReq=br.readLine())!=null){
                        sb.append(PhotoReq);
                        }
                        PhotoRadioReq=sb.toString();}
                        if(item.getFieldName().equals("Psel")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String Psel="";
                        StringBuilder sb1=new StringBuilder();
                        while((Psel=br.readLine())!=null){
                           sb1.append(Psel); 
                        }
                        PSel=sb1.toString();
                        }
                        if(item.getFieldName().equals("ReqSubtcMR")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String TCMRReq="";
                        StringBuilder sb2=new StringBuilder();
                        while((TCMRReq=br.readLine())!=null){
                           sb2.append(TCMRReq); 
                        }
                        TCMREQ=sb2.toString();
                        }
                        if(item.getFieldName().equals("Tsel")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String TSel="";
                        StringBuilder sb3=new StringBuilder();
                        while((TSel=br.readLine())!=null){
                          sb3.append(TSel);
                        }
                        TSEL=sb3.toString();
                        }
                        if(item.getFieldName().equals("ReqSubMarkSR")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String ReqMarkSRReq="";
                        StringBuilder sb4=new StringBuilder();
                        while((ReqMarkSRReq=br.readLine())!=null){
                        sb4.append(ReqMarkSRReq);
                        }
                        ReqMArkSRReq=sb4.toString();
                        }
                        if(item.getFieldName().equals("Msel")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String Msel="";
                        StringBuilder sb5=new StringBuilder();
                        while((Msel=br.readLine())!=null){
                            sb5.append(Msel);
                        }
                       MSel=sb5.toString();
                        }
                        if(item.getFieldName().equals("ReqSubbirthCR")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String ReqbirthCRReq="";
                        StringBuilder sb6=new StringBuilder();
                        while((ReqbirthCRReq=br.readLine())!=null){
                            sb6.append(ReqbirthCRReq);
                       }
                       ReqBirthCRReq=sb6.toString();
                       }
                        if(item.getFieldName().equals("Bsel")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String Bsel="";
                        StringBuilder sb7=new StringBuilder();
                        while((Bsel=br.readLine())!=null){
                            sb7.append(Bsel);
                        }
                       BSel=sb7.toString();
                       }
                        if(item.getFieldName().equals("ReqSubcharacterCR")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String ReqcharacterCR="";
                        StringBuilder sb8=new StringBuilder();
                        
                        while((ReqcharacterCR=br.readLine())!=null){
                             sb8.append(ReqcharacterCR);
                        }
                       ReqCharacterCR=sb8.toString();
                       }
                        if(item.getFieldName().equals("Csel")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String Csel="";
                        StringBuilder sb9=new StringBuilder();
                        while((Csel=br.readLine())!=null){
                             sb9.append(Csel);
                        }
                       CSel=sb9.toString();
                       }
                       if(item.getFieldName().equals("ReqSubcasteCR")){
                       BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                       String ReqcasteCR="";
                       StringBuilder sb10=new StringBuilder();
                        while((ReqcasteCR=br.readLine())!=null){
                            sb10.append(ReqcasteCR);
                         }
                        ReqCasteCR=sb10.toString();
                       }
                                
                       if(item.getFieldName().equals("Ctsel")){
                       BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                       String ctsel="";
                       StringBuilder sb11=new StringBuilder();
                       while((ctsel=br.readLine())!=null){
                            sb11.append(ctsel);
                          
                        }
                        Ctsel=sb11.toString();
                        }
                        if(item.getFieldName().equals("ReqSubdomicileCR")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String ReqdomicileCR="";
                        StringBuilder sb12=new StringBuilder();
                        while((ReqdomicileCR=br.readLine())!=null){
                             sb12.append(ReqdomicileCR);
                        }
                        ReqDomicileCR=sb12.toString();
                        } 
                        if(item.getFieldName().equals("Dsel")){
                        BufferedReader br=new BufferedReader(new InputStreamReader(item.getInputStream()));
                        String Dsel="";
                        StringBuilder sb13=new StringBuilder();
                        while((Dsel=br.readLine())!=null){
                            sb13.append(Dsel);
                        }
                        DSel=sb13.toString();
                       }       
                    }
                     if (!item.isFormField()) {                                                     
                      String fileName = item.getName();

                      if(item.getFieldName().equals("photoF")){
                      File pathP = new File( "F:/uploadPhotoDocs");
                        
                        if (!pathP.exists()) {
                            boolean status = pathP.mkdirs();
                             }
                       fileName=admn+".JPG";
                      UPLOADPpath="F:/uploadPhotoDocs/" + fileName;
                      File uploadedFile = new File(pathP + "/" + fileName);
                      System.out.println(uploadedFile.getAbsolutePath());
                      item.write(uploadedFile);}
         //--------------------------------------------------------------------------------             
                      if(item.getFieldName().equals("MigrationF"))
                      {
                        File pathM = new File( "F:/uploadTCDocs");
                        if (!pathM.exists()) {
                            boolean status = pathM.mkdirs();
                             }
                        fileName=admn+".JPG";
                       UPLOADMigpath="F:/uploadTCDocs/" + fileName;
                       File uploadedFileM = new File(pathM + "/" + fileName);
                       System.out.println(uploadedFileM.getAbsolutePath());
                       item.write(uploadedFileM);
                      }
        //---------------------------------------------------------------------------------                  
                      
                      if(item.getFieldName().equals("MarkF"))
                      {
                        File pathMark = new File("F:/uploadMarkDocs");
                        
                        if (!pathMark.exists()) {
                            boolean status = pathMark.mkdirs();
                             }
                       fileName=admn+".JPG";
                        UPLOADMarkpath="F:/uploadMarkDocs/" + fileName;
                       File uploadedFileMark = new File(pathMark + "/" + fileName);
                       System.out.println(uploadedFileMark.getAbsolutePath());
                       item.write(uploadedFileMark);
                      }
       //-----------------------------------------------------------------------------------                
                      
                      if(item.getFieldName().equals("birthF"))
                      {
                        File pathBirth = new File( "F:/uploadBirthCDocs");
                        if (!pathBirth.exists()) {
                            boolean status = pathBirth.mkdirs();
                             }
                       fileName=admn+".JPG";
                       UPLOADBirthpath="F:/uploadBirthCDocs/" + fileName;
                       File uploadedBirth = new File(pathBirth + "/" + fileName);
                       System.out.println(uploadedBirth.getAbsolutePath());
                       item.write(uploadedBirth);
                      }
   //--------------------------------------------------------------------------------------                      
                       

                      if(item.getFieldName().equals("charF"))
                      {
                        File pathChar = new File( "F:/uploadCharCDocs");
                        
                        if (!pathChar.exists()) {
                            boolean status = pathChar.mkdirs();
                             }
                        fileName=admn+".JPG";
                       UPLOADCharpath="F:/uploadCharCDocs/" + fileName;
                       File uploadedChar = new File(pathChar + "/" + fileName);
                       System.out.println(uploadedChar.getAbsolutePath());
                       item.write(uploadedChar);
                      }
   //-------------------------------------------------------------------------------------                   
                     
                      if(item.getFieldName().equals("casteF"))
                      {
                        File pathCaste = new File( "F:/uploadCasteCDocs");
                        
                        if (!pathCaste.exists()) {
                            boolean status = pathCaste.mkdirs();
                             }
                        fileName=admn+".JPG";
                        
                        UPLOADCastepath="F:/uploadCasteCDocs" + fileName;
                        File uploadedCaste = new File(pathCaste + "/" + fileName);
                        System.out.println(uploadedCaste.getAbsolutePath());
                        item.write(uploadedCaste);
                      }
 //----------------------------------------------------------------------------------------                       
                      
                        
                    if(item.getFieldName().equals("domicileF"))
                    {  
                        File pathDomicile = new File( "F:/uploadDomicileCDocs");
                        
                        if (!pathDomicile.exists()) {
                            boolean status = pathDomicile.mkdirs();
                             }
                        fileName=admn+".JPG";
                        UPLOADDomicilepath="F:/uploadDomicileCDocs/" + fileName;
                        File uploadedDomicile = new File(pathDomicile + "/" + fileName);
                        System.out.println(uploadedDomicile.getAbsolutePath());
                        item.write(uploadedDomicile);
                       
                    }                
                      
                    }    
                         //String message="successfully uploaded";
                         //request.setAttribute("message_doc",message);
                         //request.getRequestDispatcher("Admission.jsp").forward(request, response); 
                         //response.sendRedirect("dbStoreDoc");            
                       
                    }
                      
                }
               
        }
catch (Exception e) {
out.print(e);
}
try{
// out.println(PhotoRadioReq);
// out.println(PSel);
// out.println(TCMREQ);
// out.println(TSEL);
// out.println(ReqMArkSRReq);
// out.println(MSel);
// out.println(ReqBirthCRReq);
// out.println(BSel);
// out.println(ReqCharacterCR);
// out.println(ReqCasteCR);
// out.println(CSel);
// out.println(Ctsel);
// out.println(ReqDomicileCR);
// out.println(DSel);
// out.println(UPLOADPpath);
// out.println(UPLOADMigpath);
// out.println(UPLOADMarkpath);
// out.println(UPLOADBirthpath);
// out.println(UPLOADCharpath);
// out.println(UPLOADCastepath);
// out.println(UPLOADDomicilepath);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement stmt=con.createStatement();
int u=stmt.executeUpdate("UPDATE document_check_list SET isReqisSubP='"+PhotoRadioReq+"',isReqisSubT='"+TCMREQ+"',"
        + "isReqisSubM='"+ReqMArkSRReq+"',isReqisSubB='"+ReqBirthCRReq+"',isReqisSubC='"+ReqCharacterCR+"',isReqisSubCt='"+ReqCasteCR+"',isReqisSubD='"+ReqDomicileCR+"',"
        + "PphotoCOrg='"+PSel+"',TphotoCOrg='"+TSEL+"',MphotoCOrg='"+MSel+"',BphotoCOrg='"+BSel+"',CphotoCOrg='"+CSel+"',"
        + "CtphotoCOrg='"+Ctsel+"',DphotoCOrg='"+DSel+"',UploadP='"+UPLOADPpath+"',UploadT='"+UPLOADMigpath+"',UploadM='"+UPLOADMarkpath+"',UploadB='"+UPLOADBirthpath+"',"
        + "UploadC='"+UPLOADCharpath+"',UploadCt='"+UPLOADCastepath+"',UploadD='"+UPLOADDomicilepath+"' WHERE admission_no='"+admn+"'");
        if(u==0){
           // out.println("oops something went wrong");
              out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"popUpCss.css\"  /> ");
     out.println("<script src=\"jquery-1.2.6.min.js\" type=\"text/javascript\"></script>");
     out.println("<script type=\"text/javascript\">");
     out.println("$(document).ready( function() {");
     out.println(" loadPopupBox();");
     out.println("$('#popupBoxClose').click( function() {");
     out.println("unloadPopupBox();");
     out.println(" });");
     out.println(" $('#container').click( function() {");
     out.println(" unloadPopupBox();");
     out.println(" });");
     out.println("function unloadPopupBox() {  ");
     out.println("$('#popup_box').fadeOut(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"1\" ");
     out.println("});");
     out.println("} ");
     out.println("function loadPopupBox() {  ");
     out.println("$('#popup_box').fadeIn(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"0.3\" ");
     out.println("});");
     out.println("}");
     out.println("});");
     out.println("</script>");
     
     out.println("<div id=\"popup_box\"> ");
     out.println("<h3><center>Something went wrong</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
        }
        
        else{
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"popUpCss.css\"  /> ");
     out.println("<script src=\"jquery-1.2.6.min.js\" type=\"text/javascript\"></script>");
     out.println("<script type=\"text/javascript\">");
     out.println("$(document).ready( function() {");
     out.println(" loadPopupBox();");
     out.println("$('#popupBoxClose').click( function() {");
     out.println("unloadPopupBox();");
     out.println(" });");
     out.println(" $('#container').click( function() {");
     out.println(" unloadPopupBox();");
     out.println(" });");
     out.println("function unloadPopupBox() {  ");
     out.println("$('#popup_box').fadeOut(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"1\" ");
     out.println("});");
     out.println("} ");
     out.println("function loadPopupBox() {  ");
     out.println("$('#popup_box').fadeIn(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"0.3\" ");
     out.println("});");
     out.println("}");
     out.println("});");
     out.println("</script>");
     
     out.println("<div id=\"popup_box\"> ");
     out.println("<h3><center>Sucessfully Inserted</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
            //  String message="successfully uploaded";
             //  request.setAttribute("message_doc",message);
            // request.getRequestDispatcher("Admission.jsp").forward(request, response); 
                
        }   
        }

catch(Exception et){
      out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"popUpCss.css\"  /> ");
     out.println("<script src=\"jquery-1.2.6.min.js\" type=\"text/javascript\"></script>");
     out.println("<script type=\"text/javascript\">");
     out.println("$(document).ready( function() {");
     out.println(" loadPopupBox();");
     out.println("$('#popupBoxClose').click( function() {");
     out.println("unloadPopupBox();");
     out.println(" });");
     out.println(" $('#container').click( function() {");
     out.println(" unloadPopupBox();");
     out.println(" });");
     out.println("function unloadPopupBox() {  ");
     out.println("$('#popup_box').fadeOut(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"1\" ");
     out.println("});");
     out.println("} ");
     out.println("function loadPopupBox() {  ");
     out.println("$('#popup_box').fadeIn(\"slow\");");
     out.println("$(\"#container\").css({ ");
     out.println("\"opacity\": \"0.3\" ");
     out.println("});");
     out.println("}");
     out.println("});");
     out.println("</script>");
     
     out.println("<div id=\"popup_box\"> ");
     out.println("<h3><center>INVALID</center></h3>");
     out.println("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
     out.println("</div>");
     
     RequestDispatcher rd = request.getRequestDispatcher("Admission_1.jsp");   // S2 is the alias name of second Servlet, Billing
    
                                 // send the client data available with req of S1 (Accounts) to req of S2 (Billing) with include()
     rd.include(request, response);
}
 
}}
















