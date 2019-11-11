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
@WebServlet(name = "lib_purchase_search", urlPatterns = {"/lib_purchase_search"})

public class lib_purchase_search extends HttpServlet {

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
                Connection con = DBConnection1.getDBConnection();
            Statement stmt;
            stmt = con.createStatement();
            String date=request.getParameter("date");
            String bill=request.getParameter("bill");
            String query="";
               out.print("<div id='accession'>");
             if(request.getParameter("bill").equals("undefined"))
            {
             query = "select *,lib_item_type.name,lib_title.title,supplier.sup from lib_purchase join supplier on supplier.sup_id=lib_purchase.sup_id join lib_item_type on lib_item_type.type_id=lib_purchase.type_id join lib_title on lib_title.title_id=lib_purchase.title_id where date='"+date+"' and pur_id not in (select pur_id from lib_accession) ";
            }
            else  if(!(request.getParameter("bill").equals("undefined")))
            {
                query="select *,lib_item_type.name,lib_title.title,supplier.sup from lib_purchase join supplier on supplier.sup_id=lib_purchase.sup_id join lib_item_type on lib_item_type.type_id=lib_purchase.type_id join lib_title on lib_title.title_id=lib_purchase.title_id where bill_no='"+bill+"' and pur_id not in (select pur_id from lib_accession)";
            }
            else if(!bill.equals("undefined")&&!date.equals("undefined"))
            {
               query="select *,lib_item_type.name,lib_title.title,supplier.sup from lib_purchase join supplier on supplier.sup_id=lib_purchase.sup_id join lib_item_type on lib_item_type.type_id=lib_purchase.type_id join lib_title on lib_title.title_id=lib_purchase.title_id where bill_no='"+bill+"' and date='"+date+"' and pur_id not in (select pur_id from lib_accession)";  
            }
        
             ResultSet rs=stmt.executeQuery(query);
             if(rs.next())
             {
                 rs.previous();
              
             out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1'  >");
            out.print("<tr>");
            out.print("<th>Select</th>");
           out.print("<th>BILL NO</th>");
            out.print("<th>DATE</th>");
            out.print("<th>SUPPLIER</th>");
            out.print("<th>ITEM TYPE</th>");
            out.print("<th>TITLE</th>");
           out.print("<th>YEAR</th>");
           out.print("<th>EDITION</th>");
             out.print("<th>VOLUME</th>");
              out.print("<th>PAGE</th>");
               out.print("<th>QUANTITY</th>");
             out.print("<th>RATE</th>");
              out.print("<th>AMOUNT</th>");
               out.print("<th>DISCOUNT</th>");
             out.print("<th>DIS AMOUNT</th>");
              out.print("<th>NET AMOUNT</th>");
              out.print("<th>CD</th>");
            out.print("</tr>");

            while(rs.next())  
        { 
            out.print("<tr>");
            out.print("<td><input type='checkbox'  class='cb'/></td>");
            out.print("<input type='hidden' id='pur_id' value='"+rs.getString("pur_id")+"'><td>"+rs.getString("bill_no")+"</td>");
              out.print("<td>"+rs.getString("date")+"</td>");
            out.print("<td>"+rs.getString("sup")+"</td>");
             out.print("<td>"+rs.getString("name")+"</td><input type='hidden' id='type_id' value='"+rs.getString("type_id")+"'>");
              out.print("<td>"+rs.getString("title")+"</td><input type='hidden'  id='title_id' value='"+rs.getString("title_id")+"' >");
            out.print("<td>"+rs.getString("year")+"</td>");
             out.print("<td>"+rs.getString("edition")+"</td>");
              out.print("<td>"+rs.getString("vol")+"</td>");
             out.print("<td>"+rs.getString("page")+"</td>");
             out.print("<td>"+rs.getString("qty")+"</td>");
              out.print("<td>"+rs.getString("rate")+"</td>");
             out.print("<td>"+rs.getString("amt")+"</td>");
              out.print("<td>"+rs.getString("dis")+"</td>");
             out.print("<td>"+rs.getString("dis_amt")+"</td>");
             out.print("<td>"+rs.getString("net_amt")+"</td>");
             out.print("<td>"+rs.getString("cd")+"</td>");
               out.print("</tr>");
            
        }
             out.print("</table>");
            }
             else
             {
                 out.print("<h2><center>There is nothing to show</center></h2>");
             }
             out.print("</div>");
             
              if(bill.equals("undefined"))
            {
               
             query = "select *,lib_item_type.name,lib_title.title,supplier.sup from lib_purchase join supplier on supplier.sup_id=lib_purchase.sup_id join lib_item_type on lib_item_type.type_id=lib_purchase.type_id join lib_title on lib_title.title_id=lib_purchase.title_id where date='"+date+"'";
                
            }
            else  if(!bill.equals("undefined"))
            {
                query="select *,lib_item_type.name,lib_title.title,supplier.sup from lib_purchase join supplier on supplier.sup_id=lib_purchase.sup_id join lib_item_type on lib_item_type.type_id=lib_purchase.type_id join lib_title on lib_title.title_id=lib_purchase.title_id where bill_no='"+bill+"'";
            }
              else  if(!bill.equals("undefined")&& !date.equals("undefined"))
            {
                query="select *,lib_item_type.name,lib_title.title,supplier.sup from lib_purchase join supplier on supplier.sup_id=lib_purchase.sup_id join lib_item_type on lib_item_type.type_id=lib_purchase.type_id join lib_title on lib_title.title_id=lib_purchase.title_id where bill_no='"+bill+"' and date='"+date+"'";
            }
        System.out.println(query);
             ResultSet rs1=stmt.executeQuery(query);
              out.print("<div id='show1'>");
            
               out.print("<input  type='checkbox' name='cb[]' class='cb_r' value='bill_no'/>Bill No.<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='date'/>Date<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Sup'/>Supplier<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Name'/>Type<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Title'/>Title<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Year'/>Year<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Edition'/>Edition<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Vol'/>Volume<br>");
              out.print("<input  type='checkbox' name='cb[]' class='cb_r' value='Page'/>Page<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Qty'/>Quantity<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]'  value='Rate'/>Rate<br>");
           out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Amt'/>Amount<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Dis'/>Discount<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Dis_Amt'/>Discount Amount<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='Net_Amt'/>Net Amount<br>");
            out.print("<input type='checkbox'  class='cb_r' name='cb[]' value='CD'/>CD<br>");
            out.print("<input type='hidden' name='query'  value=\""+query+"\">");
             out.print("</div>");
              out.print("<div id='purchase'>");  
             
             
             if(rs1.next())
             {
//                 
                 rs1.previous();
              
             out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><table border='1'  >");
            out.print("<tr>");
          
           out.print("<th>BILL NO</th>");
            out.print("<th>DATE</th>");
            out.print("<th>SUPPLIER</th>");
            out.print("<th>ITEM TYPE</th>");
            out.print("<th>TITLE</th>");
           out.print("<th>YEAR</th>");
           out.print("<th>EDITION</th>");
             out.print("<th>VOLUME</th>");
              out.print("<th>PAGE</th>");
               out.print("<th>QUANTITY</th>");
             out.print("<th>RATE</th>");
              out.print("<th>AMOUNT</th>");
               out.print("<th>DISCOUNT</th>");
             out.print("<th>DIS AMOUNT</th>");
              out.print("<th>NET AMOUNT</th>");
              out.print("<th>CD</th>");
            out.print("</tr>");
//
            while(rs1.next())  
        { 
            out.print("<tr>");
//           
            out.print("<td>"+rs1.getString("bill_no")+"</td>");
              out.print("<td>"+rs1.getString("date")+"</td>");
            out.print("<td>"+rs1.getString("sup")+"</td>");
             out.print("<td>"+rs1.getString("name")+"</td>");
              out.print("<td>"+rs1.getString("title")+"</td>");
            out.print("<td>"+rs1.getString("year")+"</td>");
             out.print("<td>"+rs1.getString("edition")+"</td>");
              out.print("<td>"+rs1.getString("vol")+"</td>");
             out.print("<td>"+rs1.getString("page")+"</td>");
             out.print("<td>"+rs1.getString("qty")+"</td>");
              out.print("<td>"+rs1.getString("rate")+"</td>");
             out.print("<td>"+rs1.getString("amt")+"</td>");
              out.print("<td>"+rs1.getString("dis")+"</td>");
             out.print("<td>"+rs1.getString("dis_amt")+"</td>");
             out.print("<td>"+rs1.getString("net_amt")+"</td>");
             out.print("<td>"+rs1.getString("cd")+"</td>");
               out.print("</tr>");
             }   
        
             out.print("</table>");
             }
             else
             {
                 out.print("<h2><center>There is nothing to show</center></h2>");
                 out.print("</div>");
             }
             
             
            
            
             
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
