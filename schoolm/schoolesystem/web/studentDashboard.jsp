<%-- 
    Document   : studentDashboard
    Created on : Apr 8, 2017, 10:15:48 PM
    Author     : Saumya Joshi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="connect_1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/studentDashboard4.css">
<!--<link href="https://fonts.googleapis.com/css?family=Megrim" rel="stylesheet">-->
</head>
<body>
<div class="navbar">
<div class="logo">
<a href="studentDashboard.jsp" style="text-decoration: none"><h1 class="head1" style="font-family: 'Megrim', cursive;">Studend Dashboard</h1></a>
</div> 
<ul>
  <li><a href="Logout" style="font-family: 'Megrim', cursive;">Logout
</a></li>
</ul>
</div>
    <%
 String LS=(String)session.getAttribute("TYPE");
 if(LS.equals("student")){  
  
 }   
 else{
 request.getRequestDispatcher("LoginForm.jsp").forward(request, response);     
 }
%>
<div class="ABC">
<div class="display_pic">
<% 
    String usercode=(String)session.getAttribute("USERCODE");
    System.out.println(usercode);
    out.print("<img src='/schoolesystem/DisplayPhoto?admn="+usercode+"'>");
 %>

</div>

<div class="container">
  <h3 class="title" style="font-family: 'Megrim', cursive;">Student Details</h3>
  <ul>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Student Details</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="#">View Details</a></li>
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Attendance</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="#">View attendance</a></li>
        <li><a rel="nofollow" rel="noreferrer"href="#">Attendance Report </a></li>
       
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Exam</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="#">View Marks</a></li>
        <li><a rel="nofollow" rel="noreferrer"href="#">Exam Report</a></li>
       
      </ul>
    </li>
	 <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Notes</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="#">View Notes</a></li>
       
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Library</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer" href="issue_book.jsp">Detail of Issued books</a></li>
        <li><a rel="nofollow" rel="noreferrer" href="lib_opac.jsp">Library OPAC</a></li>
       
      </ul>
    </li>
  </ul>
</div>
<div class="tiles">
<div class="attendance_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="attendanceSearch.jsp">	
	Attendance
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
         <a href="attendanceSearch.jsp">
	<img src="images/attendance.jpg" width="150px"></a>
</div>
</div>
<div class="exam_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="examShow1.jsp">
	Exam
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
	<a href="examShow1.jsp">
        <img src="images/exam2img.png" width="150px">
        </a>
</div>
</div>
<div class="Notes_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="#">
	Notes
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <a href="#">
	<img src="images/notes.png" width="150px">
        </a>
</div>
</div>
<div class="Details_Class">
<div class="post">
	<span class="folded-corner"></span>
	<a href="ViewStudentDetails.jsp">
        Student Details
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
       <a href="ViewStudentDetails.jsp">
	<img src="images/student_icon.jpg" width="150px">
        </a>
</div>
</div>
    <div class="Library">
<div class="post">
	<span class="folded-corner"></span>
	<a href="lib.jsp">
        Library
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
       <a href="lib.jsp">
	<img src="images/library.png" width="150px">
        </a>
</div>
</div>
</div>

<!--
<div class="notice_heading">
<h1 >Recent Notices</h1>
</div>
-->
<div class="Details_Class" style="position:absolute;left:890px;top:50px;">
<div class="post">
	<span class="folded-corner"></span>
	<a href="#">
        Recent Notices
        </a>
</div>
</div>

<div class="slider_notice" style="overflow: scroll"> 



<div class="w3-content" style="max-width:400px">
 
   
        <%
    
       Statement cst3;
       String query_cst3 = "select * from notice_tab";
       cst3 = conn.createStatement();
       ResultSet rs_cst3 = cst3.executeQuery(query_cst3); 
       while(rs_cst3.next())
       {
       %>
       <div class="mySlides w3-container w3-red">
      <input type="text" value="<%=rs_cst3.getString(1)%>" ><%=rs_cst3.getString(2)%>
      </div>
       <%
        }
       %>
         
    
    
    
    <!--
    
  <div class="mySlides w3-container w3-red">
    <h1><b>Did You Know?</b></h1>
    <h1><i>We plan to sell trips to the moon in the 2020s</i></h1>
  </div>

  <img class="mySlides" src="img_monterosso.jpg" style="width:100%">

  <div class="mySlides w3-container w3-xlarge w3-white w3-card-4">
    <p><span class="w3-tag w3-yellow">New!</span>
    <p>6 Crystal Glasses</p>
    <p>Only $99 !!!</p>
  </div>

  <img class="mySlides" src="img_manarola.jpg" style="width:100%">
</div> -->
</div>
</div>
<script>
var slideIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none"; 
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1} 
    x[slideIndex-1].style.display = "block"; 
    setTimeout(carousel, 4000); 
}
</script>
</body>
</html>