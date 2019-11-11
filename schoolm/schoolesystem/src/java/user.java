/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(urlPatterns = {"/user"})
public class user extends HttpServlet {

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
           Connection con=DBConnection.getDBConnection();
           Statement stmt=con.createStatement();
           String query="";
           out.print("<div id='show_table'>");
           query="select usertype,username,usercode,disabled from usermgmttab";
           ResultSet rs=stmt.executeQuery(query);
           out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1' style='overflow-y:auto;width:470px;height:100px;' >");
            out.print("<tr>");
            out.print("<th>User Type</th>");
            out.print("<th>Username</th>");
            out.print("<th>Usercode</th>");
            out.print("<th>Disabled</th>");
            out.print("</tr>");
           while(rs.next())
           {
                out.print("<tr>");
                out.print("<td>"+rs.getString("usertype")+"</td>");
                out.print("<td>"+rs.getString("username")+"</td>");
                out.print("<td>"+rs.getString("usercode")+"</td>");
                out.print("<td>"+rs.getString("disabled")+"</td>");
                out.print("</tr>");
           }
           
           out.print("</table></div>");
           String utype=request.getParameter("utype");
         
           out.print("<div id='name'>");
           if(utype.equals("student"))
           {
               query="select student_name,middle_name,last_name from admission_tab ";
               ResultSet rs1=stmt.executeQuery(query);
               out.print("<option value='no'>--select--</option>");
               while(rs1.next())
               {
                   out.print("<option>"+rs1.getString("student_name")+" "+rs1.getString("middle_name")+" "+rs1.getString("last_name")+"</option>");
               }
           }
           else
           {
               query="select empl_name from employee_tab";
                ResultSet rs1=stmt.executeQuery(query);
               out.print("<option value='no'>--select--</option>");
               while(rs1.next())
               {
                   out.print("<option>"+rs1.getString("empl_name")+"</option>");
               }
           }
           out.print("</div>");
           out.print("<div id='code'>");
           String name=request.getParameter("fullname");
          
           if(utype.equals("student"))
           {
             query="select admission_no from admission_tab where concat(Student_Name,Middle_Name,Last_Name )='"+name+"'"; 
               System.out.println(query);
             ResultSet rs2=stmt.executeQuery(query);
             if(rs2.next())
             {
                 out.print(rs2.getString("admission_no"));
                 System.out.println(rs2.getString("admission_no"));
             }
           }
           else
           {
            query="select employee_id from employee_tab where empl_name='"+name+"'"; 
            ResultSet rs2=stmt.executeQuery(query);
            if(rs2.next())
            {
                out.print(rs2.getString("employee_id"));
            }
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
