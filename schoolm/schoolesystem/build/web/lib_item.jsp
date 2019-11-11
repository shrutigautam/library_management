<%-- 
    Document   : lib_item
    Created on : Jun 24, 2017, 12:28:55 PM
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
.hide1
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
width: 30%;
border-radius:4px;

}
div.tabs 
{
   
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


#ser_data,#report_btn,#close_btn
{
display:none;
}
#popup1
{
     display:none;
 margin-left: 10px;
  margin: auto;
        height: 520px;
	width:400px;
	font-size:15px;
    background-color:white;
	padding:15px;
	border:3px solid black;
        color:black;
       
}
input[name='cb[]']
{
    width:20%;
}

</style>
<script>
    function add()
    {
       add_data.style.display='block';
       ser_data.style.display='none';
      
       add_btn.style.backgroundColor='mintcream';
       add_btn.style.color='black';
        ser_btn.style.backgroundColor='#003366';
        ser_btn.style.color='white';
    }
    function ser()
    {
        ser_data.style.display='block';
        add_data.style.display='none';
         
        add_btn.style.backgroundColor='#003366';
        add_btn.style.color='white';
        ser_btn.style.backgroundColor='mintcream';
       ser_btn.style.color='black';
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
         <div class="hide1">
           <div id="popup"><div id="close" style="margin-right:20px;float:right;cursor:pointer;color: red;">X</div><br>
              Successfully <br> Done</div>
        </div>
        <div class="hide1">
            <div id="popup1">
                <div id="close" style="margin-top:-10px;float:right;cursor:pointer;color: red;font-size: 25px;">X</div>
                <h4> <center> REPORT</center></h4>
                <form action="lib_item_report.jsp" method="post" target="_blank">
                   Report Name: <input type="text" name="report_name"><br><br>
                    <div id="popup11" style="height:300px;overflow-y: auto;"></div><br>
                  <center>  <input type="submit" class="btn-primary" style="padding: 5px;" value="Generate Report" ></center>
                </form>
              </div>  
        </div>  
      
       <%@include file="connect.jsp" %>
        
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
                 <li class="btn-menu" ><a href="lib_item.jsp">LIBRARY ITEM</a></li>
                  <li class="btn-menu" ><a href="Logout">LOGOUT</a></li>
                
                  
          </ul>
            </div>
       <div class="tabs">
           <div class=" tab_ele" onclick="add()" id="add_btn">ADD</div>
            <div class=" tab_ele" onclick="ser()" id="ser_btn">SEARCH</div>
      </div><br><hr>
      
         <div class=" container" id="add_data" style="border:1px solid maroon">
           <div class="row">
                <div class="row col-sm-12" style="margin-left:2px;"><h3>LIBRARY ITEM ADD</h3></div>
<div class="col-sm-6">
<div class="row">
<div class="col-sm-5 a">Item Type :</div>
<div class="col-sm-7">
     <%
     try 
        {
           
            String query = "select name,type_id from lib_item_type";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='type' id="type" >
                  <option>-----select type-----</option>
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
<div class="col-sm-5 a">Language :</div>
<div class="col-sm-7">
    <select name="lang">
        <option>----select language----</option>>
        <option>Hindi</option>
        <option>English</option>
    </select>   
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Subject :</div>
<div class="col-sm-7">
 <select  name='subj' id="subj" ></select>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Title :</div>
<div class="col-sm-7">
 <select  name='title' id="title" ></select>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Subtitle :</div>
<div class="col-sm-7">
    <select  name='subtitle' id="subtitle">
        
    </select>
</div>
</div>
<div class="row">
<div class="col-sm-5 a">ISBN :</div>
<div class="col-sm-7"><input type="text" name="isbn"/></div>
</div>
<div class="row ">
    <div class="col-sm-6 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-4 a">Class No.</div>
        <div class="col-sm-8 "><input type="text" name="class"/></div>
    </div>
        </div>
    <div class="col-sm-6">
        <div class="row col-sm-12">
        <div class="col-sm-4 a">Book No.</div>
        <div class="col-sm-8"><input type="text" name="book"/></div>
    </div>
    </div>
</div>
<div class="row">
<div class="col-sm-5 a">Content :</div>
<div class="col-sm-7"><input type="text" name="con"/></div>
</div>
<div class="row">
<div class="col-sm-5 a">Remark :</div>
<div class="col-sm-7"><input type="text" name="rem"/></div>
</div>
<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Title purchased between</div>
        <div class="col-sm-5 "><input type="date" name="pur1"/></div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">And</div>
        <div class="col-sm-8"><input type="date" name="pur2"/></div>
    </div>
    </div>
</div>

<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Bill date between</div>
        <div class="col-sm-5 "><input type="date" name="bil1"/></div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">And</div>
        <div class="col-sm-8"><input type="date" name="bil2"/></div>
    </div>
    </div>
</div>
    </div>

<div class="col-sm-6">
  <div class="row ">
    <div class="col-sm-6 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-6 a">Item serial no.</div>
        <div class="col-sm-6 "><input type="text" name="serial"/></div>
    </div>
        </div>
    <div class="col-sm-6">
        <div class="row col-sm-12">
        <div class="col-sm-5 a">Item Status.</div>
        <div class="col-sm-7"><input type="text" name="status"/></div>
    </div>
    </div>
</div>   
    <div class="row ">
    <div class="col-sm-6 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-6 a">Item key</div>
        <div class="col-sm-6 "><input type="text" name="key"/></div>
    </div>
        </div>
    <div class="col-sm-6">
        <div class="row col-sm-12">
        <div class="col-sm-5 a">Acc Prefix.</div>
        <div class="col-sm-7">
            <select name="prefix">
            <%
                try
                {
                    Statement stmt;
                    stmt=conn.createStatement();
                    String query="select prefix,prefix_id from lib_prefix";
                    ResultSet rs=stmt.executeQuery(query);
                    out.print("<option value='no'>--select--</option>");
                    while(rs.next())
                    {
                        out.print("<option value='"+rs.getString("prefix_id")+"_"+rs.getString("prefix")+"'>"+rs.getString("prefix")+"</option>");
                    }
                }
                catch(Exception e)
                {
                    
                }
              %>
              </select>
        </div>
    </div>
    </div>
</div> 
<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Accessioning between</div>
        <div class="col-sm-5 "><input type="date" name="acces1"/></div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">And</div>
        <div class="col-sm-8"><input type="date" name="acces2"/></div>
    </div>
    </div>
</div>

<div class="row ">
    <div class="col-sm-7 ">
        <div class="row col-sm-12 ">
        <div class="col-sm-7 a">Acc No from</div>
        <div class="col-sm-5 "><input type="date" name="acc1"/></div>
    </div>
        </div>
    <div class="col-sm-5">
        <div class="row col-sm-12">
        <div class="col-sm-3 a">To</div>
        <div class="col-sm-8"><input type="date" name="acc2"/></div>
    </div>
    </div>
</div>    
 <div class="row">
  
<div class="col-sm-3 a">Author :</div>
<div class="col-sm-1 a">1.</div>
<div class="col-sm-7">
     <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select auth,auth_id from author";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='auth1' id="auth1" >
                  <option>-----select type-----</option>
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
<div class="col-sm-3 a"></div>
<div class="col-sm-1 a">2.</div>
<div class="col-sm-7">
     <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select auth,auth_id from author";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='auth2' id="auth2" >
                  <option>-----select type-----</option>
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
<div class="col-sm-6 a">Place of publication</div>
<div class="col-sm-6"><input type="text" name="place"/></div>
        </div>
        
        <div class="row">
<div class="col-sm-6 a">Publisher :</div>
<div class="col-sm-6">
    <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select pub,pub_id from publisher";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='pub' id="pub" >
                  <option>---select---</option>
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
</div></div>
               <div class="row">
<div class="col-sm-6 a">Keywords :</div>
<div class="col-sm-6"><input type="text" name="keyword"/></div>
        </div>
 <div class="row">
  <div class="col-sm-6">  
      <div class="row">
          <div class="col-sm-4 a">CupBoard</div>
          <div class="col-sm-8">
             <select id="cup_no" name="cup_no">
            <option value="no">--Select--</option>
        <%
            try
            {
            Statement stmt;
            stmt=conn.createStatement();
            String query="select cup_no,cup_id from lib_cupboard";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            { 
            out.print("<option value='"+rs.getString("cup_id")+"_"+rs.getString("cup_no")+"'>"+rs.getString("cup_no")+"</option>");    
            }
            }
            catch(Exception e)
            {
                
            }
            %>
        </select>
 
              </div>
          </div>
 </div>
 <div class="col-sm-6">   
 <div class="col-sm-4 a">Shelf :</div>
 <div class="col-sm-8">
     <select name="shelf" id="shelf"></select>
 </div>
 </div>
     </div>
             

             
                  <div class="row a">
                  <div class="col-sm-6">  <input type="checkbox" name="c1"> Item not accessioning</input>  </div>
                  
                <div class="col-sm-6"> <input type="checkbox" name="c1"> Item not issue to anyone</input>  </div>
                  </div>
                 
</div></div><br>



           
              <div class="row">
                  <center><button id="add" style="width:20%">ADD</button></center>
              </div>
    
             </div>
             
              
                  
         <div class=" container" id="ser_data">
           <div class="row">
             
                <div class="row" style="margin-left:2px"><h3>LIBRARY ITEM SEARCH</h3></div>
<div class="col-sm-6" style="border:1px solid maroon">
<div class="row">
<div class="col-sm-5 a">Item Type :</div>
<div class="col-sm-7">
     <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select name,type_id from lib_item_type";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='type1' id="type1">
                  <option>-----select type-----</option>
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
<div class="col-sm-5 a">Language :</div>
<div class="col-sm-7">
    <select name="lang1" id="lang1">
        <option value="undefined">----select language----</option>
        <option value="hindi">Hindi</option>
        <option value="english">English</option>
    </select>   
</div>
</div>
<div class="row">
<div class="col-sm-5 a">Subject :</div>
<div class="col-sm-7">
<!-- <select  name='subj1' id="subj1" style=" overflow: scroll;">-->
<%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select subj,subj_id from lib_subj";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='subj1' id="subj1" >
                  <option>-----select type-----</option>
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
<div class="col-sm-5 a">Title :</div>
<div class="col-sm-7">
<!-- <select  name='title1' id="title1" style=" overflow: scroll;">--> 
<%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select title,title_id from lib_title";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='title1' id="title1" >
                  <option>-----select type-----</option>
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
<div class="row">
<div class="col-sm-5 a">Subtitle :</div>
<div class="col-sm-7">
   <!-- <select  name='subtitle1' id="subtitle1" style=" overflow: scroll;">-->
   <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select subtitle,subtitle_id from lib_subtitle";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='subtitle1' id="subtitle1" >
                  <option>-----select type-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("subtitle")+"_"+rs.getString("subtitle_id")+"'>"+rs.getString("subtitle")+"</option><br>");
         
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
<div class="col-sm-5 a">ISBN :</div>
<div class="col-sm-7"><input type="text" name="isbn1"/></div>
</div>
<div class="row">
     
<div class="col-sm-5 a">Author :</div>

<div class="col-sm-7">
     <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select auth,auth_id from author";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='auth11' id="auth11" >
                  <option>-----select type-----</option>
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
<div class="col-sm-5 a">Publisher :</div>
<div class="col-sm-7">
    <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select pub,pub_id from publisher";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='pub1' id="pub1" >
                  <option>---select type---</option>
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
  <center>   <div class="row">
                  <button id="ser" style="width:20%">SEARCH</button>
               </div></center>      
</div>
              </div>
           </div>
              <div id="show_data" class="container" style="overflow: auto;"></div><br>
              <center>
             <div class="row">
                 <div class="col-sm-6"><a href='lib_item.jsp' style='color:white'><button id="close_btn">Close</button></a></div>
                    <div class="col-sm-6"> <button id="report_btn">Customized report</button></div>
             </div>
             </center>
                  
              
       
<script>
                    $(document).ready(function(){
                        $("#type").change(function()
                        {
                            var a=$("select[name='type']").val();
                            var b=a.split("_");
                            var item_id=b[1];
                           $.get("list.jsp",{item_id:item_id},function(data,status){
                       $("#subj").html(data);
                      });
                        });
                        
                        $("#subj").change(function()
                        {
                            var a=$("select[name='subj']").val();
                            var b=a.split("_");
                            var subj_id=b[1];
                           $.get("list1.jsp",{subj_id:subj_id},function(data,status){
                                 
                       $("#title").html(data);
                      });
                        });
                        $("#title").change(function()
                        {
                            
                            var a=$("select[name='title']").val();
                            var b=a.split("_");
                            var title_id=b[1];
                           $.get("list2.jsp",{title_id:title_id},function(data,status){
                             
                       $("#subtitle").html(data);
                      });
                        });
                         $("#auth1").change(function()
                        {
                           
                            var auth1=($("select[name='auth1']").val()).split("_");
                          var auth_id1=auth1[1];
                           $.get("auth_list.jsp",{auth_id1:auth_id1},function(data,status){
                           
                       $("#auth2").html(data);
                      });
                        });
                        $("#cup_no").change(function()
                        {
                             
                           var cup=($("select[name='cup_no']").val()).split("_");
                           
                           var cup_id=cup[0];
                           
                           $.get("lib_shelf",{cup_id:cup_id},function(data,status)
                           {
                              
                               $("#shelf").html(data);
                             // $("#shelf").val($(data).filter("#shelf").html()); 
                           });
                        });
                        $("#add").click(function()
                        {
                          var item=($("select[name='type']").val()).split("_");
                          var item_id=item[1];
                          var lang=$("select[name='lang']").val();
                         var subj=($("select[name='subj']").val()).split("_");
                          var subj_id=subj[1];
                          var title=($("select[name='title']").val()).split("_");
                          var title_id=title[1];
                          var subtitle=($("select[name='subtitle']").val()).split("_");
                          var subtitle_id=subtitle[1];
                         // alert(subtitle_id);
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
                          var prefix=($("select[name='prefix']").val()).split("_");
                          var prefix_id=prefix[0];
                          var acces1=$("input[name='acces1']").val();
                          var acces2=$("input[name='acces2']").val();
                          var acc1=$("input[name='acc1']").val();
                          var acc2=$("input[name='acc2']").val();
                          var place=$("input[name='place']").val();
                          var keyword=$("input[name='keyword']").val();
                         var auth1=($("select[name='auth1']").val()).split("_");
                          var auth1_id=auth1[1];
                          var auth2=($("select[name='auth2']").val()).split("_");
                          var auth2_id=auth2[1];
                        
                         var pub=($("select[name='pub']").val()).split("_");
                          var pub_id=pub[1];
                          var cup=($("select[name='cup_no']").val()).split("_");
                          var cup_id=cup[0];
                           var shelf=($("select[name='shelf']").val()).split("_");
                          var shelf_id=shelf[0];
                   $.get("library_item_add",{item_id:item_id,lang:lang,subj_id:subj_id,title_id:title_id,subtitle_id:subtitle_id,
                       isbn:isbn,clas:clas,book:book,content:content,remark:remark,pur1:pur1,pur2:pur2,bil1:bil1,bil2:bil2,serial:serial,
                   status:status,key:key,prefix:prefix_id,acces1:acces1,acces2:acces2,acc1:acc1,acc2:acc2,auth1_id:auth1_id,auth2_id:auth2_id,
               place:place,keyword:keyword,pub_id:pub_id,cup_id:cup_id,shelf_id:shelf_id},function(data,status)
           {
              
               $(".hide1:eq(0)").show();
                       $("#popup").show();
                       $(".hide1:eq(0) #close").click(function(){
                            $(".hide1:eq(0)").hide();
                       $("#popup").hide();
                       location.reload();
                       });
                            
                          
                   });
                          
                      });
                      var global="";
                         $("#ser").click(function()
                        {
                            
                          var item1=($("select[name='type1']").val()).split("_");
                          var item_id1=item1[1];
                          if(typeof(item_id1)==="undefined")
                          {
                              item_id1="no";
                          }
                          
                        var lang1=$("select[name='lang1']").val();
                          if(lang1==="undefined")
                          {
                             lang1="no";
                          }
                          
                         var subj1=($("select[name='subj1']").val()).split("_");
                          var subj_id1=subj1[1];
                           if(typeof(subj_id1)==="undefined")
                          {
                              subj_id1="no";
                          }
                          var title1=($("select[name='title1']").val()).split("_");
                          var title_id1=title1[1];
                           if(typeof(title_id1)==="undefined")
                          {
                              title_id1="no";
                          }
                          var subtitle1=($("select[name='subtitle1']").val()).split("_");
                          var subtitle_id1=subtitle1[1];
                           if(typeof(subtitle_id1)==="undefined")
                          {
                              subtitle_id1="no";
                          }
                          var isbn1=$("input[name='isbn1']").val();
                           if(isbn1==='')
                          {
                             isbn1="no";
                          }
                           var auth11=($("select[name='auth11']").val()).split("_");
                          var auth_id11=auth11[1];
                           if(typeof(auth_id11)==="undefined")
                          {
                              auth_id11="no";
                          }
                          var pub1=($("select[name='pub1']").val()).split("_");
                          var pub_id1=pub1[1];
                           if(typeof(pub_id1)==="undefined")
                          {
                              pub_id1="no";
                          }
                        
                         //alert(item_id1+" "+title_id1+" "+lang1+" "+subtitle_id1+" "+subj_id1+" "+isbn1+" "+auth_id11+" "+pub_id1);
                          $.get("library_item_search",{item_id1:item_id1,lang1:lang1,subj_id1:subj_id1,title_id1:title_id1,subtitle_id1:subtitle_id1,
                       isbn1:isbn1,auth_id11:auth_id11,pub_id1:pub_id1},function(data,status){
                         $("#ser_data").hide();
                         $("#show_data").html($(data).filter("#data").html());
                         global=$(data).filter("#report").html();
                         var check=$(data).filter("#data").html();
                        // alert(check);
//                         if(!check==="<h2><center>There is nothing to show</center></h2>")
                         {
                          $("#close_btn").show();
                          $("#report_btn").show();
                      }
                  });
                     });
                      $("#report_btn").click(function()
                      {
                         
                           $(".hide1:eq(1)").show();
                       $("#popup1").show();
                         $("#popup11").html(global);
                       $(".hide1:eq(1) #close").click(function(){
                            $(".hide1:eq(1)").hide();
                       $("#popup1").hide();
                 
             });
                      });  
                    });
        
</script>
<% } %>