import java.io.File;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet(name = "UploadThumb", urlPatterns = {"/UploadThumb"})
public class UploadThumb extends HttpServlet{
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
	HttpSession session = request.getSession();
	doRequest(session, request, response);
    }
    
    private void doRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter pw=response.getWriter();
        
        // reset session attributes
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
		if( !(fileItem.getName().endsWith(".jpg") || fileItem.getName().endsWith(".JPG"))) {
		    throw new Exception("Not an allowed file type");                                  
		}
		
		String path = request.getServletContext().getRealPath("/").replace("\\","/");
		String fileUploadPath = path+"../../fileUpload/thumb/";
                session.setAttribute("path_thumb",fileUploadPath);  
                  
		
		File fileUploadDir = new File(fileUploadPath);
		if(!fileUploadDir.exists()) {
		    fileUploadDir.mkdirs();
		}
		String fileName =p;
                File uploadedFile = new File(fileUploadPath + fileName+".JPG");
                fileItem.write(uploadedFile); //save uploaded file
		fileItem.delete(); // remove file item from memory
		response.sendRedirect("thumb_db_store");    
	    } catch(Exception e) {
		
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

 
