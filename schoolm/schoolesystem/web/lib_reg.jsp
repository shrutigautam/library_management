<%-- 
    Document   : lib_reg
    Created on : Jul 1, 2017, 8:54:32 AM
    Author     : Shruti Gautam
--%>

<%@page import="java.util.List"%>
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
      <link rel="stylesheet" href="css/bootstrap.min.css">
     
      <script src="js/jquery-3.2.1.min.js"></script>
      <script src="js/jquery-1.2.6.min.js"></script>
      <div id="header">
<%
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
    String a=(String)session.getAttribute("lib_reg");
    if(!a.equals("1"))
    out.print("<h1><center>This service is not under your previlidges</center></h1>");
    else
    {
    %>
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
/*width:20%;*/
border-radius:4px;

}
#sel,#des,#register,#unregister,#ser{
    display:none;
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


#ser_data{display:none;}
</style>
<script>
    function reg()
    {
       reg_data.style.display='block';
       ser_data.style.display='none';
       reg_btn.style.backgroundColor='mintcream';
       reg_btn.style.color='black';
        ser_btn.style.backgroundColor='#003366';
        ser_btn.style.color='white';
      
    }
    function ser()
    {
        ser_data.style.display='block';
        reg_data.style.display='none';
        reg_btn.style.backgroundColor='#003366';
        reg_btn.style.color='white';
        ser_btn.style.backgroundColor='mintcream';
       ser_btn.style.color='black';
    }
</script>

 </head>
    <body>
     
       <%@include file="connect.jsp" %>
       
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
            </div>
              <div class="tabs">
           <div class=" tab_ele" onclick="reg()" id="reg_btn">REGISTRATION</div>
            <div class=" tab_ele" onclick="ser()" id="ser_btn">SEARCH</div>
      </div><br><hr>
<div class=" container" id="reg_data" style="border:1px solid maroon">
           <div class="row">
                <div class="row col-sm-12" style="margin-left:2px;"><h3>LIBRARY REGISTRATION</h3></div>
                <div class="col-sm-7">
                    <div class="row">
            <div class="col-sm-2"></div>
          <div class="col-sm-4"><input type="checkbox" name="reg" value="reg" id="reg"> Registered  </div>   
         <div class="col-sm-4"><input type="checkbox" name="unreg" value="unreg" id="unreg">  Unregistered </div>
          <div class="col-sm-2"></div>
                        </div>
  <div class="row">   
      <div  id="data" style="overflow:auto;margin-left: 10px;width:550px;height:280px;">
      </div>  <br> 
     </div>
                   
                    <div class="row">
                         <div class="col-sm-2"><button id="sel">Select All</button></div>
                            <div class="col-sm-3"><button id="des">Deselect All</button></div>
                             <div class="col-sm-2"><button id="register">Register</button></div>
                             <div class="col-sm-2"><button id="unregister">Unregister</button></div>
                           
                        
                    </div>
                             </div>

                 <div class="col-sm-5">
                     <div class="row">
                         <div class="col-sm-4 a">Category:</div>
                                 <div class="col-sm-8">
                          <select name="cat" id="cat">
                               <option>-----select category-----</option>
                              <option value="stu">Student</option>
                              <option value="emp">Employee</option>
                             </select>
                                 </div>
                     </div>
          <div class="row">
      <div class="col-sm-4 a">Session:</div>
          <div class="col-sm-8">
        <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select session_id,session_name from session_tab";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='ses' id="ses" style=" overflow: scroll;">
                  <option>-----select session-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("session_name")+"_"+rs.getString("session_id")+"'>"+rs.getString("session_name")+"</option><br>");
         
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
      <div class="col-sm-4 a">class:</div>
          <div class="col-sm-8">
        <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select class_id,class_name from class_tab";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='clas' id='clas' style=" overflow: scroll;">
                  <option>-----select class-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("class_name")+"_"+rs.getString("class_id")+"'>"+rs.getString("class_name")+"</option><br>");
         
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
                         <div class="col-sm-4 a">Group Name:</div>
                                 <div class="col-sm-8">
                          <select name="grp" id="grp">
                               <option>-----select group-----</option>
                              <option value="a">a</option>
                              <option value="b">b</option>
                             </select>
                                 </div>
                     </div>
<div class="row">
 <div class="col-sm-4 a">Registration date From:</div>
   <div class="col-sm-6">
   <input type="date" name="reg1">
     </div>
     </div>
<div class="row">
 <div class="col-sm-4 a">Registration date To:</div>
   <div class="col-sm-6">
   <input type="date" name="reg2">
     </div>
     </div>
          
                </div>
                </div>
    </div>
<div class=" container" id="ser_data" style="border:1px solid maroon">
           <div class="row">
                <div class="row col-sm-12" style="margin-left:2px;"><h3>LIBRARY SEARCH</h3></div>
                <div class="col-sm-7">
            <center>        <div class="row">
          <input type="checkbox" name="reg" value="reg" id="reg1"> Registered    
         </div></center>
  <div class="row">   
      <div  id="data1" style="overflow:auto;margin-left: 10px;width:550px;height:280px;">
      </div> <br>  
     </div>
                   
                    <div class="row">
                  <button id="ser" style="margin-left: 200px;">Search</button>
                    </div>
                             </div>

                <div id="user_data1" class="col-sm-5">
                     <div class="row">
                         <div class="col-sm-4 a">Category:</div>
                                 <div class="col-sm-8">
                          <select name="cat1" id="cat1">
                               <option value="no">-----select category-----</option>
                              <option value="stu">Student</option>
                              <option value="emp">Employee</option>
                             </select>
                                 </div>
                     </div>
          <div class="row">
      <div class="col-sm-4 a">Session:</div>
          <div class="col-sm-8">
        <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select session_id,session_name from session_tab";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='ses1' id="ses1" style=" overflow: scroll;">
                  <option value="no">-----select session-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("session_name")+"_"+rs.getString("session_id")+"'>"+rs.getString("session_name")+"</option><br>");
         
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
      <div class="col-sm-4 a">class:</div>
          <div class="col-sm-8">
        <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select class_id,class_name from class_tab";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='clas1' id='clas1' style=" overflow: scroll;">
                  <option value="no">-----select class-----</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("class_name")+"_"+rs.getString("class_id")+"'>"+rs.getString("class_name")+"</option><br>");
         
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
                         <div class="col-sm-4 a">Group Name:</div>
                                 <div class="col-sm-8">
                          <select name="grp" id="grp1">
                               <option value="no">-----select group-----</option>
                              <option value="a">a</option>
                              <option value="b">b</option>
                             </select>
                                 </div>
                     </div>
<div class="row">
 <div class="col-sm-4 a">Registration date From:</div>
   <div class="col-sm-6">
   <input type="date" name="reg11">
     </div>
     </div>
<div class="row">
 <div class="col-sm-4 a">Registration date To:</div>
   <div class="col-sm-6">
   <input type="date" name="reg21">
     </div>
     </div>
          
                </div>
                </div>
<div class="row"  id="user_data1"></div>
    </div>


<script>
   
    $(document).ready(function(){
             $("#ses").attr("disabled","disabled");
                 $("#ses").css("background-color","gray");
              $("#clas").attr("disabled","disabled");
               $("#clas").css("background-color","gray");
               $("#reg").attr("disabled",true);
             
                $("#unreg").attr("disabled",true);
               
               
            
            $("#cat").change(function()
            {
                
                var cat=$("select[name='cat']").val();
               
                
        if((cat==="stu"))
        {
             $("#ses").attr("disabled",false);
                 $("#ses").css("background-color","white");
              $("#clas").attr("disabled",false);
               $("#clas").css("background-color","white");
               $("#reg").attr("disabled",false);
               
                $("#unreg").attr("disabled",false);
             
            
              $("#unreg").click(function()
              {
                    $("#reg").prop("checked",false);
                    var cat=$("select[name='cat']").val();
                    var ses=($("select[name='ses']").val()).split("_");
                      var ses_id=ses[1];
                      if(typeof(ses_id)==="undefined")
                      {
                          ses_id="no";
                      }
                   
                   var clas=($("select[name='clas']").val()).split("_");
                      var clas_id=clas[1];
                      if(typeof(clas_id)==="undefined")
                      {
                          clas_id="no";
                      }
                  
              $.get("stu_list",{ses_id:ses_id,clas_id:clas_id},function(data,status){
                        
                       $("#data").html(data);
                         $("#reg").attr("checked",false);
                       $("#sel").show();
                       $("#des").show();
                       $("#register").show();
                       $("#unregister").show();
                        $("#unregister").attr("disabled",true);
                        $("#register").attr("disabled",false);
                        $("#unregister").css('background-color','gray');
                        $("#register").css('background-color','maroon');
                   });
                   
                  $("#sel").click(function(){
                      $(".cb").attr("checked",true);
                  });
                   
                  $("#des").click(function(){
                      $(".cb").attr("checked",false);
                  });
                  $("#register").click(function(){
                      var cat=$("select[name='cat']").val();
                      var ses=($("select[name='ses']").val()).split("_");
                      var ses_id=ses[1];
                      var clas=($("select[name='clas']").val()).split("_");
                      var clas_id=clas[1];
                  
                      var grp=$("select[name='grp']").val();
                      var reg1=$("input[name='reg1']").val();
                      var reg2=$("input[name='reg2']").val();
                   
                    var y="(";
                      $(".cb:checked").each(function(){
                          var x= $(this).parent().parent().children("td:nth-child(2)").text();
                           
                        y += "'"+cat+"','"+ses_id+"','"+clas_id+"','"+grp+"','"+reg1+"','"+reg2+"','"+x+"'),(";
                    });
                    y = y.substr(0,y.length-2);
                     $.get("lib_reg_add",{value:y},function(data,status){
                      
                       $("#data").html(data);
                       $("select").val("no");
                       $("input").val('');
                     
                  alert("Successfully registered");
                   
                    });
                });
            });
            $("#reg").click(function()
            {
               $("#unreg").prop("checked",false);
               var ses=($("select[name='ses']").val()).split("_");
                      var ses_id=ses[1];
                      if(typeof(ses_id)==="undefined")
                      {
                          ses_id="no";
                      }
                   
                   var clas=($("select[name='clas']").val()).split("_");
                      var clas_id=clas[1];
                      if(typeof(clas_id)==="undefined")
                      {
                          clas_id="no";
                      }
                     
                   $.get("stu_list1",{ses_id:ses_id,clas_id:clas_id},function(data,status){
                       
                       $("#data").html(data);
                       $("#unreg").attr("checked",false);
                       $("#sel").show();
                       $("#des").show();
                       $("#unregister").show();
                       $("#register").show();
                       $("#register").attr("disabled",true);
                        $("#unregister").attr("disabled",false);
                        $("#register").css('background-color','gray');
                        $("#unregister").css('background-color','maroon');
                       
                   });
                   
                  $("#sel").click(function(){
                      $(".cb").attr("checked",true);
                  });
                   
                  $("#des").click(function(){
                      $(".cb").attr("checked",false);
                  }); 
                  $("#unregister").click(function(){
                     
                    var y="(";
                      $(".cb:checked").each(function(){
                         
                          var x= $(this).parent().parent().children("td:nth-child(2)").text();
                           
                        y += "'"+x+"',";
                    });
                    y = y.substr(0,y.length-1)+")";
                  
                     $.get("lib_reg_del",{value:y},function(data,status){
                       $("#data").html(data);
                   alert("successfully unregistered");
                       
                    });
                });
            }); 
        }
          else if((cat==="emp"))
        {
            
                 $("#ses").attr("disabled",true);
                 $("#ses").css("background-color","gray");
              $("#clas").attr("disabled",true);
               $("#clas").css("background-color","gray");
               $("#reg").attr("disabled",false);
              
                $("#unreg").attr("disabled",false);
               
               $("#unreg").click(function(){
                   
                   $("#reg").prop("checked",false);
                   $.get("emp_list_unreg",function(data,status){
                       $("#data").html(data);
                        $("#reg").attr("checked","");
                       $("#sel").show();
                       $("#des").show();
                       $("#register").show();
                       $("#unregister").show();
                        $("#unregister").attr("disabled",true);
                        $("#register").attr("disabled",false);
                        $("#unregister").css('background-color','gray');
                        $("#register").css('background-color','maroon');
                    });
                        
                        $("#sel").click(function(){
                      $(".cb").attr("checked",true);
                  });
                   
                  $("#des").click(function(){
                      $(".cb").attr("checked",false);
                  });
                  $("#register").click(function(){
                      var cat=$("select[name='cat']").val();
                      var grp=$("select[name='grp']").val();
                      var reg1=$("input[name='reg1']").val();
                      var reg2=$("input[name='reg2']").val();
                   
                    var y="(";
                      $(".cb:checked").each(function(){
                          var x= $(this).parent().parent().children("td:nth-child(2)").text();
                           
                        y += "'"+cat+"','"+grp+"','"+reg1+"','"+reg2+"','"+x+"'),(";
                    });
                    y = y.substr(0,y.length-2);
                    
                     $.get("lib_reg_add_emp",{value:y},function(data,status){
                      
                       $("#data").html(data);
                  alert("Successfully registered");
                   
                    });
                });
                       
                   });
                   $("#reg").click(function()
            {
                    $("#unreg").prop("checked",false);
                   $.get("emp_list_reg",function(data,status){
                        
                       $("#data").html(data);
                       });
                       $("#unreg").attr("checked",false);
                       $("#sel").show();
                       $("#des").show();
                       $("#unregister").show();
                       $("#register").show();
                        $("#unregister").attr("disabled",false);
                         $("#register").attr("disabled",true);
                        $("#register").css('background-color','gray');
                        $("#unregister").css('background-color','maroon');
                       
                   
                   
                  $("#sel").click(function(){
                      $(".cb").attr("checked",true);
                  });
                   
                  $("#des").click(function(){
                      $(".cb").attr("checked",false);
                  }); 
                  $("#unregister").click(function(){
                     
                    var y="(";
                      $(".cb:checked").each(function(){
                         
                          var x= $(this).parent().parent().children("td:nth-child(2)").text();
                           
                        y += "'"+x+"',";
                    });
                    y = y.substr(0,y.length-1)+")";
                  
                     $.get("lib_reg_emp_del",{value:y},function(data,status){
                       $("#data").html(data);
                   alert("successfully unregistered");
                       
                    });
                });
            });
               }
             
        });
        
        
        $("#cat1").change(function()
        {
            
        var cat1=$("select[name='cat1']").val();
        if((cat1==="stu"))
        {
             $("#ses").attr("disabled",false);
                 $("#ses").css("background-color","white");
              $("#clas").attr("disabled",false);
               $("#clas").css("background-color","white");
            
              $("#reg1").click(function(){
                  $("#ser").show();
                     
                    var ses=($("select[name='ses1']").val()).split("_");
                      var ses_id=ses[1];
                      if(typeof(ses_id)==="undefined")
                      {
                          ses_id="no";
                      }
                   
                   var clas=($("select[name='clas1']").val()).split("_");
                      var clas_id=clas[1];
                      if(typeof(clas_id)==="undefined")
                      {
                          clas_id="no";
                      }
                 
              $.get("stu_list1",{ses_id:ses_id,clas_id:clas_id},function(data,status){
                                        $("#data1").html(data);
                         $("#reg").prop("checked",false);
                       });
       $("#ser").click(function(){
              $(".cb:checked").each(function(){
                          var x= $(this).parent().parent().children("td:nth-child(2)").text();
                         
                          $.get("lib_reg_search.jsp",{x:x},function(data,status){

                              $("#user_data1").html(data);
                              
                          });
                          });
                       });
                  
        
        });

            }
            else if(cat1=="emp")
            {
                alert("hell");
            }
        });
    });
 </script>
 <%
     }
     }
%>