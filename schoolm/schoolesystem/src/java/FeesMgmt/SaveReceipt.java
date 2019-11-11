/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeesMgmt;
import java.util.Date;
import java.text.SimpleDateFormat;
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
public class SaveReceipt extends HttpServlet {

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
            String data1, data2, query;
            String admsnno = request.getParameter("admsnno");
            String challan_status = request.getParameter("challan_status");
            Connection con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            int result;
            if(challan_status.equals("No")) {
                data1 = request.getParameter("query1");
                data2 = request.getParameter("query2");
                query = "INSERT INTO receipt_table VALUES"+data1;
                System.out.println(query);
                result = stmt.executeUpdate(query);
                String fee_paid = data2.replace("x",admsnno+"");
                System.out.println(fee_paid);
                query = "INSERT INTO studentfees VALUES"+fee_paid+" ON DUPLICATE KEY UPDATE "
                        + "Admission_No=Values(Admission_no),FeeID=Values(FeeID),FeeHead=Values(FeeHead),"
                        + "FeePaid=FeePaid+Values(FeePaid)";
                result = stmt.executeUpdate(query);
                query = "SELECT receipt_no FROM receipt_table order by receipt_no DESC LIMIT 1";
                ResultSet rs = stmt.executeQuery(query);
                rs.next();
                String receipt_details = data2.replace("x",rs.getInt("receipt_no")+"");
                query = "INSERT INTO receipt_details VALUES"+receipt_details;
                System.out.println(query);
                result = stmt.executeUpdate(query);
                out.println("<p id='status'>1</p>");
            }
            else {
                int challan_no = Integer.parseInt(request.getParameter("challan_no"));
                String amount = request.getParameter("amount");
                String transaction_no = request.getParameter("transaction_no");
                //Approve Challan
                query = "UPDATE challan_table SET approved='Y' where Challan_no="+challan_no;
                System.out.println(query);
                result = stmt.executeUpdate(query);
                //Update Studentfees Table
                query = "SELECT feeID,feeHead,received FROM challan_details where challan_no="+challan_no;
                ResultSet rs = stmt.executeQuery(query);
                if(rs.next()) {
                    rs.previous();
                    data2 = "";
                    while(rs.next()) {
                        data2 += "('"+admsnno+"',"+rs.getInt("feeID")+",'"+rs.getString("feeHead")+"',"+rs.getString("received")+"),";
                    }
                    data2=data2.substring(0,data2.length()-1);
                    query = "INSERT INTO studentfees VALUES"+data2+" ON DUPLICATE KEY UPDATE "
                        + "Admission_No=Values(Admission_no),FeeID=Values(FeeID),FeeHead=Values(FeeHead),"
                        + "FeePaid=FeePaid+Values(FeePaid)";
                    System.out.println(query);
                    result = stmt.executeUpdate(query);
                    Date date = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String rdate = sdf.format(date);
                    System.out.println(rdate);
                    query = "INSERT INTO receipt_table VALUES('"+rdate+"',0,"+challan_no+",'"+admsnno+"',"+amount+","+transaction_no+")";
                    System.out.println(query);
                    result = stmt.executeUpdate(query);
                    out.println("<p id='status'>1</p>");
                }
            }
        }catch(Exception e)
        {
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
