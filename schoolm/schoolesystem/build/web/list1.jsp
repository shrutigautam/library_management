<%-- 
    Document   : list1
    Created on : Jun 24, 2017, 11:35:28 AM
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
            String subj_id=request.getParameter("subj_id");
            out.println(""+subj_id);
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select title,title_id from lib_title where subj_id=?";
             PreparedStatement pst= conn.prepareStatement(query);
             pst.setString(1,subj_id);
             ResultSet rs=pst.executeQuery(); %>
             <option value="none">---select type---</option>
       <%      while(rs.next())  
        {  
          out.print("<option value='"+rs.getString("title")+"_"+rs.getString("title_id")+"'>"+rs.getString("title")+"</option><br>");
         
        }%>
    
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                %>

