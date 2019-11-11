/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package package1;

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
public class form1 extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            String b=request.getParameter("Name");  
        String c=request.getParameter("DOB");  
        String d=request.getParameter("FName");  
        String e=request.getParameter("FOccupation");
        String f=request.getParameter("MName");
        String g=request.getParameter("Address");
        int h=Integer.parseInt(request.getParameter("City"));
        String i=request.getParameter("Gender");
        String j=request.getParameter("Email_ID");
        int k=Integer.parseInt(request.getParameter("Class"));
        String l=request.getParameter("School");
        String m=request.getParameter("Parents");
        int n=Integer.parseInt(request.getParameter("Mobile_No"));
        int o=Integer.parseInt(request.getParameter("Landline_No"));
        int p=Integer.parseInt(request.getParameter("Alternate_No"));
        int q=Integer.parseInt(request.getParameter("Category"));
        int r=Integer.parseInt(request.getParameter("Family_Income"));
        String s=request.getParameter("Admission_Mode");
        String t=request.getParameter("Admission_Place");
        String u=request.getParameter("Remark");
       // String enq="203";
        try{
            Class.forName( "com.mysql.jdbc.Driver");

         
             Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            if(conn!=null){
            PreparedStatement ps=conn.prepareStatement(
                    "insert into enquiry_tab values('202',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            //out.println("dsf");
            ps.setString(1,b);
            ps.setString(2,c);
            ps.setString(3,d);
            ps.setString(4,e);
            ps.setString(5,f);
            ps.setString(6,g);
            ps.setInt(7,h);
            ps.setString(8,i);
            ps.setString(9,j);
            ps.setInt(10,k);
            ps.setString(11,l);
            ps.setString(12,m);
            ps.setInt(13,n);
            ps.setInt(14,o);
            ps.setInt(15,p);
            ps.setInt(16,q);
            ps.setInt(17,r);
            ps.setString(18,s);
            ps.setString(19,t);
            ps.setString(20,u);
            ps.executeUpdate();
            //if(v>0){
              //  
               out.print("You are successfully registered...");
            //}
            }
            else{
              out.println("not connection");
                      }
        }catch (ClassNotFoundException | SQLException e2)
        {
            System.out.println(e2);
        }
      out.println("not connected");
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
