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
<link rel="stylesheet" type="text/css" href="css/empDashCss.css">
<link href="https://fonts.googleapis.com/css?family=Megrim" rel="stylesheet">

    
</head>
<body>
    
<%
 String LS=(String)session.getAttribute("TYPE");
 String UserCode=(String)session.getAttribute("USERCODE");
 String Notice=(String)session.getAttribute("Notice");
 String ReportGeneration=(String)session.getAttribute("ReportGeneration"); 
 String Enquiry1=(String)session.getAttribute("Enquiry1"); 
 String student_search=(String)session.getAttribute("student_search");
 if(LS.equals("employee")){  
        
 }   
 else{
 request.getRequestDispatcher("LoginForm.jsp").forward(request, response);     
 }
 
%>    
<div class="navbar">
<div class="logo">
<a href="EmployeeDashboard.jsp" style="text-decoration: none"><h1 class="head1" style="font-family: 'Megrim', cursive;">Employee Dashboard</h1></a>
</div> 
<ul>
  <li><a href="Logout" style="font-family: 'Megrim', cursive;">Logout
</a></li>
</ul>
</div>
<div class="ABC">
<div class="display_pic">
<img src="images/employee.png">
</div>

<div class="container">
  <h3 class="title" style="font-family: 'Megrim', cursive;">Menu</h3>
  <ul>
    <li class="dropdown">
      <input type="checkbox" />
       <%
       if(student_search.equals("0"))
       {
       %>
       <a rel="nofollow" rel="noreferrer"href="javascript: void(0)" data-toggle="dropdown">Student Details</a>
    
       <%
        }
       else{
       %>
       <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Student Details</a>
       <%
       }
       %>
     
      <ul class="dropdown-menu">
        <li>
              <%
       if(student_search.equals("0"))
       {
       %>
       <a rel="nofollow" rel="noreferrer" href="javascript: void(0)">View Details</a>
    
       <%
        }
       else{
       %>
      <a rel="nofollow" rel="noreferrer" href="Search.jsp">View Details</a>
       <%
       }
       %>
            </li>
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Attendance</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="attendence.jsp">View attendance</a></li>
        <li><a rel="nofollow" rel="noreferrer"href="attendence.jsp">Attendance Report </a></li>
       
      </ul>
    </li>
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Exam</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="exam.jsp">View Marks</a></li>
        <li><a rel="nofollow" rel="noreferrer"href="exam.jsp">Exam Report</a></li>
       
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
      <%
       if(Notice.equals("0"))
                    {
                    %>
                   <a rel="nofollow" rel="noreferrer"href="javascript: void(0)" data-toggle="dropdown">Notice</a>
                    <%
                    }
                    else{
                    %>
                    <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Notice</a>
                    <%
                    }
       %>
      
      <ul class="dropdown-menu">
        <li>
            <%
       if(Notice.equals("0"))
                    {
                    %>
                    <a rel="nofollow" rel="noreferrer"href="javascript: void(0)">Notice</a>
                   
                    <%
                    }
                    else{
                    %>
                    <a rel="nofollow" rel="noreferrer"href="notice.jsp">Notice</a>
                    <%
                    }
                    %> 
       </li>
       
      </ul>
    </li>
    
     <li class="dropdown">
      <input type="checkbox" />
      <%
       if(ReportGeneration.equals("0"))
                    {
                    %>
                   <a rel="nofollow" rel="noreferrer"href="javascript: void(0)" data-toggle="dropdown">Report</a>
                    <%
                    }
                    else{
                    %>
                   <a rel="nofollow" rel="noreferrer"href="report.jsp" data-toggle="dropdown">Report</a>
                    <%
                    }
       %>
     
      <ul class="dropdown-menu">
        <li>
         <%
       if(ReportGeneration.equals("0"))
                    {
                    %>
                      <a rel="nofollow" rel="noreferrer"href="javascript: void(0)">Report</a>
                  
                    <%
                    }
                    else{
                    %>
                  <a rel="nofollow" rel="noreferrer"href="report.jsp">Report</a>
                    <%
                    }
       %>    
      
        </li>
       
      </ul>
    </li>
    
    <li class="dropdown">
      <input type="checkbox" />
      <%
       if(Enquiry1.equals("0"))
                    {
                    %>
                    <a rel="nofollow" rel="noreferrer"href="javascript: void(0)" data-toggle="dropdown">Enquiry</a>
                    <%
                    }
                    else{
                    %>
                  <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Enquiry</a>
                    <%
                    }
       %>    
     
      
      <ul class="dropdown-menu">
        <li>
        <%
       if(Enquiry1.equals("0"))
                    {
                    %>
                     <a rel="nofollow" rel="noreferrer"href="javascript: void(0)">Enquiry</a>
                   
                    <%
                    }
                    else{
                    %>
                    <a rel="nofollow" rel="noreferrer"href="Enquiry.jsp">Enquiry</a>
                    <%
                    }
       %>        
       
        
        </li>
       
      </ul>
    </li>
    
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Admission</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="Admission_1.jsp">Admission</a></li>
       
      </ul>
    </li>
    
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Employee</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer"href="employee.jsp">Employee</a></li>
       
      </ul>
    </li>
      
    <li class="dropdown">
      <input type="checkbox" />
      <a rel="nofollow" rel="noreferrer"href="#" data-toggle="dropdown">Library</a>
      <ul class="dropdown-menu">
        <li><a rel="nofollow" rel="noreferrer" href="issue_book.jsp">Detail of issued books</a></li>
        <li><a rel="nofollow" rel="noreferrer" href="lib_opac.jsp">Library OPAC</a></li>
       
      </ul>
    </li>
  </ul>
</div>
<div class="tiles">
<div class="attendance_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="attendence.jsp">	
	Attendance
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <a href="attendence.jsp">
	<img src="images/attendance.jpg" width="150px"></a>
</div>
</div>
<div class="exam_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="examPage.jsp">
	Exam
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
	<a href="examPage.jsp">
        <img src="images/exam2img.png" width="150px">
        </a>
</div>
</div>
<div class="Notes_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="notes.jsp">
	Notes
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <a href="notes.jsp">
	<img src="images/notes.png" width="150px">
        </a>
</div>
</div>
<div class="Details_Class">
<div class="post">
	<span class="folded-corner"></span>
	     <%
       if(student_search.equals("0"))
       {
       %>
     
       <a href="javascript: void(0)">
       Student Details
       </a>
       <%
        }
       else{
       %>
        <a href="Search.jsp">
        Student Details
        </a>
       <%
       }
       %>
        
        
</div>
<div class="post photo">
	<span class="folded-corner"></span>
             <%
       if(student_search.equals("0"))
       {
       %>
     
       
       <a href="javascript: void(0)">
       <img src="images/student_icon.jpg" width="150px">
       </a>
       <%
        }
       else{
       %>
       <a href="Search.jsp">
       <img src="images/student_icon.jpg" width="150px">
       </a>
       <%
       }
       %>
       
</div>
</div>
    
<div class="notice_Class">
<div class="post">
	<span class="folded-corner"></span>
	            <%
                    if(Notice.equals("0"))
                    {
                    %>
                   
                   <a href="javascript: void(0)">
                    Create Notice
                   </a>
                    <%
                    }
                    else{
                    %>
                   <a href="notice.jsp">
                    Create Notice
                   </a>
                    <%
                    }
                    %> 
        
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <%
                    if(Notice.equals("0"))
                    {
                    %>
                   
                  
                    <a href="javascript: void(0)">
	            <img src="images/notice.png" width="150px">
                    </a>
                    <%
                    }
                    else{
                    %>
                  <a href="notice.jsp">
	          <img src="images/notice.png" width="150px">
                  </a>
                    <%
                    }
                    %> 
        
</div>
</div>    
<div class="Report_Class">
<div class="post">
	<span class="folded-corner"></span>
	           <%
                    if(ReportGeneration.equals("0"))
                    {
                    %>
                  <a href="javascript: void(0)">
                  Report
                  </a>
                    <%
                    }
                    else{
                    %>
                  <a href="report.html">
                  Report
                  </a>
                    <%
                    }
                    %> 
       
</div>
<div class="post photo">
	<span class="folded-corner"></span>
                    <%
                    if(ReportGeneration.equals("0"))
                    {
                    %>
                 
                    <a href="javascript: void(0)">
	            <img src="images/report.png" width="150px">
                    </a>
                    <%
                    }
                    else{
                    %>
                   <a href="report.html">
	           <img src="images/report.png" width="150px">
                   </a>
                    <%
                    }
                    %> 
        
</div>
</div>
<div class="Enquiry_Class">
<div class="post">
	<span class="folded-corner"></span>
                    <%
                    if(Enquiry1.equals("0"))
                    {
                    %>
                 
                    
                    <a href="javascript: void(0)">
	            Enquiry
                    </a>
                    <%
                    }
                    else{
                    %>
                 <a href="Enquiry.jsp">
	         Enquiry
                 </a>
                    <%
                    }
                    %> 
        
        
</div>
<div class="post photo">
	<span class="folded-corner"></span>
          <%
                    if(Enquiry1.equals("0"))
                    {
                    %>
                 <a href="javascript: void(0)">
	         <img src="images/enquiry.png" width="150px">
                 </a>
                    <%
                    }
                    else{
                    %>
                 <a href="Enquiry.jsp">
	         <img src="images/enquiry.png" width="150px">
                 </a>
                    <%
                    }
                    %> 
       
</div>
</div>
<div class="Notes_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="notes.jsp">
	Notes
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <a href="notes.jsp">
	<img src="images/notes.png" width="150px">
        </a>
</div>
</div>

    <div class="Admission_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="Admission_1.jsp">
	Admission
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <a href="Admission_1.jsp">
	<img src="images/admission.png" width="150px">
        </a>
</div>
</div> 
    
<div class="Employee_Class">
<div class="post">
	<span class="folded-corner"></span>
        <a href="employee.jsp">
	Employee
        </a>
</div>
<div class="post photo">
	<span class="folded-corner"></span>
        <a href="employee.jsp">
	<img src="images/employee.png" width="150px">
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
</div>


</body>
</html>