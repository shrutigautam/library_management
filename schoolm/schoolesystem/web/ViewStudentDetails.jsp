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
<link href="https://fonts.googleapis.com/css?family=Megrim" rel="stylesheet">
<style>
    .admission_details_div{
position:absolute;
left:400px;
z-index:1;
top:50px;
height:500px;
width:600px;
/* border: 2px solid red; */
}
    </style>
</head>
<%
 String LS=(String)session.getAttribute("TYPE");
 String UserCode=(String)session.getAttribute("USERCODE");
 if(LS.equals("student")){  
  
 }   
 else{
 request.getRequestDispatcher("LoginForm.jsp").forward(request, response);     
 }
%>
 <script>
       var a,b,c,d;    
        function showAdmDetails(){
       
        var usercode=<%= UserCode %>
        if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","ViewStudentInfo?usercode="+usercode+"&TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str1=req.responseText;
                var res =str1.split(",");
                a="<h1>Admission Details</h1><br><table><tr><th><font size='4px'>Admission No.</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[0]+"</font></td></tr>";
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Student Name</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[1]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Date Of Birth</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[2]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Father's Name</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[3]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Mother's Name</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[4]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Admission Date</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[5]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Admission Mode</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[6]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Class</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[7]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Section</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[8]+"</font></td></tr>"
                a=a+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                a=a+"<tr><th><font size='4px'>Year</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res[9]+"</font></td></tr></table>"
                document.getElementById("vd1").innerHTML=a;            
                 }}
        }    
        
        
         function showPersDetails(){
       
        var usercode=<%= UserCode %>
        if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","ViewStudentInfo?usercode="+usercode+"&TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str2=req.responseText;
                var res2 =str2.split(",");
                b="<h1>Personal Information</h1><br><table><tr><th><font size='4px'>Roll Number</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[11]+"</font></td></tr>";
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Enrollment Number</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[12]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Gender</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[13]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Father's Occupation</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[14]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Mother's Name</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[15]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Mother's Occupation</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[16]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Caste</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[17]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Student Type</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[18]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Domicile Type</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[19]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Nationality</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[20]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Blood Group</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[21]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Religion</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[22]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
            
                b=b+"<tr><th><font size='4px'>Disability</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[23]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Vision</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[24]+"</font></td></tr>"
                b=b+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                b=b+"<tr><th><font size='4px'>Hobbies</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res2[25]+"</font></td></tr></table>"
            
                    document.getElementById("vd1").innerHTML=b;            
                 }}
     
           }   
     
       
        function  showContactDetails(){
        var usercode=<%= UserCode %>
        if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","ViewStudentInfo?usercode="+usercode+"&TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str3=req.responseText;
                var res3 =str3.split(",");
                c="<h1>Contact Details</h1><br><table><tr><th><font size='4px'>Address1</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[26]+"</font></td></tr>";
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Address2</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[27]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Pincode</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[28]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>City</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[29]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Email</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[30]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Mobile Number</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[31]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Guardian Name</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[32]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Guardian Occupation</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[33]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Guardian Contact Number</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[34]+"</font></td></tr>"
                c=c+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                c=c+"<tr><th><font size='4px'>Guardian Mobile Number</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res3[35]+"</font></td></tr></table>"
                document.getElementById("vd1").innerHTML=c;            
                 }}
        }    
        
        function  showEduDetails(){
        var usercode=<%= UserCode %>
        if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","ViewStudentInfo?usercode="+usercode+"&TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str4=req.responseText;
                var res4 =str4.split(",");
                d="<h1>Education Details</h1><br><table><tr><th><font size='4px'>Class</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res4[35]+"</font></td></tr>";
                d=d+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                d=d+"<tr><th><font size='4px'>School Name</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res4[36]+"</font></td></tr>"
                d=d+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                d=d+"<tr><th><font size='4px'>Board</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res4[37]+"</font></td></tr>"
                d=d+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                d=d+"<tr><th><font size='4px'>Stream</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res4[38]+"</font></td></tr>"
                d=d+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                d=d+"<tr><th><font size='4px'>Year</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res4[39]+"</font></td></tr>"
                d=d+"<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                d=d+"<tr><th><font size='4px'>Percentage</font></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><font size='4px'>"+res4[40]+"</font></td></tr></table>"
                
                document.getElementById("vd1").innerHTML=d;            
                 }}
        } 
        
 </script>

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
<div class="ABC">
<div class="display_pic">
<img src="/schoolesystem/DisPic2">
</div>

<div class="container">
  <h3 class="title" style="font-family: 'Megrim', cursive;">Student Details</h3>
  <ul>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Admission Details</a>
      <ul class="dropdown-menu">
          <li onclick="showAdmDetails()"><a rel="nofollow" rel="noreferrer"href="#">Admission Details</a></li>
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Personal Information</a>
      <ul class="dropdown-menu">
        <li onclick="showPersDetails()"><a rel="nofollow" rel="noreferrer"href="#">Personal Information</a></li>
        
       
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Contact Details</a>
      <ul class="dropdown-menu">
        <li onclick="showContactDetails()"><a rel="nofollow" rel="noreferrer"href="#">Contact Details</a></li>
    
       
      </ul>
    </li>
	 <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Education Details</a>
      <ul class="dropdown-menu">
        <li onclick="showEduDetails()"><a rel="nofollow" rel="noreferrer"href="#">Education Details</a></li>
       
      </ul>
    </li>
     
   
  </ul>
</div>
  
<div class="admission_details_div" id="vd1" style="padding: 20px 40px ">
</div>
</div>
</body>
</html>