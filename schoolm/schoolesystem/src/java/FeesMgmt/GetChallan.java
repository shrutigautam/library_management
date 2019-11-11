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
public class GetChallan extends HttpServlet {

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
            int x = 0 ;
            out.println("<table class='table table-striped'><tr><th>S.No</th><th>Date</th><th>Challan No.</th><th>Admission No.</th>\n" +
"                    <th>Student Name</th><th>Father's Name</th><th>Class</th><th>Amount</th><th>FeeType</th><th>Payment At</th><th>Payment Mode</th>\n" +
"                    <th>Payment Details</th><th>Approved</th><th>Select</th><th>Txn. No.</th><th>Print</th><th>Cancel</th></tr>");
            Connection con = DBConnection.getDBConnection();
            Statement getChallan = con.createStatement();
                    String query = "SELECT DISTINCT feetype,date_format(date,'%d-%m-%Y') as date, "
                            + "ct.challan_no,at.Admission_no, CONCAT_WS(' ', Student_name, Middle_name, Last_name) "
                            + "as Full_name,Father_name, Class_name, Amount, PaymentAt, PaymentMode, PaymentDetails,"
                            + "Approved FROM challan_table as ct inner join admission_tab as at on ct.admission_no=at.admission_no"
                            + " inner join class_tab as cst on cst.class_id=at.class inner join challan_details as cd"
                            + " on ct.challan_no=cd.challan_no inner join feetype as ft on ft.feeID=cd.feeID WHERE Approved='N'";
                    System.out.println(query);
                    ResultSet gcRS = getChallan.executeQuery(query);
                    if(gcRS.next())
                    {
                        gcRS.previous();
                        while(gcRS.next()) {
                            //Table Body    
                            out.println("<tr>\n" +
    "                        <td>"+(++x)+"\n" +
    "                        </td><td>"+gcRS.getString("date")+"</td>\n" +
    "                        <td>"+gcRS.getString("challan_no")+"</td>\n" +
    "                        <td>"+gcRS.getString("admission_no")+"</td>\n" +
    "                        <td>"+gcRS.getString("full_name")+"</td>\n" +
    "                        <td>"+gcRS.getString("father_name")+"</td>\n" +
    "                        <td>"+gcRS.getString("class_name")+"</td>\n" +
    "                        <td>"+gcRS.getString("amount")+"</td>\n" +
    "                        <td>"+gcRS.getString("feetype")+"</td>\n" +
    "                        <td>"+gcRS.getString("paymentAt")+"</td>\n" +
    "                        <td>"+gcRS.getString("paymentMode")+"</td>\n" +
    "                        <td>"+gcRS.getString("paymentDetails")+"</td>\n" +
    "                        <td><input type='checkbox' name='approved'></td>\n" +
    "                        <td><input type='button' class='btn btn-success full-width' id='cstatus' value='OK'></td>\n" +
    "                        <td><input type='text' name='txn-no' style='width:100%'></td>\n" +
    "                        <td><input type='button' class='btn btn-primary full-width' id='cprint' value='Print'></td>\n" +
    "                        <td><input type='button' class='btn btn-danger full-width' id='ccancel' value='Cancel'></td>\n" +
    "                    </tr>");
                        }
                    }
                    else
                        out.println("<tr><td colspan='17' class='text-center'>No Challans Present</td></tr>");
                    
        } catch(Exception e)
        {
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
