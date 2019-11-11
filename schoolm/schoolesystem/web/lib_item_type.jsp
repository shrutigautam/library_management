<%-- 
    Document   : lib_item_type
    Created on : Jun 9, 2017, 1:07:34 PM
    Author     : Shruti Gautam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/jquery-1.2.6.min.js"></script>
      <script src="js/j2.js"></script>
      <script src="js/j1.js"></script>
       <style>
input[type="text"]
{
padding:3px;
color:maroon;
margin: 3px;
width: 80%;
border-radius:4px;
}
button{
background-color:maroon;
color:white;
padding:5px;
width: 100%;
border-radius:4px;

}
div#msg
{
    display:none;
    background-color: maroon;
    color:white;
    width:50%;
    padding: 3px;
}
div.upd
{
  display:none;
    height:200px;
    width:50%;
    align-content: center;
}
#popup1
{
    box-sizing: content-box;
    margin:auto;
	width:360px;
	font-size:19px;
    background-color:lightslategrey;
	padding:10px;
	display:none;
	z-index:2;
        color:white;
        position:fixed;
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
        box-shadow:5px 5px 15px red;
       
}
#err,#err1
{
    display:none;
}

</style>
<script>

</script>
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
        
     
       <%@include file="connect.jsp"  %>
       <div id="hide">
           <div id="popup"><div id="close" style="margin-right:20px;float:right;cursor:pointer;color: red;">X</div><br>
              Successfully <br> Done</div>
        </div>   
        <div id="nav">
            <ul id="topnav" class="topnav">
                <li class="btn-menu"><a href="lib_mst.jsp">HOME</a></li>
               
                 <li class="btn-menu"><a href="lib_item_type.jsp"> ITEM TYPE</a></li>
               <li class="btn-menu" ><a href="lib_subj.jsp"> SUBJECT</a></li>
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
           

        <div class=" container" style="border:1px solid maroon;width:40%;height:440px;">
            <div class="row">
                <div class="col-sm-12" style="margin-left:2px;"><h3>LIBRARY ITEM TYPE</h3></div><br>
<div class="col-sm-12">
<div class="row">
    <div class="col-sm-4" style="padding:8px;">Type Name :</div>
<div class="col-sm-5"><input type="text" name="name"  required/></div>
<div class="col-sm-3"><span id="err"><font color='red'><b>Please fill</b></font></span></div>
</div>
    </div>
            </div>
            <div class="container" style="width:90%;height:250px;">
                <br>
                    <div id="popup1">
                     <center>
                         <div>Enter Updated Name:</div>
                         <div style="color:black;"><input type="name" name="name1"><br><span id="err1"><font color='red'><b>Please fill</b></font></span></div><br>
                         
                          <div><button id="update" style="background-color:bisque;width:30%;color: black;">Update</button>
                     <button id="cancel" style="background-color:bisque;width:30%;color: black;">Cancel</button></div>
                     
                     </center>
                </div>
                <div id="message">
                <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select name from lib_item_type";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select multiple name='list' style="height:250px; width: 350px; overflow:auto;">
       <%      while(rs.next())  
        {  
          out.print("<option>"+rs.getString("name")+"</option><br>");
        }%>
    </select>
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                %>
  
                </div>
            </div><br><br>
            
                
                <div class="row">
                    <div class="col-sm-4"><Button id="add"  name="add" value="add">ADD</button></div>
                    <div class="col-sm-4"><button id="edit">EDIT</button></div>
                    <div class="col-sm-4"><button id="del">DELETE</button></div>
                    
                    </div>
                </div>
              
                
       
         <script>
            $(document).ready(function(){
                $("#add").click(function(){
                    var name = $("input[name='name']").val();
                  
                  if(name!='')
                  {
                    $("input[name='name']").val('');
                    $.get("lib_item_type_add",{name:name},function(data,status){
                       $("#message").html(data);
                       $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
                   });
                   }
                   else
                       $("#err").show();
                    
                });
                $("#del").click(function(){
                    var y="(";
                    $("select[name='list'] option:selected").each(function(){
                        var x= $(this).text();
                        y += "'"+x+"',";
                    });
                    y = y.substr(0,y.length-1)+")";
                 
                    $.get("lib_item_type_del",{name:y},function(data,status){
                  
                       $("#message").html(data);
                        $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
                       
                    });
                });
                $("#edit").click(function(){
                    var name=$("input[name='name']").val();
                    
                    $("#hide").show();
                    $("#popup1").show();
                    $("#cancel").click(function(){
                        $("#popup1").hide();
                        $("#hide").hide();
                        var name=$("input[name='name']").val('');
                    });
        
              });
                    $("#update").click(function()
                    {
                        var name;
                         $("select[name='list'] option:selected").each(function(){
                        name=$(this).text();
                      
                        });
                        var name1 = $("input[name='name1']").val();
                      if(name1!='')
                      {
                        $.get("lib_item_type_edit",{name1:name1,name:name},function(data,status){
                            $("#message").html(data);
                             $("#popup1").hide();
                              $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
                    }); 
                      }
                      else
                      {
                          $("#err1").show();
                      }
                      
                        $("input[name='name1']").val('');
                      
                        var name=$("input[name='name']").val('');
                });
                });
        </script>
 <% }
       
%>
            
        