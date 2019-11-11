<%-- 
    Document   : lib_item_report
    Created on : Jul 27, 2017, 4:53:20 PM
    Author     : Shruti Gautam
--%>

<%@page import="java.io.StringReader"%>
<%@page import="com.itextpdf.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
    try
    {
    int i=0;
    Statement stmt;
    stmt=conn.createStatement();
String query=request.getParameter("query");

String s="";
String report=request.getParameter("report_name");
String a[]=request.getParameterValues("cb[]");
s+=report;
s+="<table border='1'><tr>";
for(i=0;i<a.length;i++)
{    
    String head=a[i];
    if(a[i].equals("Type_id"))
        head="Type";
    if(a[i].equals("Lang"))
        head="Language";
    if(a[i].equals("Subj_id"))
        head="Subject";
    if(a[i].equals("Title_id"))
        head="Title";
    if(a[i].equals("Subtitle_id"))
        head="Subtitle";
    if(a[i].equals("pur1"))
        head="Title Purchased (From)";
    if(a[i].equals("pur2"))
        head="Title Purchased (To)";
    if(a[i].equals("bil1"))
        head="Bill Date (From)";
    if(a[i].equals("bil2"))
        head="Bill Date (To)";
    if(a[i].equals("acces1"))
        head="Acessioning (From)";
     if(a[i].equals("acces2"))
        head="Acessioning (To)";
     if(a[i].equals("acc1"))
         head="Account No.(From)";
     if(a[i].equals("acc2"))
         head="Account No.(To)";
    if(a[i].equals("auth_id1"))
         head="Author";
     if(a[i].equals("pub_id"))
         head="Publisher";
     if(a[i].equals("pub_place"))
         head="Publisher Place";
    s+="<th>"+head+"</th>";
}
s+="</tr>";
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
    s+="<tr>";
    for(i=0;i<a.length;i++)
    {
        String data=a[i];
        if(a[i].equals("Type_id"))
        data="name";
        if(a[i].equals("Subj_id"))
        data="Subj";
        if(a[i].equals("Title_id"))
        data="Title";
        if(a[i].equals("Subtitle_id"))
        data="Subtitle";
        if(a[i].equals("auth_id1"))
         data="auth";
        if(a[i].equals("pub_id"))
         data="pub";
        if(a[i].equals("Cupboard"))
          data="cup_no";  
         if(a[i].equals("Shelf"))
          data="shelf_no";  
    s+="<td>"+rs.getString(data)+"</td>";
    }
    s+="</tr>";
}
s+="</table>";

String path=request.getServletContext().getRealPath("/");
String p=path+"report";

File f=new File(p);
if(!f.exists())
f.mkdir();
File rep=new File(p+"\\report.pdf");
OutputStream os= new FileOutputStream(rep);
Document doc=new Document();
PdfWriter.getInstance(doc,os);
doc.open();
HTMLWorker hw=new HTMLWorker(doc);
hw.parse(new StringReader(s));
doc.close();
out.print("<h1 align='center'>Click here to take printout<br>");
out.println("<a href='report/report.pdf'>Open</a></h1>");   
    }
    catch(Exception e)
    {
        out.print(e.getMessage());
    }






%>
