/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeesMgmt;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Common.DBConnection;
/**
 *
 * @author tusha
 */
public class GetFeeStructure extends HttpServlet {

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
        try{
           Connection con = DBConnection.getDBConnection(); 
           Statement stmt = con.createStatement();
           String session_id = request.getParameter("session_id");
           String class_id = request.getParameter("class_id");
           String query = "SELECT * FROM feestructure where class_id="+class_id+" and session_id="+session_id;
           System.out.println(query);
           ResultSet rs = stmt.executeQuery(query);
           int i=1;
           out.println("<table class='table table-bordered' id='table-editable'><tr><th class='hidden'>FeeID</th><th>Fee Head</th><th>GEN</th><th>SC</th><th>ST</th><th>OBC</th><th>Others</th></tr>");
           if(rs.next())
           {
               rs.previous();
                while(rs.next())
                {
                    float gen = Float.parseFloat(rs.getString("GEN"));
                    System.out.println(gen);
                    float sc = Float.parseFloat(rs.getString("SC"));
                    float st = Float.parseFloat(rs.getString("ST"));
                    float obc = Float.parseFloat(rs.getString("OBC"));
                    float others = Float.parseFloat(rs.getString("Others"));
                    out.println("<tr><td class='hidden' name='feeID"+i+"'>"+rs.getInt("feeID")+"</td><td name='feeHead"+i+"'>"+rs.getString("feehead")+
                            "</td><td><input type='number' step='0.01' style='width:100%' name='gen"+(i)+"' value='"+gen+"'></td><td>"
                                    + "<input type='number' step='0.01' name='sc"+(i)+"' value='"+sc+"'></td><td><input"
                                            + " type='number' step='0.01' name='st"+(i)+"' value='"+st+"'></td><td><input"
                                                    + " type='number' step='0.01' name='obc"+(i)+"' value='"+obc+"'></td><td><input "
                                                            + "type='number' step='0.01' name='others"+(i)+"' value='"+others+"'></td></tr>");
                    System.out.println("<tr><td class='hidden' name='feeID"+i+"'>"+rs.getInt("feeID")+"</td><td name='feeHead"+i+"'>"+rs.getString("feehead")+
                            "</td><td><input type='number' step='0.01' style='width:100%' name='gen"+(i)+"' value='"+gen+"'></td><td>"
                                    + "<input type='number' step='0.01' name='sc"+(i)+"' value='"+sc+"'></td><td><input"
                                            + " type='number' step='0.01' name='st"+(i)+"' value='"+st+"'></td><td><input"
                                                    + " type='number' step='0.01' name='obc"+(i)+"' value='"+obc+"'></td><td><input "
                                                            + "type='number' step='0.01' name='others"+(i)+"' value='"+others+"'></td></tr>");
                    i++;
                }
           }
           else
           { 
               out.println("<tr><td colspan='6' class='text-center'>No Feeheads present</td></tr>");
           }
           out.println("</table>");
        }catch(Exception e){
            System.out.println(e.getMessage());
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
