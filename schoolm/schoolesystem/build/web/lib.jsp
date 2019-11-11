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
       <script src="js/j1.js"></script>
        <script src="js/j2.js"></script>
       
    <style>
     div.list{
         font-size: 20px;
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
     #hide
{	z-index:1;
    position: fixed;
   display:none;
    box-sizing: content-box;
	  background: rgba(0,0,0,0.4);
    width: 100%;
    height: 100%;
}
#popup
{
     display:none;
  margin:auto;
  margin-top: 150px;
        height: 150px;
	width:300px;
	font-size:20px;
    background-color:white;
	padding:10px;
	border-radius: 40px;
        color:black;
        text-align: center;
        box-shadow:5px 5px 15px red;
}

     </style>   
    </head>
    <div id="header">
        <div id="hide">
            <div id="popup"><div id="close" style="margin-right:20px;float:right;cursor:pointer;color: red;">X</div>
                <br>Only Library OPAC can be accessible</div>
            
            </div>
<%
   
    if(session.getAttribute("USERNAME")==null )
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
            <script>
                 $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
            </script> 
            <%
        }
        else if(LS3.equals("student")){
out.print(session.getAttribute("locked"));
    out.print("USERNAME");
            %>
            <div class="logo"><a href="studentDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <script>
                 $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
            </script>    
            
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
    <body>
      
        <div id="nav">
            <ul id="topnav" class="topnav">
               
                 <li class="btn-menu" ><a href="lib.jsp">HOME</a></li>
             <li class="btn-menu" ><a href="lib_mst.jsp">LIBRARY MASTERS</a></li>
                 <li class="btn-menu" ><a href="lib_reg.jsp">REGISTRATION</a></li>
                 <li class="btn-menu" ><a href="lib_purchase.jsp">PURCHASE REGISTER</a></li>
                  <li class="btn-menu" ><a href="lib_accession.jsp">ACCESSION REGISTER</a></li>
                   <li class="btn-menu" ><a href="lib_issue.jsp">ISSUE/RETURN</a></li>
                     <li class="btn-menu" ><a href="lib_opac.jsp">OPAC</a></li>
               
                  <li class="btn-menu" ><a href="Logout">LOGOUT</a></li>
              </ul>
            </div><br>
        <div class="container">
            
            <div class="row col-sm-5" style="border:1px solid maroon;box-shadow:10px 10px 15px maroon;">
            <div class="row"><h1 align="center">Library </h1></div>
            <div class="container list">
               <ul>
                  <a href="lib_mst.jsp"> <li> Library Masters</li></a>
                   <a href="lib_reg.jsp"><li> Library Registration</li></a>
                   <a href="lib_purchase.jsp"><li>Library Purchase Register</li></a>
                        <a href="lib_accession.jsp"> <li>Library Accession Register</li></a>
                         <a href="lib_issue.jsp"><li>Library Issue/Return</li></a>
                          <a href="lib_opac.jsp"><li>Library OPAC</li></a>
                      
                </ul></div>
                </div>
            </div>
    </body>
</html>
<% } %>