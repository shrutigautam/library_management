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
public class GetReceipt extends HttpServlet {

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
            Connection con = DBConnection.getDBConnection();
            String query;
            Statement getReceipt = con.createStatement();
            Statement stmt = con.createStatement();
            ResultSet getft;
            query = "select date_format(date,'%d-%m-%Y') as date,receipt_no,challan_no,rt.admission_no,"
                    + "CONCAT_WS(' ',Student_name,Middle_name,Last_name) as Full_name,Father_name,Class_name,"
                    + "Amount,Transaction_no from receipt_table as rt inner join admission_tab as at on"
                    + " rt.admission_no=at.admission_no inner join class_tab as ct on ct.class_id=class;";
            System.out.println(query);
            ResultSet grRS = getReceipt.executeQuery(query);
            String rdate, challan_no, admission_no, student_name, father_name, class_name, amount, paymentAt,
                    paymentMode, paymentDetails, transaction_no, feetype; 
            int receipt_no, y = 0;
            out.println("<table class='table table-striped'>\n" +
"                    <tr><th>S.No</th><th>Date</th><th>Receipt No.</th><th>Challan No.</th>\n" +
"                        <th>Admission No.</th><th>Student Name</th><th>Father's Name</th><th>Class</th>\n" +
"                        <th>Amount</th><th>FeeType</th><th>Payment At</th><th>Payment Mode</th>\n" +
"                    <th>Payment Details</th><th>Txn. No.</th><th>Print</th><th>Cancel</th><th>Remarks</th></tr>");
            if(grRS.next()) {
                grRS.previous();
                while(grRS.next())
                {
                    rdate = grRS.getString("date");
                    receipt_no = grRS.getInt("receipt_no");
                    challan_no = grRS.getString("challan_no");
                    admission_no = grRS.getString("admission_no");
                    student_name = grRS.getString("full_name");
                    father_name = grRS.getString("father_name");
                    class_name = grRS.getString("class_name"); 
                    amount = grRS.getString("amount");
                    transaction_no = grRS.getString("transaction_no");
                    System.out.println(challan_no);
                    if(challan_no == null) {
                        paymentAt="School";
                        paymentMode = "Cash";
                        paymentDetails = "";
                        challan_no = "";
                        transaction_no = "";
                        query = "SELECT distinct feetype from receipt_details as rd "
                                + "inner join feetype as ft on rd.feeID=ft.feeID where receipt_no="+receipt_no;
                        System.out.println(query);
                        getft = stmt.executeQuery(query);
                        getft.next();
                        feetype = getft.getString("feetype");
                    }
                    else {
                        query = " select distinct paymentat, paymentmode,paymentdetails,feetype from "
                                + "challan_table as ct inner join challan_details as cd on ct.challan_no=cd.challan_no"
                                + " inner join feetype as ft on ft.feeID=cd.feeID WHERE ct.challan_no="+challan_no;
                        System.out.println(query);
                        getft = stmt.executeQuery(query);
                        getft.next();
                        paymentAt = getft.getString("paymentAt");
                        paymentMode = getft.getString("paymentMode");
                        paymentDetails = getft.getString("paymentDetails");
                        feetype = getft.getString("feetype");
                    }
                    out.println("<tr><td>"+(++y)+"</td>\n" +
"                            <td>"+rdate+"</td>\n" +
"                            <td>"+receipt_no+"</td>\n" +
"                            <td>"+challan_no+"</td>\n" +
"                            <td>"+admission_no+"</td>\n" +
"                            <td>"+student_name+"</td>\n" +
"                            <td>"+father_name+"</td>\n" +
"                            <td>"+class_name+"</td>\n" +
"                            <td>"+amount+"</td>\n" +
"                            <td>"+feetype+"</td>\n" +
"                            <td>"+paymentAt+"</td>\n" +
"                            <td>"+paymentMode+"</td>\n" +
"                            <td>"+paymentDetails+"</td>\n" +
"                            <td>"+transaction_no+"</td>\n" +
"                            <td><input type='button' id='rprint' class='btn btn-primary full-width' value='Print'></td>\n" +
"                            <td><input type='button' id='rcancel' class='btn btn-danger full-width' value='Cancel'></td>\n" +
"                            <td><input type='text' id='remarks' class='full-width' style='padding:5px'></td>\n" +
"                        </tr>");
                }
            }
            else
                out.println("<tr><td colspan='16' class='text-center'>No Receipts Present</td></tr>");
        } catch(Exception e) {
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
