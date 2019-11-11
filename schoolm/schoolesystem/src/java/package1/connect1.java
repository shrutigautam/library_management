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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sunil
 */
public class connect1 extends HttpServlet {

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
           String cl_id=request.getParameter("cid");
        String cl_name=request.getParameter("cname");
        String buttonname=request.getParameter("btname");
         
            if(buttonname.equals("add")){
            try{
            Class.forName( "com.microsoft.sqlserver.jdbc.SQLServerDriver");

         
                try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; databaseName=erp","sa","Bsacet@123")) {
                    PreparedStatement pstmt;
                    String query = "insert into class_tab(class_id,class_name) values(?, ?)";
                    pstmt = conn.prepareStatement(query); // create a statement
                    pstmt.setString(1, cl_id); // set input parameter 1
                    pstmt.setString(2, cl_name); // set input parameter 2
                    //pstmt.setString(3, "sname"); // set input parameter 3
                    pstmt.executeUpdate();
                    out.println("asdfg");
                    pstmt.close();
                }
      RequestDispatcher vi=request.getRequestDispatcher("/mst.jsp?key=1");
                   vi.forward(request,response);
    
        }
            catch(ClassNotFoundException | SQLException se){
                out.println(se);
            } 
        
        }
        else {
            out.println("connection not establish");
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
