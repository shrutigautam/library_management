
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

/**
 *
 * @author Saumya Joshi
 */
public class DisPic extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/jpeg");
	ServletOutputStream out;
	out = response.getOutputStream();
        HttpSession LoginSession = request.getSession();
        String ab;
        ab="F:\\photo\\fileUploads\\photo1\\"+ LoginSession.getAttribute("USERCODE")+".JPG";
        
        
         
        
        
        FileInputStream fin = new FileInputStream(ab);
	
	BufferedInputStream bin = new BufferedInputStream(fin);
	BufferedOutputStream bout = new BufferedOutputStream(out);
	int ch =0; ;
	while((ch=bin.read())!=-1)
	{
	bout.write(ch);
        bout.flush();
	}
        
       
	bin.close();
	fin.close();
	bout.close();
	out.close();

        response.sendRedirect("studentDashboard.jsp");
	}
	}