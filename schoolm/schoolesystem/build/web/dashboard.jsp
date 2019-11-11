<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
        <link rel="stylesheet" type="text/css" href="tile.css" />
    </head>

    <body>
        <%
         String Notice=(String)session.getAttribute("Notice");
         String Master=(String)session.getAttribute("Master");
         String ReportGeneration=(String)session.getAttribute("ReportGeneration"); 
         
         String idCard_generation=(String)session.getAttribute("idCard_generation");
         String student_search=(String)session.getAttribute("student_search");
         String Enquiry1=(String)session.getAttribute("Enquiry1"); 
        %>   
        <div id="header">
            <div class="logo"><a href="dashboard.jsp">Dash<span>Board</span></a>
            </div>
            <div class="logoutD"><a href="Logout" style="color:white">Log<span>Out</span></a>
            </div>
        </div>
        <div id="container">
            <div class="sidebar">
                <ul  id="nav">
                    <% 
                    if(Master.equals("0"))
                    {
                    %>
                    <li><a href="javascript: void(0)">Master</a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="mst.jsp?key=0">Master</a></li>
                    <%
                    }
                    %>
                    
                    <%
                    if(Enquiry1.equals("0"))
                    {
                    %>
                   
                    <li><a href="javascript: void(0)">Enquiry</a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="Enquiry.jsp">Enquiry</a></li>
                    <%
                    }
                    %>
                   
                    <li><a href="Admission_1.jsp">Admission</a></li>
                    <li><a href="employee.jsp">Employee</a></li>
                    <li><a href="cons.html">User</a></li>
                    <li><a href="attendence.jsp">Attendance</a></li>
                    <li><a href="exam.jsp">Examination</a></li>
                    <li><a href="cons.html">News</a></li>
                    <li><a href="cons.html">Transport</a></li>
                     <%
                    if(Notice.equals("0"))
                    {
                    %>
                    <li><a href="javascript: void(0)">Notice</a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="notice.jsp">Notice</a></li>
                    <%
                    }
                    %>
                   
                    <li><a href="cons.html">Library</a></li>
                      <%
                    if(Enquiry1.equals("0"))
                    {
                    %>
                   
                    <li><a href="javascript: void(0)">Student Search</a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="Search.jsp">Student Search</a></li>
                    <%
                    }
                    %>
                    <%
                    if(Enquiry1.equals("0"))
                    {
                    %>
                    <li><a href="javascript: void(0)">ID Card</a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="ID1.jsp">ID Card</a></li>
                    <%
                    }
                    %>
                    <%
                    if(ReportGeneration.equals("0"))
                    {
                    %>
                    <li><a href="javascript: void(0)">Master</a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href="report.jsp">Report</a></li>
                    <%
                    }
                    %>
                   


                </ul>  
            </div>
            <div class="content">
                <div class="tile">
                     <%
                    if(Master.equals("0"))
                    {
                    %>
                    <a href="javascript: void(0)"><img src="images/master.png"/><span class="caption">Master</span></a>
                    <%
                    }
                    else{
                    %>
                    <a href="mst.jsp?key=0"><img src="images/master.png"/><span class="caption">Master</span></a>
                    <%
                    }
                    %>
                   
                </div>
                <div class="tile">
                     <%
                    if(Enquiry1.equals("0"))
                    {
                    %>
                    <a href="javascript: void(0)"><img src="images/enquiry.png"/><span class="caption">Enquiry</span></a>
                   
                    <%
                    }
                    else{
                    %>
                     <a href="Enquiry.jsp"><img src="images/enquiry.png"/><span class="caption">Enquiry</span></a>
                    <%
                    }
                    %>
                   
                </div>
                <div class="tile">
                    <a href="Admission_1.jsp"><img src="images/admission.png"/><span class="caption">Admission</span></a>
                </div>
                <div class="tile">
                    <a href="employee.jsp"><img src="images/employee.png"/><span class="caption">Employee</span></a>
                </div>
                <div class="tile">
                    <a href="UserMgMt.jsp"><img src="images/add student.png"/><span class="caption">User</span></a>
                </div>
                <div class="tile">
                    <a href="attendence.jsp"><img src="images/attendance.png"/><span class="caption">Attendance</span></a>
                </div>
                <div class="tile">
                    <a href="examPage.jsp"><img src="images/examination.png"/><span class="caption">Examination</span></a>
                </div>
                <div class="tile">
                    <a href="cons.html"><img src="images/news.png"/><span class="caption">News</span></a>
                </div>
                <div class="tile">
                    <a href="cons.html"><img src="images/transport.png"/><span class="caption">Transport</span></a>
                </div>
               
                <div class="tile">
                    
                     <%
                    if(Notice.equals("0"))
                    {
                    %>
                 
                    <a href="javascript: void(0)"><img src="images/notice.png"/><span class="caption">Notice</span></a>
                    <%
                    }
                    else{
                    %>
                  <a href="notice.jsp"><img src="images/notice.png"/><span class="caption">Notice</span></a>
                    <%
                    }
                    %>
                   
               
                    
                </div>
                <div class="tile">
                    <a href="lib.jsp"><img src="images/library.png"/><span class="caption">Library</span></a>
                </div>
                <div class="tile">
                     <%
                    if(student_search.equals("0"))
                    {
                    %>
                   
                    <a href="javascript: void(0)"><img src="images/studentSearch.png"/><span class="caption">Search Students</span></a>  
                    <%
                    }
                    else{
                    %>
                    <a href="Search.jsp"><img src="images/studentSearch.png"/><span class="caption">Search Students</span></a>  
                    <%
                    }
                    %>
                   
                </div>
                <div class="tile">
                    
                     <%
                    if(idCard_generation.equals("0"))
                    {
                    %>
                     <a href="javascript: void(0)"><img src="images/id.png"/><span class="caption">ID Card</span></a>
            
                    <%
                    }
                    else{
                    %>
                   <a href="ID1.jsp"><img src="images/id.png"/><span class="caption">ID Card</span></a> 
                    <%
                    }
                    %>
                  
                </div>
                 
                <div class="tile">
                   <%
                    if(ReportGeneration.equals("0"))
                    {
                    %>
                 <a href="javascript: void(0)"><img src="images/report.png"/><span class="caption">Report</span></a>
                   
                    <%
                    }
                    else{
                    %>
                 <a href="report.jsp"><img src="images/report.png"/><span class="caption">Report</span></a>
                    <%
                    }
                    %>
                   
                    
                </div>
                <div class="tile">
                    <a href="cons.html"><img src="images/settings.png"/><span class="caption">Settings</span></a>
                </div>
</div>
            </div>
                </body>
                </html>