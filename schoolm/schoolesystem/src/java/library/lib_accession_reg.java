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
@WebServlet(name = "lib_accession_reg", urlPatterns = {"/lib_accession_reg"})

public class lib_accession_reg extends HttpServlet {

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
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
       try 
        {
             Connection con = DBConnection1.getDBConnection();
            Statement stmt;
            stmt = con.createStatement();
            String type=request.getParameter("type1");
            String title=request.getParameter("title1");
           
           
            String status=request.getParameter("status");
           
            out.print("<div id='head'><input  type='checkbox' name='cb[]' class='cb_r' value='access_no'/>Accession no.<br>");
             
              out.print("<input type='checkbox'  class='cb_r'  name='cb[]' value='Status'/>Status<br>");
              out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Cupboard'/>Cupboard<br>");
                out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Shelf'/>Shelf<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Class'/>Class No.<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Book'/>Book No.<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='name'/>Type<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Title'/>Title<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Subj'/>Subject<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Year'/>Year<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Edition'/>Edition<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Vol'/>Volume<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Page'/>Page<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Rate'/>Cost<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Sup'/>Supplier<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Auth'/>Author<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Pub'/>Publisher<br>");
            
            out.print("<input type='checkbox'   class='cb_r' name='cb[]' value='Bill_no'/>Bill No.<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Date'/>Bill Date<br>");
            out.print("<input type='checkbox'   class='cb_r' name='cb[]' value='CD'/>With CD<br></div>");
          
            String query="";
            if(!type.equals("no")&&title.equals("no")&&status.equals("no"))
            {
              query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where lib_accession.type='"+type+"' ";
            }
         else   if(!type.equals("no")&&title.equals("no")&&!status.equals("no"))
            {
              query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where lib_accession.type='"+type+"' and lib_accession.status='"+status+"' ";
            }
            else   if(!type.equals("no")&& !title.equals("no")&&status.equals("no"))
            {
          query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where lib_accession.type='"+type+"' and lib_accession.title_id='"+title+"' ";      
            }
            
            else   if(!type.equals("no")&& !title.equals("no")&& !status.equals("no"))
            {
          query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where lib_accession.type='"+type+"' and lib_accession.title_id='"+title+"'  ";      
            }
          else   if(type.equals("no")&& !title.equals("no")&& status.equals("no"))
          {
          query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where lib_accession.title_id='"+title+"'  ";    
          } 
            else   if(type.equals("no")&& !title.equals("no")&& !status.equals("no"))
          {
          query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where lib_accession.title_id='"+title+"' and lib_accession.status='"+status+"'  ";    
          } 
             else   if(type.equals("no")&& title.equals("no")&& !status.equals("no"))
             {
          query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id where  lib_accession.status='"+status+"' ";       
             }
          else
             {
                 query="select distinct lib_accession.title_id,lib_item.cupboard,lib_item.shelf,lib_accession.status, lib_accession.rate,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_subj.subj,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession   join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id";       
          
             }
             
            
            ResultSet rs=stmt.executeQuery(query);
            System.out.println(query);
            out.print("<div id='data1'>");
            if(rs.next())
            {
                rs.previous();
               
            out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1' style='overflow:auto' >");
            out.print("<tr>");
            out.print("<th>Select</th>");
            out.print("<th>Accession no.</th>");
            out.print("<th>Status</th>");
              out.print("<th>Cupboard</th>");
                out.print("<th>Shelf</th>");
            out.print("<th>Class No.</th>");
            out.print("<th>Book No.</th>");
            out.print("<th>Type</th>");
            out.print("<th>Title</th>");
            out.print("<th>Subject</th>");
            out.print("<th>Year</th>");
            out.print("<th>Edition</th>");
            out.print("<th>Volume</th>");
            out.print("<th>Page</th>");
            out.print("<th>Cost</th>");
       
            out.print("<th>Author</th>");
            out.print("<th>Publisher</th>");
            out.print("<th>Publisher Place</th>");
     
            out.print("</tr>");
            while(rs.next())
            {
             if(rs.getString("status").equals("AVAILABLE"))
           {
            out.print("<style>.a1{background-color:lightgreen;}</style>");
         out.print("<tr class='a1'>");
           out.print("<td><input type='checkbox' id='ac_cb' class='ac_cb'/></td>"); 
             out.print("<td>"+rs.getString("access_no")+"</td>");
              out.print("<td>"+rs.getString("status")+"</td>");
              out.print("<td>"+rs.getString("cupboard")+"</td>");
              out.print("<td>"+rs.getString("shelf")+"</td>");
             
              out.print("<td>"+rs.getString("class")+"</td>");
            out.print("<td>"+rs.getString("book")+"</td>");
             out.print("<td>"+rs.getString("name")+"</td>");
             out.print("<td>"+rs.getString("subj")+"</td>");
            out.print("<td>"+rs.getString("title")+"</td><input type='hidden' class='title_id' value='"+rs.getString("title_id")+"'>");
             out.print("<td>"+rs.getString("year")+"</td>");
            out.print("<td>"+rs.getString("edition")+"</td>");
             out.print("<td>"+rs.getString("vol")+"</td>");
             out.print("<td>"+rs.getString("page")+"</td>");
            out.print("<td>"+rs.getString("rate")+"</td>");
         
               out.print("<td>"+rs.getString("auth")+"</td>");
               out.print("<td>"+rs.getString("pub")+"</td>");
               out.print("<td>"+rs.getString("pub_place")+"</td>");
          
            out.print("</tr>");
        }
            else
                {
                out.print("<style>.b{background-color:red;color:white}</style>");
         out.print("<tr class='b'>");
           out.print("<td><input type='checkbox' id='ac_cb' class='ac_cb'/></td>");
             out.print("<td>"+rs.getString("access_no")+"</td>");
              out.print("<td>"+rs.getString("status")+"</td>");
               out.print("<td>"+rs.getString("cupboard")+"</td>");
              out.print("<td>"+rs.getString("shelf")+"</td>");
              out.print("<td>"+rs.getString("class")+"</td>");
            out.print("<td>"+rs.getString("book")+"</td>");
             out.print("<td>"+rs.getString("name")+"</td>");
             out.print("<td>"+rs.getString("subj")+"</td>");
            out.print("<td>"+rs.getString("title")+"</td><input type='hidden' class='title_id' value='"+rs.getString("title_id")+"'>");
             out.print("<td>"+rs.getString("year")+"</td>");
            out.print("<td>"+rs.getString("edition")+"</td>");
             out.print("<td>"+rs.getString("vol")+"</td>");
             out.print("<td>"+rs.getString("page")+"</td>");
            out.print("<td>"+rs.getString("rate")+"</td>");
               out.print("<td>"+rs.getString("sup")+"</td>");
               out.print("<td>"+rs.getString("auth")+"</td>");
               out.print("<td>"+rs.getString("pub")+"</td>");
               out.print("<td>"+rs.getString("pub_place")+"</td>");
           
            out.print("</tr>");
            }   
            }
                out.print("</table>");
              
            }
            else
            {
                out.print("<center><h2>There is nothing to show</h2></center>");
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
