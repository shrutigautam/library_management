import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Common.DBConnection;
/**
 *
 * @author Saumya Joshi
 */
@WebServlet(name = "photo_db_store", urlPatterns = {"/photo_db_store"})
public class photo_db_store extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String admn=(String)session.getAttribute("ADMN");
        System.out.println(admn);
        
        PrintWriter out = response.getWriter();
        String path=(String)session.getAttribute("path_photo"); 
        System.out.println(path);
        try {
        Connection con= DBConnection.getDBConnection();
        Statement stmt=con.createStatement();
        int u=stmt.executeUpdate("update images set std_photo=('"+path+"') where admission_no=('"+admn+"')");
        if(u==0){
            
        }
        else{
                String image=path+admn+".JPG";
                
                request.setAttribute("message2",image);
                request.getRequestDispatcher("Admission_1.jsp").forward(request, response);
                
                response.sendRedirect("DisplayPhoto");
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Inserted');");
                 out.println("location='Admission_1.jsp';");
                 out.println("</script>");
        }   
        }
           
         
       catch(Exception et){
           out.print(et.getMessage());
       } 
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
