package package1;
import com.itextpdf.text.*;
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



public class First_pdf_report {
    public static void main(String[] args) throws Exception{
         try{           
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
                 Statement stmt=con.createStatement();
                 String query_s1 = "select admission_no, student_id, roll_no, status,  date FROM attendance_tab  WHERE session='1' AND class='1' AND section='2' AND date BETWEEN '01/02/1800' AND '05/02/2017' ";
                 ResultSet rs = stmt.executeQuery(query_s1);
                  /* Step-2: Initialize PDF documents - logical objects */
                 Document my_pdf_report = new Document();
                 PdfWriter.getInstance(my_pdf_report, new FileOutputStream("first_pdf_report.pdf"));
                 my_pdf_report.open();            
                 //we have four columns in our table
                 PdfPTable my_report_table = new PdfPTable(5);
                 //create a cell object
                 PdfPCell table_cell;
                 
                   while (rs.next()) {                
                                String admission_no = rs.getString("ADMISSION_NO");
                                table_cell=new PdfPCell(new Phrase(admission_no));
                                my_report_table.addCell(table_cell);
                                String student_name=rs.getString("STUDENT_NAME");
                                table_cell=new PdfPCell(new Phrase(student_name));
                                my_report_table.addCell(table_cell);
                                String roll_no=rs.getString("ROLL_NO");
                                table_cell=new PdfPCell(new Phrase(roll_no));
                                my_report_table.addCell(table_cell);
                                String status1=rs.getString("STATUS");
                                table_cell=new PdfPCell(new Phrase(status1));
                                my_report_table.addCell(table_cell);
                                String date1=rs.getString("DATE");
                                table_cell=new PdfPCell(new Phrase(date1));
                                my_report_table.addCell(table_cell);
                                }
                  /* Attach report table to PDF */
                my_pdf_report.add(my_report_table);                       
                my_pdf_report.close();
                
                /* Close all DB related objects */
                rs.close();
                stmt.close(); 
                con.close();     
                 }
                 catch(Exception et){
                     
                 }
    }
    
}
