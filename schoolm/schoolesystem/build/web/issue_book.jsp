<%-- 
    Document   : issue_book
    Created on : Jul 30, 2017, 8:12:54 PM
    Author     : Shruti Gautam
--%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
</head>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
 <div id="header">
     <%
         if(session.getAttribute("USERNAME")==null)
             response.sendRedirect("LoginForm.jsp");
         else
         {
    String LS3=(String)session.getAttribute("TYPE");
        if(LS3.equals("employee")){
            %>
            <div class="logo"><a href="EmployeeDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
        else if(LS3.equals("student")){
            %>
            <div class="logo"><a href="studentDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
        else if(LS3.equals("Admin")){
            %>
            <div class="logo"><a href="dashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }

            %>
</div><br>
    <%  
        String usercode=(String)session.getAttribute("USERCODE");
       
     try
     {  
       
        Statement stmt;
        stmt=conn.createStatement();
        String query="select accession_no,issue_date,return_date,lib_item_type.name,lib_title.title from lib_issue join lib_item_type on lib_item_type.type_id=lib_issue.type_id join lib_title on lib_title.title_id=lib_issue.title_id where lib_issue.adm_no='"+usercode+"' and lib_issue.flag='i'" ;
        ResultSet rs=stmt.executeQuery(query);
        if(rs.next())
        {
        rs.previous();
        out.print("<h3 style='text-align:center'>Books that are alloted to you:</h3><br>");
        out.print("<style>td{padding-left:10px;padding-right:10px;}th{padding-left:10px;padding-right:10px;}</style><center><table border='1'>");
        out.print("<tr>");
        out.print("<th>Accession No.</th>");
        out.print("<th>Type</th>");
        out.print("<th>Title</th>");
        out.print("<th>Issue Date</th>");
        out.print("<th>Return Date</th>");
        out.print("</tr>");
        while(rs.next())
           {
            out.print("<tr>");
             out.print("<td>"+rs.getString("accession_no")+"</td>"); 
              out.print("<td>"+rs.getString("name")+"</td>"); 
               out.print("<td>"+rs.getString("title")+"</td>"); 
               out.print("<td>"+rs.getString("Issue_date")+"</td>"); 
               out.print("<td>"+rs.getString("return_date")+"</td>"); 
                 out.print("</tr>");
           }
           }
           else
           {
               out.print("<center>No Previously Issued Books</center>");
           }
           out.print("</table></center>");
           
           
    }
    catch(Exception e)
    {

    }
    }
    %>
    