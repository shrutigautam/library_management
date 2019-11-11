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
@WebServlet(name = "library_item_search", urlPatterns = {"/library_item_search"})

public class library_item_search extends HttpServlet {

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
           
            String type_id=request.getParameter("item_id1");
              
           String lang=request.getParameter("lang1");
            String title_id=request.getParameter("title_id1");
             String subj_id=request.getParameter("subj_id1");
             String subtitle_id=request.getParameter("subtitle_id1");
              String isbn=request.getParameter("isbn1");
                String auth=request.getParameter("auth_id11");
                 String pub=request.getParameter("pub_id1");
               
            String query="";
             if(request.getParameter("lang1").equals("no")&&request.getParameter("subj_id1").equals("no")&&request.getParameter("title_id1").equals("no")&&request.getParameter("subtitle_id1").equals("no")&&request.getParameter("isbn1").equals("no")&&request.getParameter("auth_id11").equals("no")&&request.getParameter("pub_id1").equals("no"))
             {
                query = "select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix,lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where lib_item.type_id="+type_id+"";
                 System.out.println(query);
             }
            else if(request.getParameter("subj_id1").equals("no")&&request.getParameter("title_id1").equals("no")&&request.getParameter("subtitle_id1").equals("no")&&request.getParameter("isbn1").equals("no")&&request.getParameter("auth_id11").equals("no")&&request.getParameter("pub_id1").equals("no"))
            {
                query="select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix, lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where lib_item.type_id="+type_id+" and lang='"+lang+"'";
            }
             
            else if(request.getParameter("title_id1").equals("no")&&request.getParameter("subtitle_id1").equals("no")&&request.getParameter("isbn1").equals("no")&&request.getParameter("auth_id11").equals("no")&&request.getParameter("pub_id1").equals("no"))
            {
                query="select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix, lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where lib_item.type_id="+type_id+" and lang='"+lang+"' and lib_item.subj_id="+subj_id+"";
            }
              else if(request.getParameter("subtitle_id1").equals("no")&&request.getParameter("isbn1").equals("no")&&request.getParameter("auth_id11").equals("no")&&request.getParameter("pub_id1").equals("no"))
             {
               query="select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix, lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where lib_item.type_id="+type_id+" and lang='"+lang+"' and lib_item.subj_id="+subj_id+" and lib_item.title_id="+title_id+"";
             }
             else if(request.getParameter("isbn1").equals("no")&&request.getParameter("auth_id11").equals("no")&&request.getParameter("pub_id1").equals("no"))
             {
                 query="select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix, lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where lib_item.type_id="+type_id+" and lang='"+lang+"' and lib_item.subj_id="+subj_id+" and lib_item.title_id="+title_id+" and lib_item.subtitle_id="+subtitle_id+"";
             } 
              else if(!(request.getParameter("isbn1").equals("no")))
              {
                  query="select * , lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix,lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where isbn='"+isbn+"'";
              }
             else if(!(request.getParameter("auth_id11").equals("no")))
           {
               query="select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix, lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where auth_id1="+auth+" or auth_id2="+auth+" or auth_id3="+auth+"";
           }
              else if(!(request.getParameter("pub_id1").equals("no")))
           {
               query="select * ,lib_cupboard.cup_no,lib_shelf.shelf_no,lib_prefix.prefix, lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id join lib_prefix on lib_prefix.prefix_id=lib_item.prefix_id join lib_cupboard on lib_cupboard.cup_id=lib_item.cupboard join lib_shelf on lib_shelf.shelf_id=lib_item.shelf where lib_item.pub_id="+pub+"";
           }   
           ResultSet rs=stmt.executeQuery(query);
            System.out.println(query);
              out.print("<div id='report' style='overflow-y:auto;height:300px'><input  type='checkbox' name='cb[]' class='cb_r' value='Type_id'/>Type<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Lang'/>Language<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Subj_id'/>Subject<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Title_id'/>Title<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Subtitle_id'/>Subtitle<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='ISBN'/>ISBN<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Class'/>Class No.<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Book'/>Book No.<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Content'/>Content<br>");
             out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Remark'/>Remark<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='pur1'/>Title Purchased (From)<br>");
             out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='pur2'/>Title Purchased (To)<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='bil1'/>Bill Date (From)<br>");
             out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='bil2'/>Bill Date (To)<br>");
              out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Serial'/>Serial<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Status'/>Status<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Item_key'/>Item Key<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Prefix'/>Prefix<br>");
             out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='acces1'/>Accessiong(From)<br>");
              out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='acces2'/>Accessiong(To)<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='acc1'/>Account No.(From)<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='acc2'/>Account(To)<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='auth_id1'/>Author<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='pub_place'/>Publisher Place<br>");
              out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='pub_id'/>Publisher<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Keyword'/>Keyword<br>");
             out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Cupboard'/>Cupboard<br>");
              out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Shelf'/>Shelf<br>");
        
            out.print("<input type='hidden'  name='query' value='"+query+"'></div>");
            
           if(rs.next())
           {
                rs.previous();
           out.print("<div id='data'><style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1'  >");
            out.print("<tr>");
            out.print("<th>CLICK HERE</th>");
            out.print("<th>ITEM TYPE</th>");
            out.print("<th>LANGUAGE</th>");
            out.print("<th>SUBJECT</th>");
            out.print("<th>TITLE</th>");
            out.print("<th>SUBTITLE</th>");
           out.print("<th>ISBN</th>");
             out.print("<th>CLASS NO.</th>");
              out.print("<th>BOOK NO.</th>");
               out.print("<th>CONTENT</th>");
             out.print("<th>REMARK</th>");
              out.print("<th>TITLE PURCHASED (From)</th>");
               out.print("<th>TITLE PURCHASED (To)</th>");
             out.print("<th>BILL DATE(From)</th>");
              out.print("<th>BILL DATE(To)</th>");
              out.print("<th>SERIAL</th>");
             out.print("<th>STATUS</th>");
              out.print("<th>ITEM KEY</th>");
               out.print("<th>PREFIX</th>");
             out.print("<th>ACCESSIONING (From)</th>");
              out.print("<th>ACCESSIONING (To)</th>");
                out.print("<th>ACCOUNT NO. (From)</th>");
              out.print("<th>ACCOUNT NO. (To)</th>");
              out.print("<th>AUTHOR</th>");
              out.print("<th>PUBLISHER PLACE</th>");
                out.print("<th>PUBLISHER</th>");
                 out.print("<th>CUPBOARD</th>");
                  out.print("<th>SHELF</th>");
              out.print("<th>KEYWORD</th>");
            out.print("</tr>");

              
             while(rs.next())
             {
                 
               out.print("<tr>");
            out.print("<td><a href='library_item_show.jsp?item_id="+rs.getString("item_id")+"'>DETAILS</a></td>");
             out.print("<td>"+rs.getString("name")+"</td>");
              out.print("<td>"+rs.getString("lang")+"</td>");
            out.print("<td>"+rs.getString("subj")+"</td>");
             out.print("<td>"+rs.getString("title")+"</td>");
              out.print("<td>"+rs.getString("subtitle")+"</td>");
            out.print("<td>"+rs.getString("isbn")+"</td>");
             out.print("<td>"+rs.getString("class")+"</td>");
              out.print("<td>"+rs.getString("book")+"</td>");
             out.print("<td>"+rs.getString("content")+"</td>");
             out.print("<td>"+rs.getString("remark")+"</td>");
              out.print("<td>"+rs.getString("pur1")+"</td>");
             out.print("<td>"+rs.getString("pur2")+"</td>");
              out.print("<td>"+rs.getString("bil1")+"</td>");
             out.print("<td>"+rs.getString("bil2")+"</td>");
             out.print("<td>"+rs.getString("serial")+"</td>");
             out.print("<td>"+rs.getString("status")+"</td>");
              out.print("<td>"+rs.getString("item_key")+"</td>");
             out.print("<td>"+rs.getString("prefix")+"</td>");
              out.print("<td>"+rs.getString("acces1")+"</td>");
             out.print("<td>"+rs.getString("acces2")+"</td>");
              out.print("<td>"+rs.getString("acc1")+"</td>");
             out.print("<td>"+rs.getString("acc2")+"</td>");
              out.print("<td>"+rs.getString("auth")+"</td>");
            out.print("<td>"+rs.getString("pub_place")+"</td>");
              out.print("<td>"+rs.getString("pub")+"</td>");
               out.print("<td>"+rs.getString("cup_no")+"</td>");
                out.print("<td>"+rs.getString("shelf_no")+"</td>");
             out.print("<td>"+rs.getString("keyword")+"</td>");
               out.print("</tr>");
             
        }
             out.print("</table>");

        }
           else
           {
               out.print("<h2><center>There is nothing to show</center></h2>");
           }
           out.print("</div>");
 }
          
         catch(Exception e)
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
