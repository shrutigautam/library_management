<%-- 
    Document   : supplier
    Created on : Jul 6, 2017, 9:05:32 PM
    Author     : Shruti Gautam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Statement"%>
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
input,select
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
#err{
    display:none;
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
                
                <li class="btn-menu"><a href="lib_item_type.jsp">LIBRARY ITEM TYPE</a></li>
               <li class="btn-menu" ><a href="lib_subj.jsp">LIBRARY SUBJECT</a></li>
                 <li class="btn-menu"><a href="lib_title.jsp">LIBRARY TITLE</a></li>
                 
                 <li class="btn-menu" ><a href="lib_subtitle.jsp">LIBRARY SUBTITLE</a></li>
                 <li class="btn-menu"><a href="auth.jsp">AUTHOR</a></li>
                 <li class="btn-menu" ><a href="pub.jsp">PUBLISHER</a></li>
                  <li class="btn-menu" ><a href="lib_supplier.jsp">SUPPLIER</a></li>
                  <li class="btn-menu" ><a href="lib_prefix.jsp">PREFIX</a></li>
                 <li class="btn-menu" ><a href="lib_item.jsp">LIBRARY ITEM</a></li>
                  
                  <li class="btn-menu" ><a href="#">LOGOUT</a></li>
                
                  
          </ul>
            </div>
        <br>
        
        <div class=" container" style="border:1px solid maroon;width:40%;height:430px;">
            <div class="row">
                <div class="col-sm-12" style="margin-left:2px;"><h3>LIBRARY SUPPLIER</h3></div><br>
<div class="col-sm-12">
    <div class="row">
    <div class="col-sm-4" style="padding:8px;">Name :</div>
    <div class="col-sm-5"><input type="text" name="name"></div>
   <div class="col-sm-3"> <span id="err" style="padding:5px;"><font color='red'><b>Please fill</b></font></span></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Address :</div>
    <div class="col-sm-5"><input type="text" name="add"></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">City :</div>
    <div class="col-sm-5"><input type="text" name="city"></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Phone :</div>
    <div class="col-sm-5"><input type="number" name="phone"></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Mobile :</div>
    <div class="col-sm-5"><input type="number" name="mob"></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Fax  :</div>
    <div class="col-sm-5"><input type="text" name="fax"></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">E-mail :</div>
    <div class="col-sm-5"><input type="text" name="email"></div>
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Website :</div>
    <div class="col-sm-5"><input type="text" name="web"></div>
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
                    
        var name=$("input[name='name']").val();
        var add=$("input[name='add']").val();
        var city=$("input[name='city']").val();
        var phone=$("input[name='phone']").val();
        var mob=$("input[name='mob']").val();
        var fax=$("input[name='fax']").val();
        var email=$("input[name='email']").val();
        var web=$("input[name='web']").val();
       if(name!='')
       {
       
        $.get("lib_sup_add",{name:name,add:add,city:city,phone:phone,mob:mob,fax:fax,email:email,web:web},function(data,status){
        //alert(data); 
        $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       }); 
        $("input").val('');
        });
    }
    else
    {
         $("#err").show(); 
    }
       });
            });
        </script>
<% } %>