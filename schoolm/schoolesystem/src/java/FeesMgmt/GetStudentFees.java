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
public class GetStudentFees extends HttpServlet {

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
            String admsnno = request.getParameter("admsnno");
            String feeID = request.getParameter("feeID");
            int class_id = 0;
            String query;
            String change = "class=class_id";
            Connection con = DBConnection.getDBConnection();
            Statement getClass = con.createStatement();
            query = "SELECT class_id from class_tab where class_name='Others'";
            ResultSet gci = getClass.executeQuery(query);
            if(gci.next())
            {
                class_id = gci.getInt("class_id");
            }
            System.out.println(class_id);
            if(class_id != 0)
                change = "(class=class_id or class_id="+class_id+")";
            query = "select Caste,admission_no,Class_ID,Session_id,accf.FeeID,accf.FeeHead,Type,GEN,SC,ST"
                    + ",OBC,Others from (select * from (select Caste,ac.admission_no,class,year from (select "
                    + "std_caste as Caste,admission_no from personal_info where admission_no='"+admsnno+"') as ac inner join "
                    + "admission_tab on ac.admission_no=admission_tab.admission_no) as acc inner join feestructure on"
                    + " "+change+" and year=session_id) as accf inner join feehead on accf.feeid=feehead.feeid and "
                    + "accf.feehead=feehead.feehead and accf.feeID="+feeID;
            System.out.println(query);
            Statement stmt1 = con.createStatement();
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            out.println("<table class='table table-bordered'><tr><th style='display:none;'></th><th width='30%'>Fee Head</th>"
                    + "<th width='10%'>Type</th><th width='20%'>Total</th><th width='20%'>"
                    + "Balance</th><th width='20%'>Received</th></tr>");
            ResultSet rs1 = stmt1.executeQuery(query);
            if(rs1.next()){
                int caste = Integer.parseInt(rs1.getString("Caste"));
                System.out.println(caste);
                query = "Select * from studentfees where admission_no='"+admsnno+"'";
                System.out.println(query);
                ResultSet rs2 = stmt2.executeQuery(query);
                rs1.previous();
                String caste_name="";
                
                /*Extracts caste from caste_id*/
                if(caste == 1)
                  caste_name="GEN";
                else if(caste==2)
                    caste_name="SC";
                else if(caste==3)
                    caste_name="ST";
                else if(caste==4)
                    caste_name="OBC";
                else if(caste==5)
                    caste_name="Others";
                if(rs2.next())
                {
                    rs2.previous();
                    Statement stmt4 = con.createStatement();
                    while(rs1.next())
                    {
                        int feeid = rs1.getInt("feeid");
                        String feehead = rs1.getString("feehead");
                        double total = Double.parseDouble(rs1.getString(caste_name));
                        System.out.println(total);
                        query = "SELECT * FROM studentfees where admission_no="+admsnno+" and "
                                + "feeid="+feeid+" and feehead='"+feehead+"'";
                        System.out.println(query);
                        ResultSet rs3 = stmt4.executeQuery(query);
                        if(rs3.next())
                        {
                            System.out.println("in rs3");
                            double paid = Double.parseDouble(rs3.getString("feepaid"));
                            System.out.println(total+" "+paid);
                            if(total-paid!=0)
                            {
                                System.out.println("in paid");
                                out.println("<tr><td style='display:none'>"+rs1.getString("feeid")+"</td><td>"
                                +rs1.getString("feehead")+"</td>"
                                        + "<td>"+rs1.getString("type")+"</td>"
                                + "<td>"+total+"</td><td>"+(total-paid)+
                                "</td><td><input type='number' step='0.01' value='0' name='sfee' min=0 max='"+(total-paid)+"' style='width:100%;text-align:left'></td></tr>");
                            }
                        }
                        else
                        {
                            if(rs1.getInt("class_id") != class_id) {
                            query = "INSERT INTO studentfees VALUES('"+rs1.getString("admission_no")+"',"
                                + ""+rs1.getString("Feeid")+",'"+rs1.getString("feehead")+"',0)";
                            System.out.println(query);
                            int result = stmt3.executeUpdate(query);
                            out.println("<tr><td style='display:none'>"+rs1.getString("feeid")+"</td><td>"
                                +rs1.getString("feehead")+"</td>"
                                        + "<td>"+rs1.getString("type")+"</td>"
                                + "<td>"+Double.parseDouble(rs1.getString(caste_name))+"</td><td>"+rs1.getString(caste_name)+
                                "</td><td><input type='number' step='0.01' name='sfee' value='0' min=0 style='width:100%;text-align:left'></td></tr>");
                            }
                        }
                    }
                }
                else
                {
                    query = "INSERT INTO studentfees VALUES";
                    System.out.println(query);
                    while(rs1.next()) {
                        if(rs1.getInt("class_id") != class_id) {
                        query += "('"+rs1.getString("admission_no")+"',"
                                + ""+rs1.getString("Feeid")+",'"+rs1.getString("feehead")+"',0),";
                        out.println("<tr><td style='display:none'>"+rs1.getString("feeid")+"</td><td>"
                                +rs1.getString("feehead")+"</td>"
                                        + "<td>"+rs1.getString("type")+"</td>"
                                + "<td>"+Double.parseDouble(rs1.getString(caste_name))+"</td><td>"+rs1.getString(caste_name)+
                                "</td><td><input type='number' step='0.01' name='sfee' value='0' min=0 style='width:100%;text-align:left'></td></tr>");
                        }
                    }
                    query = query.substring(0,query.length()-1);
                    
                    System.out.println(query);
                    int result = stmt3.executeUpdate(query);
                }
            }
            else{
                out.println("<tr><td colspan='5' class='text-center'>Fee Structure is not ready</td></tr>");
                out.println("<p id='status' class='hidden'>0</p>");
            }
            out.println("</table>");
            out.println("<div id='amount'></div>");
                
                
        }catch(ClassNotFoundException | NumberFormatException | SQLException e){
            out.println("<p id='status' class='hidden'>1</p>");
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
