<%-- 
    Document   : library_item_show
    Created on : Jun 30, 2017, 4:29:59 PM
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
        <script src="js/jquery-1.2.6.min.js"></script>
           <script src="js/jquery-3.2.1.min.js"></script>
       <script src="js/j2.js"></script>
      <script src="js/j1.js"></script>
       <style>
input[type="text"],select
{
padding:3px;
color:maroon;
margin: 3px;
width: 80%;
border-radius:4px;
}
input[type="date"]
{
    width:100%;
    border-radius:4px;
}

div.a{
    padding: 8px;
}
button{
background-color:maroon;
color:white;
padding:5px;
width: 100%;
border-radius:4px;

}
div.tabs {
   
        background-color: #0066cc;
        width:100%;
       
       
}

div.tab_ele
{
    float:left;
	color:black;
	padding:10px;
        cursor:pointer;
        background-color: #003366;
        color:white;
        
}
div.tab_ele:hover{
    background-color: mintcream;
    color:maroon;
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

#ser_data{display:none;}

</style>
<script>
    function add()
    {
       add_data.style.display='block';
       ser_data.style.display='none';
    }
    function ser()
    {
        ser_data.style.display='block';
        add_data.style.display='none';
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
        <div id="hide">
           <div id="popup"><div id="close" style="margin-right:20px;float:right;cursor:pointer;color: red;">X</div><br>
              Successfully <br> Done</div>
        </div>  
       
       <%@include file="connect.jsp" %>
       
        <div id="nav">
            <ul id="topnav" class="topnav">
             <li class="btn-menu" id="1a"><a id="menu-home" href="#">HOME</a></li>
                <li class="btn-menu"><a href="lib_item_type.jsp">LIBRARY ITEM TYPE</a></li>
               <li class="btn-menu" ><a href="lib_subj.jsp">LIBRARY SUBJECT</a></li>
                 <li class="btn-menu"><a href="lib_title.jsp">LIBRARY TITLE</a></li>
                 
                 <li class="btn-menu" ><a href="lib_subtitle.jsp">LIBRARY SUBTITLE</a></li>
                 <li class="btn-menu"><a href="auth.jsp">AUTHOR</a></li>
                 <li class="btn-menu" ><a href="pub.jsp">PUBLISHER</a></li>
                  <li class="btn-menu" ><a href="lib_item.jsp">LIBRARY ITEM</a></li>
                 
                 <li class="btn-menu" ><a href="grpmst.jsp">LIBRARY GROUP MASTER</a></li>
                   <li><a href="#" class="log">LOGOUT</a></li>
          </ul>
            </div>
       <div class="tabs">
           <div class=" tab_ele" onclick="add()">ADD</div>
            <div class=" tab_ele" onclick="ser()">SEARCH</div>
      </div><br><hr>
      
         <div class=" container" id="add_data" style="border:1px solid maroon">
           <div class="row">
                <div class="row col-sm-12" style="margin-left:2px;"><h3>LIBRARY ITEM SHOW</h3></div>
                <%
                    int item_id=Integer.parseInt(request.getParameter("item_id"));
    try 
        {
            Statement stmt;
            stmt = conn.createStatement();
             String query = "select * , lib_item_type.name,lib_subj.subj,lib_title.title,lib_subtitle.subtitle,publisher.pub,author.auth from lib_item  join lib_item_type on lib_item.type_id=lib_item_type.type_id join lib_subj on lib_item.subj_id=lib_subj.subj_id join lib_title on lib_item.title_id=lib_title.title_id join lib_subtitle on lib_item.subtitle_id=lib_subtitle.subtitle_id  join publisher on lib_item.pub_id=publisher.pub_id join author on lib_item.auth_id1=author.auth_id where lib_item.item_id=?";
          PreparedStatement pst= conn.prepareStatement(query);
             pst.setInt(1,item_id);
             ResultSet rs=pst.executeQuery(); 
              if(rs.next()) 
              {
                  out.print("<input type='hidden' name='item_id' value='"+rs.getString("item_id")+"'</input>");
              %>
                    
                
<div class="col-sm-6">
<div class="row">
<div class="col-sm-5 a">Item Type :</div>
<div class="col-sm-7">
     
              <select  name='type' id="type" style=" overflow: scroll;">
       <%     
           out.print("<option value='"+rs.getString("name")+"_"+rs.getString("type_id")+"'>"+rs.getString("name")+"</option><br>");
         
         %>
        
       
</select>
</div>
</div>
       <div class="row">
<div class="col-sm-5 a">Language :</div>
<div class="col-sm-7">
    <select name="lang">
        <%
            out.print("<option>"+rs.getString("lang")+"</option>");
        %>
    </select>   
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Subject :</div>
<div class="col-sm-7">
    <select  name='subj' id="subj" style=" overflow: scroll;">
         <%
            out.print("<option value='"+rs.getString("subj")+"_"+rs.getString("subj_id")+"'>"+rs.getString("subj")+"</option><br>");
         
        %>
    </select>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Title :</div>
<div class="col-sm-7">
    <select  name='title' id="title" style=" overflow: scroll;">
         <%
            out.print("<option value='"+rs.getString("title")+"_"+rs.getString("title_id")+"'>"+rs.getString("title")+"</option><br>");
         
        %>
    </select>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Subtitle :</div>
<div class="col-sm-7">
    <select  name='subtitle' id="subtitle" style=" overflow: scroll;">
     <%
             out.print("<option value='"+rs.getString("subtitle")+"_"+rs.getString("subtitle_id")+"'>"+rs.getString("subtitle")+"</option><br>");
         
        %>    
    </select>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">ISBN :</div>
<div class="col-sm-7">
     <%
            out.print("<input type='text' name='isbn' value='"+rs.getString("isbn")+"'>");
            %>
         
        
</div>
</div>
<div class="row ">
    <div class="col-sm-6 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-4 a">Class No.</div>
        <div class="col-sm-8 ">
            <%
            out.print("<input type='text' name='clas' value='"+rs.getString("class")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-6">
        <div class="row col-sm-12">
        <div class="col-sm-4 a">Book No.</div>
        <div class="col-sm-8">
            <%
            out.print("<input type='text' name='book' value='"+rs.getString("book")+"'>");
            %>
        </div>
    </div>
    </div>
</div>
<div class="row">
<div class="col-sm-5 a">Content :</div>
<div class="col-sm-7">
    <%
            out.print("<input type='text' name='con' value='"+rs.getString("content")+"'>");
            %>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Remark :</div>
<div class="col-sm-7">
<%
            out.print("<input type='text' name='rem' value='"+rs.getString("remark")+"'>");
            %>
</div>
</div>
<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Title purchased between</div>
        <div class="col-sm-5 ">
            <%
            out.print("<input type='date' name='pur1' value='"+rs.getString("pur1")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">And</div>
        <div class="col-sm-8">
        <%
            out.print("<input type='date' name='pur2' value='"+rs.getString("pur2")+"'>");
            %>
        </div>
    </div>
    </div>
</div>

<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Bill date between</div>
        <div class="col-sm-5 ">
        <%
            out.print("<input type='date' name='bil1' value='"+rs.getString("bil1")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">And</div>
        <div class="col-sm-8">
        <%
            out.print("<input type='date'  name='bil2' value='"+rs.getString("bil2")+"'>");
            %>
        </div>
    </div>
    </div>
</div>
    </div>

<div class="col-sm-6">
  <div class="row ">
    <div class="col-sm-6 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-6 a">Item serial no.</div>
        <div class="col-sm-6 ">
        <%
            out.print("<input type='text'name='serial' value='"+rs.getString("serial")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-6">
        <div class="row col-sm-12">
        <div class="col-sm-5 a">Item Status.</div>
        <div class="col-sm-7">
        <%
            out.print("<input type='text' name='status' value='"+rs.getString("status")+"'>");
            %>
        </div>
    </div>
    </div>
</div>   
    <div class="row ">
    <div class="col-sm-6 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-6 a">Item key</div>
        <div class="col-sm-6 ">
            <%
            out.print("<input type='text' name='key' value='"+rs.getString("item_key")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-6">
        <div class="row col-sm-12">
        <div class="col-sm-5 a">Acc Prefix.</div>
        <div class="col-sm-7">
        <%
            out.print("<input type='text'name='pref' value='"+rs.getString("prefix")+"'>");
            %>
        </div>
    </div>
    </div>
</div> 
<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Accessioning between</div>
        <div class="col-sm-5 ">
        <%
            out.print("<input type='date' name='acces1' value='"+rs.getString("acces1")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">And</div>
        <div class="col-sm-8">
        <%
            out.print("<input type='date' name='acces2' value='"+rs.getString("acces2")+"'>");
            %>
        </div>
    </div>
    </div>
</div>
       

<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Acc No from</div>
        <div class="col-sm-5 ">
            <%
            out.print("<input type='date' name='acc1' value='"+rs.getString("acc1")+"'>");
            %>
        </div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">To</div>
        <div class="col-sm-8">
        <%
            out.print("<input type='date' name='acc1' value='"+rs.getString("acc2")+"'>");
            %>
        </div>
    </div>
    </div>
</div>
        
 <div class="row">
     
<div class="col-sm-3 a">Author :</div>
<div class="col-sm-1 a"></div>
<div class="col-sm-7">
   <select  name='auth1' id="auth1" style=" overflow: scroll;">
     <%
            out.print("<option>"+rs.getString("auth")+"</option>");
        %>    
    </select>   

</div>
</div>
<div class="row">
    <div class="col-sm-6">
        <div class="row">
<div class="col-sm-6 a">Place of publication</div>
<div class="col-sm-6">
     <%
            out.print("<input type='text' name='place' value='"+rs.getString("pub_place")+"'>");
            %>
</div>
        </div>
        
        <div class="row">
<div class="col-sm-6 a">Publisher :</div>
<div class="col-sm-6">
  <select  name='pub' id="pub" style=" overflow: scroll;">
     <%
            out.print("<option>"+rs.getString("pub")+"</option>");
        %>    
    </select>  
</div>
        </div>
              <div class="row">
<div class="col-sm-6 a">Keywords :</div>
<div class="col-sm-6">
    <%
            out.print("<input type='text' name='keyword' value='"+rs.getString("keyword")+"'>");
            }
}
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
            %>
</div>
        </div>
</div>
<div class="col-sm-6">
                  <div class="row a">
                    <input type="checkbox" name="c1"> Item not accessioning</input>  
                  </div>
                  <div class="row a">
                    <input type="checkbox" name="c1"> Item not issue to anyone</input>  
                  </div>
                  </div>
</div>

</div>

           </div>
              <div class="row">
                  <center><button id="upd" style="width:20%">UPDATE</button></center>
              </div>
    <br>
             </div>
             <br>
 <script> 
     $(document).ready(function(){

 $("#upd").click(function()
                        { 
                            
                            var item_id=$("input[name='item_id']").val();
      
                          var isbn=$("input[name='isbn']").val();
                          var clas=$("input[name='class']").val();
                          var book=$("input[name='book']").val();
                          var content=$("input[name='con']").val();
                          var remark=$("input[name='rem']").val();
                          var pur1=$("input[name='pur1']").val();
                          var pur2=$("input[name='pur2']").val();
                          var bil1=$("input[name='bil1']").val();
                          var bil2=$("input[name='bil2']").val();
                          var serial=$("input[name='serial']").val();
                          var status=$("input[name='status']").val();
                          var key=$("input[name='key']").val();
                          var prefix=$("input[name='pref']").val();
                          var acces1=$("input[name='acces1']").val();
                          var acces2=$("input[name='acces2']").val();
                          var acc1=$("input[name='acc1']").val();
                          var acc2=$("input[name='acc2']").val();
                          var place=$("input[name='place']").val();
                          var keyword=$("input[name='keyword']").val();
                          
$.get("library_item_edit",{item_id:item_id,isbn:isbn,clas:clas,book:book,content:content,remark:remark,pur1:pur1,pur2:pur2,bil1:bil1,bil2:bil2,serial:serial,
                   status:status,key:key,prefix:prefix,acces1:acces1,acces2:acces2,acc1:acc1,acc2:acc2,place:place,keyword:keyword},function(data,status)
               {
                  // alert(data);
              $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       window.location.href="lib_item.jsp"; 
                       });
                       
                   });
                         
                      });
                  });
                      </script>
   <% } %>