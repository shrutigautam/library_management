<%-- 
    Document   : lib_report
    Created on : Jul 25, 2017, 3:03:48 PM
    Author     : Shruti Gautam
--%>

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
    java.util.Date d=new java.util.Date();
    String date=d.toString();
  s+="<h4 style='text-align:right;'>"+date+"</h4>";
   s+="<h2 style='text-align:center;'>"+name+"</h2><br>";
 
   s+="<table border='1'><tr>";
    for( i=0;i<ab.length;i++)
    {
        String head=ab[i];
        if(ab[i].equals("name"))
            head="Type";
        if(ab[i].equals("access_no"))
                head="Accession No.";
        if(ab[i].equals("Subj"))
            head="Subject";
        if(ab[i].equals("Vol"))
            head="Volume";
        if(ab[i].equals("Sup"))
            head="Supplier";
        if(ab[i].equals("Auth"))
            head="Author";
        if(ab[i].equals("Pub"))
            head="Publisher";
                    
        s=s+"<th style='text-align:center;' >"+head+"</th>";
    }
   
   s=s+"</tr>";
   String query="select distinct lib_item.cupboard,lib_item.shelf,lib_accession.status,lib_purchase.date, lib_accession.rate,lib_purchase.cd,lib_item.pub_place,lib_accession.year,lib_accession.edition,lib_accession.page,lib_accession.vol, author.auth,publisher.pub,lib_purchase.bill_no,lib_subj.subj,supplier.sup,lib_item_type.name,lib_title.title,lib_accession.access_no,lib_item.class,lib_item.book from lib_accession join lib_purchase on lib_purchase.type_id=lib_accession.type join supplier on lib_purchase.sup_id=supplier.sup_id join  lib_item_type on lib_accession.type=lib_item_type.type_id join lib_title on lib_title.title_id=lib_accession.title_id join lib_item on lib_accession.title_id=lib_item.title_id join lib_subj on lib_subj.subj_id=lib_item.subj_id join author on author.auth_id=lib_item.auth_id1 join publisher on publisher.pub_id=lib_item.pub_id";       
      ResultSet rs=stmt.executeQuery(query); 
      
      while(rs.next())
      {
          s=s+"<tr>";
           for( i=0;i<ab.length;i++)
       {
         s=s+"<td style='text-align:center;'>"+rs.getString(ab[i])+"</td>";
     
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
