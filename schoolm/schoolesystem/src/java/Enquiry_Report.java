import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saumya Joshi
 */
public class Enquiry_Report extends HttpServlet {

   
     public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            String class1=request.getParameter("class1");
            String cat1=request.getParameter("cat1");
            String date1=request.getParameter("d1");
            String date2=request.getParameter("d2");
                 //Create Document instance. 
                 Document document = new Document();
                 //Create OutputStream instance.
                // Date date=new Date();
                // String filename1 = "Attendance-"+date.toString()+".pdf";
                 OutputStream outputStream = new FileOutputStream(new File("F:\\EnquiryReport.pdf"));   
                 //Create PDFWriter instance.
                 PdfWriter.getInstance(document, outputStream);
                 //Open the document. 
                 document.open();
                 //Create paragraph objects
                 Paragraph paragraph1 = new Paragraph("ENQUIRY REPORT");
                 Paragraph paragraph2 = new Paragraph("FROM:- "+date1+" TO:- "+date2);
                
                 //Set alignment, spacing etc on Paragraph2
                 paragraph2.setSpacingAfter(35);
                 paragraph2.setSpacingBefore(35);
                 paragraph1.setAlignment(Element.ALIGN_CENTER);
                 paragraph2.setAlignment(Element.ALIGN_CENTER);
                 paragraph2.setIndentationLeft(40); 
                 paragraph2.setIndentationRight(40);   
                 //Add content to the document using Paragraph objects. 
                 document.add(paragraph1);
                 document.add(paragraph2); 
                 //Create Table object, Here 5 specify the no. of columns 
                 PdfPTable pdfPTable = new PdfPTable(6);    
                     
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 String query_s1 = "select enquiry_id, std_name, std_fname, std_mobile, std_address  FROM enquiry_tab  WHERE std_class='"+class1+"' AND date_value BETWEEN '"+date1+"' AND '"+date2+"'";
                 ResultSet rs = stmt.executeQuery(query_s1);
                 PdfPCell HpdfPCellS = new PdfPCell(new Paragraph("Serial No")); 
                 PdfPCell HpdfPCell1 = new PdfPCell(new Paragraph("Enquiry No"));
                 PdfPCell HpdfPCell2 = new PdfPCell(new Paragraph("Student's Name")); 
                 PdfPCell HpdfPCell3 = new PdfPCell(new Paragraph("Father's Number"));
                 PdfPCell HpdfPCell4 = new PdfPCell(new Paragraph("Mobile")); 
                 PdfPCell HpdfPCell5 = new PdfPCell(new Paragraph("Address")); 
                 pdfPTable.addCell(HpdfPCellS);
                 pdfPTable.addCell(HpdfPCell1);
                 pdfPTable.addCell(HpdfPCell2);
                 pdfPTable.addCell(HpdfPCell3);
                 pdfPTable.addCell(HpdfPCell4);
                 pdfPTable.addCell(HpdfPCell5);
                 int i=1;
                 while(rs.next())
                 {
                 String serial_no = i+"";
                 PdfPCell pdfPCellS = new PdfPCell(new Paragraph(serial_no));
                 pdfPTable.addCell(pdfPCellS);
           
           
            String enquiry_id = rs.getString("enquiry_id");
            PdfPCell pdfPCell1 = new PdfPCell(new Paragraph(enquiry_id));
            pdfPTable.addCell(pdfPCell1);
            String student_name = rs.getString("std_name");
            PdfPCell pdfPCell2 = new PdfPCell(new Paragraph(student_name));
            pdfPTable.addCell(pdfPCell2);
            String fname = rs.getString("std_fname");
            PdfPCell pdfPCell3 = new PdfPCell(new Paragraph(fname));
            pdfPTable.addCell(pdfPCell3);
            String mobile = rs.getString("std_mobile");
            PdfPCell pdfPCell4 = new PdfPCell(new Paragraph(mobile));
            pdfPTable.addCell(pdfPCell4);
            String address = rs.getString("std_address");
            PdfPCell pdfPCell5 = new PdfPCell(new Paragraph(address));
            pdfPTable.addCell(pdfPCell1);
            i++;
        }
             //Add content to the document using Table objects.
            document.add(pdfPTable);  
            // document.add(new Paragraph("Hello world, " + "this is a test pdf file."));
            //Close document and outputStream.
           document.close(); 
           outputStream.close();
           
      //     out.print("Pdf created successfully. LOCATION: F:\\TestTableFile5.pdf");
     
           }
                 catch(Exception et){
                   out.print("oops"+et);  
                 }
        }
    }

    