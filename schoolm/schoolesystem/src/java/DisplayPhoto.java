
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "DisplayPhoto", urlPatterns = {"/DisplayPhoto"})
public class DisplayPhoto extends HttpServlet {

        @Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
	response.setContentType("image/jpeg");
	ServletOutputStream out;
	out = response.getOutputStream();
        HttpSession session = request.getSession();
        String admn=(String)session.getAttribute("ADMN");
        String ab,path=request.getServletContext().getRealPath("/").replace("\\","/")+"../../fileUpload/";
        //out.print(path);
        if(request.getParameterMap().containsKey("admn")) 
            admn = request.getParameter("admn");
        ab=path+"photo/"+admn+".JPG";
            
        
       // String ab;
      //  ab=(String)(session.getAttribute("path_photo"))+admn+".JPG";
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
        response.sendRedirect("Admission_1.jsp");
	}
	}