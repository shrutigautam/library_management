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
@WebServlet(name = "lib_opac_ser", urlPatterns = {"/lib_opac_ser"})
public class lib_opac_ser extends HttpServlet {

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
         String type=request.getParameter("type");
         String subj=request.getParameter("subj");
         String title=request.getParameter("title");
         String auth=request.getParameter("auth");
         String pub=request.getParameter("pub");
         String query="";
         if(!type.equals("no") && subj.equals("no") && title.equals("no") && auth.equals("no")&& pub.equals("no"))
         {
            query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard   where lib_item.type_id='"+type+"'  ";
         }
         else if(type.equals("no") && !subj.equals("no")  && title.equals("no") && auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.subj_id='"+subj+"'";
         }
         else if(type.equals("no") && subj.equals("no") && !title.equals("no")&& auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.title_id='"+title+"'";
         }
         else if(type.equals("no") && subj.equals("no") && title.equals("no")&& !auth.equals("no") && pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.auth_id1='"+auth+"'";
         }
         else if(type.equals("no") && subj.equals("no") && title.equals("no") && auth.equals("no")&& !pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.pub_id='"+pub+"'";
         }
          else if(type.equals("no") && !subj.equals("no") && !title.equals("no") && auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.subj_id='"+subj+"' and lib_item.title_id='"+title+"'";
         }
         else if(type.equals("no") && !subj.equals("no") && !title.equals("no") && !auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub,lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.subj_id='"+subj+"' and lib_item.title_id='"+title+"' and lib_item.auth_id1='"+auth+"'";
         }
          else if(type.equals("no") && !subj.equals("no") && title.equals("no") && !auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.subj_id='"+subj+"'  and lib_item.auth_id1='"+auth+"'";
         }
          else if(type.equals("no") && subj.equals("no") && !title.equals("no") && !auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where  lib_item.title_id='"+title+"' and lib_item.auth_id1='"+auth+"'";
         }
         else if(!type.equals("no") && !subj.equals("no")  && title.equals("no") && auth.equals("no")&& pub.equals("no"))
         {
           query="select distinct ls.shelf_no,lc.cup_no,lib_item_type.name,lib_subj.subj,lib_title.title,author.auth,publisher.pub, lib_accession.access_no,lib_accession.status from lib_item join lib_accession on lib_item.type_id=lib_accession.type join lib_item_type on lib_item_type.type_id=lib_item.type_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join lib_title on lib_title.title_id=lib_item.title_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id join lib_shelf  ls on ls.shelf_id=lib_item.shelf join lib_cupboard lc on lc.cup_id=lib_item.cupboard where lib_item.subj_id='"+subj+"' and lib_item.type_id='"+type+"'";
         }
         else 
             out.print("<h3><center>Sorry...you are applying wrong constraints</center></h3>");
         ResultSet rs=stmt.executeQuery(query);
         out.print("<style>.a>tbody>tr>td{padding-left:10px;padding-right:10px;padding-top:5px;padding-bottom:5px;}.a>tbody>tr>th{padding-left:10px;padding-top:5px;padding-right:10px;padding-bottom:5px;}}</style><table border='1' class='a'>");
         
          out.print("<tr>");
         out.print("<th>Accession No.</th>");
         out.print("<th>Status</th>");
            out.print("<th>Cupboard</th>");
             out.print("<th>Shelf</th>");
            out.print("<th>Type</th>");
            out.print("<th>Subject</th>");
            out.print("<th>Title</th>");
             out.print("<th>Author</th>");
            out.print("<th>Publisher</th>");
           out.print("</tr>");
          
         while(rs.next())
         {
             if(!rs.getString("status").equals("AVAILABLE"))
             {
                 out.print("<style>.a1{background-color:red;color:white;}</style>");
              out.print("<tr class='a1'>");
              out.print("<td>"+rs.getString("access_no")+"</td>");
              out.print("<td>"+rs.getString("status")+"</td>");
              out.print("<td>"+rs.getString("cup_no")+"</td>");
              out.print("<td>"+rs.getString("shelf_no")+"</td>");
              out.print("<td>"+rs.getString("name")+"</td>");
              out.print("<td>"+rs.getString("subj")+"</td>");
              out.print("<td>"+rs.getString("title")+"</td>");
              out.print("<td>"+rs.getString("auth")+"</td>");
              out.print("<td>"+rs.getString("pub")+"</td>");
               out.print("</tr>");
             }
             else
             {
                  out.print("<style>.b1{background-color:lightgreen;}</style>");
                 out.print("<tr class='b1'>");
              out.print("<td>"+rs.getString("access_no")+"</td>");
              out.print("<td>"+rs.getString("status")+"</td>");
              out.print("<td>"+rs.getString("cup_no")+"</td>");
              out.print("<td>"+rs.getString("shelf_no")+"</td>");
              out.print("<td>"+rs.getString("name")+"</td>");
              out.print("<td>"+rs.getString("subj")+"</td>");
              out.print("<td>"+rs.getString("title")+"</td>");
              out.print("<td>"+rs.getString("auth")+"</td>");
              out.print("<td>"+rs.getString("pub")+"</td>");
               out.print("</tr>");
             }
         }
          out.print("</table>");
        }
        catch(Exception e)
        {
            //out.print(e.getMessage());
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
