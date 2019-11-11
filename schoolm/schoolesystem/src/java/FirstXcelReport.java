import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Saumya Joshi
 */
public class FirstXcelReport {
    static int present=0;
    static int total=0;
    static float percentage=0;
    public static void main(String []args) throws FileNotFoundException, IOException{
       
        try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    ResultSet rs = st.executeQuery("Select DISTINCT date from attendance_tab WHERE session='1' AND class='1' AND section='2' ORDER BY roll_no");
    HSSFWorkbook workbook = new HSSFWorkbook();
    HSSFSheet sheet = workbook.createSheet("lawix10");
    HSSFRow rowhead = sheet.createRow((short) 0);
    rowhead.createCell((short) 0).setCellValue("serial_no");
    rowhead.createCell((short) 1).setCellValue("admission_no");
    rowhead.createCell((short) 2).setCellValue("student_id");
    rowhead.createCell((short) 3).setCellValue("roll_no");
    ArrayList<String> al=new ArrayList<String>();
    int j=4;
     while (rs.next()){
     rowhead.createCell((short) j).setCellValue(rs.getString("date"));
     al.add(rs.getString("date"));
     j++;
    }
    rowhead.createCell((short) j).setCellValue("present");
    rowhead.createCell((short) (j+1)).setCellValue("total");
    rowhead.createCell((short) (j+2)).setCellValue("% present");
    int i = 1;
    String adm_no;
   
    ResultSet rsS = st.executeQuery("Select DISTINCT admission_no, student_id, roll_no from attendance_tab WHERE session='1' AND class='1' AND section='2' ORDER BY roll_no ");
    while(rsS.next())
    {
     total=0;   
     present=0;
     percentage=0;
     String ab;
     int k=0;
     HSSFRow row = sheet.createRow((short) i);
     row.createCell((short) 0).setCellValue(i);
     row.createCell((short) 1).setCellValue(rsS.getString("admission_no"));
     row.createCell((short) 2).setCellValue(rsS.getString("student_id"));
     row.createCell((short) 3).setCellValue(rsS.getString("roll_no"));
     adm_no=rsS.getString("admission_no");
     StringBuilder sb=new StringBuilder();
     while(k<al.size()){
      
       
         ResultSet rs1 = st1.executeQuery("Select status FROM attendance_tab WHERE admission_no='"+adm_no+"' AND date='"+al.get(k)+"'");
        
         while(rs1.next()){
             ab=rs1.getString("status");     
             row.createCell((short) (k+4)).setCellValue(ab); 
             if(ab.equals("P"))
             present++;
             total++;    
         }
        
         row.createCell((short) (k+5)).setCellValue(present); 
         row.createCell((short) (k+6)).setCellValue(total);
         percentage=(present*100)/total;
         row.createCell((short) (k+7)).setCellValue(percentage+"%"); 
         k++;
         
         
     } 
     i++;
    }
    
  
    String yemi = "F:/test.xls";
    FileOutputStream fileOut = new FileOutputStream(yemi);
    workbook.write(fileOut);
    fileOut.close();
    } catch (ClassNotFoundException e1) {
       e1.printStackTrace();
    } catch (SQLException e1) {
        e1.printStackTrace();
    } catch (FileNotFoundException e1) {
        e1.printStackTrace();
    } catch (IOException e1) {
        e1.printStackTrace();
    }
    }
}
