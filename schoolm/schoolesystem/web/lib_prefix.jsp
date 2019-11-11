<%-- 
    Document   : lib_prefix
    Created on : Jul 10, 2017, 1:53:41 PM
    Author     : Shruti Gautam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
        <link rel="stylesheet" href="css/menu_nav.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link href='css/style2' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/j2.js"></script>
      <script src="js/j1.js"></script>
       <style>
           
input,textarea
{
padding:3px;
color:maroon;
margin: 3px;
width: 110%;
border-radius:4px;
}
button{
background-color:maroon;
color:white;
padding:5px;
width: 30%;
border-radius:4px;

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
	font-size:25px;
    background-color:white;
	padding:10px;
	border-radius: 40px;
        color:black;
        text-align: center;
        box-shadow: 10px 10px 15px red;
       
}
#err1,#err2
{
    display: none;
    color: red;
}
</style>
      </head>
      <div id="header">
<%
    if(session.getAttribute("USERNAME")==null)
    {
        response.sendRedirect("LoginForm.jsp");
    }
    else
    {
    String LS2=(String)session.getAttribute("TYPE");
        if(LS2.equals("employee")){
            %>
            <div class="logo"><a href="EmployeeDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
        else if(LS2.equals("student")){
            %>
            <div class="logo"><a href="studentDashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
        else if(LS2.equals("Admin")){
            %>
            <div class="logo"><a href="dashboard.jsp">Dash<span>Board</span></a>
            </div>
            <%
        }
            %>    
   </div>

    <body>
      
       <%@include file="connect.jsp" %>
       <div id="hide">
           <div id="popup"><div id="close" style="margin-right:20px;float:right;cursor:pointer;color: red;">X</div><br>
              Successfully <br> Done</div>
        </div>
       
        <div id="nav">
            <ul id="topnav" class="topnav">
                <li class="btn-menu"><a href="lib_mst.jsp">HOME</a></li>
                
                <li class="btn-menu"><a href="lib_item_type.jsp"> ITEM TYPE</a></li>
               <li class="btn-menu" ><a href="lib_subj.jsp">SUBJECT</a></li>
                 <li class="btn-menu"><a href="lib_title.jsp"> TITLE</a></li>
                 
                 <li class="btn-menu" ><a href="lib_subtitle.jsp">SUBTITLE</a></li>
                 <li class="btn-menu"><a href="auth.jsp">AUTHOR</a></li>
                 <li class="btn-menu" ><a href="pub.jsp">PUBLISHER</a></li>
                  <li class="btn-menu" ><a href="lib_supplier.jsp">SUPPLIER</a></li>
                   <li class="btn-menu" ><a href="lib_prefix.jsp">PREFIX</a></li>
                    <li class="btn-menu" ><a href="lib_cupboard.jsp">CUPBOARD</a></li>
                    <li class="btn-menu" ><a href="lib_shelf.jsp">SHELF</a></li>
                 <li class="btn-menu" ><a href="lib_item.jsp">LIBRARY ITEM</a></li>
                  
                  <li class="btn-menu" ><a href="Logout">LOGOUT</a></li>
                
                  
          </ul>
            </div>
        <br>
        
        <div class=" container" style="border:1px solid maroon;width:40%;height:430px;">
            <div class="row">
                <div class="col-sm-12" style="margin-left:2px;"><h3>Prefix</h3></div><br>
<div class="col-sm-12">
    <div class="row">
    <div class="col-sm-4" style="padding:8px;">Prefix :</div>
    <div class="col-sm-5"><input type="text" name="prefix"></div>
     <div class="col-sm-3" style="padding:8px;"><span id="err1">Please Fill</span></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Description :</div>
    <div class="col-sm-5"><textarea  name="desc"></textarea></div>
     <div class="col-sm-3" style="padding:8px;"><span id="err2">Please Fill</span></div>
    </div>
     
    <br>
                <div class="row"><center><Button id="add">ADD</button></center></div>
  </div>
 </div>
  </div>
        <script>
            $(document).ready(function()
            {
                $("#add").click(function()
                {
                  
        var pref=$("input[name='prefix']").val();
        var des=$("textarea[name='desc']").val();
        if(pref==='')
       {
           $("#err1").show();
       }
       else if(des==='')
       {
           $("#err1").hide();
           $("#err2").show();
       }
       else
       {
        $.get("lib_prefix_add",{pref:pref,des:des},function(data,status){
       
        $("input").val('');
         $("textarea").val('');
         $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });  
        });
    }
       });
            });
        </script>
<% }
%>
