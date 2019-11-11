<%-- 
    Document   : grpmst
    Created on : Jun 9, 2017, 9:44:32 AM
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
input[type="text"],input[type="number"],select
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
div.a{
    padding: 8px;
}
div.msg
{
    display:none;
    background-color: maroon;
    color:white;
    width:50%;
    
    padding: 3px;
}
</style>
    </head>
    <body>
       <%@include file="header.jsp"  %>
       
        <div id="nav">
            <ul id="topnav" class="topnav">
             <li class="btn-menu" id="1a"><a id="menu-home" href="#">HOME</a></li>
                <li class="btn-menu" id="2a"><a href="lib_item_type.jsp">LIBRARY ITEM TYPE</a></li>
                <li class="btn-menu" id="3a"><a href="grpmst.jsp">LIBRARY GROUP MASTER</a></li>
                <li class="btn-menu" id="4a"><a href="lib_subj.jsp">LIBRARY SUBJECT</a></li>
                   <li><a href="#" class="log">LOGOUT</a></li>
                 
            </ul>
            </div>
        <br>
        <div class=" container" style="border:1px solid maroon">
           <div class="row">
                <div class="row col-sm-12" style="margin-left:2px;"><h3>LIBRARY GROUP MASTER</h3></div>
<div class="col-sm-6">
<div class="row">
<div class="col-sm-5 a">Group Name :</div>
<div class="col-sm-7"><input type="text" name="name" placeholder="Group Name" required/></div>
</div>
<div class="row">
<div class="col-sm-5 a">Max days for items :</div>
<div class="col-sm-7"><input type="number" name="day"/></div>
</div>
<div class="row">
<div class="col-sm-5 a">Limit on each item :</div>
<div class="col-sm-7"><input type="number" name="lim"/></div>
</div>
<div class="row">
<div class="col-sm-5 a">Late Fine Policy:</div>
<div class="col-sm-7">
<select name="finpol">
<option>Students</option>
<option>Teachers</option>
<option>Non Teachers</option>
</select></div>
</div>
<div class="row">
<div class="col-sm-5 a">Item Fine(Lost) :</div>
<div class="col-sm-7"><input type="number" name="fine"/></div>
</div>
</div>
<div class="col-sm-6">
<div class="row" style="margin-top:112px;">
<div class="col-sm-5">Total limit on item :</div>
<div class="col-sm-7"><input type="number" name="tlim"/></div>
</div>
</div>
</div>
<br>
<div class="row">
<div class="col-sm-6">
<div class="col-sm-12">Available Items :</div>
<div class="col-sm-12">
<select name="avail">
<option>a</option>
<option>b</option>
<option>c</option>
</select>
</div>
</div>
<div class="col-sm-6">
<div class="col-sm-12">Selected Items for Group :</div>
<div class="col-sm-12">
<select name="sel">
<option>Book Bank</option>
<option>Book Bank(Btech)</option>
<option>Book Bank</option>
<option>Book Bank(MBA)</option>
<option>Book Bank</option>
<option>Book Bank(MCA)</option>
<option>Book(Diploma)</option>
</select>
</div>
</div>
</div>
<br><br>
<div class="row">
<div class="col-sm-3"><Button  id="add">ADD</Button></div>
<div class="col-sm-3"><Button name="edit" value="edit">EDIT</Button></div>
<div class="col-sm-3"><Button name="ser" value="ser">SEARCH</Button></div>
<div class="col-sm-3"><Button name="del" value="del">DELETE</Button></div>
</div><br><br>
<center><div class="msg"></div></center>
<br>
 </div>
                <script>
            $(document).ready(function(){
                $("#add").click(function(){
                   
                    var name = $("input[name='name']").val();
                      var day = $("input[name='day']").val();
                        var lim = $("input[name='lim']").val();
                          var finpol = $("select[name='finpol']").val();
                            var fine = $("input[name='fine']").val();
                              var tlim = $("input[name='tlim']").val();
                                var avail = $("select[name='avail']").val();
                                 var sel = $("select[name='sel']").val();
                    $.get("lib_add",{name: name,day:day,lim:lim,fine:fine,finpol:finpol,tlim:tlim,avail:avail,sel:sel},function(data,status){
                        $(".msg").html(data);
                        $(".msg").fadeIn("slow").delay(2000).fadeOut("slow");
                    });
                });
               
                
                
            });
        </script>
       
    </body>
</html>

