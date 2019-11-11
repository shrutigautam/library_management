<%-- 
    Document   : lib_issue
    Created on : Jul 19, 2017, 2:33:56 PM
    Author     : Shruti Gautam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <head>
         <link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
        <link rel="stylesheet" href="css/menu_nav.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link href='css/style2' rel='stylesheet' type='text/css'>
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
    String a=(String)session.getAttribute("lib_issue");
    if(!a.equals("1"))
    out.print("<h1><center>This service is not under your previlidges</center></h1>");
    else
    {
    %>
        <style>
 input[type='text'],input[type='date']
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
width: 20%;
border-radius:4px;

}
div.a{
    padding: 8px;
}
#issue_btn,#reset
{
    display: none;
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
#lib_ser_data,#c_report
{
    display:none;
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
        height: 420px;
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
 function lib_issue()
    {
       lib_issue_data.style.display='block';
       lib_ser_data.style.display='none';
       lib_issue_btn.style.backgroundColor='mintcream';
       lib_issue_btn.style.color='black';
        lib_ser_btn.style.backgroundColor='#003366';
        lib_ser_btn.style.color='white';
      
    }
    function lib_ser()
    {
        lib_ser_data.style.display='block';
        lib_issue_data.style.display='none';
        lib_issue_btn.style.backgroundColor='#003366';
        lib_issue_btn.style.color='white';
        lib_ser_btn.style.backgroundColor='mintcream';
       lib_ser_btn.style.color='black';
    }           
</script>
    </head>
   <body>
    
        <%@include file="connect.jsp" %>
        <div id="hide">
            <div id="popup">
                <div id="close" style="margin-top:-10px;float:right;cursor:pointer;color: red;font-size: 25px;">X</div>
                <h4> <center>ISSUE / RETURN  REPORT</center></h4>
                <form action="lib_issue_report.jsp" method="get" target="_blank">
                   Report Name: <input type="text" name="report_name"><br><br>
                    <div id="popup1"></div><br>
                  <center>  <input type="submit" value="Generate Report" ></center>
                </form>
              </div>  
        </div>   
        <div id="nav">
            <ul id="topnav" class="topnav">
                
                 <li class="btn-menu" ><a href="lib.jsp">HOME</a></li>
             <li class="btn-menu" ><a href="lib_mst.jsp">LIBRARY MASTERS</a></li>
                 <li class="btn-menu" ><a href="lib_reg.jsp">REGISTRATION</a></li>
                 <li class="btn-menu" ><a href="lib_purchase.jsp">PURCHASE REGISTER</a></li>
                  <li class="btn-menu" ><a href="lib_accession.jsp"> ACCESSION REGISTER</a></li>
                   <li class="btn-menu" ><a href="lib_issue.jsp"> ISSUE/RETURN</a></li>
                    <li class="btn-menu" ><a href="lib_opac.jsp"> OPAC</a></li>
            <li class="btn-menu" ><a href="Logout">LOGOUT</a></li>
              </ul>
            </div>
        <div class="tabs">
        <div class="tab_ele" onclick="lib_issue()" id="lib_issue_btn" >Library Issue/Return </div>
        <div class="tab_ele" onclick="lib_ser()" id="lib_ser_btn">Issue/Return Search</div>
        </div>
        <br><hr>
            <div id="lib_issue_data">
            <div class=" container" style="border:1px solid maroon;">
           <div class="col-sm-12" style="margin-left:2px;"><h3>LIBRARY ISSUE / RETURN</h3></div><br>
            <div class="row">
                <div class="col-sm-6">
            <div class="row">
           <div class="col-sm-3 a">Accession No.</div>
         <div class="col-sm-6"><input type="text" name="access_no" id="access_no"></div>
           </div>   
           <div class="row">
            <div class="col-sm-3 a">Member Code</div>
            <div class="col-sm-6"><input type="text" name="mem_code" id="mem_code"></div>
            </div>
           <div  class="row col-sm-10" id="issue" style="color:red;font-size:20px;text-align: center; "></div>     
           <br>
           <div class="row" style="padding:5px;"><div id="show1"></div></div>
          <div class="row" style="padding:5px;"> <div id="show2"></div></div><br>
          <div class="row">
          <center>    <button id="issue_btn" style='margin-left:10px;'>Issue / Return </button> &nbsp;
              <button id="reset">RESET</button></center>
             </div>
            </div>
               
                <div class="col-sm-6">
                <div  class="row"><div id="show3"></div></div>
                </div>
                </div><br>
            </div></div>
        <div id="lib_ser_data">
             <div class=" container" style="border:1px solid maroon;">
           <div class="col-sm-12" style="margin-left:2px;"><h3>ISSUE / RETURN SEARCH</h3></div><br>
           <div class="row">
            <div class="col-sm-4">
                <div class="row">
           <div class="col-sm-3 a">Issue Date :</div>
         <div class="col-sm-8"><input type="date" name="issue_date" id="issue_date"></div>
           </div>   
          </div>
               <div class="col-sm-4">
                    <div class="row">
            <div class="col-sm-3 a">Return Date</div>
            <div class="col-sm-8"><input type="date" name="return_date" id="return_date"></div>
            </div>
                   </div>
               <div class="col-sm-4"><button id="ser_date" style="width:50%;">Search</button></div>
           </div><br>
           <center>  <div id="date_data" class="container"></div><br>
               <div class="row"><button id="c_report">Customized Report</button></div>
           </center><br>
             </div>
        </div>
            <script>
                $(document).ready(function()
                { var adm_no,reg_date,exp_date,grp,class_id,mem_code,access_no,type_id,title_id;
                  $("#mem_code").keypress(function(event)
                  {
                       access_no=$("#access_no").val();
                       if(access_no!='')
                       {
                      if(event.which===13)
                      {
                           mem_code=$("#mem_code").val();
                          
                         
                          $.get("lib_issue",{mem_code:mem_code,access_no:access_no},function(data,status)
                          {
                              
                              $("#show1").html($(data).filter("#info1").html());
                              $("#show2").html($(data).filter("#info2").html());
                               $("#show3").html($(data).filter("#info3").html());
                              
                              $("#issue_btn").show();
                              $("#reset").show();
                             
                             
                          });
                      }
                  }
                 }); 
                 $("#access_no").keypress(function(event)
                 {
                    
                   //  alert(mem_code);
                 //    if(mem_code!=='')
                     {
                       if(event.which===13)
                       {
                          
                           access_no=$("#access_no").val();
                            mem_code=$("#mem_code").val();
                            $.get("lib_issue",{mem_code:mem_code,access_no:access_no},function(data,status)
                          {
                              $("#show2").show();
                              $("#show1").html($(data).filter("#info1").html());
                              $("#show2").html($(data).filter("#info2").html());
                               $("#show3").html($(data).filter("#info3").html());
                              
                            
                             
                          });
                       }
                     }
//                     else
//                     {
//                         alert("please fill");
//                     }
                     
                 });
                 $("#issue_btn").click(function()
                 {
                      $(".cb:checked").each(function()
                {
                     access_no=$(this).parent().parent().children("td:nth-child(2)").text();
                     type_id=$("#type_id").val();
                     title_id=$("#title_id").val();
                       adm_no=$("#adm_no").html();
                               grp=$("#grp").html();
                               if(isNaN(grp))
                               grp="no";
                               class_id=$("#class_id").val();
                               if(isNaN(class_id))
                               class_id="no";
                               reg_date=$("#reg_date").html();
                               exp_date=$("#exp_date").html();
                               var date = new Date();
                               var month = ((date.getMonth().length+1) === 1)? (date.getMonth()+1) : '0' + (date.getMonth()+1);
                               var date1 = date.getFullYear() + "-" + month + "-" + date.getDate();
                               var date2=0001-01-01;
                               var flag="i";
                               
                    var value="('"+adm_no+"','"+grp+"','"+class_id+"','"+reg_date+"','"+exp_date+"','"+access_no+"','"+type_id+"','"+title_id+"','"+date1+"',"+date2+",'i')";  
                   // alert(value);       
                    $.get("lib_issue_add",{flag:flag,reg_date:reg_date,exp_date:exp_date,issue_date:date1,return_date:date2,type_id:type_id,title_id:title_id,grp:grp,class_id:class_id,access_no:access_no,mem_code:mem_code},function(data,status)
                    {
                        
                      $("#issue").html(data);
                      $("#show2").hide();
                       $("#access_no").val('');
                    });
                    
                });
                         $.get("lib_issue",{mem_code:mem_code,access_no:access_no},function(data,status)
                          {
                               $("#show3").html($(data).filter("#info3").html());
                              
                            
                          });
                         
                    
                 });
                 $("#reset").click(function()
                 {
                   location.reload();  
                 });
                 var global="";
                 $("#ser_date").click(function()
                 {
                    var issue_date=$("#issue_date").val();
                    if(issue_date==='')
                    {
                        issue_date="no";
                    }
                    var return_date=$("#return_date").val();
                    if(return_date==='')
                    {
                        return_date="no";
                    }
                   
                    $.get("lib_issue_date",{issue_date:issue_date,return_date:return_date},function(data,status){
                       
                        global=$(data).filter("#show2").html();
                      
                       $("#date_data").html($(data).filter("#show1").html());
                       var a=$(data).filter("#show1").html();
                      
                        if(a==="There is nothing to show")
                        {
                            $("#c_report").hide();
                        }
                        else
                        $("#c_report").show();
                        
                    });
                 });
                 $("#c_report").click(function()
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
   
</html>
<% }
}
    %>