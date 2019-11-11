import java.io.File;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(name = "UploadSign", urlPatterns = {"/UploadSign"})
public class UploadSign extends HttpServlet{
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
	HttpSession session = request.getSession();
	doRequest(session, request, response);
    }
    
    private void doRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter pw=response.getWriter();
        
      
	session.setAttribute("href", null);
	session.setAttribute("dir", "");
        String p=(String)session.getAttribute("ADMN");
        
	boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
	if(isMultipartContent) {
	    FileItemFactory factory = new DiskFileItemFactory();
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    try {
                List<FileItem> fields = upload.parseRequest(request); 
		Iterator<FileItem> it = fields.iterator();
                FileItem fileItem = null; // variable used to hold the file when it is found
		if(!it.hasNext()) {
		    throw new Exception("No fields provided");
		}
		while(it.hasNext()) {
		    // loop through each field
		    FileItem field = it.next();
		    if(field.isFormField()) {
			String fieldName = field.getFieldName();
			String fieldValue = field.getString();
			if(fieldName.equals("dir")) {
			    session.setAttribute("dir", fieldValue);
			}
		    }
		    else {
			// this is the file since it is not a form field
			fileItem = field;
		    }
		}
		
		// No file was actually provided
		if(fileItem == null) {
		   throw new Exception("Not a File"); 
		}
		
		// check the file extension is allowed
		if( !(fileItem.getName().endsWith(".JPG") || fileItem.getName().endsWith(".jpg"))) {
		    throw new Exception("Not an allowed file type");                                  
		}
		String path = request.getServletContext().getRealPath("/").replace("\\","/");
		String fileUploadPath = path+"../../fileUpload/sign/";
                session.setAttribute("path_sign",fileUploadPath);  
		File fileUploadDir = new File(fileUploadPath);
		if(!fileUploadDir.exists()) {
		    fileUploadDir.mkdirs();
		}
		
		// make a valid file name
		//String fileName = fileItem.getName().substring(0,fileItem.getName().length() - 4)
		//		    .replace(" ", "_").replace("%", "_").replace(".","_");
		String fileName =p;
                //pw.println(fileName);
		File uploadedFile = new File(fileUploadPath + fileName+".JPG");
		//pw.println(uploadedFile);
		fileItem.write(uploadedFile); //save uploaded file
		fileItem.delete(); // remove file item from memory
		//pw.println("You successfully uploaded the file");
                
                //String message="successfully uploaded"+fileName+".JPG";
                //request.setAttribute("message2",message);
                //request.getRequestDispatcher("Admission.jsp").forward(request, response);
                
		//session.setAttribute("href", "<b>You succesfully uploaded:</b> " + fileName + ".JPG<br /><b>to:</b> " + dir + "/");
	       response.sendRedirect("sign_db_store");    
	    } catch(Exception e) {
		session.setAttribute("href", e.getMessage());
	    }
            
	   
	  
	}
	
    }
    
     // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

 
