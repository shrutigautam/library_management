<%-- 
    Document   : report
    Created on : May 30, 2017, 5:51:55 PM
    Author     : Saumya Joshi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="connect_1.jsp" %>
<html>
    <head>
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link rel="stylesheet" type="text/css" href="tile.css" />
        <link rel="stylesheet" href="css/search_enquiry.css">
        <link rel="stylesheet" href="css/w3.css">
        <script src="js/jquery.min.js"></script>
        <script>
            
            
            var req, req2;
            function special()
            {
            var class1=document.emp.class_box.value;
            var cat1=document.emp.category_box.value;    
            var d1=document.emp.d1.value;
            var d2=document.emp.d2.value;
            
           if(window.XMLHttpRequest){
           req=new XMLHttpRequest();}
           else{
           req=new ActiveXObject("Microsoft.XMLHTTP");}
       
           req.open("GET","rep?d1="+d1+"&d2="+d2+"&class1="+class1+"&cat1="+cat1,true);
           req.send();
           
           req.onreadystatechange=function(){
                if(req.readyState==4){ 
             var str2=req.responseText;     
           
              document.getElementById("display_box").innerHTML = req.responseText;
           }
         
    }    }

function enqRep(){
    var class1=document.emp.class_box.value;
            var cat1=document.emp.category_box.value;    
            var d1=document.emp.d1.value;
            var d2=document.emp.d2.value;
            if(window.XMLHttpRequest){
            req2=new XMLHttpRequest();}
            else{
            req2=new ActiveXObject("Microsoft.XMLHTTP");}
           req2.open("GET","Enquiry_Report?d1="+d1+"&d2="+d2+"&class1="+class1+"&cat1="+cat1,true);
           req2.send();
           req2.onreadystatechange=function(){
                if(req2.readyState==4){ 
             var str2=req2.responseText;     
           
              
           }
         
    }
}
        </script>
    </head>

    <body>
        <div id="header">
            <div class="logo"><a href="dashboard.jsp">Dash<span>Board</span></a>
            </div>
        </div>
        <div id="container">
            
            <div class="content">
                <div id="enq_fields" >
                    <form name="emp">
                    <div id="enq_fields_div1">
                    
                    <div id="class">
                        Class:
                        <select name="class_box" id="class_box"  style="border-radius:4px;">
                            <option value="-1">Select</option>
                      <%

                      Statement cst1;
                      String query_cst1 = "select * from class_tab";
                      cst1 = conn.createStatement();
                      ResultSet rs_cst1 = cst1.executeQuery(query_cst1);
                      while(rs_cst1.next())
                      {
                     %>
                     <option value="<%=rs_cst1.getString(1)%>" ><%=rs_cst1.getString(2)%></option>
                     <%
                      }
                     %>
                      </select>
                    </div>
                    <div id="category">
                        Category: 
                        <select name="category_box" id="category_box"  style="border-radius:4px;">
                        <option value="-1">Select</option>
                      <%

                      Statement cst2;
                      String query_cst2 = "select * from category_tab";
                      cst2 = conn.createStatement();
                      ResultSet rs_cst2 = cst2.executeQuery(query_cst2);
                      while(rs_cst2.next())
                      {
                     %>
                     <option value="<%=rs_cst2.getString(1)%>" ><%=rs_cst2.getString(2)%></option>
                     <%
                      }
                     %>
                      </select>
                    </div>
                </div>


                <div id="enq_fields_div2">
                    <div id="date_to">
                        Date To: <input type="date" value="" name="d1" id="d1">
                    </div>
                    <div id="date_from">
                        Date From: <input type="date" value="" name="d2" id="d2">
                    </div>
                </div>

                <div id="enq_search">
                    <input id="enq_search_btn" type="button" value="Search" onclick="special()">
                </div>
                </form>
                  <hr style="margin-left: 5%; border-color: #ccc;">  
                  <div id="enq_table">
                <table>
                    <tr id="table_heading">
                        <th class="enq_no">Enquiry No.</th>
                        <th class="name">Name</th>
                        <th class="fname">Father Name</th>
                        <th class="class">Class</th>
                        <th class="mobile">Mobile</th>
                        <th class="city">City</th>
                        <th class="present_address">Present Address</th>
                        
                    </tr>

                </table><span id="display_box">
                    
                </span>
            </div>
            <div id="enq_print">
                    
                <img id="enq_print_btn" src="images/PDF.png" width="60" height="60" alt="PDF" onclick="enqRep()" />
                    &nbsp;
                    <img src="images/Excel.png" width="80" height="60" alt="Excel"/>

                </div>
            </div>
                 
            </div>
                </body>
                </html>
