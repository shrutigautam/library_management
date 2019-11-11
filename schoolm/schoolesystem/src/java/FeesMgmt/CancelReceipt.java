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
 * @author Tushar
 */
public class CancelReceipt extends HttpServlet {

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
        try {
            String receipt_no = request.getParameter("receipt_no");
            String challan_no = request.getParameter("challan_no");
            String admsnno = request.getParameter("admsnno");
            String remarks = request.getParameter("remarks");
            Connection con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "", resetFees="";
            int result;
            ResultSet rs;
            if(challan_no.equals("")) {
                query = "SELECT feeID,feeHead,paid FROM receipt_details where receipt_no="+receipt_no;
                System.out.println(query);
                rs = stmt.executeQuery(query);
                while(rs.next()) 
                    resetFees += "('"+admsnno+"',"+rs.getInt("feeID")+",'"+rs.getString("feeHead")+"',"+rs.getString("paid")+"),";
                resetFees = resetFees.substring(0, resetFees.length()-1);
                System.out.println(resetFees);
                query = "DELETE FROM receipt_details where receipt_no="+receipt_no;
                System.out.println(query);
                result = stmt.executeUpdate(query);
            }
            else {
                query = "SELECT feeID,feeHead,received FROM challan_details where challan_no="+challan_no;
                System.out.println(query);
                rs = stmt.executeQuery(query);
                while(rs.next())
                    resetFees += "('"+admsnno+"',"+rs.getInt("feeID")+",'"+rs.getString("feeHead")+"',"+rs.getString("received")+"),";
                resetFees = resetFees.substring(0, resetFees.length()-1);
                System.out.println(resetFees);
                query = "UPDATE challan_table SET Approved='N' WHERE challan_no="+challan_no;
                result = stmt.executeUpdate(query);
                System.out.println(query);
            }
            query = "INSERT INTO studentfees VALUES"+resetFees+" ON DUPLICATE KEY UPDATE Admission_no=Values(Admission_no),"
                    + "FeeID=Values(FeeID),FeeHead=Values(FeeHead),FeePaid=FeePaid-Values(FeePaid)";
            System.out.println(query);
            result = stmt.executeUpdate(query);
            query = "INSERT INTO receipt_del_info SELECT *,'"+remarks+"' FROM receipt_table WHERE receipt_no="+receipt_no;
            System.out.println(query);
            result = stmt.executeUpdate(query);
            query = "DELETE FROM receipt_table where receipt_no="+receipt_no;
            System.out.println(query);
            result = stmt.executeUpdate(query);
            out.println("<p id='status'>1</p>");
        } catch(Exception e) {
            out.println("<p id='status'>0</p>");
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
