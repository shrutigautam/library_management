<%-- 
    Document   : UserMgMt
    Created on : Jun 24, 2016, 7:27:14 AM
    Author     : cristina-LP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>usermgmt </title>
        <link rel="stylesheet" type="text/css" href="UserMgMt.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <%--<%@include file="connect_1.jsp" %>--%>
        <%@include file="connect.jsp"%>
        <style>
select,input[type='text'],input[type='password'],input[type='date']
{
padding:3px;
color:maroon;
margin: 3px;
border-radius:4px;
width:70%;
}
th,td{
    padding:10px;
}
.head{
    padding:10px;
    margin-left: 20px;
}
input[type='button']
{
    width:80%;
}

button{
background-color:maroon;
color:white;
padding:5px;
border-radius:4px;
width:50%;
}
.list1{display:none;}
            </style>
        <script>
               function UserFun1(){
               var sel = document.getElementById("fullName");
              
               var length = sel.options.length;
               for (i = 0; i < length; i++) {
               sel.options[i] = null;
               }
                var str1;
                var str2;
                var x=document.getElementById("UType").value;
                var stu="student"; 
                var admin="administrator";
                var staff="employee";
                var n1=x.localeCompare(stu);
                var n2=x.localeCompare(admin);
                var n3=x.localeCompare(staff);
                if(n1==0)
                {
                   
                if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET","UserMgMt?TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                str1=req.responseText;
                var res1 = str1.split(",");
                var sel = document.getElementById('fullName');
                for(var i = 0; i < res1.length/2; i++) {
                var opt = document.createElement('option');
                 opt.innerHTML = res1[i+res1.length/2];
                 opt.value = res1[i];
                 sel.appendChild(opt);
            }
            }} } 
                
                if(n2==0)
                {
                    
               var sel = document.getElementById("fullName");
               var opt = document.createElement('option');
                opt.innerHTML = "Admin1";
                opt.value = "Admin";
                sel.appendChild(opt);
                }
                if(n3==0)
                {
                   
                if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET","UserMgMtEmp?TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                str2=req.responseText;
                
                var res2 = str2.split(",");
                var sel = document.getElementById('fullName');
                
             
                for(var i = 0; i < res2.length/2; i++) {
                var opt = document.createElement('option');
                opt.innerHTML = res2[i+res2.length/2];
                opt.value = res2[i];
                sel.appendChild(opt);
            } 
            }}}    
            }
        
    function ajaxSend(){
    var UType=document.getElementById("UType").value;
    var Uname= document.getElementById("Uname").value;
    var usrcode= document.getElementById("usrcode").value;
    var fullName= document.getElementById("fullName").value;
    var passWord= document.getElementById("passWord").value;
    var Cpass= document.getElementById("Cpass").value;
    var Photo1= document.getElementById("Photo1").value;
    if(document.getElementById("ChangePwd").checked==true)
        var ChangePwd=1;
    else
        var ChangePwd=0;
    if(document.getElementById("Disable1").checked==true)
        var Disable1=1;
    else
        var Disable1=0;
    if(document.getElementById("Admin_rights").checked==true)
        var Admin_rights=1;
    else
        var Admin_rights=0;    
    if(document.getElementById("adm_details").checked==true)
        var adm_details=1;
    else
        var adm_details=0;
    if(document.getElementById("adm_pers_details").checked==true)
        var adm_pers_details=1;
    else
        var adm_pers_details=0;
    if(document.getElementById("adm_cntct_details").checked==true)
        var adm_cntct_details=1;
    else
        var adm_cntct_details=0;
    if(document.getElementById("adm_edu_details").checked==true)
        var adm_edu_details=1;
    else
        var adm_edu_details=0;
   
    if(document.getElementById("adm_chck_list").checked==true)
        var adm_chck_list=1;
    else
        var adm_chck_list=0;
    if(document.getElementById("adm_welf_conc").checked==true)
        var adm_welf_conc=1;
    else
        var adm_welf_conc=0;
    if(document.getElementById("Emp_details").checked==true)
        var Emp_details=1;
    else
        var Emp_details=0;
    if(document.getElementById("Emp_faculty").checked==true)
       var Emp_faculty=1;
    else
        var Emp_faculty=0;
    if(document.getElementById("atndnc_mark").checked==true)
        var atndnc_mark=1;
    else
        var atndnc_mark=0;
    if(document.getElementById("atndnc_view").checked==true)
        var atndnc_view=1;
    else
        var atndnc_view=0;
   
    if(document.getElementById("exam_create").checked==true)
        var exam_create=1;
    else
        var exam_create=0;
    if(document.getElementById("marks_upload").checked==true)
        var marks_upload=1;
    else
        var marks_upload=0;
    if(document.getElementById("exam_view_result").checked==true)
        var exam_view_result=1;
    else
        var exam_view_result=0;
    if(document.getElementById("notice1").checked==true)
        var notice1=1;
    else
        var notice1=0;
    if(document.getElementById("master1").checked==true)
        var master1=1;
    else
        var master1=0;
    if(document.getElementById("rep_generation").checked==true)
        var rep_generation=1;
    else
        var rep_generation=0;
    
    if(document.getElementById("idCard_generation").checked==true)
        var idCard_generation=1;
    else
        var idCard_generation=0;
    
     if(document.getElementById("student_search").checked==true)
        var student_search=1;
    else
        var student_search=0;
    
     if(document.getElementById("Enquiry1").checked==true)
        var Enquiry1=1;
    else
        var Enquiry1=0;
    if(document.getElementById("lib_mst").checked==true)
        var lib_mst=1;
    else
        var lib_mst=0;
    if(document.getElementById("lib_reg").checked==true)
        var lib_reg=1;
    else
        var lib_reg=0;
    if(document.getElementById("lib_purchase").checked==true)
        var lib_purchase=1;
    else
        var lib_purchase=0;
    if(document.getElementById("lib_accession").checked==true)
        var lib_accession=1;
    else
        var lib_accession=0;
    if(document.getElementById("lib_issue").checked==true)
        var lib_issue=1;
    else
        var lib_issue=0;
    if(document.getElementById("lib_opac").checked==true)
        var lib_opac=1;
    else
        var lib_opac=0;
    var locked=0;
     if(window.XMLHttpRequest)
      {
      req=new XMLHttpRequest();
      }
      else{
      req=new ActiveXObject("Microsoft.XMLHTTP");}
      req.open("GET","USRMgmtInsert?UType="+UType+"&Uname="+Uname+"&usrcode="+usrcode+"&fullName="+fullName+"&passWord="+passWord+"&Cpass="+Cpass+"&Photo1="+Photo1+"&ChangePwd="+ChangePwd+"&Disable1="+Disable1+"&Admin_rights="+Admin_rights+"&adm_details="+adm_details+"&adm_pers_details="+adm_pers_details+"&adm_cntct_details="+adm_cntct_details+"&adm_edu_details="+adm_edu_details+"&adm_chck_list="+adm_chck_list+"&adm_welf_conc="+adm_welf_conc+"&Emp_details="+Emp_details+"&Emp_faculty="+Emp_faculty+"&atndnc_mark="+atndnc_mark+"&atndnc_view="+atndnc_view+"&exam_create="+exam_create+"&marks_upload="+marks_upload+"&exam_view_result="+exam_view_result+"&notice1="+notice1+"&master1="+master1+"&rep_generation="+rep_generation+"&idCard_generation="+idCard_generation+"&student_search="+student_search+"&Enquiry1="+Enquiry1+"&lib_mst="+lib_mst+"&lib_reg="+lib_reg+"&lib_issue="+lib_issue+"&lib_purchase="+lib_purchase+"&lib_accession="+lib_accession+"&lib_opac="+lib_opac+"&locked="+locked  ,true);
      req.send();
      req.onreadystatechange=function(){
      if(req.readyState==4){ 
      var str=req.responseText;
      alert(str);
     location.reload();

}}}


function ajaxEdit(){
    var UType=document.getElementById("UType").value;
    var Uname= document.getElementById("Uname").value;
    var usrcode= document.getElementById("usrcode").value;
    var fullName= document.getElementById("fullName").value;
    var passWord= document.getElementById("passWord").value;
    var Cpass= document.getElementById("Cpass").value;
    var Photo1= document.getElementById("Photo1").value;
    if(document.getElementById("ChangePwd").checked==true)
        var ChangePwd=1;
    else
        var ChangePwd=0;
    if(document.getElementById("Disable1").checked==true)
        var Disable1=1;
    else
        var Disable1=0;
    if(document.getElementById("Admin_rights").checked==true)
        var Admin_rights=1;
    else
        var Admin_rights=0;    
    if(document.getElementById("adm_details").checked==true)
        var adm_details=1;
    else
        var adm_details=0;
    if(document.getElementById("adm_pers_details").checked==true)
        var adm_pers_details=1;
    else
        var adm_pers_details=0;
    if(document.getElementById("adm_cntct_details").checked==true)
        var adm_cntct_details=1;
    else
        var adm_cntct_details=0;
    if(document.getElementById("adm_edu_details").checked==true)
        var adm_edu_details=1;
    else
        var adm_edu_details=0;
   
    if(document.getElementById("adm_chck_list").checked==true)
        var adm_chck_list=1;
    else
        var adm_chck_list=0;
    if(document.getElementById("adm_welf_conc").checked==true)
        var adm_welf_conc=1;
    else
        var adm_welf_conc=0;
    if(document.getElementById("Emp_details").checked==true)
        var Emp_details=1;
    else
        var Emp_details=0;
    if(document.getElementById("Emp_faculty").checked==true)
       var Emp_faculty=1;
    else
        var Emp_faculty=0;
    if(document.getElementById("atndnc_mark").checked==true)
        var atndnc_mark=1;
    else
        var atndnc_mark=0;
    if(document.getElementById("atndnc_view").checked==true)
        var atndnc_view=1;
    else
        var atndnc_view=0;
   
    if(document.getElementById("exam_create").checked==true)
        var exam_create=1;
    else
        var exam_create=0;
    if(document.getElementById("marks_upload").checked==true)
        var marks_upload=1;
    else
        var marks_upload=0;
    if(document.getElementById("exam_view_result").checked==true)
        var exam_view_result=1;
    else
        var exam_view_result=0;
    if(document.getElementById("notice1").checked==true)
        var notice1=1;
    else
        var notice1=0;
    if(document.getElementById("master1").checked==true)
        var master1=1;
    else
        var master1=0;
    
    if(document.getElementById("rep_generation").checked==true)
        var rep_generation=1;
    else
        var rep_generation=0;
    if(document.getElementById("idCard_generation").checked==true)
        var idCard_generation=1;
    else
        var idCard_generation=0;
    
     if(document.getElementById("student_search").checked==true)
        var student_search=1;
    else
        var student_search=0;
    
     if(document.getElementById("Enquiry1").checked==true)
        var Enquiry1=1;
    else
        var Enquiry1=0;
    
    if(document.getElementById("lib_mst").checked==true)
        var lib_mst=1;
    else
        var lib_mst=0;
    if(document.getElementById("lib_reg").checked==true)
        var lib_reg=1;
    else
        var lib_reg=0;
    if(document.getElementById("lib_purchase").checked==true)
        var lib_purchase=1;
    else
        var lib_purchase=0;
    if(document.getElementById("lib_accession").checked==true)
        var lib_accession=1;
    else
        var lib_accession=0;
    if(document.getElementById("lib_issue").checked==true)
        var lib_issue=1;
    else
        var lib_issue=0;
    if(document.getElementById("lib_opac").checked==true)
        var lib_opac=1;
    else
        var lib_opac=0;
    
     if(window.XMLHttpRequest)
      {
      req=new XMLHttpRequest();
      }
      else{
      req=new ActiveXObject("Microsoft.XMLHTTP");}
      req.open("GET","USRMgmtUpdate?UType="+UType+"&Uname="+Uname+"&usrcode="+usrcode+"&fullName="+fullName+"&passWord="+passWord+"&Cpass="+Cpass+"&Photo1="+Photo1+"&ChangePwd="+ChangePwd+"&Disable1="+Disable1+"&Admin_rights="+Admin_rights+"&adm_details="+adm_details+"&adm_pers_details="+adm_pers_details+"&adm_cntct_details="+adm_cntct_details+"&adm_edu_details="+adm_edu_details+"&adm_chck_list="+adm_chck_list+"&adm_welf_conc="+adm_welf_conc+"&Emp_details="+Emp_details+"&Emp_faculty="+Emp_faculty+"&atndnc_mark="+atndnc_mark+"&atndnc_view="+atndnc_view+"&exam_create="+exam_create+"&marks_upload="+marks_upload+"&exam_view_result="+exam_view_result+"&notice1="+notice1+"&master1="+master1+"&rep_generation="+rep_generation+"&idCard_generation="+idCard_generation+"&student_search="+student_search+"&Enquiry1="+Enquiry1+"&lib_mst="+lib_mst+"&lib_reg="+lib_reg+"&lib_issue="+lib_issue+"&lib_purchase="+lib_purchase+"&lib_accession="+lib_accession+"&lib_opac="+lib_opac ,true);
      req.send();
      req.onreadystatechange=function(){
      if(req.readyState==4){ 
      var str=req.responseText;
      alert(str);
     
      location.reload();
      

}}}


function ajaxDelete(){
   
    var Uname= document.getElementById("Uname").value;
    
     if(window.XMLHttpRequest)
      {
      req=new XMLHttpRequest();
      }
      else{
      req=new ActiveXObject("Microsoft.XMLHTTP");}
      req.open("GET","USRMgmtDelete?Uname="+Uname,true);
      req.send();
      req.onreadystatechange=function(){
      if(req.readyState==4){ 
      var str=req.responseText;
      alert(str);
     location.reload();

}}}

$(document).ready(function(){
    $(".ulist").click(function(){
        mm=$(".list").css("display");
        if(mm=="none")
        {
            $(".list").css({"display":"block"})
        }
        else{
            $(".list").css({"display":"none"})
        }

    });
});

$(document).ready(function(){
    $(".ulist2").click(function(){
        gg=$(".list2").css("display");
        if(gg=="none")
        {
            $(".list2").css({"display":"block"})
        }
        else{
            $(".list2").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist3").click(function(){
        kk=$(".list3").css("display");
        if(kk=="none")
        {
            $(".list3").css({"display":"block"})
        }
        else{
            $(".list3").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist4").click(function(){
        ll=$(".list4").css("display");
        if(ll=="none")
        {
            $(".list4").css({"display":"block"})
        }
        else{
            $(".list4").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist5").click(function(){
        hh=$(".list5").css("display");
        if(hh=="none")
        {
            $(".list5").css({"display":"block"})
        }
        else{
            $(".list5").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist1").click(function(){
        ff=$(".list1").css("display");
        if(ff=="none")
        {
            $(".list1").css({"display":"block"})
        }
        else{
            $(".list1").css({"display":"none"})
        }

    });
});
$(document).ready(function()
{
$(".ulist6").click(function(){
    ff=$(".list6").css("display");
    if(gg=="none")
        $(".list6").css({"display":"block"})
    else
        $(".list6").css({"display":"block"})
});
});
$(document).ready(function(){
    $("#imgchange").click(function(){
       imgPath= $("#imgchange").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange1").click(function(){
       imgPath= $("#imgchange1").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange1").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange1").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange2").click(function(){
       imgPath= $("#imgchange2").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange2").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange2").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange3").click(function(){
       imgPath= $("#imgchange3").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange3").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange3").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange4").click(function(){
       imgPath= $("#imgchange4").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange4").attr("src","images/minus.jpg");
       }
       else
       {
          $("#imgchange4").attr("src","images/plus.jpg");  
       }
    });
});
$(document).ready(function(){
    $("#imgchange5").click(function(){
       imgPath= $("#imgchange5").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange5").attr("src","images/minus.jpg");
       }
       else
       {
          $("#imgchange5").attr("src","images/plus.jpg");  
       }
    });
});
$(document).ready(function()
{
  $("#imgchange6").click(function()
  {
      imgPath=$("#imgchange6").attr("src");
      if(imgPath=="images/plus.jpg")
      {
          $("#imgchange6").attr("src","images/minus.jpg");
      }
      else
      {
          $("#imgchange6").attr("src","images/plus.jpg");
      }
  });  
});
 $(function () {
        $("#1").click(function () {
            if ($(this).is(":checked")) {
                $("#2").checked();
            } else {
                $("#2").unchecked();
            }
        });
    });
     function UserFun(){
         var type=document.getElementById("UType").value;
         if(type=="administrator"){
             document.getElementById("Uname");
         }
         else if(type="student"){
             
         }
         else if(type="employee"){
             
         }
     }
            
        </script>
       
        <style type="text/css">
     </style>
     
</head>
   <body>
      <div id="header">
        <div class="headerP">
           <ul style="display: inline">
               <a href="dashboard.jsp"> <li class="admission">Dashboard</li></a>
               
           </ul>
        </div>
      </div><br>
       
<!--      <div id="mainpart">-->
            <div class='row'>
            <div class='col-sm-3'><h3 style='margin-left: 15px;margin-top:5px;'>User Management</h3></div>
             <div class='col-sm-3'>Last Edited:<input type="date" name="LastE" placeholder="Last Edited" /></div>
             <div class='col-sm-2'>Date:<input type="date" name="Date" placeholder="Date" /></div>
             <div class='col-sm-2'>Time:<input type="date" name="Time"  placeholder="Time" /></div>
             </div>
             <hr>
            <div class='row'>
            <div clas="col-sm-6 ">
            <div class="col-sm-1 head"><input type="button" name="button" value="Add" onclick="ajaxSend()" class="btn btn-primary"/></div> 
            <div class="col-sm-1 head"><input type="button" name="button" value="Edit" onclick="ajaxEdit()" class="btn btn-primary"/></div> 
            <div class="col-sm-1 head"><input type="button" name="button" value="Locked" onclick="ajaxDelete()" class="btn btn-primary"/></div> 
            
            <!--<div class="col-sm-1 head"><input type="submit" name="button" value="Close" class="btn btn-primary"/></div>--> 
            </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                <div class="row">
                <div class="col-sm-3 head">User Type:</div>  
                <div class="col-sm-8">
                <select name="UType" id="UType" onchange="UserFun1()">
                <option value="administrator">Administrator</option>
                <option value="student">Student</option>
                <option value="employee">Employee</option>
                </select>
                </div>
                </div>
                <div class="row">
                <div class="col-sm-3 head">Full Name:</div>  
                <div class="col-sm-8">
               <select name="UType" name="fullName" id="fullName"></select>
                </div>
                </div> 
                <div class="row">
                <div class="col-sm-3 head">User Code:</div>  
                <div class="col-sm-8">
                <input type="text" name="usrcode" id="usrcode"   />
                </div>
                </div> 
                <div class="row">
                <div class="col-sm-3 head">User Name:</div>  
                <div class="col-sm-8">
                <input type="text" name="Uname" id="Uname"   />
                </div>
                </div>     
                <div class="row">
                <div class="col-sm-3 head">Password:</div>  
                <div class="col-sm-8">
                <input type="password" name="passWord" id="passWord"  maxlength="25" placeholder="Password" />
                </div>
                </div>
                <div class="row">
                <div class="col-sm-3 head">Confirm Password:</div>  
                <div class="col-sm-8">
                <input type="password" name="Cpass" id="Cpass" maxlength="25" placeholder="Confirm Password"/>
                </div>
                </div>
                <div class="row">
                <div class="col-sm-3 head"> Set Photo Path:</div>  
                <div class="col-sm-8">
                <input type="text" name="Photo1" id="Photo1" placeholder="Set Photo Path"/>
                </div>
                </div>
                <div class="row">
                <div class="col-sm-3 head">User Can Not Change Password:</div>  
                <div class="col-sm-4 head">
                <input type="checkbox" name="ChangePwd" id="ChangePwd"/>
                </div>
                </div> 
                <div class="row">
                <div class="col-sm-3 head">Disabled:</div>  
                <div class="col-sm-4 head">
                <input type="checkbox" name="Disable1" id="Disable1"/>
                </div>
                </div> 
                <div class="row">
                <div class="col-sm-3 head">Administrator Rights:</div>  
                <div class="col-sm-4 head">
                <input type="checkbox" name="Admin_rights" id="Admin_rights"/>
                </div>
                </div> 
                <div class="row" id='show_table' style='margin-left: 20px;height:300px;overflow: auto; width:490px;'>
                </div>    
                <hr>
                </div>
        <div class=" col-sm-6">
         <ul class="tree">
           <li>
               <div>
                   <img src="images/plus.jpg" id="imgchange" class="ulist" width="18px" height="18px"/>
                    <img src="images/dhtmlgoodies_folder.gif"/>
                   <input type="checkbox" name="user" id="1"/>Users right
                   </div>
                       <div class="list" >
                           <ul style="list-style:none" >
                               <li> 
                                   <div >
                                      <img src="images/plus.jpg" id="imgchange1"  class="ulist2" width="18px" height="18px"/>
                    <img src="images/dhtmlgoodies_folder.gif"/>
                                       <input type="checkbox" name="acc" class="2"/>Admission
                                       </div>
                                   <div class="list2">
                                       <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="adm_details" id="adm_details"/>Admission Details
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="adm_pers_details" id="adm_pers_details"/>Personal Information
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="adm_cntct_details" id="adm_cntct_details"/>Contact Details
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="adm_edu_details" id="adm_edu_details"/>Education Details
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="adm_chck_list" id="adm_chck_list"/>Document Check List
                                       </div>
                                   </li>
                                   </ul>
                                         <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="adm_welf_conc" id="adm_welf_conc"/>Welfare/Concession
                                       </div>
                                   </li>
                                   </ul>
                                       </div>
                                   </li>
                                   </ul>
                           <ul style="list-style:none">
                               <li> 
                                   <div >
                                       <img src="images/plus.jpg" id="imgchange2"  class="ulist3" width="18px" height="18px"></img>
                                        <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="" class="2"/>Employee
                                       </div>
                                   <div class="list3">
                                       <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="Emp_details" id="Emp_details"/>Employee Details
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="Emp_faculty" id="Emp_faculty"/>Faculty
                                       </div>
                                   </li>
                                   </ul>
                                       
                                       
                                       
                                       </div>
                                   </li>
                                   </ul>
                           <ul style="list-style:none">
                               <li> 
                                   <div >
                                       <img src="images/plus.jpg" id="imgchange3"  class="ulist4" width="18px" height="18px"></img>
                                        <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="" class="2"/>Attendance
                                       </div>
                                   <div class="list4">
                                       <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="atndnc_mark" id="atndnc_mark"/>Mark Attendance
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="atndnc_view" id="atndnc_view"/>View Attendance
                                       </div>
                                   </li>
                                   </ul>
                                       
                                       
                                      
                                       </div>
                                   </li>
                                   </ul>
                           <ul style="list-style:none" >
                               <li> 
                                   <div >
                                       <img src="images/plus.jpg" id="imgchange4" class="ulist5" width="18px" height="18px"></img>
                                        <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="" class="2"/>Exam
                                       </div>
                                   <div class="list5">
                                       <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="exam_create" id="exam_create"/>Create Exam
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="marks_upload" id="marks_upload"/>Marks Upload
                                       </div>
                                   </li>
                                   </ul>
                                   <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="exam_view_result" id="exam_view_result"/>View Result
                                       </div>
                                   </li>
                                   </ul>
                                
                                   
                                       </div>
                                   </li>
                                   </ul>
                           <ul style="list-style:none" >
                               <li> 
                                   <div >
                                       <img src="images/plus.jpg" id="imgchange5" class="ulist6" width="18px" height="18px"></img>
                                        <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="notice1" id="notice1" class="2"/>Notice
                                       </div>
                                   <div class="list6">
                              
                               
                                    
                                     
                                       </div>
                                   </li>
                                   </ul>
                           <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <img src="images/plus.jpg" id="imgchange" width="18px" height="18px"></img>
                                        <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="master1" id="master1" class="2"/>Master
                                       </div>
                                   </li>
                                   </ul>
                           <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <img src="images/plus.jpg" id="imgchange" width="18px" height="18px"></img>
                                       <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="rep_generation" id="rep_generation" class="2"/>Report Generation
                                       </div>
                                   </li>
                            </ul>
                           
                           <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <img src="images/plus.jpg" id="imgchange" width="18px" height="18px"></img>
                                       <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="idCard_generation" id="idCard_generation" class="2"/>ID card Generation
                                       </div>
                                   </li>
                            </ul>
                             <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <img src="images/plus.jpg" id="imgchange" width="18px" height="18px"></img>
                                       <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="student_search" id="student_search" class="2"/>Search Students
                                       </div>
                                   </li>
                            </ul>
                            <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <img src="images/plus.jpg" id="imgchange" width="18px" height="18px"></img>
                                       <img src="images/dhtmlgoodies_folder.gif"></img>
                                       <input type="checkbox" name="Enquiry1" id="Enquiry1" class="2"/>Enquiry
                                       </div>
                                   </li>
                            </ul>
                           <ul style="list-style:none">
                              <li> 
                                   <div >
                                      <img src="images/plus.jpg" id="imgchange6"  class="ulist1" width="18px" height="18px"/>
                    <img src="images/dhtmlgoodies_folder.gif"/>
                                       <input type="checkbox" name="acc" class="2"/>Library
                                       </div>
                                   <div class="list1">
                                       <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="lib_mst" id="lib_mst"/>Library Masters
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="lib_reg" id="lib_reg"/>Library Registration
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="lib_purchase" id="lib_purchase"/>Library Purchase Register
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="lib_accession" id="lib_accession"/>Library Accession
                                       </div>
                                   </li>
                                   </ul>
                                        <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="lib_issue" id="lib_issue"/>Library Issue/Return
                                       </div>
                                   </li>
                                   </ul>
                                         <ul style="list-style:none">
                               <li> 
                                   <div>
                                       <input type="checkbox" name="lib_opac" id="lib_opac"/>Library OPAC
                                       </div>
                                   </li>
                                   </ul>
                                       </div>
                                   </li>
                            </ul>
                         
                           </div>
               </li>
               </ul>



        </div>
     </div>
       
     <script>
         $(document).ready(function()
         {
             $.get("user",function(data,status)
             {
                  $("#show_table").html($(data).filter("#show_table").html());
             });
            
             var utype;
             $("#UType").change(function()
             {
                 utype=$("#UType").val();
                
                 $.get("user",{utype:utype},function(data,status)
                 {
                     $("#fullName").html($(data).filter("#name").html());
                   
                 });
             });
             $("#fullName").change(function()
             {
                 var fullname1;
                var fullname=$("#fullName").val();
                 fullname=(fullname).split(" ");
                 if(fullname[3]==undefined)
                     fullname1=fullname[0]+fullname[1];
                 else
                 fullname1=fullname[0]+fullname[1]+fullname[2];
                
                $.get("user",{fullname:fullname1,utype:utype},function(data,status)
                {
                  $("#usrcode").val($(data).filter("#code").html());  
                });
             });
         })
     </script>
    </body>
</html>
