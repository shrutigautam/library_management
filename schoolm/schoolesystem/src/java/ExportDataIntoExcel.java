import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
* Export database table data into excel sheet.
*
* @author Saravanan V v1.0 03/12/2012
* @LotusMentor
*/
public class ExportDataIntoExcel {

/*
* DB Connection Details
*/
private String url = "jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull";
private String driverClassName = "com.mysql.jdbc.Driver";
private String username = "root";
private String password = "";
String date1="2016-07-29";
String date2="2016-06-01";
/*
Table
*/
private String tableName = "enquiry_tab";

/*
* Export excel file location
*/
private String path="d:/portIntoExcel.xls";

/*
* Properties
*/
private Connection conn;
private PreparedStatement ps;
private ResultSet rs = null;
private File file;

/**
*
*/
private static final long serialVersionUID = 1L;

/**
* Export database table data into excel sheet.
*
* @throws Exception
*/
public boolean exportData() throws Exception {
List details = null;
String query;
int numberOfColumns = 0;
ResultSetMetaData rsmd;
Label lbl;
Iterator itr;
try {

conn = getConnection();
query = "Select enquiry_id,std_name,std_fname,std_mobile,std_address,c.city_name,cs.class_name from enquiry_tab e join city_tab c on e.std_city=c.city_id join class_tab cs on e.std_class=cs.class_id " ;

ps = conn.prepareStatement(query);
rs = ps.executeQuery();
rsmd = rs.getMetaData();
numberOfColumns = rsmd.getColumnCount();
details = new ArrayList();
// Read and store data in list variable.
while (rs.next()) {
for (int n = 1; n <= numberOfColumns; n++) {
details.add(rs.getString(n));
}
}
// Excel file properties
file=new File(path);
if(!file.exists()){
file.createNewFile();
}
WorkbookSettings wbSettings = new WorkbookSettings();

wbSettings.setLocale(new Locale("en", "EN"));
WritableWorkbook w = Workbook.createWorkbook(file, wbSettings);
w.createSheet("Table Data", 0);
WritableSheet s = w.getSheet(0);
WritableFont wf = new WritableFont(WritableFont.ARIAL, 10,
WritableFont.NO_BOLD);
WritableCellFormat cf = new WritableCellFormat(wf);
cf.setWrap(true);

itr = details.iterator();
// Write column header
int col = 0;
for (int j = 1; j <= numberOfColumns; j++) {
lbl = new Label(col, 0, rsmd.getColumnName(j), cf);
s.addCell(lbl);
col++;
}
// Write content
int row = 1;
while (itr.hasNext()) {
for (int column = 0; column < numberOfColumns; column++) {
lbl = new Label(column, row, (String) itr.next(), cf);
s.addCell(lbl);
}
row++;
}
w.write();
w.close();
} catch (Exception e) {
e.printStackTrace();
} finally {
conn.close();
}
return true;
}

/**
* Provide database connection
*
* @return
*/
public Connection getConnection() {
Connection con = null;
try {
Class.forName(driverClassName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
try {
con = DriverManager.getConnection(url, username, password);
} catch (SQLException e) {
e.printStackTrace();
}
return con;
}

/**
* Main
*
* @param args
* @throws Exception
*/
public static void main(String args[]) {
try {
ExportDataIntoExcel vi = new ExportDataIntoExcel();
if(vi.exportData()){
System.out.println("Datarted..");
}else{
System.out.println("Dataexported..");
}
} catch (Exception e) {
e.printStackTrace();
}
}
}