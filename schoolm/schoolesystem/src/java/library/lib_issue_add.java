/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shruti Gautam
 */
@WebServlet(name = "lib_issue_add", urlPatterns = {"/lib_issue_add"})
public class lib_issue_add extends HttpServlet {

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
            Connection conn=DBConnection1.getDBConnection();
            Statement stmt;
            stmt=conn.createStatement();
           
            String access_no=request.getParameter("access_no");
            String adm_no=request.getParameter("mem_code");
            String reg_date=request.getParameter("reg_date");
            String exp_date=request.getParameter("exp_date");
             String issue_date=request.getParameter("issue_date");
           // String return_date=request.getParameter("return_date");
            String type_id=request.getParameter("type_id");
            String title_id=request.getParameter("title_id");
            String flag=request.getParameter("flag");
            String grp=request.getParameter("grp");
            String class_id=request.getParameter("class_id");
            //out.print(return_date);
            String query1="select status from lib_accession where access_no=? ";
            PreparedStatement pst1=conn.prepareStatement(query1);
            pst1.setString(1,access_no);
            ResultSet rs1=pst1.executeQuery();
            if(rs1.next())
            {
                if(rs1.getString("status").equals("AVAILABLE"))
                {
                    
            String query="insert into lib_issue(adm_no,grp,class_id,reg_date,exp_date,accession_no,type_id,title_id,Issue_date,flag) values(?,?,?,?,?,?,?,?,?,?)";
            System.out.println(query);
            
            PreparedStatement pst=conn.prepareStatement(query);
            pst.setString(1, adm_no);
            pst.setString(2, grp);
            pst.setString(3, class_id);
            pst.setString(4, reg_date);
            pst.setString(5, exp_date);
            pst.setString(6, access_no);
            pst.setString(7, type_id);
            pst.setString(8, title_id);
            pst.setString(9, issue_date);
//            pst.setString(10, return_date);
            pst.setString(10,flag);
                 
            int result = pst.executeUpdate();
            if(result>0)
            { 
                out.print("ISSUED");
            }
           String query2="update lib_accession set status='ISSUED' where access_no=?";
           PreparedStatement pst2= conn.prepareStatement(query2);
              pst2.setString(1, access_no);
               int result2 = pst2.executeUpdate();
            }
                else
                {
                    
                  String query6="select adm_no from lib_issue where adm_no='"+adm_no+"' and accession_no='"+access_no+"' and flag='i'";
                  ResultSet rs6=stmt.executeQuery(query6);
                    System.out.println(query6);
                   
                   if(rs6.next())
                   {
                       
                    out.print("RETURNED"); 
                   
                    String query="update lib_issue set return_date='"+java.time.LocalDate.now()+"' , flag='r' where accession_no=?";
                 
                    PreparedStatement pst=conn.prepareStatement(query);
                    pst.setString(1,access_no);
                    int result=pst.executeUpdate();
               
                
                    String query5="update lib_accession set status='AVAILABLE' where access_no=?";
           PreparedStatement pst5= conn.prepareStatement(query5);
              pst5.setString(1, access_no);
               int result5 = pst5.executeUpdate();
                   }
                   else
                   {
                       out.print("ALREADY ISSUED");
                   }
//                   
//                   
                }
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
