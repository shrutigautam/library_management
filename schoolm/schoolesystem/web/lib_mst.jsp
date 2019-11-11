<%-- 
    Document   : lib
    Created on : Jun 9, 2017, 9:33:14 AM
    Author     : Shruti Gautam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
       <link rel="stylesheet" href="css/menu_nav.css">
       <link rel="stylesheet" href="css/bootstrap.min.css">
       <div id="header">
<%
    try
    {
    if(session.getAttribute("USERNAME")==null)
    {
    response.sendRedirect("LoginForm.jsp");
    }
    else
    {
    String LS3=(String)session.getAttribute("TYPE");
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
<%
    String a=(String)session.getAttribute("lib_mst");
    if(!a.equals("1"))
    out.print("<h1><center>This service is not under your previlidges</center></h1>");
    else
    {
    %>

 <style>
     div.list{
         font-size: 16px;
    }
     div.list li{
         padding:8px;
     }
     div.list li:hover{
         background-color: gray;
         color:white;
        cursor: pointer;
        width:35%;
        
     }
     div.list a{
         color:black;
         text-decoration: none;
     }
     div.list a:hover{
         color:white;
     }
     </style>
    </head>
    <body>
      
        <%@include file="connect.jsp" %>
        <div id="nav">
            <ul id="topnav" class="topnav">
              
             <li class="btn-menu" ><a href="lib.jsp">HOME</a></li>
                 
                 <li class="btn-menu"><a href="lib_item_type.jsp"> ITEM TYPE</a></li>
               <li class="btn-menu" ><a href="lib_subj.jsp"> SUBJECT</a></li>
                 <li class="btn-menu"><a href="lib_title.jsp"> TITLE</a></li>
                 <li class="btn-menu" ><a href="lib_subtitle.jsp"> SUBTITLE</a></li>
                 
                 <li class="btn-menu"><a href="auth.jsp">AUTHOR</a></li>
                 <li class="btn-menu" ><a href="pub.jsp">PUBLISHER</a></li>
                 <li class="btn-menu" ><a href="lib_supplier.jsp">SUPPLIER</a></li>
                   <li class="btn-menu" ><a href="lib_prefix.jsp">PREFIX</a></li>
                   <li class="btn-menu" ><a href="lib_cupboard.jsp">CUPBOARD</a></li>
                    <li class="btn-menu" ><a href="lib_shelf.jsp">SHELF</a></li>
                 <li class="btn-menu" ><a href="lib_item.jsp">LIBRARY ITEM</a></li>
                  
                  <li class="btn-menu" ><a href="Logout">LOGOUT</a></li>
                
              </ul>
            </div><br>
            
        <div class="container">
            
            <div class="row col-sm-5" style="border:1px solid maroon;box-shadow:10px 10px 15px maroon;">
            <div class="row"><h1 align="center">Library Masters</h1></div>
            <div class="container list">
               <ul>
                   <a href="lib_item_type.jsp"> <li>Item Type</li></a>
                    <a href="lib_subj.jsp"><li>Subjects</li></a>
                   <a href="lib_title.jsp"><li>Title</li></a>
                         <a href="lib_subtitle.jsp"><li>Subtitle</li></a>
                          <a href="auth.jsp"><li>Author</li></a>
                     <a href="pub.jsp"><li>  Publisher</li></a>
                       <a href="lib_supplier.jsp"><li>Supplier</li></a>
                       <a href="lib_prefix.jsp"><li>Prefix</li></a>
                       <a href="lib_cupboard.jsp"><li>Library Cupboard</li></a>
                         <a href="lib_shelf.jsp"><li>Library Shelf</li></a>
                      <a href="lib_item.jsp"><li>Library Item</li></a>
                        
                </ul></div>
                </div>
            </div>
    
<%
    }
}
}
catch(Exception e)
{
    out.print(e.getMessage());
}
%>
</body>
</html>