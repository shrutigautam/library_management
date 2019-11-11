<%-- 
    Document   : connect
    Created on : Jul 5, 2016, 2:31:21 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>connect</title>
    </head>
    <body>
        <% Connection conn;
           
            Class.forName( "com.mysql.jdbc.Driver");

         
              conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
       
            %>
    </body>
</html>
