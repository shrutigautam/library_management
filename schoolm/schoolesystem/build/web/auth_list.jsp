<%-- 
    Document   : auth_list
    Created on : Jun 30, 2017, 9:28:39 AM
    Author     : Shruti Gautam
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%@include file="connect.jsp" %>
       
        <%
           // if(request.getParameter("auth_id2").equals(""))
            
     try 
        {
            int auth_id=Integer.parseInt(request.getParameter("auth_id1"));
           
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select auth,auth_id from author where auth_id not like "+auth_id;
             PreparedStatement pst= conn.prepareStatement(query);
           
             ResultSet rs=pst.executeQuery(); %>
             <option value="none">---select type---</option>
       <%      while(rs.next())  
        {  
          out.print("<option value='"+rs.getString("auth")+"_"+rs.getString("auth_id")+"'>"+rs.getString("auth")+"</option><br>");
         
        }%>
    
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                
%>

