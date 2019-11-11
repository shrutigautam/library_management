package package1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sunil
 */
public class country extends HttpServlet {


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
        try (PrintWriter out = response.getWriter()) {
            
            
            
            
            
        int cnt_id=Integer.parseInt( request.getParameter("cntid"));
        String cnt_name=request.getParameter("cntname");
        String buttonname=request.getParameter("btname");
         try{
            Class.forName( "com.mysql.jdbc.Driver");

         
             Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            PreparedStatement pstmt;
            if(buttonname.equals("add")){
            
                
                   String query = "insert into country_tab(country_name) values( '"+cnt_name+"') ";
            pstmt = conn.prepareStatement(query); // create a statement
    
      pstmt.executeUpdate();
                   
                response.sendRedirect("/schoolesystem/mst.jsp?key=6");
     // RequestDispatcher vi=request.getRequestDispatcher("/mst.jsp?key=1");
       //            vi.forward(request,response);
            }    
            else if(buttonname.equals("update")) {
                String query = "update country_tab set country_name='"+cnt_name+"' where country_id='"+cnt_id+"'";
          // Statement st=conn.createStatement();
                      pstmt = conn.prepareStatement(query); // create a statement
     // pstmt.setString(1, ses_id); // set input parameter 1
     // pstmt.setString(2, ses_name);
      // set input parameter 2
      //pstmt.setString(3, "sname"); // set input parameter 3
      pstmt.executeUpdate();
    //out.println(ses_id);
     
     pstmt.close();
     conn.close();
       response.sendRedirect("/schoolesystem/mst.jsp?key=6");
            
        }
        }
            catch(ClassNotFoundException | SQLException se){
                out.println(se);
           
        
        }
            
 
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
