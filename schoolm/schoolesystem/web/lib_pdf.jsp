<%-- 
    Document   : lib_pdf
    Created on : Jul 12, 2017, 3:01:56 PM
    Author     : Shruti Gautam
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.StringReader"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<body>
   
        <%  
            try {
            String s="";
            Statement stmt = conn.createStatement();
            String query = "Select path,lib_title.title,bar_id from lib_barcode join lib_title on lib_barcode.title=lib_title.title_id";
            System.out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            s="<table border='1' cellspacing='20'><tr>";
            int flag=1;
    while(rs.next())
    {
        s = s + "<td><div>&nbsp;</div><img style='margin:auto;' src='"+rs.getString("path")+"' width='110px' height='25'/><p style='text-align:center;' >"+rs.getString("title")+"</p><div>&nbsp;</div></td>";
        if(flag % 4 ==0 )
        {
            s += "</tr><tr>";
        }
        flag++;
        
    }
    flag = (flag-1) % 4;
    if(flag > 0)
        flag = 4-flag;
    for(int i=1;i<=flag;i++)
        s+="<td></td>";
    s += "</tr>";
    s = s+"</table>";
    System.out.println(s);
    String path = request.getServletContext().getRealPath("/");
    String p=path+"pdf";
   // out.println(s+" "+p);  
   // System.out.println(s+" "+p);  
    File file = new File(p);
    if(!file.exists())
        file.mkdir();
        File pdf = new File(p+"\\barcode.pdf");
        OutputStream file1 = new FileOutputStream(pdf);
       // out.println(pdf.getCanonicalPath());
        Document document = new Document();
        PdfWriter.getInstance(document,file1);
        document.open();
        HTMLWorker htmlWorker = new HTMLWorker(document);
//        s = "<table border='1' cellspacing='20'><tr><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//geo21.gif' width='110px' height='25'/><p style='text-align:center;' >Geography</p><div>&nbsp;</div></td><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//geo24.gif' width='110px' height='25'/><p style='text-align:center;' >Geography</p><div>&nbsp;</div></td><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//his1.gif' width='110px' height='25'/><p style='text-align:center;' >History</p><div>&nbsp;</div></td><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//his2.gif' width='110px' height='25'/><p style='text-align:center;' >History</p><div>&nbsp;</div></td></tr><tr><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//geo20.gif' width='110px' height='25'/><p style='text-align:center;' >Geography</p><div>&nbsp;</div></td><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//geo23.gif' width='110px' height='25'/><p style='text-align:center;' >Geography</p><div>&nbsp;</div></td><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//ch4.gif' width='110px' height='25'/><p style='text-align:center;' >Chemistry</p><div>&nbsp;</div></td><td><div>&nbsp;</div><img style='margin:auto;' src='D://barcode//ch5.gif' width='110px' height='25'/><p style='text-align:center;' >Chemistry</p><div>&nbsp;</div></td></tr></table>";
        htmlWorker.parse(new StringReader(s));
        document.close();
        out.print("<h1 align='center'>Click here to take printout<br>");
        out.println("<a href='pdf/barcode.pdf'>Open</a></h1>");   
            
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
            try
            {
                String query1="truncate lib_barcode";
                PreparedStatement pst=conn.prepareStatement(query1);
                int u=pst.executeUpdate();
            }
            catch(Exception et)
            {
                
            }
        %>
    </body>
