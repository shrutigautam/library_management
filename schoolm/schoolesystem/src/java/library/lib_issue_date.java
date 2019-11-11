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
@WebServlet(name = "lib_issue_date", urlPatterns = {"/lib_issue_date"})
public class lib_issue_date extends HttpServlet {

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
           String issue_date=request.getParameter("issue_date");
           String return_date=request.getParameter("return_date");
           out.print("<div id='show2'><input  type='checkbox' name='cb[]' class='cb_r' value='Accession_no'/>Accession no.<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Student_name'/>Name<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Class_name'/>Class<br>");
           
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Grp'/>Group<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Name'/>Type<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Title'/>Title<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Issue_Date'/>Issue Date<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Return_Date'/>Return Date<br></div>");
           
            out.print("<div id='show1'>");
           String query="";
           if(!issue_date.equals("no")&& return_date.equals("no"))
           {
               query="select *,lt.title,li.name,ct.class_name, at.student_name,at.middle_name,at.last_name from lib_issue join admission_tab at on at.admission_no=lib_issue.adm_no join class_tab ct on ct.class_id=lib_issue.class_id join lib_item_type li on li.type_id=lib_issue.type_id join lib_title lt on lt.title_id=lib_issue.title_id where issue_date='"+issue_date+"'";
           }
           else if(issue_date.equals("no")&& !return_date.equals("no"))
           {
             query="select *,lt.title,li.name,ct.class_name, at.student_name,at.middle_name,at.last_name from lib_issue join admission_tab at on at.admission_no=lib_issue.adm_no join class_tab ct on ct.class_id=lib_issue.class_id join lib_item_type li on li.type_id=lib_issue.type_id join lib_title lt on lt.title_id=lib_issue.title_id where return_date='"+return_date+"'";
           }
           else if(!issue_date.equals("no")&& !return_date.equals("no"))
           {
             query="select *,lt.title,li.name,ct.class_name, at.student_name,at.middle_name,at.last_name from lib_issue join admission_tab at on at.admission_no=lib_issue.adm_no join class_tab ct on ct.class_id=lib_issue.class_id join lib_item_type li on li.type_id=lib_issue.type_id join lib_title lt on lt.title_id=lib_issue.title_id where return_date='"+return_date+"' and issue_date='"+issue_date+"'";
           }
           else if(issue_date.equals("no")&& return_date.equals("no"))
           {
               query="select *,lt.title,li.name,ct.class_name, at.student_name,at.middle_name,at.last_name from lib_issue join admission_tab at on at.admission_no=lib_issue.adm_no join class_tab ct on ct.class_id=lib_issue.class_id join lib_item_type li on li.type_id=lib_issue.type_id join lib_title lt on lt.title_id=lib_issue.title_id";
           }
//           else
//               out.print("hell");
//          
               
           
           ResultSet rs=stmt.executeQuery(query);
           if(rs.next())
           {
           rs.previous();
           out.print("<style>td{padding-left:20px;padding-right:20px;}th{padding-left:20px;padding-right:20px;}</style><table border='1' style='overflow:auto' >");
            out.print("<tr>");
            out.print("<th>Name</th>");
            out.print("<th>Class</th>");
             out.print("<th>Accession No.</th>");
            out.print("<th>Group</th>");
             out.print("<th>Type</th>");
            out.print("<th>Title</th>");
            out.print("<th>Issue Date</th>");
            out.print("<th>Return Date</th>");
            out.print("</tr>");
           while(rs.next())
           {
               out.print("<tr>");
               out.print("<td>"+rs.getString("student_name")+" "+rs.getString("middle_name")+" "+rs.getString("last_name")+"</td>");
              out.print("<td>"+rs.getString("class_name")+"</td>");
               out.print("<td>"+rs.getString("accession_no")+"</td>");
               out.print("<td>"+rs.getString("grp")+"</td>");
                out.print("<td>"+rs.getString("name")+"</td>");
               out.print("<td>"+rs.getString("title")+"</td>");
               out.print("<td>"+rs.getString("issue_date")+"</td>");
                 out.print("<td>"+rs.getString("return_date")+"</td>");
               out.print("</tr>");
           }
           out.print("</table>");
       }
           else
           {
               out.print("There is nothing to show");
           }
           out.print("</div>");
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
