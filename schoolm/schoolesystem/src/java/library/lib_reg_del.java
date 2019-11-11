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
 * @author Shruti Gautam
 */
@WebServlet(name = "lib_reg_del", urlPatterns = {"/lib_reg_del"})

public class lib_reg_del extends HttpServlet {

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
        try 
        {
            Connection con = DBConnection1.getDBConnection();
            Statement stmt;
            stmt = con.createStatement();
        
            String value=request.getParameter("value");
           
             String query = "delete from lib_reg where adm_no in "+value;
             PreparedStatement pst= con.prepareStatement(query);
            int result = pst.executeUpdate();
            if(result>0)
            {   
               
             String query1 = "select admission_no,student_name from admission_tab where  admission_no  in ( select adm_no from lib_reg ) ";
             PreparedStatement pst1= con.prepareStatement(query1);
             
             ResultSet rs=pst1.executeQuery(); 
            out.print("<style>td{padding-left:50px;padding-right:50px;}th{padding-left:45px;padding-right:45px;}</style>");
            out.print("<table border='1' style='margin-left:10px;'><tr><th>Select</th><th>Admission No.</th><th>Student Name</th></tr>");
            while(rs.next())  
        {  
            out.print("<tr>");
            out.print("<td><input type='checkbox' class='cb' id='cb' name='cb' value='"+rs.getString("admission_no")+"'></td>");
           out.print("<td>"+rs.getString("admission_no")+"</td>");
           out.print("<td>"+rs.getString("student_name")+"</td></tr>");

        }
            out.print("</table>");
    
            
            
            }   
       
             else
             {
                //out.println("<alert>Data  notInserted</alert>");
            
             }
        
    }
        catch(ClassNotFoundException | SQLException e)
        {
            out.println("<h4>error</h4>"+e);
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
