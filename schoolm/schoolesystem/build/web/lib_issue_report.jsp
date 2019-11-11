<%-- 
    Document   : lib_issue_report
    Created on : Jul 26, 2017, 1:25:41 PM
    Author     : Shruti Gautam
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.io.StringReader"%>
<%@page import="com.itextpdf.text.html.simpleparser.HTMLWorker"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@include file="connect.jsp" %>

<%
    
    try
    {   int i;
    String s="";
    
       Statement stmt;
       stmt=conn.createStatement();
    String ab[]=request.getParameterValues("cb[]");
    String name=request.getParameter("report_name");
    String query1="select *,curdate() as cd from school_info_tab";
    ResultSet rs1=stmt.executeQuery(query1);
    Blob blob;
    byte logo[];
    String path1 = request.getServletContext().getRealPath("/")+"../../images/";
    File file2 = new File(path1) ;
    if(!file2.exists())
        file2.mkdir();
    FileOutputStream fos = new FileOutputStream(path1+"logo.png");
    if(rs1.next())
    {
        blob = rs1.getBlob("school_logo");
    logo = blob.getBytes(1, (int)blob.length());
    fos.write(logo);
    s+="<table border='1' width='100%'><tr><td align='center'><img  src='"+path1+"logo.png' height='40px' width='40px'>";
    s+= "<label style='font-size:20px;vertically-align:top;'>"+rs1.getString("school_name")+"</label></td></tr>";
    s+="<tr><td style='text-align:center;'>"+rs1.getString("school_address")+"</td></tr>";
    s+="<tr><td style='text-align:right;'>"+rs1.getString("cd")+"</td></tr></table>";
   }
   s+="<h2 style='text-align:center;'>"+name+"</h2><br>";
 
   s+="<table border='1'><tr>";
    for( i=0;i<ab.length;i++)
    {
        String s_name=ab[i];
        if(ab[i].equals("Student_name"))
        s_name="Name";
        else if(ab[i].equals("Class_name"))
            s_name="Class";
        else if(ab[i].equals("Grp"))
            s_name="Group";
        else if(ab[i].equals("Name"))
            s_name="Type";
        s=s+"<th style='text-align:center;' >"+s_name+"</th>";
    }
   
   s=s+"</tr>";
   String query="select *,lt.title,li.name,ct.class_name from lib_issue join admission_tab at on at.admission_no=lib_issue.adm_no join class_tab ct on ct.class_id=lib_issue.class_id join lib_item_type li on li.type_id=lib_issue.type_id join lib_title lt on lt.title_id=lib_issue.title_id";       
    System.out.println(query);
   ResultSet rs=stmt.executeQuery(query); 
      
      while(rs.next())
      {
          s=s+"<tr>";
           for( i=0;i<ab.length;i++)
       {
           String field = rs.getString(ab[i]);
           if(ab[i].equals("Student_name"))
               field = rs.getString("student_name")+" "+rs.getString("middle_name")+" "+rs.getString("last_name");
         s=s+"<td style='text-align:center;'>"+field+"</td>";
     
      }
           s=s+"</tr>";
     
    }
   
     s+="</table>";
      String path = request.getServletContext().getRealPath("/");
    String p=path+"report";
    File file = new File(p);
    if(!file.exists())
        file.mkdir();
        File report = new File(p+"\\report.pdf");
        OutputStream file1 = new FileOutputStream(report);
     Document document = new Document();
        PdfWriter.getInstance(document,file1);
        document.open();
        HTMLWorker htmlWorker = new HTMLWorker(document);
        htmlWorker.parse(new StringReader(s));
        document.close();
        out.print("<h1 align='center'>Click here to take printout<br>");
        out.println("<a href='report/report.pdf'>Open</a></h1>");   
            
    }
    catch(Exception e)
    {
        out.print(e.getMessage());
    }
    %>

