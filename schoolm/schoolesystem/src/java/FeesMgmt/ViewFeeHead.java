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
public class ViewFeeHead extends HttpServlet {

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
        try{
            Connection con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            String feeID = request.getParameter("feeID");
            String query = "SELECT * FROM feehead WHERE feeID='"+feeID+"'";
            ResultSet rs = stmt.executeQuery(query);
            out.println("<table class='table table-bordered'>");
            out.println("<tr><th>Fee Head</th><th>Abbr.</th><th>Type</th><th>Refundable</th><th>Print Order</th>"
                    + "<th>Update</th><th>Delete</th></tr>");
            if(rs.next())
            {    
                rs.previous();
                while(rs.next()){
                    out.println("<tr><td>"+rs.getString("feehead")+"</td><td>"+rs.getString("Abbr")+"<"
                            + "/td><td>"+rs.getString("Type")+"</td><td>"+rs.getString("Refundable")+
                            "</td><td>"+rs.getInt("PrintOrder")+"</td>"
                            + "<td><input type='button' class='btn btn-primary full-width' id='FHUpdate' value='Select'></td>"
                            + "<td><input type='button' class='btn btn-danger full-width' id='FHDelete' value='Delete'></td></tr>");
                }
            }
            else
                out.println("<tr><td colspan='7' class='text-center'>No Records Found</td></tr>");
            out.println("</table>");
        }catch(Exception e){
            
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
