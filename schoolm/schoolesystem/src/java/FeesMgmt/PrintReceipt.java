/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeesMgmt;

import java.io.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.tool.xml.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Common.DBConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author Tushar
 */
public class PrintReceipt extends HttpServlet {

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
            int receipt_no = Integer.parseInt(request.getParameter("receipt_no"));
            String admsnno = request.getParameter("admsnno");
            String challan_no = request.getParameter("challan_no");
            String amount = request.getParameter("amount");
            Connection con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); 
            String rdate = sdf.format(date);
            String query = "SELECT school_name, school_address, school_logo FROM school_info_tab LIMIT 1;";
            ResultSet school = stmt.executeQuery(query);
            Blob blob;
            String path = request.getServletContext().getRealPath("/");
            File file = new File(path+"../../images");
            if(!file.exists())
                file.mkdir();
            String ipath = file.getCanonicalPath()+"/logo.png";
            System.out.println(ipath);
            FileOutputStream fos = new FileOutputStream(new File(ipath));
            byte logo[];
            if(school.next())
            {
                blob = school.getBlob("school_logo");
                logo = blob.getBytes(1, (int)blob.length());
                fos.write(logo);
            }
            String school_name = school.getString("school_name");
            String school_address = school.getString("school_address");
            fos.close();
            File fpdf = new File(path+"pdf/");
            if(!fpdf.exists())
                fpdf.mkdir();
            query = "select CONCAT_WS(' ',Student_name, Middle_name, Last_name) as Student_name, "
                    + "Father_name, Class_name,Section_name,IFNULL(guardian_contactno,'') as Contact_no FROM"
                    + " receipt_table as rt inner join admission_tab as at on rt.admission_no=at.admission_no"
                    + " inner join class_tab as ct on at.class=ct.Class_id inner join section_tab as st on"
                    + " st.section_id=at.section inner join contact_detail as cd on cd.admission_no=at.admission_no "
                    + "where receipt_no="+receipt_no;
            System.out.println(query);
            ResultSet info = stmt.executeQuery(query);
            info.next();
            String student_name = info.getString("student_name");
            String father_name = info.getString("father_name");
            String class_name = info.getString("class_name");
            String section_name = info.getString("section_name");
            String contact_no = info.getString("contact_no");
            /*Getting FeeDetails*/
            if(challan_no.equals("")) 
                query = "SELECT feeHead,Paid as Amount FROM receipt_details where receipt_no="+receipt_no;
            else
                query = "SELECT feeHead,Received as Amount FROM challan_details where challan_no="+challan_no;
            ResultSet fee=stmt.executeQuery(query);
            StringBuilder feeDetails = new StringBuilder("<table cellpadding='7' cellspacing='5' width='100%' "
                    + "align='center' border='1' style='border-collapse:collapse'><tr><th width='30%'>S.No</th>"
                    + "<th width='35%' align='center'>Fee Head</th><th width='35%' align='center'>Amount</th></tr>");
            int x = 0;
            while(fee.next())
                feeDetails.append("<tr><td>"+(++x)+"</td><td align='center'>"+fee.getString("feeHead")+"</td><td align='center'>"+fee.getString("Amount")+"</td></tr>");
            feeDetails.append("<tr><td></td><td align='center'><b>Total:</b></td><td align='center'><b>"+amount+"</b></td></tr></table>");
            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path+"pdf/Receipt.pdf"));
            document.open();
            StringBuilder sb = new StringBuilder("<!DOCTYPE HTML>\n" +
"<html>\n" +
"<head>\n" +
"	<title>Receipt Form</title>\n" +
"	<link href='"+path+"/css/Receipt_pdf.css' rel=\"stylesheet\" type=\"text/css\" />\n" +
"</head>\n" +
"	<body>\n" +
"	<h2 class='heading'>RECEIPT FORM</h2>\n" +
"	<table width='100%' border='1'>\n" +
"		<tr>\n" +
"			<td>\n" +
"				<table width='100%'>\n" +
"				<tr>\n" +
"				<td width='84%'>\n" +
"				<b>"+school_name+"</b><br/>\n" +
"				<b>"+school_address+"</b>\n" +
"				</td>\n" +
"				<td width='16%' align='right'>\n" +
"				<img src='"+ipath+"' height='60px' width='60px' align='right' vertical-align='top' /></td>\n" +
"				</tr>\n" +
"				</table>\n <br/>" +
"		<div><h3 class='heading'>PERSONAL DETAILS</h3></div>\n" +
"			<table width='100%' cellspacing='2' cellpadding='5'>\n" +
"				<tr>\n" +
"				<td width='30%'>Receipt No.</td>\n" +
"				<td width='35%'><b>"+receipt_no+"</b></td>\n" +
"				<td width='25%'>Dated</td>\n" +
"				<td width='10%'><b>"+rdate+"</b></td>\n" +
"				</tr>\n" +
"				<tr>\n" +
"				<td width='30%'>Student's Name</td>\n" +
"				<td width='35%'><b>"+student_name+"</b></td>\n" +
"				<td width='25%'>Admission No.</td>\n" +
"				<td width='10%'><b>"+admsnno+"</b></td>\n" +
"				</tr>\n" +
"				<tr>\n" +
"				<td width='20%'>Father's Name</td>\n" +
"				<td width='40%'><b>"+father_name+"</b></td>\n" +
"				<td width='20%'>Class</td>\n" +
"				<td width='20%'><b>"+class_name+"</b></td>\n" +
"				</tr>\n" +
"				<tr>\n" +
"				<td width='20%'>Contact No.</td>\n" +
"				<td width='40%'><b>"+contact_no+"</b></td>\n" +
"				<td width='20%'>Section</td>\n" +
"				<td width='20%'><b>"+section_name+"</b></td>\n" +
"				</tr>\n" +
"				<tr>\n" +
"				<td width='20%'>Fee Amount</td>\n" +
"				<td width='80%'><b>"+amount+"</b></td>\n" +
"				</tr>\n" +
"			</table><br></br>\n" +
"			<div><h3 class='heading'>FEE DETAILS</h3></div>\n" +
"			<div style='padding:5px 20px'>"+feeDetails.toString()+"</div>	\n" +
"                       <br/>"
        + "</td></tr>\n" +
"		</table><br/>"
        + "<div><h4 style='text-align:right;'>Authorised Signatory</h4></div>\n" +
"			\n" +
"	</body>\n" +
"</html>");
            String s = sb.toString();
            System.out.println(s);
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, new StringReader(sb.toString()));
            document.close();
            writer.close();
            System.out.println("Done");
            out.println("<p id='status'>1</p>");
        } catch(Exception e)
        {
            out.println("<p id='status'>0</p>");
            out.println(e.getMessage());
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
