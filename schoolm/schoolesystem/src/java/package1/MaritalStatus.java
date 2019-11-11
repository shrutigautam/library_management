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

/**
 *
 * @author Saumya Joshi
 */
public class MaritalStatus extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           int marital_status_id=Integer.parseInt(request.getParameter("marital_status_id"));
        String marital_status_name=request.getParameter("marital_status_name");
        String buttonname=request.getParameter("btname");
            try{
            Class.forName( "com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            PreparedStatement pstmt;
            if(buttonname.equals("add")){
            String query = "insert into marital_status_tab(marital_status_name) values( '"+marital_status_name+"') ";
            pstmt = conn.prepareStatement(query); // create a statement
            pstmt.executeUpdate();
            out.println("asdfg");
            response.sendRedirect("/schoolesystem/mst.jsp?key=13");
            }
           else if(buttonname.equals("update")){
            String query = "update marital_status_tab set marital_status_name='"+marital_status_name+"' where marital_status_id='"+marital_status_id+"'";
            pstmt = conn.prepareStatement(query); // create a statement
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("/schoolesystem/mst.jsp?key=13");
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
