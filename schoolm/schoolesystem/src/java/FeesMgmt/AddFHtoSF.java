/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeesMgmt;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Common.DBConnection;
/**
 *
 * @author tusha
 */
public class AddFHtoSF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String admsnno = request.getParameter("admsnno");
            int feeID = Integer.parseInt(request.getParameter("feeID"));
            String feeHead = request.getParameter("feeHead");
            String class_name = request.getParameter("class_name");
            Connection con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select ct.class_id,feeId,feehead from class_tab as ct inner join feestructure as fs"
                    + " on ct.class_id=fs.class_id and class_name in ('Others') where feeID="+feeID+" and feeHead='"+feeHead+"'";
            System.out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                query = "INSERT INTO studentfees VALUES('"+admsnno+"',"+feeID+",'"+feeHead+"',0)";
                int result = stmt.executeUpdate(query);
                out.println("<p id='status' class='hidden'>1</p>");
            }
        }catch(Exception e){
            out.println("<p id='status' class='hidden'>0</p>");
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
