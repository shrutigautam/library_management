<%-- 
    Document   : connect
    Created on : 20 Jun, 2016, 11:58:03 PM
    Author     : sunil
--%>

<%@page import="java.sql.*"%>



        <% Connection conn;
           
            Class.forName( "com.mysql.jdbc.Driver");

         
              conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
       
            %>
   
