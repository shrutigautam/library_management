/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Designation extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           int dez_id=Integer.parseInt(request.getParameter("designationid"));
           String dez_name=request.getParameter("designationname");
           String buttonname=request.getParameter("btname");
             try{
            Class.forName( "com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            PreparedStatement pstmt;
            if(buttonname.equals("add")){
            String query = "insert into designation_tab(designation_name) values( '"+dez_name+"') ";
            pstmt = conn.prepareStatement(query); // create a statement
            pstmt.executeUpdate();
            out.println("asdfg");
            response.sendRedirect("/schoolesystem/mst.jsp?key=10");
            }
           else if(buttonname.equals("update")){
            String query = "update designation_tab set designation_name='"+dez_name+"' where designation_id='"+dez_id+"'";
            pstmt = conn.prepareStatement(query); // create a statement
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("/schoolesystem/mst.jsp?key=10");
        }}
            catch(ClassNotFoundException | SQLException se){
                out.println(se);
            } 
        
        
        
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
