
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "DisplaySign", urlPatterns = {"/DisplaySign"})
public class DisplaySign extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
	response.setContentType("image/jpeg");
	ServletOutputStream out;
	out = response.getOutputStream();         
        HttpSession session = request.getSession();
        String ab;
        ab=(String)(session.getAttribute("path_sign"))+session.getAttribute("ADMN")+".JPG";
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
       
        response.sendRedirect("Admission.jsp");
	}
	}