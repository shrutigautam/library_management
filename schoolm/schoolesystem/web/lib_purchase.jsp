<%-- 
    Document   : lib_purchase
    Created on : Jul 6, 2017, 3:02:05 PM
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
        <!--<script src="js/jquery-3.2.1.min.js"></script>-->
        <script src="js/j1.js"></script>
        <script src="js/j2.js"></script>
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
    String a=(String)session.getAttribute("lib_purchase");
    if(!a.equals("1"))
    out.print("<h1><center>This service is not under your previlidges</center></h1>");
    else
    {
    %>
       <style>
 input[type='checkbox']
 {
     width:20%;
 }
input[type="text"],select,input[type="date"],input
{
padding:3px;
color:maroon;
margin: 3px;
border-radius:4px;
}
button{
background-color:maroon;
color:white;
padding:5px;
border-radius:4px;
width:10%;
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
.hide1
{	z-index:1;
    position: fixed;
   display:none;
    box-sizing: content-box;
	  background: rgba(0,0,0,0.4);
    width: 100%;
    height: 100%;
}
#popup1
{
     display:none;
 margin-left: 10px;
  margin: auto;
        height: 450px;
	width:400px;
	font-size:15px;
    background-color:white;
	padding:15px;
	border:3px solid black;
        color:black;
       
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
#ser_data,#report
{
    display: none;
}


 </style>      
 <script>
     function sel(type,title,cd)
            {
                $.get("lib_purchase_list",function(data,status){
                    $(type).html($(data).filter("#itemtype").html());
                    $(title).html($(data).filter("#title").html());
                    $(cd).html($(data).filter("#cd").html());
                });
            }
            var index = 2;  
            function insertRow()
            {
                var table=document.getElementById("mytable");
                var row=table.insertRow(table.rows.length);
                var cell1=row.insertCell(0);
                var t1=document.createElement("select");
                t1.id = "type"+index;
                cell1.appendChild(t1);
                var cell2=row.insertCell(1);
                var t2=document.createElement("select");
                t2.id = "title"+index;
                cell2.appendChild(t2);
                var cell3=row.insertCell(2);
                var t3=document.createElement("input");
                t3.setAttribute("type","number");
                t3.id = "year"+index;
                cell3.appendChild(t3);
                var cell4=row.insertCell(3);
                var t4=document.createElement("input");
                 t4.setAttribute("type","number");
                t4.id = "edition"+index;
                cell4.appendChild(t4);
                var cell5=row.insertCell(4);
                var t5=document.createElement("input");
                 t5.setAttribute("type","number");
                t5.id = "vol"+index;
                cell5.appendChild(t5);
                var cell6=row.insertCell(5);
                var t6=document.createElement("input");
                 t6.setAttribute("type","number");
                t6.id = "page"+index;
                cell6.appendChild(t6);
                var cell7=row.insertCell(6);
                var t7=document.createElement("input");
                 t7.setAttribute("type","number");
                t7.id="qty"+index;
                cell7.appendChild(t7);
                $("#qty"+index).addClass("qty");
                var cell8=row.insertCell(7);
                var t8=document.createElement("input");
                 t8.setAttribute("type","number");
                t8.id="rate"+index;
                cell8.appendChild(t8);
                $("#rate"+index).addClass("rate");
                var cell9=row.insertCell(8);
                var t9=document.createElement("input");
                 t9.setAttribute("type","number");
                t9.id="amt"+index;
                cell9.appendChild(t9);
                $("#amt"+index).addClass("amt");
                var cell10=row.insertCell(9);
                var t10=document.createElement("input");
                 t10.setAttribute("type","number");
                t10.id = "dis"+index;
                cell10.appendChild(t10);
                $("#dis"+index).addClass("dis");
                var cell11=row.insertCell(10);
                var t11=document.createElement("input");
                 t11.setAttribute("type","number");
                t11.id="dis_amt"+index;
                cell11.appendChild(t11);
                 $("#dis_amt"+index).addClass("dis_amt");
                var cell12=row.insertCell(11);
                var t12=document.createElement("input");
                 t12.setAttribute("type","number");
                t12.id="net_amt"+index;
               cell12.appendChild(t12);
               $("#net_amt"+index).addClass("net_amt");
                var cell13=row.insertCell(12);
                var t13=document.createElement("select");
                t13.id="cd"+index;
                cell13.appendChild(t13);
                sel("#type"+index,"#title"+index,"#cd"+index);
                index++;
            }
           
 
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
    <body>
       
       <%@include file="connect.jsp" %>
       <div class="hide1">
           <div id="popup"><div id="close" style="margin-right:20px;float:right;cursor:pointer;color: red;">X</div><br>
              Successfully <br> Done</div>
        </div>
        <div class="hide1">
            <div id="popup1">
                <div id="close" style="margin-top:-10px;float:right;cursor:pointer;color: red;font-size: 25px;">X</div>
                <h4> <center> REPORT</center></h4>
                <form action="lib_purchase_report.jsp" method="post" target="blank">
                   Report Name: <input type="text" name="report_name"><br><br>
                    <div id="popup11" style="height:250px;overflow-y: auto;"></div><br>
                  <center>  <input type="submit" class="btn-primary" style="padding: 5px;" value="Generate Report" ></center>
                </form>
              </div>  
        </div>  
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
           <div class=" tab_ele" onclick="add()" id="add_btn">ADD</div>
            <div class=" tab_ele" onclick="ser()" id="ser_btn">SEARCH</div>
      </div><br><hr>
      
       <div class="row" id="add_data" style="border:1px solid maroon;margin-left:10px;margin-right: 10px;">
           <div class="row" style="margin-left: 10px"><h3>ADD PURCHASE REGISTER</h3></div>
        <div class="row" style="margin-left: 10px">
           <div class="col-sm-4">Bill no. <input type="text" name="bill"/></div>
             <div class="col-sm-4">Date <input type="date" name="date"/></div>
               <div class="col-sm-4">Supplier
               <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select sup_id,sup from supplier";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select  name='sup' id="sup" style="width:50%;">
                  <option>---select supplier---</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("sup")+"_"+rs.getString("sup_id")+"'>"+rs.getString("sup")+"</option><br>");
         
        }
       }
catch(Exception e)
{

}
       %>
       </select>
               </div>
               </div><br>
           <div class="row" style="overflow-x:auto;margin-left: 10px;margin-right: 10px;">
            <table id="mytable"><tr>
        <th>Type</th>
        <th>Title</th>
        <th>Year</th>
        <th>Edition</th>
        <th>Volume</th>
        <th>Pages</th>
        <th>Qty</th>
        <th>Rate</th>
        <th>Amount</th>
        <th>Dis(%)</th>
        <th>Dis Amt</th>
        <th>Net Amt</th>
        <th>With CD</th></tr>
        <tr>
            <td><%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select name,type_id from lib_item_type";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select   id="type1" style=" overflow: scroll;">
                  <option>--select--</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("name")+"_"+rs.getString("type_id")+"'>"+rs.getString("name")+"</option><br>");
         
        }
       %>
       
    </select>
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                %></td>
    <td>
        <%
     try 
        {
            Statement stmt;
            stmt = conn.createStatement();
            String query = "select title,title_id from lib_title";
             PreparedStatement pst= conn.prepareStatement(query);
             ResultSet rs=pst.executeQuery(); %>
              <select   id="title1" style=" overflow: scroll;">
                  <option>--select--</option>
       <%      while(rs.next())  
        {  
           out.print("<option value='"+rs.getString("title")+"_"+rs.getString("title_id")+"'>"+rs.getString("title")+"</option><br>");
         
        }
       %>
       
    </select>
       <% }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
                %>
    </td>
            <td><input type="number"  id='year1'/></td>
            <td><input type="number"  id='edition1'/></td>
             <td><input type="number" id="vol1" /></td>
            <td><input type="number" id="page1" /></td>
            <td><input type="number" class='qty' id="qty1" /></td>
            <td><input type="number" class='rate' id="rate1" /></td>
             <td><input type="number" id="amt1" /></td>
            <td><input type="number" class="dis" id="dis1"  /></td>
            <td><input type="number" class="dis_amt" id="dis_amt1" /></td>
            <td><input type="number" class="net" id="net_amt1" /></td>
            <td><select id="cd1">
                    <option>Yes</option>
                     <option>No</option>
                </select></td>
        </tr>
</table>
    <br>              <center><button id="add" onclick="insertRow();">Add new Entry</button>   
               <button id="sub">Save</button></center>
           </div>
    <div class="row">
        <div class="col-sm-6"></div>
        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-6"><br><br>
                    
                    <div class="row">
                        <div class="col-sm-4 a">Dis(%)</div>
                        <div class="col-sm-5 b"><input type="number" id="t_disp" name="t_disp"></div>
                    </div> 
                    <div class="row">
                        <div class="col-sm-4 a">Tax(%)</div>
                        <div class="col-sm-5 b"><input type="number" id="t_taxp" name="t_taxp"></div>
                    </div>  
                </div>
                <div class="col-sm-6">
                   <div class="row">
                        <div class="col-sm-4 a">Total Amt</div>
                        <div class="col-sm-5"><input type="number" id="t_amt" name="t_amt"></div>
                    </div>  
                   
                     <div class="row">
                        <div class="col-sm-4 a">Dis Amount</div>
                        <div class="col-sm-5"><input type="number" id="t_dis" name="t_dis"></div>
                    </div>
                     <div class="row">
                        <div class="col-sm-4 a">Tax Amount</div>
                        <div class="col-sm-5"><input type="number" id="t_tax" name="t_tax"></div>
                    </div>
                     <div class="row">
                        <div class="col-sm-4 a">Net Amount</div>
                        <div class="col-sm-5"><input type="number" id="t_net" name="net"></div>
                    </div>
                </div>
                <center><div class="row"><button id="final" style="width:20%"> Submit </div></center><br>
            </div> 
        </div>
    </div>
       </div>
    <div id="ser_data" style="border:1px solid maroon;" class="container">
    <div class="row" style="margin-left: 10px"><h3>SEARCH PURCHASE REGISTER</h3></div>
    <div class="row" style="margin-left: 10px">
    <div class="col-sm-4">Bill no. <input type="text" name="bill1" id="bill1"/></div>
    <div class="col-sm-4">Date <input type="date" name="date1" id="date1"/></div>
    <div class="col-sm-4"><button id="ser1" style="width:50%">Search</button></div>
    </div><br>  
    <div id="show"  style="overflow: auto;width:1100px;height:250px;"></div><br>
    <center><div class="row"><button id="report" style="width: 20%;">Customized Report</button></div></center>
    <br>
    </div>
    <script>
        $(document).ready(function($){
           var amt,dis_amt,net_amt,t_tax,t_dis,t_net,bill_no,date;
           var dis=0,t_taxp=0,t_disp=0;
                
           var net=0;
            $(document).on('blur',".rate",function(){
                
                    var rate = parseInt($(this).val()); 
                    var qty = parseInt($(this).parent().prev().find("input").val());
                     amt=rate*qty;
                    $(this).parent().parent().children("td:nth-child(9)").find("input").val(amt);
            });
            $(document).on('blur','.dis',function()
            {
               
                dis=parseInt($(this).val());
                
                 if(isNaN(dis))
                 {
                    dis_amt=0; 
                 }
                
                else
                {
                     
                   dis_amt=amt*(dis/100); 
                    
               }
                
               $(this).parent().parent().children("td:nth-child(11)").find("input").val(dis_amt);
            });
            $(document).on('blur','.dis_amt',function(){
              //  alert(dis_amt);
              if(isNaN(dis))
              {
                net_amt=amt;  
              }
              else
              {
                net_amt=amt-dis_amt;
              }
                 net=net+net_amt;
             
                $(this).parent().parent().children("td:nth-child(12)").find("input").val(net_amt);
            });
            $(document).on('click','#sub',function(){
               $("#t_amt").val(net);
            });
            $(document).on('blur','#t_taxp',function()
            {
                 t_taxp=$("input[name='t_taxp']").val();
                if(isNaN(t_taxp))
                {
                 t_tax=net;   
                }
                else
                {
                
                 t_tax=net*(t_taxp/100);
             }
               $("#t_tax").val(t_tax); 
            });
            $(document).on('blur','#t_disp',function()
            {
                 t_disp=$("input[name='t_disp']").val();
                 if(isNaN(t_disp))
                {
                    t_dis=net;
                }
                else
                {
                
                 t_dis=net*(t_disp/100)
             };
               $("#t_dis").val(t_dis); 
            });
            $(document).on('blur','#t_dis',function(){
                
                t_net=(net-t_dis)+t_tax;
               $("#t_net").val(t_net);
            });
             
           
        $("#sub").click(function(){
                 bill_no=$("input[name='bill']").val();
                 date=$("input[name='date']").val();
                 var sup=($("select[name='sup']").val()).split("_");
               var sup_id=sup[1];
               var dis,amt,dis_amt;
                for(i=1;i<=index-1;i++)
                {
                    var type=($("#type"+i).val()).split("_");
                    var type_id=type[1];
                    var title=($("#title"+i).val()).split("_");
                    var title_id=title[1];
                    var year=$("#year"+i).val();
                    var edition=$("#edition"+i).val();
                    var vol=$("#vol"+i).val();
                    var page=$("#page"+i).val();
                    var qty=$("#qty"+i).val();
                    var rate=$("#rate"+i).val();
                    var amt=$("#amt"+i).val();
                    var dis=$("#dis"+i).val();
                    var dis_amt=$("#dis_amt"+i).val();
                    var net_amt=$("#net_amt"+i).val();
                    var cd=$("#cd"+i).val();
                  
                    var x="('"+bill_no+"','"+date+"','"+sup_id+"','"+type_id+"','"+title_id+"','"+year+"','"+edition+"','"+vol+"','"+page+"','"+qty+"','"+rate+"','"+amt+"','"+dis+"','"+dis_amt+"','"+net_amt+"','"+cd+"','no')";
                    $.get("lib_purchase_add",{x:x},function(data,status)
                    {
//                    alert(data);
                    });
               }
            });
            $("#final").click(function()
            {
               
                $.get("lib_purchase_bill",{bill_no:bill_no,date:date,amt:t_net},function(data,status){
                 // alert(data);
                  $("#hide").show();
                       $("#popup").show();
                       $("#close").click(function(){
                            $("#hide").hide();
                       $("#popup").hide();
                       });
                  $("input").val('');
                  $("select").val('');
                });
            });
            var global="";
            $("#ser1").click(function()
            {
               var bill1=$("input[name='bill1']").val();
               if(bill1==='')
                   bill1="undefined";
               var date1=$("input[name='date1']").val();
               if(date1==='')
                   date1="undefined";
              
               $.get("lib_purchase_search",{bill:bill1,date:date1},function(data,status)
               {
                   
                  $("#show").html($(data).filter("#purchase").html()); 
                   global=$(data).filter("#show1").html();
                  var pur=$(data).filter("#purchase").html();
                
                  if(pur==="<h2><center>There is nothing to show</center></h2>")
                  {
                      $("#report").hide();
                  }
                  else
                  {
                  $("#report").show();
                  }
                  $("#bill1").val("");
                  $("#date1").val("");
               });
            });
            $("#report").click(function(){
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
    <% }
}
%>