<%-- 
    Document   : list2
    Created on : Jun 24, 2017, 12:57:20 PM
    Author     : Shruti Gautam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%@include file="connect.jsp" %>
       
        <%
            
     try 
        {
            String title_id=request.getParameter("title_id");
            out.println(""+title_id);
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select subtitle,subtitle_id from lib_subtitle where title_id=?";
             PreparedStatement pst= conn.prepareStatement(query);
             pst.setString(1,title_id);
             ResultSet rs=pst.executeQuery(); %>
             <option value="none">---select type---</option>
            
       <%      while(rs.next())  
        {  
          out.print("<option value='"+rs.getString("subtitle")+"_"+rs.getString("subtitle_id")+"'>"+rs.getString("subtitle")+"</option><br>");
         
        }%>
    
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                %>


