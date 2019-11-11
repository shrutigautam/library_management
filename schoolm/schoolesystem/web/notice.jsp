<%-- 
    Document   : notice
    Created on : Mar 22, 2017, 9:02:05 AM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CKEditor</title>
        <link rel="stylesheet" href="css/menu_nav.css">
        <script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script> 
     <style>
         #noticeDiv{
            position: absolute; 
           
            left:100px;
            
            width:1300px;
         }
         #sub_button{
                position: absolute;
                left:20px;
                background: #347ed9;
                background-image: -webkit-linear-gradient(top, #347ed9, #2980b9);
                background-image: -moz-linear-gradient(top, #347ed9, #2980b9);
                background-image: -ms-linear-gradient(top, #347ed9, #2980b9);
                background-image: -o-linear-gradient(top, #347ed9, #2980b9);
                background-image: linear-gradient(to bottom, #347ed9, #2980b9);
                -webkit-border-radius: 7;
               -moz-border-radius: 7;
                border-radius: 7px;
                font-family: Arial;
                color: #ffffff;
                font-size: 15px;
                padding: 8px 16px 8px 16px;
                text-decoration: none;
         }
         #sub_button:hover{
             background: #3cb0fd;
             background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
             background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
             background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
             background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
             background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
             text-decoration: none;
         }
     </style>
    </head>
    <body>
       
           <%@include file="header.jsp"  %>
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
        <div id="noticeDiv">
        <form action="SaveNotice" method="POST">
        <textarea name="editor1"></textarea>
        <script>
            CKEDITOR.replace( 'editor1' );
        </script>
        
        <input type="submit" value="Submit" id="sub_button">
       </form>
        </div>
    </body>
</html>
