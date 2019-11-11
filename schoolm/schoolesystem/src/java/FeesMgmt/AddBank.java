/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeesMgmt;

import Common.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tusha
 */
public class AddBank extends HttpServlet {

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
        PrintWriter out=response.getWriter();;
        try {
            Connection con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            String bank = request.getParameter("bank");
            String query = "SELECT * FROM bank_tab WHERE bank_name='"+bank+"'";
            System.out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            if(!rs.next())
            {
                query = "insert into bank_tab values(0,'"+bank+"');";
                System.out.println(query);
                int result = stmt.executeUpdate(query);
                if(result>0){
                    out.println("<p id='status' class='hidden'>1</p>");
                    query="SELECT * FROM bank_tab";
                    rs = stmt.executeQuery(query);
                    out.println("<table class='table table-bordered'><tr style='background-color:#aaa;color:white;'><th class='text-center' style='font-size:1em;'>Bank</th>"
                            + "<th class='text-center' style='font-size:1em;'>Remove</th></tr>");
                    if(rs.next())
                    {
                        rs.previous();
                        while(rs.next()){
                            out.println("<tr><td style='display:none;'>"+rs.getInt("bank_id")+"</td><td>"+rs.getString("bank_name")+"</td>"
                                    + "<td><input type='checkbox' name='rmvbank'></td></tr>");
                        }
                    }
                    else
                        out.println("<tr><td colspan='2'>No Banks Found</td></tr>");
                    out.println("</table>");
                    }
            }
            else
            {
                out.println("<p id='status' class='hidden'>0</p>");
                System.out.println("asd");
            }
        }catch(ClassNotFoundException | SQLException e){
            
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
