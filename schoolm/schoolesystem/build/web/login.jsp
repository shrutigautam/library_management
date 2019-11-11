<%-- 
    Document   : login
    Created on : 21 Jun, 2016, 11:31:59 AM
    Author     : sunil
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            
            
                var a=document.getElementById("h11");
                var password=prompt("Enter Password","");
                window.location.href="first?key="+password;
                
            
            
           
                   
            
        </script>
    </head>
    <body  >
        <h1 ></h1>
        
        <%
            String path="D:\\log.txt";
            File file=new File(path);
	if(!file.exists()){
            
        out.println("<h1 id='h11'>enter password</h1>");
            %> 
     <% }
        else{
            response.sendRedirect("dashboard.html");
        }
        %>
        
       
    
    </body>
</html>
