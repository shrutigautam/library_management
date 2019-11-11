<%-- 
    Document   : lib_accession
    Created on : Jul 10, 2017, 11:00:24 AM
    Author     : Shruti Gautam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/dashboard1.css" /> 
         <link rel="stylesheet" href="css/menu_nav.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-3.2.1.min.js"></script>
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
<%
    String a=(String)session.getAttribute("lib_accession");
    if(!a.equals("1"))
    out.print("<h1><center>This service is not under your previlidges</center></h1>");
    else
    {
    %>
      <style>
select,input
{
padding:3px;
color:maroon;
margin: 3px;
border-radius:4px;
width:50%;
}
input[name='cb[]']
{
    width:20%;
}
button{
background-color:maroon;
color:white;
padding:5px;
border-radius:4px;
width:50%;
}
table input{
    width:80%;
}
div.a{
    padding:8px;
}
input[type="number"]
{
    width:90%;
}
#show_pref,#barcode,#ser_data,#err,#bar,#pdf,#show_access_btn,#sel_btn,#des_btn,#report
{
    display:none;
}
#pref{
    width:100%;
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
 margin-left: 10px;
  margin: auto;
        height: 500px;
	width:400px;
	font-size:15px;
    background-color:white;
	padding:15px;
	border:3px solid black;
        color:black;
       
}



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
        <div id="hide">
            <div id="popup">
                <div id="close" style="margin-top:-10px;float:right;cursor:pointer;color: red;font-size: 25px;">X</div>
                <h4> <center>ACCESSION REGISTER REPORT</center></h4>
                <form action="lib_report.jsp" method="get" target="blank">
                   Report Name: <input type="text" name="report_name"><br><br>
                    <div id="popup1" style="height: 300px;overflow-y: auto;"></div><br>
                  <center>  <input type="submit" value="Generate Report" ></center>
                </form>
             <div id="t1"></div>
              </div>  
        </div>   
        <div id="nav">
            <ul id="topnav" class="topnav">
                 <li class="btn-menu" ><a href="lib.jsp">HOME</a></li>
            <li class="btn-menu" ><a href="lib_mst.jsp">LIBRARY MASTERS</a></li>
                 <li class="btn-menu" ><a href="lib_reg.jsp">REGISTRATION</a></li>
                    <li class="btn-menu" ><a href="lib_purchase.jsp">PURCHASE REGISTER</a></li>
                    <li class="btn-menu" ><a href="lib_accession.jsp">ACCESSION REGISTER</a></li>
                    <li class="btn-menu" ><a href="lib_issue.jsp"> ISSUE/RETURN</a></li>
                     <li class="btn-menu" ><a href="lib_opac.jsp">OPAC</a></li>
                   <li class="btn-menu" ><a href="Logout">LOGOUT</a></li>
          </ul>
            </div>
       <div class="tabs">
           <div class=" tab_ele" onclick="reg()" id="reg_btn">Generate Accession</div>
            <div class=" tab_ele" onclick="ser()" id="ser_btn">Search Accession</div>
      </div><br><hr>
       <div class="row" id="reg_data" style="border:1px solid maroon;margin-left:10px;margin-right: 10px;">
           <div class="row" style="margin-left: 10px"><h3>Generate Accession</h3></div>
        <div class="row" style="margin-left: 10px">
            <div class="col-sm-4">Bill No.
               <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select bill_id,bill_no from lib_purchase_bill";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='bill' id="bill">
                  <option value="undefined">---select---</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("bill_no")+"'>"+rs.getString("bill_no")+"</option><br>");
         
        }
       }
catch(Exception e)
{

}
       %>
       </select>
               </div>
           
             <div class="col-sm-4">Date<input type="date" id="date"></div>
               <div class="col-sm-4">
                   <button id="ser">Search</button>
               </div>
               </div><br>
               <div id="show" style="margin-left:5px;overflow-x: auto;margin-right: 5px" ></div><br>
               <div class="row" id="show_pref">
                   <div class="col-sm-7">
                       <div class="row" style="margin-left: 10px;">
                           <div class="col-sm-2 a">Select a prefix</div>
                           <div class="col-sm-3">
                             <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select * from lib_prefix";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='pref' id="pref">
                  <option value="undefined">---select prefix---</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("prefix")+"_"+rs.getString("prefix_id")+"'>"+rs.getString("prefix")+"</option>");
        }
       }
catch(Exception e)
{
out.print(e.getMessage());
}
   %>
         </select> 
                           </div>
         <div class="col-sm-1" id="err" style="color:red">Please fill</div>
         <div class="col-sm-5 a" id="desc"></div>
        </div>
                   </div>
         <div class="col-sm-5">
             <button id="access">Generate Accession Number</button>
         </div>
               </div>  <br>
               <center>
         <div class="row">
       <div class="col-sm-6"><button id="show_access_btn">Show Accession Number</button></div>
       <div class="col-sm-6"><a href="lib_pdf.jsp" target="blank"><button id="barcode">Generate Barcode</button></a></div>
         </div></center><br>
         <div id="show_access" style="height:300px;width:22%;overflow-y: auto;margin-left: 180px;"></div>
       </div>
         <div id="ser_data">
               <div class="row"  style="border:1px solid maroon;margin-left:10px;margin-right: 10px;">
           <div class="row" style="margin-left: 10px"><h3>Search Accession</h3></div>
           <div class="row" style="margin-left: 10px">
            <div class="col-sm-3">Item Type
               <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select type_id,name from lib_item_type";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='type1' id="type1">
                  <option value="undefined">---select---</option>
       <%      while(rs.next())  
        { 
            out.print("<option value='"+rs.getString("name")+"_"+rs.getString("type_id")+"'>"+rs.getString("name")+"</option><br>");
         
        }
       }
catch(Exception e)
{

}
       %>
       </select>
               </div>
           
             <div class="col-sm-3">Title
              <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select title_id,title from lib_title";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='title1' id="title1">
                  <option value="undefined">---select---</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("title_id")+"_"+rs.getString("title")+"'>"+rs.getString("title")+"</option>");
         
        }
       }
catch(Exception e)
{

}
       %>
              </select></div>
              
       <div class="col-sm-3">Status:
           <select name="status">
               <option value="no">--Select--</option>
               <option value="AVAILABLE">AVAILABLE</option>
               <option value="ISSUED">ISSUED</option>
           </select>
           </div>
               <div class="col-sm-3">
                   <button id="ser1">Search</button>
               </div>
           </div><br>
              <div id="accession" style="overflow:auto;height:280px;margin-left: 10px;margin-right: 10px; "></div><br>
              <div>
              <div class="row"> 
            <center>     
                <div class="col-sm-3"><button id="sel_btn">Select All</button></div>
                <div class="col-sm-3"><button id="des_btn">Deselect All</button></div>
                 <div class="col-sm-3"><button id="report">Customized Report</button></div>
                 <div class="col-sm-3"><a href="lib_pdf.jsp" target="blank"><button id="bar">barcode</button></a></div>
                </center>
               </div>   
                 
              </div></div>
       
       
           </div>
       <script>
           $(document).ready(function()
           { var title,type,year,edition,vol,page,x1,rate,pre_id,pre_id1,prefix,pre,bill1;
               var y,i;
                var value="";
              $("#ser").click(function()
              {
                 var  bill=$("#bill").val();
                  if(typeof(bill)==='undefined')
                  {
                      bill="no";
                  }
                 
                  var date=($("#date").val()).split("-");
                  var year=date[0];
                  var mon=date[1];
                  var day=date[2];
                 var date1=year+"-"+mon+"-"+day;
                
                  $.get("lib_purchase_search",{bill:bill,date:date1},function(data,status)
                  {
                     $("#show").html($(data).filter("#accession").html());
                    
                     if(data==="<h2><center>There is nothing to show</center></h2>")
                     $("#show_pref").hide();
                     else
                         $("#show_pref").show();
                     //$("#pref").val("");
                     
                  });
                  
             });
             $("#pref").change(function()
             {
                 $("#err").hide();
                  pre=($("select[name='pref']").val()).split("_");
                
                 prefix=pre[0];
               pre_id=pre[1];
             
               if(pre==='undefined')
               {
                   $("#err").show();
               }
               else
               {
                  
                   $("#err").hide();
                }
                $.get("lib_access_desc",{pre_id:pre_id},function(data,status)
                {
                   
                   $("#desc").html(data); 
                });  
                        
                        
                      $.get("lib_check_prefix",{pre_id:pre_id},function(data,status)
                      {
                          
                        var pre=parseInt(data); 
                        var pre_id1=pre+1;
                      
                          if(data!=="null")
                          {
                              
                       
                        $(".cb:checked").each(function(){
                
                           var x= parseInt($(this).parent().parent().children("td:nth-child(14)").text());
                           x1=$("#pur_id").val();
                           type=$("#type_id").val();
                           title=$("#title_id").val();
                            bill1=$(this).parent().parent().children("td:nth-child(3)").text();
                            year= $(this).parent().parent().children("td:nth-child(10)").text();
                            edition= $(this).parent().parent().children("td:nth-child(11)").text();
                            vol= $(this).parent().parent().children("td:nth-child(12)").text();
                            page= $(this).parent().parent().children("td:nth-child(13)").text();
                            rate= $(this).parent().parent().children("td:nth-child(15)").text();
                            value = "";
                            var pre_id2=x+pre_id1;
                            for(i=pre_id1;i<pre_id2;i++)
                            {
                                y=prefix+i;
                                value += "('"+x1+"','"+type+"','"+title+"','"+year+"','"+edition+"','"+vol+"','"+page+"','"+rate+"','"+y+"','"+pre_id+"','"+i+"','AVAILABLE','"+bill1+"'),";
                            }
              });
                          }
                          else
                          {
                              $(".cb:checked").each(function(){
                
                           var x= $(this).parent().parent().children("td:nth-child(14)").text();
                           x1=$("#pur_id").val();
                           type=$("#type_id").val();
                           title=$("#title_id").val();
                             bill1=$(this).parent().parent().children("td:nth-child(3)").text();
                             year= $(this).parent().parent().children("td:nth-child(10)").text();
                              edition= $(this).parent().parent().children("td:nth-child(11)").text();
                               vol= $(this).parent().parent().children("td:nth-child(12)").text();
                                page= $(this).parent().parent().children("td:nth-child(13)").text();
                                rate= $(this).parent().parent().children("td:nth-child(15)").text();
                    value = "";
                    for(i=1;i<=x;i++)
                    {
                        y=prefix+i;
                        value += "('"+x1+"','"+type+"','"+title+"','"+year+"','"+edition+"','"+vol+"','"+page+"','"+rate+"','"+y+"','"+pre_id+"','"+i+"','AVAILABLE','"+bill1+"'),";
                    }
      });
                        
                          }
             });
             
               
             $("#access").click(function()
             {
                 if(pre==='undefined')
               {
                   $("#err").show();
               }
               else
               {
                  
                   $("#err").hide();
                }
                value = value.substr(0,value.length-1);
                
                $.get("lib_access_add",{value:value,x1:x1},function(data,status)
                {
                    alert("Successfully generated");
                });
               
                        //resetSelect();
                         $("#desc").hide();
                         $(".cb").attr("checked",false);
                          $("#show_access_btn").show();
                          $("#barcode").show();
                          $("#barcode").prop("disabled",true);
                          $("#barcode").css("background-color","gray");
             });

             });
     
             $("#show_access_btn").click(function(){
                 
                $.get("lib_accession_list",{title:title,type:type,year:year,edition:edition,vol:vol,page:page},function(data,status)
                {
                   
                   $("#show_access").html(data);
                    $("#barcode").show();
                    $("#barcode").prop("disabled",false);
                          $("#barcode").css("background-color","maroon");
                  //alert(data);
                }); 
             });
             $("#barcode").click(function(e){
                var accession_no = [];
                var title = [];
                var x;
              
                $(".cb1:checked").each(function()
                {
                    
                    x= $(this).parent().siblings().eq(2).text();
                    accession_no.push(x);
                  x= $(".title_id").val();
                    title.push(x);
                });
                alert(accession_no);
                
                $.get("lib_barcode",{accession_no:accession_no,title:title},function(data,status)
                    {
                        //alert(data);
                    });
                
                alert("done");
             });
             
            /*Resetting selects in Search Accession*/
            function resetSelect(){
                $("select[name='type1']").val("undefined");
                $("select[name='title1']").val("undefined");
                $("select[name='bill1']").val("undefined");
                $("select[name='status']").val("no");
            };
            var global="";
             $("#ser1").click(function()
             {
                 var type1=$("select[name='type1']").val();  
                 if(type1==="undefined")
                 {
                     type1="no";
                 }
                 else
                 {
                  type1=($("select[name='type1']").val()).split("_");
                 type1=type1[1];
             }
               var title1=$("select[name='title1']").val();
               if(title1==="undefined")
               {
                   title1="no";
               }
               else
               {
               title1=($("select[name='title1']").val()).split("_");
                 title1=title1[0];
             }
                
             var status=$("select[name='status']").val();
                $.get("lib_accession_reg",{type1:type1,title1:title1,status:status},function(data,status)
                {
                   // alert(data);
                   global=$(data).filter("#head").html();
                
                    $("#accession").html($(data).filter("#data1").html());
                    var z=$(data).filter("#data1").html();
                    
                    if(z==="<center><h2>There is nothing to show</h2></center>")
                    {
                    $("#bar").hide();
                    $("#pdf").hide();
                    $("#sel_btn").hide();
                    $("#des_btn").hide();
                    $("#report").hide();
                }
                else
                {
                     $("#bar").show();
                    $("#pdf").show();
                    $("#sel_btn").show();
                    $("#des_btn").show();
                    $("#report").show();
                }
                    resetSelect();
                });
             });
             $("#sel_btn").click(function()
             {
                $(".ac_cb").attr("checked","checked"); 
             });
             $("#des_btn").click(function()
             {
                $(".ac_cb").attr("checked",false); 
             });
           
             $("#bar").click(function(){
                var accession_no = [];
                var title = [];
                var x;
              
                $(".ac_cb:checked").each(function()
                {
                    
                    x= $(this).parent().parent().children("td:nth-child(2)").text();
                    accession_no.push(x);
                  x= $(".title_id").val();
                 // alert(x);
                 title.push(x);
               });
               
                $.get("lib_barcode",{accession_no:accession_no,title:title},function(data,status)
                    {
                        //alert(data);
                    });
                
                alert("done");
             });
               $("#report").click(function()
             {
                 $("#hide").show();
                       $("#popup").show();
                         $("#popup1").html(global);
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                 
             });
             });
            
       });
       </script>
       <%
           }
}
           %>