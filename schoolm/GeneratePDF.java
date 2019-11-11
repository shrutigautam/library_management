package package1;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;

/**
 *
 * @author Sikander
 */
public class GeneratePDF extends HttpServlet {
public static final String dest= "simple_table.pdf";
    private static final long serialVersionUID = 1L;
    public GeneratePDF() {
  super();
 }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doPost(request, response);
 }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
String date1=request.getParameter("d1");
String date2=request.getParameter("d2");

  //get the output stream for writing binary data in the response.
  ServletOutputStream os = response.getOutputStream();
  //set the response content type to PDF
  response.setContentType("application/pdf"); 
  //create a new document
  Document doc = new Document();

  //create some special styles and font sizes
  Font bfBold18 = new Font(FontFamily.TIMES_ROMAN, 24, Font.BOLD, new BaseColor(0, 0, 0) ); 
  Font bfBold12 = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD, new BaseColor(0, 0, 0)); 
  Font bfBold13 = new Font(FontFamily.TIMES_ROMAN, 20, Font.BOLD, new BaseColor(0, 0, 0)); 
  Font bf12 = new Font(FontFamily.TIMES_ROMAN, 12); 

  Connection conn = null;             
  PreparedStatement stmt = null;      
  String sql = null;
  String sql1=null;

  try{
   
   //create an instance of the PdfWriter using the output stream
   PdfWriter.getInstance(doc, os); 

   //document header properties
   doc.addAuthor("betterThanZero");
   doc.addCreationDate();
   doc.addProducer();
   doc.addCreator("MySampleCode.com");
   doc.addTitle("DemoPDF");
   doc.setPageSize(PageSize.LETTER);
   doc.open();

   //add a new paragraph
    Paragraph wrong = new Paragraph("SCHOOL E-SYSTEM",bfBold18);
Paragraph wrong1 = new Paragraph("ENQUIRY REPORT",bfBold13);
Paragraph wrong2 = new Paragraph("---------------------------------------------------------------------------------",bfBold13);
wrong.setIndentationLeft(150);
wrong1.setIndentationLeft(170);
doc.add(wrong);
doc.add(wrong1);
doc.add(wrong2);

 // doc.add(new Paragraph("Enquiry No.      Name      Father Name      Mobile      Present Address      City",bfBold12));
   Class.forName( "com.mysql.jdbc.Driver");
   //connection to the MySQL database
   Context ctx = (Context) new InitialContext().lookup("java:comp/env");
   conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp?zeroDateTimeBehavior=convertToNull","root",""); 
System.out.print(conn);
   //just get 10 countries from my database for demo
   sql = "Select *,c.city_name from enquiry_tab e join city_tab c on e.std_city=c.city_id where date between '"+date1+"' and '"+date2+"'"; 
   stmt = conn.prepareStatement(sql);
PdfPTable table = new PdfPTable(6);
table.getDefaultCell().setBorder(0);
table.setWidthPercentage(100);
PdfPCell cell = new PdfPCell();
table.getDefaultCell().getWidth();
//PdfPTable table1 = new PdfPTable(3);
   ResultSet rs = stmt.executeQuery(); 
   String heading[]={"Enquiry No.","Name","Father Name","Mobile","City","Present Address"};
    for(int i=0;i<6;i++){
       
    table.addCell(heading[i]);
    }
        
       // for (int i=0;i<3;i++){
       // int i=0;
     //   while(rs.next()&&i<3){
  //  Anchor an=new Anchor(rs.getString("enquiry_id"),bfBold12);
          //for(int i=0;i<6;i++){
           //   Anchor an=new Anchor(rs.getString("enquiry_id"),bfBold12);
  //  table1.addCell(an);
    //}
    //    doc.add(table1);
      //doc.add(an);
  //    table.addCell(an);
  //    i++;
     //   }
       // doc.add(table1);
     //   table.addCell(an);
       // }
//        document.add(table);
//        document.close();
        
   while(rs.next()){ 
    //create an anchor reference
       
     
// String anchor = new String(rs.getString("enquiry_id"));
//    //anchor.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//  //  doc.add(anchor);
// String anchor1 = new String(rs.getString("std_name"));
//  //doc.add(wrong4);
//    //wrong4.setExtraParagraphSpace(Element.ALIGN_RIGHT);
//    
//   // anchor1.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//    //doc.add(anchor1);
//   
//     String anchor2 = new String(rs.getString("std_fname"));
//    //anchor2.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//    //doc.add(anchor2);
//    
//     String anchor3 = new String(rs.getString("std_class"));
//    //anchor1.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//    //doc.add(anchor3);
//    
//     String anchor4= new String(rs.getString("std_mobile"));
//    //anchor4.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//    //doc.add(anchor4);
//    
//     String anchor5 = new String(rs.getString("std_address"));
//    //anchor5.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//    //doc.add(anchor5);
//    
//     String anchor6 = new String(rs.getString("std_city"));
//    //anchor6.setReference("#" + rs.getString("std_remark").trim());
//    //add the anchor to the document
//   // doc.add(anchor6);
    // Anchor anchor=new Anchor(rs.getString("enquiry_id")+"                "+rs.getString("std_name")+"      "+rs.getString("std_fname")+"      "+rs.getString("std_class")+"      "+rs.getString("std_mobile")+"      "+rs.getString("std_address")+"      "+rs.getString("std_city"),bfBold12);
       table.addCell(rs.getString("enquiry_id"));
       table.addCell(rs.getString("std_name"));
       table.addCell(rs.getString("std_fname"));
       table.addCell(rs.getString("std_mobile"));
       
       table.addCell(rs.getString("city_name"));
       table.addCell(rs.getString("std_address"));

//Paragraph wrong3 = new Paragraph(an);
    //Paragraph wrong4 = new Paragraph(anchor1);
    
    
////     Anchor anchor7 = new Anchor(rs.getString("Admission_Date").trim(),bfBold12);
////    anchor7.setReference("#" + rs.getString("Year").trim());
////    //add the anchor to the document
////    doc.add(anchor7);
////    
////    Anchor anchor8= new Anchor(rs.getString("Admission_Mode").trim(),bfBold12);
////    anchor8.setReference("#" + rs.getString("Year").trim());
////    //add the anchor to the document
////    doc.add(anchor8);
////    
////    Anchor anchor9 = new Anchor(rs.getString("School").trim(),bfBold12);
////    anchor9.setReference("#" + rs.getString("Year").trim());
////    //add the anchor to the document
////    doc.add(anchor9);
////    
////    Anchor anchor10 = new Anchor(rs.getString("Class").trim(),bfBold12);
////    anchor10.setReference("#" + rs.getString("Year").trim());
////    //add the anchor to the document
////    doc.add(anchor10);
////   
////    Anchor anchor11= new Anchor(rs.getString("Year").trim(),bfBold12);
////    anchor11.setReference("#" + rs.getString("Year").trim());
////    //add the anchor to the document
////    doc.add(anchor11);
////    
    //add an empty line
   // doc.add( Chunk.NEWLINE);
   }                                                                          
   
   // Move cursor to the first row
 //  rs.first();

doc.add(table);
   rs.close();                                                                
   stmt.close();                                                              
  // stmt = null;                                                               

   conn.close();                                                              
  // conn = null;                                                    


   doc.close(); 

  }catch(DocumentException e){
   e.printStackTrace();
  }
  catch(Exception e){
   e.printStackTrace();
  }

 }

}
