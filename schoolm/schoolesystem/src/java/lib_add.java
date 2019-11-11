/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
/**
 *
 * @author Shruti Gautam
 */
@WebServlet(urlPatterns = {"/lib_add"})
public class lib_add extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();;
        try 
        {
            Connection con = DBConnection.getDBConnection();
            Statement stmt;
            stmt = con.createStatement();
            String name=request.getParameter("name");
            
        int day=Integer.parseInt(request.getParameter("day"));
        int lim=Integer.parseInt(request.getParameter("lim"));
        String finpol=request.getParameter("finpol");
        int fine=Integer.parseInt(request.getParameter("fine"));
        int tlim=Integer.parseInt(request.getParameter("tlim"));
        String avail=request.getParameter("avail");
        String sel=request.getParameter("sel");
            String query = "insert into grpmstr values(?,?,?,?,?,?,?,?)";
             PreparedStatement pst= con.prepareStatement(query);
          pst.setString(1,name);
           pst.setInt(2,day);
            pst.setInt(3,lim);
             pst.setInt(4,tlim);
              pst.setString(5,finpol);
               pst.setInt(6,fine);
                pst.setString(7,avail);
                 pst.setString(8,sel);
         System.out.println(query);
            int result = pst.executeUpdate();
            if(result>0)
                out.println("<h4 style='text-align:center'><center>Data Inserted</center></h4>");
        }
        catch(Exception e)
        {
            out.println("<center><h4 style='text-align:center'>Data Not Inserted</h4>"+e);
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
