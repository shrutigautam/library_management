package package1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import package1.connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sunil
 */
public class Category extends HttpServlet {

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
            int cat_id=Integer.parseInt(request.getParameter("categoryid"));
            //out.print(ses_id);
        String cat_name=request.getParameter("categoryname");
        String buttonname=request.getParameter("btname");
         
            
            try{
            Class.forName( "com.mysql.jdbc.Driver");

         
             Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            
            PreparedStatement pstmt;
            if(buttonname.equals("add")){
            String query = "insert into category_tab(category_name) values( '"+cat_name+"') ";
            pstmt = conn.prepareStatement(query); // create a statement
    
      pstmt.executeUpdate();
    
      
      
       response.sendRedirect("/schoolesystem/mst.jsp?key=9");
            }

                   else if(buttonname.equals("update")){
                       
            
                      String query = "update category_tab set category_name='"+cat_name+"' where session_id='"+cat_id+"'";
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
       response.sendRedirect("/schoolesystem/mst.jsp?key=9");
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
        PrintWriter out = response.getWriter();
        
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
