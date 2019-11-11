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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @publisher Shruti Gautam
 */
@WebServlet(name = "pub_del", urlPatterns = {"/pub_del"})

public class pub_del extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try 
        {
            Connection con = DBConnection1.getDBConnection();
            Statement stmt;
            stmt = con.createStatement();
            
            String name=request.getParameter("name");
            
           
           String query = "delete from publisher where pub IN "+name;
            PreparedStatement pst= con.prepareStatement(query);
            
      //      pst.setString(1,name);
          int result = pst.executeUpdate();
            if(result>0)
            {      
            String query1="select pub from publisher";
            PreparedStatement pst1=con.prepareStatement(query1);
            ResultSet rs=pst1.executeQuery(); 
            out.print("<select multiple name='list' style='height:270px; width: 350px;'>");
            while(rs.next())  
            {  
             out.print("<option>"+rs.getString("pub")+"</option>");
            }
            out.print("</select>");
            }
          
        }
        
         catch(ClassNotFoundException | SQLException e)
        {
            out.println("<h4>Something went wrong</h4>"+e);
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
