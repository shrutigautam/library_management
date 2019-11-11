<%-- 
    Document   : DisplayNotice
    Created on : Mar 22, 2017, 9:46:52 AM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@include file="connect_1.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
        <h3>Notice</h3>
       <marquee direction="up">
        <%
    
       Statement cst3;
       String query_cst3 = "select * from notice_tab";
       cst3 = conn.createStatement();
       ResultSet rs_cst3 = cst3.executeQuery(query_cst3); 
       while(rs_cst3.next())
       {
       %>
    
      <input type="text" value="<%=rs_cst3.getString(1)%>" ><%=rs_cst3.getString(2)%>
      
       <%
        }
       %>
       </marquee>
       
   </body>
</html>
