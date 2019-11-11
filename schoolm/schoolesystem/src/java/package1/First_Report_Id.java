package package1;

import com.itextpdf.text.*;
import com.itextpdf.text.Element;
import com.itextpdf.text.Rectangle.*;
import com.itextpdf.text.pdf.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;

/**
 *
 * @author Vermas
 */
public class First_Report_Id extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out=response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            String admission_val=request.getParameter("b");
                String []adm2=admission_val.split(",");
                int l=adm2.length;
                int i;
            /* TODO output your page here. You may use following sample code. */
                 try{
                 //Create Document instance. 
               Document document = new Document();
                 //Create OutputStream instance.
                 OutputStream outputStream = new FileOutputStream(new File("F:\\TTestTableFile6.pdf"));   
                 //Create PDFWriter instance.
                 PdfWriter.getInstance(document, outputStream);
                 //Open the document. 
                 document.open();
                  PdfPTable T1=new PdfPTable(3);
             for(i=0;i<l;i++)
             {
                 //Create Table object, Here 4 specify the no. of columns 
                PdfPTable t = new PdfPTable(1);  
                t.setWidthPercentage(100f);
                     
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 String query_s1 = "select * FROM admission_tab  WHERE admission_no='"+adm2[i]+"' ";
                 ResultSet rs = stmt.executeQuery(query_s1);
            
    
              while(rs.next())   
              {
           
            String school=rs.getString("school");
            out.print(school);
            Paragraph p1=new Paragraph(school,FontFactory.getFont(FontFactory.TIMES_ROMAN, 12, Font.BOLD, new CMYKColor(0,0,0,0)));
            p1.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell1 = new PdfPCell();
            pdfPCell1.addElement(p1);
            pdfPCell1.setBackgroundColor(BaseColor.BLUE);
            pdfPCell1.setBorderColor(BaseColor.BLUE);
            t.addCell(pdfPCell1);
            
            
             Image img = Image.getInstance("F:\\a1.png");
             img.scaleAbsolute(40f, 40f);
             img.setAlignment(Element.ALIGN_CENTER);
             PdfPCell pdfPCell2=new PdfPCell();
             pdfPCell2.addElement(img);
             //pdfPCell2.setPaddingLeft(30f);
             pdfPCell2.setBackgroundColor(new BaseColor(237,237,237));
             pdfPCell2.setBorderColor(new BaseColor(237,237,237));
             t.addCell(pdfPCell2);
          
            String student_name = rs.getString("student_name");
          
            String middle_name = rs.getString("middle_name");
          
            String last_name = rs.getString("last_name");
           
            String name;
            name=student_name+" "+middle_name+" "+last_name;
            Paragraph p3=new Paragraph(name,FontFactory.getFont(FontFactory.TIMES_ROMAN, 8, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p3.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell3 = new PdfPCell();
            pdfPCell3.addElement(p3);
            pdfPCell3.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell3.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell3);
      
            
          
             
            String Class = rs.getString("class");
            String section = rs.getString("section");
            String class_detail="Class: "+Class+"-"+section;
            Paragraph p4=new Paragraph(class_detail,FontFactory.getFont(FontFactory.TIMES_ROMAN, 6, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p4.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell4 = new PdfPCell();
            pdfPCell4.addElement(p4);
            pdfPCell4.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell4.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell4);
            
         
            
           
            String father_name = rs.getString("father_name");
            String father="F's Name-"+" MR. "+father_name;
            Paragraph p5=new Paragraph(father,FontFactory.getFont(FontFactory.TIMES_ROMAN, 7, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p5.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell5 = new PdfPCell();
            pdfPCell5.addElement(p5);
            pdfPCell5.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell5.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell5);
            
            String phone="Phone No.- 9897737719";
            Paragraph p9=new Paragraph(phone,FontFactory.getFont(FontFactory.TIMES_ROMAN, 7, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p9.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell9 = new PdfPCell();
            pdfPCell9.addElement(p9);
            pdfPCell9.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell9.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell9);
     
            
            String session = rs.getString("year");
            String sess="Session: "+session;
            Paragraph p6=new Paragraph(sess,FontFactory.getFont(FontFactory.TIMES_ROMAN, 7, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p6.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell6 = new PdfPCell();
            pdfPCell6.addElement(p6);
            pdfPCell6.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell6.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell6);
            
       
            
            String admission_no = rs.getString("admission_no");
            String adm="Adm No.: "+admission_no;
            Paragraph p7=new Paragraph(adm,FontFactory.getFont(FontFactory.TIMES_ROMAN, 7, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p7.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell7 = new PdfPCell();
            pdfPCell7.addElement(p7);
            pdfPCell7.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell7.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell7);
            
    
            
            String office="Director's Office";
            Paragraph p8=new Paragraph(office,FontFactory.getFont(FontFactory.TIMES_ROMAN, 8, Font.NORMAL, new CMYKColor(0, 0, 0, 255)));
            p8.setAlignment(Element.ALIGN_CENTER);
            PdfPCell pdfPCell8 = new PdfPCell();
            pdfPCell8.addElement(p8);
            pdfPCell8.setBackgroundColor(new BaseColor(237,237,237));
            pdfPCell8.setBorderColor(new BaseColor(237,237,237));
            t.addCell(pdfPCell8);
            
       
            
       
       }PdfPCell pdfPCell90=new PdfPCell();
       pdfPCell90.setPadding(7f);
       pdfPCell90.addElement(t);
              T1.addCell(pdfPCell90);
             }
             //Add content to the document using Table objects.
            document.add(T1);  
            // document.add(new Paragraph("Hello world, " + "this is a test pdf file."));
            //Close document and outputStream.
                      
          
            document.close(); 
            outputStream.close();
          //  out.print("Pdf created successfully. LOCATION: D:\\TestTableFile5.pdf");
                     
                     
                 
        

                 }
                 catch(Exception et){
                   out.print("oops"+et);  
                 }
        }
    }

    
