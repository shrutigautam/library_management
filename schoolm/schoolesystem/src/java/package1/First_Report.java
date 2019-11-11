package package1;

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
public class First_Report extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out=response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            String session1_val=request.getParameter("session1_val");
            String class1_val=request.getParameter("class1_val");
            String section1_val=request.getParameter("section1_val");
            String date1_val=request.getParameter("date1_val");
            String date2_val=request.getParameter("date2_val");    
            /* TODO output your page here. You may use following sample code. */
                 try{
                 //Create Document instance. 
                 Document document = new Document();
                 //Create OutputStream instance.
                // Date date=new Date();
                // String filename1 = "Attendance-"+date.toString()+".pdf";
                 OutputStream outputStream = new FileOutputStream(new File("F:\\attendanceReport.pdf"));   
                 //Create PDFWriter instance.
                 PdfWriter.getInstance(document, outputStream);
                 //Open the document. 
                 document.open();
                 //Create paragraph objects
                 Paragraph paragraph1 = new Paragraph("ATTENDANCE REPORT");
                 Paragraph paragraph2 = new Paragraph("FROM:- "+date1_val+" TO:- "+date2_val);
                
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
                 //Create Table object, Here 4 specify the no. of columns 
                 PdfPTable pdfPTable = new PdfPTable(5);    
                     
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 String query_s1 = "select admission_no, student_id, roll_no, SUM( CASE status WHEN status='A' THEN 1 ELSE 0 END ) AS cnt,  date FROM attendance_tab  WHERE session='"+session1_val+"' AND class='"+class1_val+"' AND section='"+section1_val+"' AND date BETWEEN '"+date1_val+"' AND '"+date2_val+"' GROUP BY admission_no  ";
                 ResultSet rs = stmt.executeQuery(query_s1);
                 PdfPCell HpdfPCellS = new PdfPCell(new Paragraph("Serial No")); 
                 PdfPCell HpdfPCell1 = new PdfPCell(new Paragraph("Admission No"));
                 PdfPCell HpdfPCell2 = new PdfPCell(new Paragraph("Student Name")); 
                 PdfPCell HpdfPCell3 = new PdfPCell(new Paragraph("Roll Number"));
                 PdfPCell HpdfPCell4 = new PdfPCell(new Paragraph("cnt")); 
                 
                 pdfPTable.addCell(HpdfPCellS);
                 pdfPTable.addCell(HpdfPCell1);
                 pdfPTable.addCell(HpdfPCell2);
                 pdfPTable.addCell(HpdfPCell3);
                 pdfPTable.addCell(HpdfPCell4);
                 
                 int i=1;
                 while(rs.next())
                 {
                 String serial_no = i+"";
                 PdfPCell pdfPCellS = new PdfPCell(new Paragraph(serial_no));
                 pdfPTable.addCell(pdfPCellS);
           
           
            String admission_no = rs.getString("admission_no");
            PdfPCell pdfPCell1 = new PdfPCell(new Paragraph(admission_no));
            pdfPTable.addCell(pdfPCell1);
            String student_id = rs.getString("student_id");
            PdfPCell pdfPCell2 = new PdfPCell(new Paragraph(student_id));
            pdfPTable.addCell(pdfPCell2);
            String roll_no = rs.getString("roll_no");
            PdfPCell pdfPCell3 = new PdfPCell(new Paragraph(roll_no));
            pdfPTable.addCell(pdfPCell3);
            String status = rs.getString("cnt");
            PdfPCell pdfPCell4 = new PdfPCell(new Paragraph(status));
            pdfPTable.addCell(pdfPCell4);
           
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

    