<%-- 
    Document   : lib_shelf
    Created on : Jul 22, 2017, 6:33:53 PM
    Author     : Shruti Gautam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
           
input,textarea,select
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
table input{
    width:90%;
    
}
#add,#shelf_table
{
    display:none;
}

</style>
<script>
    var i=0;
   
    function shelf1()
    {
        document.getElementById("shelf_table").style.display='block';
        var s=document.getElementById("shelf").value;
       
         for(i=1;i<=s;i++)
        {
       
        var table=document.getElementById("shelf_table");
       var row=table.insertRow(i);
        var cell1=row.insertCell(0);
        var t1=document.createElement("input");
        t1.id="sno"+i;
        cell1.appendChild(t1);
        var cell2=row.insertCell(1);
        var t2=document.createElement("input");
        t2.id="shelf_no"+i;
        cell2.appendChild(t2);
         var cell3=row.insertCell(2);
        var t3=document.createElement("input");
        t3.id="alias"+i;
        cell3.appendChild(t3);
        }
    }
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
                 <li class="btn-menu" ><a href="#">LOGOUT</a></li>
          </ul>
            </div>
        <br>
        <div class=" container" style="border:1px solid maroon;width:40%;height:75%;">
            <div class="row">
                <div class="col-sm-12" style="margin-left:2px;"><h3>LIBRARY SHELF</h3></div><br>
<div class="col-sm-12">
    <div class="row">
    <div class="col-sm-4" style="padding:8px;">Cupboard No. :</div>
    <div class="col-sm-5">
        <select id="cup_no" name="cup_no">
            <option>--Select--</option>
        <%
            Statement stmt;
            stmt=conn.createStatement();
            String query="select cup_no,cup_id from lib_cupboard";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            { 
            out.print("<option value='"+rs.getString("cup_id")+"_"+rs.getString("cup_no")+"'>"+rs.getString("cup_no")+"</option>");    
            }
            
            %>
        </select>
    </div>
    
    </div>
     <div class="row">
    <div class="col-sm-4" style="padding:8px;">Alias :</div>
    <div class="col-sm-5"><input type="text" id="cup_alias" > </div>
    </div>
        <div class="row">
    <div class="col-sm-4" style="padding:8px;">No. of Shelf :</div>
    <div class="col-sm-5"><input type="number" id="shelf" name="shelf"> </div>
    </div><br>
        <center>
        <div class="row" style="width: 80%;">
            <table id="shelf_table" border="1"  style="overflow-y: auto; height:230px;text-align: center;">
                <tr>
                    <th>S No.</th>
                    <th>Shelf No.</th>
                    <th>Alias</th>
                    </tr>
                  
            </table>
            </div><br>
        <div class="row">
            <button id="add"> ADD </button> 
        </div>
   </center>
  </div>
 </div>
  </div>

<script>
    $(document).ready(function(){
       var cup_no;
    $("#cup_no").change(function()
    {
        cup_no=($("select[name='cup_no']").val()).split("_");
        cup_no=cup_no[0];
         
       $.get("lib_shelf",{cup_no:cup_no},function(data,status)
       { 
          $("#cup_alias").val($(data).filter("#cup_alias").html());
       });
    });
    $("#shelf").change(function(){
       
        shelf1();
        $("#add").show();
    });
    $("#add").click(function()
    {
       for(var j=1;j<i;j++)
       {
           
           var shelf_no=$("#shelf_no"+j).val();
           var alias=$("#alias"+j).val();
           var value="('"+cup_no+"','"+shelf_no+"','"+alias+"')";
          
           $.get("lib_shelf_add",{value:value},function(data,status)
           {
                $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
                      
                      $("input").val('');
                      $("select").val('');
                        
           });
       }
    });
    });
    </script>
    <% } %>