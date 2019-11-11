
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "DisplayThumb", urlPatterns = {"/DisplayThumb"})
public class DisplayThumb extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
	response.setContentType("image/jpeg");
	ServletOutputStream out;
	out = response.getOutputStream();
         
        HttpSession session = request.getSession();
        
        String ab;
        
        
        
         ab=(String)(session.getAttribute("path_thumb"))+session.getAttribute("ADMN")+".JPG";
        
        
         
        
        
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
       /* try{
       String message="/SchoolM/DisplayPhoto";
                request.setAttribute("IMG",message);
                request.getRequestDispatcher("Admission.jsp").forward(request, response);
       response.sendRedirect("Admission.jsp");
        }
        catch(Exception et){
            
        } */
        
      
        response.sendRedirect("Admission.jsp");
	}
	}