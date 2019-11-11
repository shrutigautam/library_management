<%-- 
    Document   : attendance
    Created on : Jun 27, 2016, 12:35:14 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!--<link rel="stylesheet" href="Bootstrap/bootstrap.css">
        <script src="Bootstrap/jquery.js"></script>
        <script src="Bootstrap/javascript.js"></script>-->
        <link rel="stylesheet" href="css/menu_nav.css">
        <link rel="stylesheet" href="css/w3.css">
        <title>SMS</title>
        

    </head>
    <body>
        <div id="nav">
            <ul id="topnav" class="topnav">
                
                 <li id="nav-btn"><a href="#" onclick="abcd()">&#9776;</a></li>
                <li class="btn-menu" id="1a"><a id="menu-home" href="#">HOME</a></li>
                <li class="btn-menu" id="2a"><a href="#">MASTER</a></li>
                <li class="btn-menu" id="3a"><a href="#">ENQUIRY</a></li>
                <li class="btn-menu" id="4a"><a href="#">ADMISSION</a></li>
                <li class="btn-menu" id="5a"><a href="#">EMPLOYEE</a></li>
                <li class="btn-menu" id="1a"><a href="#">USER</a></li>
                <li class="btn-menu" id="2a"><a href="#">NOTICE</a></li>
                <li class="btn-menu" id="3a"><a href="#">STUDENT DETAIL</a></li>
                <li class="btn-menu" id="4a"><a href="#">ATTENDANCE</a></li>
                <li class="btn-menu" id="5a"><a href="#">EXAMINATION</a></li>
                <li class="btn-menu" id="4a"><a href="#">ID CARD</a></li>
                <li class="btn-menu" id="5a"><a href="#">REPORT</a></li>
                 <li class="btn-menu" id="5a"><a href="#">LOGOUT</a></li>
                
            </ul>
        </div>
        <div id="after-click">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">MASTER</a></li>
                <li><a href="#">ENQUIRY</a></li>
                <li><a href="#">ADMISSION</a></li>
                <li><a href="#">EMPLOYEE</a></li>
                 <li><a href="#">USER</a></li>
                <li><a href="#">NOTICE</a></li>
                <li><a href="#">STUDENT DETAIL</a></li>
                <li><a href="#">ATTENDANCE</a></li>
                <li><a href="#">ID CARD</a></li>
                <li><a href="#">REPORT</a></li>
                 <li class="btn-menu" id="5a"><a href="#">LOGOUT</a></li>
            </ul>
        </div>
        <div id="side-nav">
            <div id="nav-list">
                <p>Side Navigation</p>
                <ul class="nav-list">
                     <%
        String LS=(String)session.getAttribute("TYPE");
        if(LS.equals("student")){ 
        %>
        
        
         <li><a href="javascript: void(0)">Attendance</a></li>
         <li><a href="attendanceSearch.jsp">Search</a></li>
        <%
        }   
        else{
        %>
         <li><a href="attendence.jsp">Attendance</a></li>
         <li><a href="attendanceSearch.jsp">Search</a></li>
        <%
        }
        %>
        
        
        
                   
                  
                </ul>
            </div> 
        </div>
        <div id="side-nav-horizontal">
            <div id="nav-heading">
                <p>Navigation<p>
            </div>
            <div id="nav-list-horizontal">
                <ul>
                    <div id="horizontal-first">
                    <li id="first-attendence"><a href="#">Attendence</a></li>
                    <li><a href="#">Attendence Result</a></li>
                    </div>
                    <div id="horizontal-second">
                    <li><a href="#">Search</a></li>
                    <li><a href="#">Result</a></li>
                    </div>
                </ul>
            </div>
        </div>
        
 
        
        <script>
            after_click_list = document.getElementById("after-click");
            i = 0;
            function abcd() {
                if(!i){
                    after_click_list.style.display = "block";
                    i = 1;
                }else{
                    after_click_list.style.display = "none";
                    i = 0;
                }
            }
        </script>
    </body>
</html>
