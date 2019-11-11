import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class DisplayEmployeeImage extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        response.setContentType("image/jpeg");
	ServletOutputStream out1;
	out1 = response.getOutputStream();
        HttpSession session = request.getSession();
        String ab;
        ab="F:\\photo\\fileUploads\\employee_photo\\"+session.getAttribute("EMPLID")+".JPG";
        FileInputStream fin = new FileInputStream(ab);
	BufferedInputStream bin = new BufferedInputStream(fin);
	BufferedOutputStream bout = new BufferedOutputStream(out1);
	int ch =0; ;
	while((ch=bin.read())!=-1)
	{
	bout.write(ch);
         bout.flush();
	}
        bin.close();
	fin.close();
	bout.close();
	out1.close();
        response.sendRedirect("employee.jsp");
	}
	}
        }
    

   