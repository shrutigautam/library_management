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
public class PrintChallan extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8;image/png");
        PrintWriter out = response.getWriter();
        try {
            int challan_no = Integer.parseInt(request.getParameter("challan_no"));
            String admsnno = request.getParameter("admsnno");
            Connection con = DBConnection.getDBConnection();
            Statement stmt1 = con.createStatement();
            Statement stmt2 = con.createStatement();
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); 
            String query = "SELECT school_name, school_address, school_logo FROM school_info_tab LIMIT 1;";
            ResultSet school = stmt1.executeQuery(query);
            Blob blob;
            String path = request.getServletContext().getRealPath("/");
            File file = new File(path+"../../images");
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
            fos.close();
            File fpdf = new File(path+"pdf/");
            if(!fpdf.exists())
                fpdf.mkdir();
            query = "select CONCAT_WS(\" \",Student_name,Middle_name,Last_name) as Full_name, Father_name,"
                    + " Class_name, ct.Challan_no,at.Admission_no,Amount, PaymentDetails, Section_name, Bank_name"
                    + "  from admission_tab as at inner join challan_table as ct on at.admission_no=ct.admission_no"
                    + " inner join class_tab as cst on cst.class_id=at.class inner join section_tab as st on"
                    + " at.section=st.section_id inner join bank_tab as bt on ct.bank_id=bt.bank_id where "
                    + "at.admission_no="+admsnno+" and ct.challan_no="+challan_no;
            ResultSet info = stmt2.executeQuery(query);
            info.next();
            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path+"pdf/Challan.pdf"));
            document.open();
            //document.addTitle("Challan Form");
            StringBuilder sb = new StringBuilder("<!DOCTYPE HTML>\n" +
                "<html>\n" +
                "<head>\n" +
                "	<title>Challan Form</title>\n" +
                "	<link href='"+path+"/css/Challan_pdf.css' rel=\"stylesheet\" type=\"text/css\" />\n" +
                "</head>\n" +
                "	<body>\n" +
                "		<h4 class='heading'>Bank Copy</h4>\n" +
                "		<table width='100%' border='1'>\n" +
                "		<tr>\n" +
                "		<td width='80%'>\n" +
                "			<table width='100%' class='nested1'>\n" +
                "			<tr>\n" +
                "			<td width='84%'>\n" +
                "			<b>"+school.getString("school_name")+"</b><br></br>\n" +
                "			<b>"+school.getString("school_address")+"</b>\n" +
                "			</td>\n" +
                "			<td width='16%' align='right'>\n" +
                "			<img src='"+ipath+"' height='60px' width='60px' align='right' vertical-align='top' /></td>\n" +
                "			</tr>\n" +
                "			</table>\n<br></br>" +
                "			<table width='100%'>\n" +
                "				<tr><td width='40%'></td><td><h3>Challan Form</h3></td></tr>\n" +
                "			</table>\n" +
                "			<table width='100%' cellspacing='2'>\n" +
                "				<tr>\n" +
                "				<td width='30%'>Challan No.</td>\n" +
                "				<td width='35%'><b>"+challan_no+"</b></td>\n" +
                "				<td width='25%'>Dated</td>\n" +
                "				<td width='10%'><b>"+sdf.format(date)+"</b></td>\n" +
                "				</tr>\n" +
                "				<tr>\n" +
                "				<td width='30%'>Student's Name</td>\n" +
                "				<td width='35%'><b>"+info.getString("Full_name")+"</b></td>\n" +
                "				<td width='25%'>Admission No.</td>\n" +
                "				<td width='10%'><b>"+admsnno+"</b></td>\n" +
                "				</tr>\n" +
                "				<tr>\n" +
                "				<td width='20%'>Father's Name</td>\n" +
                "				<td width='40%'><b>"+info.getString("father_name")+"</b></td>\n" +
                "				<td width='20%'>Class</td>\n" +
                "				<td width='20%'><b>"+info.getString("class_name")+"</b></td>\n" +
                "				</tr>\n" +
                "				<tr>\n" +
                "				<td width='20%'>Bank Name</td>\n" +
                "				<td width='40%'><b>"+info.getString("Bank_name")+"</b></td>\n" +
                "				<td width='20%'>Section</td>\n" +
                "				<td width='20%'><b>"+info.getString("Section_name")+"</b></td>\n" +
                "				</tr>\n" +
                "				<tr>\n" +
                "				<td width='20%'>DD/Cheque</td>\n" +
                "				<td width='80%'><b>"+info.getString("PaymentDetails")+"</b></td>\n" +
                "				</tr>\n" +
                "				<tr>\n" +
                "				<td width='20%'>Fee Amount</td>\n" +
                "				<td width='80%'><b>"+info.getInt("amount")+"</b></td>\n" +
                "				</tr>\n" +
                "			</table><br></br>\n" +
                "			<table width='100%'>\n" +
                "				<tr>\n" +
                "					<td width='70%'>\n" +
                "						Signature / Bank Stamp<br></br>\n" +
                "						General Transaction No. _ _ _ _ _\n" +
                "					</td>\n" +
                "					<td width='30%'>\n" +
                "					<br></br>\n" +
                "					<br></br>\n" +
                "					Signature Of Depositor\n" +
                "					</td>\n" +
                "				</tr>\n" +
                "			</table>\n" +
                "		</td>\n" +
                "		<td width='20%' align='center' style='padding:5px;'>\n" +
                "		<h4 class='heading'>DENOMINATION OF NOTES</h4>\n" +
                "		<center>\n" +
                "		<table style='width:100%' border='1'>\n" +
                "			<tr><td width='45%'>2000 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>500 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>100 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>50 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>20 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>10 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>5 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>2 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>1 X</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>Coins</td>	<td width='55%'></td></tr>\n" +
                "			<tr><td width='45%'>Total</td>	<td width='55%'></td></tr>\n" +
                "		</table>\n" +
                "		</center>\n" +
                "		</td>\n" +
                "		</tr>\n" +
                "		</table><br/>\n" +
                "	</body>\n" +
                "</html>"); /*END OF STRINGBUILDER*/
            String s = sb.toString();
            System.out.println(s);
            sb.append(s.replace("Bank Copy","College Copy")+s.replace("Bank Copy","Student Copy"));
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, new StringReader(sb.toString()));
            document.close();
            writer.close();
            System.out.println("Done");
        } catch(Exception e)
        {
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
