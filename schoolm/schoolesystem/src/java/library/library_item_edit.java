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
@WebServlet(name = "library_item_edit", urlPatterns = {"/library_item_edit"})
public class library_item_edit extends HttpServlet {

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
            int item_id=Integer.parseInt(request.getParameter("item_id"));
           String isbn=request.getParameter("isbn");
           String clas=request.getParameter("clas");
           String book=request.getParameter("book");
           String content=request.getParameter("content");
           String remark=request.getParameter("remark");
           String pur1=request.getParameter("pur1");
           String pur2=request.getParameter("pur2");
           String bil1=request.getParameter("bil1");
           String bil2=request.getParameter("bil2");
           String serial=request.getParameter("serial");
           String status=request.getParameter("status");
           String key=request.getParameter("key");
           String prefix=request.getParameter("prefix");
            String acces1=request.getParameter("acces1");
           String acces2=request.getParameter("acces2");
           String acc1=request.getParameter("acc1");
           String acc2=request.getParameter("acc2");
          out.print(acc1);
          
            String place=request.getParameter("place");
           
           String keyword=request.getParameter("keyword");
          
        
             String query = "update lib_item set isbn=? ,class=?,book=?,content=?,remark=?,pur1=?,pur2=?,bil1=?,bil2=?,serial=?,status=?,item_key=?,prefix=?,acces1=?,acces2=?,acc1=?,acc2=?,pub_place=?,keyword=? where item_id=?";
             PreparedStatement pst= con.prepareStatement(query);
             System.out.println(query);
             
                pst.setString(1,isbn);
                
                 pst.setString(2,clas);
                  pst.setString(3,book);
                   pst.setString(4,content);
                 pst.setString(5,remark);
                  pst.setString(6,pur1);
                   pst.setString(7,pur2);
                 pst.setString(8,bil1);
                  pst.setString(9,bil2);
                   pst.setString(10,serial);
                 pst.setString(11,status);
                  pst.setString(12,key);
                   pst.setString(13,prefix);
                   pst.setString(14,acces1);
                   pst.setString(15,acces2);
                 pst.setString(16,acc1);
                  pst.setString(17,acc2);
                 pst.setString(18,place);
                  pst.setString(19,keyword);
                pst.setInt(20,item_id);
//                  
           int result = pst.executeUpdate();
            if(result>0)
            {      out.println("<alert>Data Inserted</alert>");
                // response.sendRedirect("library_item_show.jsp");
            }
                     
        }
         catch(ClassNotFoundException | SQLException e)
        {
            out.println("<h4>Data Not Inserted</h4>"+e);
            // response.sendRedirect("library_item_show.jsp");
            
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
