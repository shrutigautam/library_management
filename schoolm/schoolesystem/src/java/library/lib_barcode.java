package library;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.onbarcode.barcode.Code128;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.onbarcode.barcode.AbstractBarcode;
import java.sql.PreparedStatement;


/**
 *
 * @author Shruti Gautam
 */
@WebServlet(name = "lib_barcode", urlPatterns = {"/lib_barcode"})

public class lib_barcode extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out=response.getWriter();
           Connection con = DBConnection1.getDBConnection();
            Statement stmt;
            stmt = con.createStatement();
         Code128 barcode = new Code128();
         String acc[]=request.getParameterValues("accession_no[]");
         String title[]=request.getParameterValues("title[]");
         System.out.println(acc.length+" "+acc[0]);
         String x="";
         for(int i=0;i<acc.length;i++)
         {
             x+="('"+acc[i]+"','D://barcode//"+acc[i]+".gif','"+title[i]+"'),";
             System.out.println(x);
         }
       
          x=x.substring(0,x.length()-1);
        String query="insert into lib_barcode(access_no,path,title) values "+x;
       PreparedStatement pst=con.prepareStatement(query);
         int result = pst.executeUpdate();
        for(int i=0;i<acc.length;i++)
        {
         out.print(acc[i]);
         barcode.setData(acc[i]);
         barcode.setX(2);
         barcode.setShowText(false);
         barcode.drawBarcode("D://barcode//"+acc[i]+".gif");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(lib_barcode.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(lib_barcode.class.getName()).log(Level.SEVERE, null, ex);
        }
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
