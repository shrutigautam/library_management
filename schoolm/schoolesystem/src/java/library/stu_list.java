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
@WebServlet(name = "stu_list", urlPatterns = {"/stu_list"})

public class stu_list extends HttpServlet {

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
             
              if(request.getParameter("clas_id").equals("no")&&!(request.getParameter("ses_id").equals("no")))
           {
              
            int session_id=Integer.parseInt(request.getParameter("ses_id"));
            
 String query = "select admission_no,student_name from admission_tab where  admission_no not in( select adm_no from lib_reg )  and year=?" ;
             PreparedStatement pst= con.prepareStatement(query);
            
                pst.setInt(1,session_id);
             ResultSet rs=pst.executeQuery(); 
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
               else   if(request.getParameter("ses_id").equals("no") && !(request.getParameter("clas_id").equals("no")))
           {
           
             int class_id=Integer.parseInt(request.getParameter("clas_id"));
 String query = "select admission_no,student_name from admission_tab where  admission_no not in( select adm_no from lib_reg )  and class=?" ;
             PreparedStatement pst= con.prepareStatement(query);
            
                pst.setInt(1,class_id);
             ResultSet rs=pst.executeQuery(); 
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

           
           else   if(!(request.getParameter("ses_id").equals("no")&&request.getParameter("clas_id").equals("no")))
           {
           int session_id=Integer.parseInt(request.getParameter("ses_id"));
             int class_id=Integer.parseInt(request.getParameter("clas_id"));
 String query = "select admission_no,student_name from admission_tab where  admission_no not in( select adm_no from lib_reg ) and year=? and class=?" ;
             PreparedStatement pst= con.prepareStatement(query);
               pst.setInt(1,session_id);
                pst.setInt(2,class_id);
             ResultSet rs=pst.executeQuery(); 
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
      else  if(request.getParameter("ses_id").equals("no")&& request.getParameter("clas_id").equals("no"))
           {
           
 String query = "select admission_no,student_name from admission_tab where  admission_no not in( select adm_no from lib_reg )" ;
             PreparedStatement pst= con.prepareStatement(query);
              
             ResultSet rs=pst.executeQuery(); 
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
  
       
        
           
  
        }
        catch(ClassNotFoundException | SQLException e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
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
