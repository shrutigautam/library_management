/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shruti Gautam
 */
@WebServlet(name = "lib_issue", urlPatterns = {"/lib_issue"})
public class lib_issue extends HttpServlet {

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
           Statement stmt;
           Connection con=DBConnection1.getDBConnection();
           stmt=con.createStatement();
          String adm_no=request.getParameter("mem_code");
          String access_no=request.getParameter("access_no");
          String q="select cat_id from lib_reg where adm_no='"+adm_no+"'";
          ResultSet r=stmt.executeQuery(q);
          out.print("<div id='info1'>");
          if(r.next())
          {
             if(r.getString("cat_id").equals("stu"))
              {
          String query="select *,images.std_photo,admission_tab.student_name,admission_tab.middle_name,admission_tab.last_name,class_tab.class_name   from lib_reg join admission_tab on admission_tab.admission_no=lib_reg.adm_no join class_tab on class_tab.class_id=lib_reg.prog_id join images on images.admission_no=lib_reg.adm_no  where adm_no=?";
             PreparedStatement pst= con.prepareStatement(query);
                pst.setString(1,adm_no);
             ResultSet rs=pst.executeQuery(); 
          out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1'  >");
            out.print("<tr>");
            out.print("<th>Admission No.</th>");
           out.print("<th>Name</th>");
            out.print("<th>Group</th>");
            out.print("<th>Program</th>");
         
            out.print("<th>Reg Date</th>");
              out.print("<th>Exp Date</th>");
             
            out.print("</tr>");
          if(rs.next())
          {
              out.print("<tr>");
             out.print("<td id='adm_no'>"+rs.getString("adm_no")+"</td>"); 
             out.print("<td id='name' >"+rs.getString("student_name")+" "+rs.getString("middle_name")+" "+rs.getString("last_name")+"</td>");
              out.print("<td id='grp'>"+rs.getString("grp")+"</td>"); 
               out.print("<td>"+rs.getString("class_name")+"</td><input type='hidden' id='class_id' value='"+rs.getString("prog_id")+"'>"); 
               
             out.print("<td id='reg_date'>"+rs.getString("reg1")+"</td>"); 
             out.print("<td id='exp_date'>"+rs.getString("reg2")+"</td>"); 
            out.print("<img style='margin-left:170px;margin-bottom:20px;'  width='120' height='120' src='/schoolesystem/DisplayPhoto?admn="+adm_no+"'><br>");
             out.print("</tr>");
             
          }
          out.print("</table>");
              }
              else if(r.getString("cat_id").equals("emp"))
              {
               String query="select *,employee_tab.empl_name from lib_reg join employee_tab on employee_tab.employee_id=lib_reg.adm_no  where adm_no=?";
             PreparedStatement pst= con.prepareStatement(query);
                pst.setString(1,adm_no);
             ResultSet rs=pst.executeQuery(); 
          out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1'  >");
            out.print("<tr>");
            out.print("<th>Employee ID</th>");
           out.print("<th>Name</th>");
          out.print("<th>Reg Date</th>");
              out.print("<th>Exp Date</th>");
             
            out.print("</tr>");
          if(rs.next())
          {
              out.print("<tr>");
             out.print("<td id='adm_no'>"+rs.getString("adm_no")+"</td>"); 
             out.print("<td id='name' >"+rs.getString("empl_name")+"</td>");
             out.print("<td id='reg_date'>"+rs.getString("reg1")+"</td>"); 
             out.print("<td id='exp_date'>"+rs.getString("reg2")+"</td>"); 
           // out.print("<img style='margin-left:170px;margin-bottom:20px;'  width='120' height='120' src='/schoolesystem/DisplayPhoto?admn="+adm_no+"'><br>");
             out.print("</tr>");
             
          }
          out.print("</table>");
              }
             
              
          }
          out.print("</div>");
          String query1="select *,lib_item_type.name,lib_title.title from lib_accession join lib_item_type on lib_item_type.type_id=lib_accession.type join lib_title on lib_title.title_id=lib_accession.title_id where access_no=?";
           PreparedStatement pst1= con.prepareStatement(query1);
                pst1.setString(1,access_no);
                
             ResultSet rs1=pst1.executeQuery(); 
          out.print("<div id='info2'><style>.a>tbody>tr>td{padding-left:25px;padding-right:25px;}.a>tbody>tr>th{padding-left:25px;padding-right:25px;}}</style><table border='1' class='a'>");
         
          out.print("<tr>");
         out.print("<th>Select</th>");
            out.print("<th>Accession No.</th>");
            out.print("<th>Type</th>");
           out.print("<th>Title</th>");
           out.print("</tr>");
           while(rs1.next())
           {
               out.print("<tr>");
                 out.print("<td><input type='checkbox' class='cb' id='cb' name='cb'/></td>");
               out.print("<td>"+rs1.getString("access_no")+"</td>");
               out.print("<td>"+rs1.getString("name")+"</td><input type='hidden' id='type_id' value='"+rs1.getString("type")+"'>");
              out.print("<td>"+rs1.getString("title")+"</td><input type='hidden' id='title_id' value='"+rs1.getString("title_id")+"'>");
               out.print("</tr>");
           }
           out.print("<tr>&nbsp;</tr></table></div>");
           
           String query3="select accession_no,issue_date,return_date,lib_item_type.name,lib_title.title from lib_issue join lib_item_type on lib_item_type.type_id=lib_issue.type_id join lib_title on lib_title.title_id=lib_issue.title_id where lib_issue.adm_no=? and lib_issue.flag='i'";
         PreparedStatement pst3= con.prepareStatement(query3);
                pst3.setString(1,adm_no);
             ResultSet rs3=pst3.executeQuery();
             
          out.print("<div id='info3' style='height:100px;border:1px solid maroon;'><style>.b>tbody>tr>td{padding-left:20px;padding-right:20px;}.b>tbody>tr>th{padding-left:20px;padding-right:20px;}}</style><table border='1' class='b'>");
          out.print("<h3> Issued Books:</h3>");
          
           if(rs3.next())
           {
               rs3.previous();
           
              out.print("<tr>");
          out.print("<th>Accession No.</th>");
            out.print("<th>Type</th>");
           out.print("<th>Title</th>");
            out.print("<th>Issue Date</th>");
             out.print("<th>Return Date</th>");
           out.print("</tr>");
           while(rs3.next())
           {
                 out.print("<tr>");
             out.print("<td>"+rs3.getString("accession_no")+"</td>"); 
              out.print("<td>"+rs3.getString("name")+"</td>"); 
               out.print("<td>"+rs3.getString("title")+"</td>"); 
               out.print("<td>"+rs3.getString("Issue_date")+"</td>"); 
               out.print("<td>"+rs3.getString("return_date")+"</td>"); 
                 out.print("</tr>");
           }
           }
           else
           {
               out.print("<center>No Previously Issued Books</center>");
           }
           out.print("</table></div>");
           
           
           
       }
       catch(ClassNotFoundException | SQLException e)
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
