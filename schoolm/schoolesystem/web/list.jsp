<%-- 
    Document   : list
    Created on : Jun 23, 2017, 3:39:45 PM
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
            String item_id=request.getParameter("item_id");
            out.println(""+item_id);
            
            String query = "select subj,subj_id from lib_subj where item_id=?";
             PreparedStatement pst= conn.prepareStatement(query);
             pst.setString(1,item_id);
             ResultSet rs=pst.executeQuery(); %>
             <option value="none">---select type---</option>
       <%      while(rs.next())  
        {  
          out.print("<option value='"+rs.getString("subj")+"_"+rs.getString("subj_id")+"'>"+rs.getString("subj")+"</option><br>");
         
        }%>
    
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                %>
   