<%-- 
    Document   : exam_menu_nav
    Created on : Feb 8, 2017, 12:07:22 PM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
      
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
                <li class="btn-menu" id="3a"><a href="#">STUDENT DETAIL</a></li>
                <li class="btn-menu" id="4a"><a href="#">ATTENDANCE</a></li>
                <li class="btn-menu" id="5a"><a href="#">EXAMINATION</a></li>
                <li><a href="#" class="log">LOGOUT</a></li>
            </ul>
        </div>
        <div id="after-click">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">MASTER</a></li>
                <li><a href="#">STUDENT DETAIL</a></li>
                <li><a href="#">ATTENDANCE</a></li>
                <li><a href="#">EXAMINATION</a></li>
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
       
         <li><a href="javascript: void(0)">Exam</a></li>
         <li><a href="examShow1.jsp">Exam Result</a></li>
         <li><a href="javascript: void(0)">Marks Upload</a></li>
        <%
        }
       
        else{
        %>
         <li><a href="examPage.jsp">Exam</a></li>
         <li><a href="examShow1.jsp">Exam Result</a></li>
         <li><a href="marksUpdate.jsp">Marks Upload</a></li> 
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
                    <li id="first-attendence"><a href="#">Exam</a></li>
                    <li><a href="#">Exam Result</a></li>
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
