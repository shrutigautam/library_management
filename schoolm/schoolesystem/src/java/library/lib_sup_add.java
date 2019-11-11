package library;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "lib_sup_add", urlPatterns = {"/lib_sup_add"})

public class lib_sup_add extends HttpServlet {

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
          String name=request.getParameter("name");
           String add=request.getParameter("add");
            String city=request.getParameter("city");
             String phone=request.getParameter("phone");
              String mob=request.getParameter("mob");
               String fax=request.getParameter("fax");
                String email=request.getParameter("email");
                 String web=request.getParameter("web");
                 String query="insert into supplier(sup,address,city,phone,mobile,fax,email,website) values(?,?,?,?,?,?,?,?)";
          PreparedStatement pst=con.prepareStatement(query);
          pst.setString(1,name);
          pst.setString(2,add);
          pst.setString(3,city);
          pst.setString(4,phone);
          pst.setString(5,mob);
          pst.setString(6,fax);
          pst.setString(7,email);
          pst.setString(8,web);
          int result=pst.executeUpdate();
          if(result>0)
              out.print("insert successfully");
          else
          out.print("failed");
          
       }
       catch(Exception e)
       {
           out.print(e.getMessage());
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
