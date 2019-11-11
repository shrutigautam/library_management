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
import Common.DBConnection;
import java.sql.*;
/**
 *
 * @author tusha
 */
public class RemoveFeeType extends HttpServlet {

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
            String feetypes = request.getParameter("y");
            Connection con = DBConnection.getDBConnection(); 
            Statement stmt = con.createStatement();
            String query = "DELETE FROM feetype WHERE feeID IN "+feetypes;
            int result = stmt.executeUpdate(query);
            if(result>0)
            {
                query = "DELETE FROM feehead where feeID IN "+feetypes;
                result = stmt.executeUpdate(query);
                query = "SELECT * FROM feetype;";
                ResultSet rs = stmt.executeQuery(query);
                out.println("<link rel='stylesheet' href='css/feesmgmt.css' type='text/css'>");
                out.println("<table class='table table-bordered'><tr style='background-color:#aaa;color:white;'><th class='text-center'>FeeTypes</th><th class='text-center'>Remove</th></tr>");
                if(rs.next())
                {
                    rs.previous();
                    while(rs.next()){
                        out.println("<tr><td style='display:none;'>"+rs.getInt("feeID")+"</td><td>"+rs.getString("feetype")
                                +"</td><td><input type='checkbox' name='rmv'></td></tr>");
                    }
                    
                }
                else
                    out.println("<tr><td colspan='2'>No Feetypes found</td></tr>");
                out.println("</table>");
            }
        }
        catch(Exception e)
        {
            
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
