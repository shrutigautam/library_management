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
@WebServlet(name = "library_item_add", urlPatterns = {"/library_item_add"})
public class library_item_add extends HttpServlet {

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
            int type_id=Integer.parseInt(request.getParameter("item_id"));
             String lang=request.getParameter("lang");
           int subj_id=Integer.parseInt(request.getParameter("subj_id"));
            int title_id=Integer.parseInt(request.getParameter("title_id"));
             int subtitle_id=Integer.parseInt(request.getParameter("subtitle_id"));
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
            String auth1=request.getParameter("auth1_id");
           String auth2=request.getParameter("auth2_id");
          
            String place=request.getParameter("place");
           String pub=request.getParameter("pub_id");
           String keyword=request.getParameter("keyword");
           int cup_id=Integer.parseInt(request.getParameter("cup_id"));
            int shelf_id=Integer.parseInt(request.getParameter("shelf_id"));
          
        
             String query = "insert into lib_item(type_id,lang,subj_id,title_id,subtitle_id,isbn,class,book,content,remark,pur1,pur2,bil1,bil2,serial,status,item_key,prefix_id,acces1,acces2,acc1,acc2,auth_id1,auth_id2,pub_place,pub_id,keyword,cupboard,shelf) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
             PreparedStatement pst= con.prepareStatement(query);
             System.out.println(query);
              pst.setInt(1, type_id);
              pst.setString(2,lang);
                pst.setInt(3, subj_id);
                  pst.setInt(4, title_id);
                    pst.setInt(5, subtitle_id);
                pst.setString(6,isbn);
                 pst.setString(7,clas);
                  pst.setString(8,book);
                   pst.setString(9,content);
                 pst.setString(10,remark);
                  pst.setString(11,pur1);
                   pst.setString(12,pur2);
                 pst.setString(13,bil1);
                  pst.setString(14,bil2);
                   pst.setString(15,serial);
                 pst.setString(16,status);
                  pst.setString(17,key);
                   pst.setString(18,prefix);
                   pst.setString(19,acces1);
                   pst.setString(20,acces2);
                 pst.setString(21,acc1);
                  pst.setString(22,acc2);
                  pst.setString(23,auth1);
                   pst.setString(24,auth2);
                 
                  pst.setString(25,place);
                    pst.setString(26,pub);
                  pst.setString(27,keyword);
                  pst.setInt(28,cup_id);
                  pst.setInt(29,shelf_id);
                  
                
                    
             
              
           
            int result = pst.executeUpdate();
            if(result>0)
            {      out.println("<alert>Data Inserted</alert>");
            }
                     
        }
         catch(ClassNotFoundException | SQLException e)
        {
            out.println("<h4>Data Not Inserted</h4>"+e);
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
