<%-- 
    Document   : employee_opac
    Created on : Jul 27, 2017, 9:59:31 PM
    Author     : Shruti Gautam
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/studentDashboard4.css">
<link href="https://fonts.googleapis.com/css?family=Megrim" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-3.2.1.min.js"></script>

      <style>
select,input[type="date"]
{
padding:3px;
color:maroon;
margin: 3px;
border-radius:4px;
width:50%;
}
button{
background-color:maroon;
color:white;
padding:5px;
border-radius:4px;
width:20%;
}
div.a{
    padding:8px;
}
</style>
<body>
      
       <%@include file="connect.jsp" %>
       
        <div class="navbar">
<div class="logo">
<a href="EmployeeDashboard.jsp" style="text-decoration: none"><h1 class="head1" style="font-family: 'Megrim', cursive;">Employee Dashboard</h1></a>
</div> 
<ul>
  <li><a href="Logout" style="font-family: 'Megrim', cursive;">Logout
</a></li>
</ul>

    <div class="container" style="border:1px solid maroon">
        <div class="row" style="margin-left: 10px;"><h3>Online Public Access Catalogue</h3></div>
        <div class="row">
            <div class="col-sm-6">
                <div class="row">
<div class="col-sm-3 a">Item Type :</div>
<div class="col-sm-9">
     <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select name,type_id from lib_item_type";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='type' id="type">
                  <option value="no">-----select type-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("name")+"_"+rs.getString("type_id")+"'>"+rs.getString("name")+"</option><br>");
         
        }
       }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
       %>
</select>
</div>
</div>
       
<div class="row">
<div class="col-sm-3 a">Subject :</div>
<div class="col-sm-9">

<%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select subj,subj_id from lib_subj";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='subj' id="subj" >
                  <option value="no">-----select subject-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("subj")+"_"+rs.getString("subj_id")+"'>"+rs.getString("subj")+"</option><br>");
         
        }
       }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
       %></select>
</div>
</div>
<div class="row">
<div class="col-sm-3 a">Title :</div>
<div class="col-sm-9">

<%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select title,title_id from lib_title";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='title' id="title" >
                  <option value="no">-----select title-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("title")+"_"+rs.getString("title_id")+"'>"+rs.getString("title")+"</option><br>");
         
        }
       }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
       %></select>
</div>
</div>

                </div>
<div class="col-sm-6">
    <div class="row">
     
<div class="col-sm-3 a">Author :</div>

<div class="col-sm-9">
     <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select auth,auth_id from author";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='auth' id="auth" >
                  <option value="no">-----select author-----</option>
       <%      while(rs.next())  
        {  
            out.print("<option value='"+rs.getString("auth")+"_"+rs.getString("auth_id")+"'>"+rs.getString("auth")+"</option><br>");
         
        }
       }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
       %>
</select>
</div>
</div>
<div class="row">
<div class="col-sm-3 a">Publisher :</div>
<div class="col-sm-9">
    <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select pub,pub_id from publisher";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='pub' id="pub" >
                  <option value="no">---select publisher---</option>
       <%      while(rs.next())  
        {  
            out.print("<option value='"+rs.getString("pub")+"_"+rs.getString("pub_id")+"'>"+rs.getString("pub")+"</option><br>");
         
        }
       }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
       %>
              </select>
</div>
        </div>

    </div>
        </div><br>
              <center><div class="row"><button id="ser">Search</button></div><br>
        <div id="show" style="overflow-y:auto;height:250px;width:950px;"></div></center><br>
        </div>
              <script>
                  $(document).ready(function()
                  {
                     $("#ser").click(function()
                     {
                        var type=$("#type").val();
                        if(type==="no")
                        {
                            type="no";
                        }
                        else
                        {
                            type=($("#type").val()).split("_");
                            type=type[1];
                        }
                       
                        var subj=$("#subj").val();
                        if(subj==="no")
                        {
                            subj="no";
                        }
                        else
                        {
                            subj=($("#subj").val()).split("_");
                            subj=subj[1];
                        }
                        var title=$("#title").val();
                        if(title==="no")
                        {
                            title="no";
                        }
                        else
                        {
                            title=($("#title").val()).split("_");
                            title=title[1];
                        }
                        var auth=$("#auth").val();
                        if(auth==="no")
                        {
                            auth="no";
                        }
                        else
                        {
                            auth=($("#auth").val()).split("_");
                            auth=auth[1];
                        }
                        var pub=$("#pub").val();
                        if(pub==="no")
                        {
                            pub="no";
                        }
                        else
                        {
                            pub=($("#pub").val()).split("_");
                            pub=pub[1];
                        }
                        
                         $.get("lib_opac_ser",{type:type,subj:subj,title:title,auth:auth,pub:pub},function(data,status)
                         {
                            // alert(data);
                            $("#show").html(data);
                            $("select").val("no");
                         });
                     }); 
                  });
                  </script>


