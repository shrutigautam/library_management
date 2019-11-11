/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shruti Gautam
 */
@WebServlet(name = "lib_shelf", urlPatterns = {"/lib_shelf"})
public class lib_shelf extends HttpServlet {

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
       PrintWriter out=response.getWriter();
      try
      {
       Connection con=DBConnection1.getDBConnection();
       Statement stmt;
       stmt=con.createStatement();
       
       String cup_no=request.getParameter("cup_no");
    String query="select alias from lib_cupboard where cup_id='"+cup_no+"'";
       ResultSet rs=stmt.executeQuery(query);
       if(rs.next())
       {
           out.print("<div id='cup_alias'>"+rs.getString("alias")+"</div>");
       }
        String cup_no1=request.getParameter("cup_id");
 String query1="select shelf_no,shelf_id from lib_shelf where cup_id='"+cup_no1+"'";
 ResultSet rs1=stmt.executeQuery(query1); 
 

 out.print("<div id='shelf'><option value='no'>--select--</option> ");
 
         while(rs1.next())
 {
     out.print("<option value='"+rs1.getString("shelf_id")+"_"+rs1.getString("shelf_no")+"'>"+rs1.getString("shelf_no")+"</option>");
 }
       out.print("</div>");
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
