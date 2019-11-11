<%-- 
    Document   : header
    Created on : Jun 24, 2016, 3:30:20 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <link rel="stylesheet" type="text/css" href="popUpCss.css" />
    <link rel="stylesheet" type="text/css" href="popUpCss_1.css" />
<div id="header">
    <%
        String LS3="";
        if(session.getAttribute("USERNAME") == null) { 
            response.sendRedirect("LoginForm.jsp");
        }
        else {
//            String ab=(String)session.getAttribute("lib_opac");
//        if(!ab.equals("1"))
//        out.print("<h1>You cannot access</h1>");
        LS3=(String)session.getAttribute("TYPE");
        if(LS3.equals("employee")){
            %>
            <div class="logo"><a href="EmployeeDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
        else if(LS3.equals("student")){
            %>
            <div class="logo"><a href="studentDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
        else if(LS3.equals("Admin")){
            %>
            <div class="logo"><a href="dashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
            %>
</div>
  <script src="jquery-1.2.6.min.js" type="text/javascript"></script>
<script>
  
    function showPOP(mes,button){
       var x1= document.getElementById("popup_box");
       x1.innerHTML=mes;
      // x1.innerHTML("<input type=\"button\" value=\"ok\" id=\"popupBoxClose\"/> ");
       x1.style.display="block";
       
      

    }
</script>
</head>
<body>
    <div id="popup_box">
        
    </div>
</body>
<%
    }
%>