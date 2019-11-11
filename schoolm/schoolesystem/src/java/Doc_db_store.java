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

/**
 *
 * @author Saumya Joshi
 */
@WebServlet(name = "Doc_db_store", urlPatterns = {"/Doc_db_store"})
public class Doc_db_store extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String admn=(String)session.getAttribute("ADMN");
        
        
        PrintWriter out = response.getWriter();
        String DocPhotoPath=(String)session.getAttribute("path_Doc_photo");
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
        Statement stmt=con.createStatement();
        int u=stmt.executeUpdate("update images set document_check_list=('"+DocPhotoPath+"') where admission_no=('"+admn+"')");
        if(u==0){
            
        }
        else{
                
                String Docimage=DocPhotoPath+admn+".JPG";
                
                request.setAttribute("message_docPhoto",Docimage);
                request.getRequestDispatcher("Admission.jsp").forward(request, response);
                
               
        }   
        }
           
         
       catch(Exception et){
           out.print(et);
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
