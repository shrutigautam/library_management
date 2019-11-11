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
@WebServlet(name = "lib_accession_list", urlPatterns = {"/lib_accession_list"})

public class lib_accession_list extends HttpServlet {

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
            int title=Integer.parseInt(request.getParameter("title"));
            int type=Integer.parseInt(request.getParameter("type"));
            String year=request.getParameter("year");
            String edition=request.getParameter("edition");
            String vol=request.getParameter("vol");
            String page=request.getParameter("page");
//            out.print(title+"_"+type+"_"+year+"_"+edition+"_"+vol+"_"+page); 
            String query="select lib_accession.title_id,lib_accession.access_no,lib_title.title from lib_accession join lib_title on lib_title.title_id=lib_accession.title_id where lib_accession.title_id=? and lib_accession.type=? and lib_accession.year=? and lib_accession.edition=? and lib_accession.vol=? and lib_accession.page=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setInt(1, title);
            pst.setInt(2,type);
            pst.setString(3,year);
            pst.setString(4,edition);
            pst.setString(5,vol);
            pst.setString(6,page);
            
           
            ResultSet rs=pst.executeQuery();
            out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;} overflow-y='auto;'</style><table border='1' style='overflow-y:auto;' >");
            out.print("<tr>");
            out.print("<th>Select</th>");
            out.print("<th>TITLE</th>");
            out.print("<th>ACCESSION NO.</th>");
            out.print("</tr>");
            while(rs.next())
            {
                out.print("<tr>");
                out.print("<td><input type='checkbox' class='cb1'/></td>");
                out.print("<td>"+rs.getString("title")+"</td><input type='hidden' class='title_id' value='"+rs.getString("title_id")+"'>");
                out.print("<td>"+rs.getString("access_no")+"</td>");
                out.print("</tr>");
            }
            out.print("</table>");
            
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
