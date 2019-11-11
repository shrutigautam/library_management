
<html>
    <!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<title>Untitled Document</title>

<script>
             var req;
     function special()
     {
      var a=document.FS.enq_id.value;
      if(window.XMLHttpRequest){
      req=new XMLHttpRequest();}
      else{
      req=new ActiveXObject("Microsoft.XMLHTTP");}
      req.open("GET","Admission?na1="+a,true);
      req.send();
      req.onreadystatechange=function(){
      if(req.readyState==4){ 
      var str=req.responseText;
      var res =str.split(",");
      document.getElementById("Name").value=res[0];
      document.getElementById("DOB").value=res[1];
      document.getElementById("Father_Name").value=res[2];
      document.getElementById("Mother_Name").value=res[3];
      document.getElementById("School").value=res[4];
      document.getElementById("Class1").value=res[5];
      document.getElementById("Gender").value=res[6];
      document.getElementById("FOccupation").value=res[7];
      document.getElementById("PIncome").value=res[8];
      document.getElementById("CasteC").value=res[9];
      document.getElementById("Address1").value=res[10];
      document.getElementById("City").value=res[11];
      document.getElementById("Email").value=res[12];
      document.getElementById("Mno").value=res[13];
      
      
     }}}
     
     function special_second()
     {
         
      var b=document.FS.admx_no.value;
      if(window.XMLHttpRequest){
      req=new XMLHttpRequest();}
      else{
      req=new ActiveXObject("Microsoft.XMLHTTP");}
      req.open("GET","AdmissionNoSearch?na2="+b,true);
      req.send();
      req.onreadystatechange=function(){
      if(req.readyState==4){ 
      var str1=req.responseText;
     }
      var res1 =str1.split(",");
      document.getElementById("AaddNo").value=res1[0];
      document.getElementById("Name").value=res1[1];
      document.getElementById("Middle_Name").value=res1[2];
      document.getElementById("Last_Name").value=res1[3];
      document.getElementById("DOB").value=res1[4];
      document.getElementById("Father_Name").value=res1[5];
      document.getElementById("Mother_Name").value=res1[6];
      document.getElementById("Admission_Date").value=res1[7];
      document.getElementById("Admission_Mode").value=res1[8];
      document.getElementById("School").value=res1[9];
      document.getElementById("Class1").value=res1[10];
      document.getElementById("Year").value=res1[11];
      document.getElementById("RNo").value=res1[12];
      document.getElementById("ENo").value=res1[13];
      document.getElementById("Gender").value=res1[14];
      document.getElementById("FOccupation").value=res1[15];
      document.getElementById("PIncome").value=res1[16];
      document.getElementById("IncomeAmt").value=res1[17];
      document.getElementById("Mname").value=res1[18];
      document.getElementById("MOccupation").value=res1[19];
      document.getElementById("CasteC").value=res1[20];
      document.getElementById("ToStudent").value=res1[21];
      document.getElementById("DState").value=res1[22];
      document.getElementById("Nation").value=res1[23];
      document.getElementById("Religion").value=res1[24];
      document.getElementById("BGroup").value=res1[25];
      document.getElementById("PDisability").value=res1[26];
      document.getElementById("Vision").value=res1[27];
      document.getElementById("Hobbies").value=res1[28];
      document.getElementById("Address1").value=res1[29];
      document.getElementById("Address2").value=res1[30];
      document.getElementById("PinCode").value=res1[31];
      document.getElementById("City").value=res1[32];
      document.getElementById("Email").value=res1[33];
      document.getElementById("Mno").value=res1[34];
      document.getElementById("G_name").value=res1[35];
      document.getElementById("G_ocptn").value=res1[36];
      document.getElementById("G_ContactNo").value=res1[37];
      document.getElementById("G_MobileNo").value=res1[38];
      document.getElementById("Relation").value=res1[39];
      document.getElementById("G_email").value=res1[40];
      document.getElementById("P_Address1").value=res1[41];
      document.getElementById("P_Address2").value=res1[42];
      document.getElementById("Pin_Code").value=res1[43];
      document.getElementById("P_City").value=res1[44];
      document.getElementById("Contact_No").value=res1[45];
      document.getElementById("E_person").value=res1[46];
      document.getElementById("E_ContactNo").value=res1[47];
      document.getElementById("E_MobileNo").value=res1[48];
      
      document.getElementById("spec_info").value=res1[49];
      document.getElementById("CLASS2").value=res1[50];
      document.getElementById("SCHOOL2").value=res1[51];
      document.getElementById("BOARD2").value=res1[52];
      document.getElementById("STREAM2").value=res1[53];
      document.getElementById("YEAR2").value=res1[54];
      document.getElementById("PERCENT2").value=res1[55];
      
     
             
      document.getElementById("AdmType").value=res1[56];
      document.getElementById("Concession_Name").value=res1[57];
      document.getElementById("Concession_By").value=res1[58];
      document.getElementById("Remark").value=res1[59];
      document.getElementById("Approved_By").value=res1[60];
      document.getElementById("Approved_Date").value=res1[61];
      if(res1[62]==="Required"){
      document.getElementById("RequiredphotoR").checked=true;
      
      }
      else{
      document.getElementById("SubmittedphotoR").checked=true;
      
      }
      
      if(res1[63]===("Required")){
      document.getElementById("RequiredtcMR").checked=true;
      }
      else{
      document.getElementById("SubmittedtcMR").checked=true;
      }
      if(res1[64]===("Required")){
      document.getElementById("RequiredMarkSR").checked=true;
      }
      else
      {
      document.getElementById("SubmittedMarkSR").checked=true;
      }
        if(res1[65]===("Required")){
      document.getElementById("RequiredbirthCR").checked=true;
      }
      else{
      document.getElementById("SubmittedbirthCR").checked=true;
      }
      if(res1[66]===("Required")){
      document.getElementById("RequiredcharacterCR").checked=true;
      }
      else{
      document.getElementById("SubmittedcharacterCR").checked=true;
      }
      if(res1[67]===("Required")){
      document.getElementById("RequiredcasteCR").checked=true;
      }
      else
      {
      document.getElementById("SubmittedcasteCR").checked=true;
      }
      if(res1[68]===("Required"))
      {
      document.getElementById("RequireddomicileCR").checked=true;
      }
      else
      {
      document.getElementById("SubmitteddomicileCR").checked=true;
      } 
         
      document.getElementById("Psel").value=res1[69];
      document.getElementById("Tsel").value=res1[70];
      document.getElementById("Msel").value=res1[71];
      document.getElementById("Bsel").value=res1[72];
      document.getElementById("Csel").value=res1[73];
      document.getElementById("Ctsel").value=res1[74];
      document.getElementById("Dsel").value=res1[75];
      document.getElementById("photoF").value=res1[76];
      document.getElementById("MigrationF").value=res1[77];
      document.getElementById("MarkF").value=res1[78];
      document.getElementById("birthF").value=res1[79];
      document.getElementById("charF").value=res1[80];
      document.getElementById("casteF").value=res1[81];
      document.getElementById("domicileF").value=res1[82];
      
        }}
    
</script>


<style type="text/css">
<!--
#mainContent {
	padding: 0 20px; 
	background: #FFFFFF;
}
#footer { 
	padding: 0 10px; 
	background:#000066;
	width:100%;
} 
#footer p {
	margin: 0; 
	padding: 10px 0;
}
#personal_info{
    display:block;
}
#contact_detail{
    display: none;
}
#Education_detail{
    display: none;
}
#Document_check_list{
    display: none;
}
#Welfare{
    display: none;
}
#li1{
    background: red;
}
#li2{
    background:  #990000;
}
#li3{
    background:  #990000;
}
#li4{
    background:  #990000;
}
#li5{
    background:  #990000;
}

</style>
<script language="JavaScript">
    function fun1() {
        document.getElementById('personal_info').style.display = "block";
        document.getElementById('contact_detail').style.display = "none";
        document.getElementById('Education_detail').style.display = "none";
        document.getElementById('Document_check_list').style.display = "none";
        document.getElementById('Welfare').style.display = "none";
         document.getElementById('li1').style.background = "#000066";
         document.getElementById('li2').style.background = "#990000";
         document.getElementById('li3').style.background = "#990000";
         document.getElementById('li4').style.background = "#990000";
         document.getElementById('li5').style.background = "#990000";
        } 
    function fun2() {
        document.getElementById('personal_info').style.display = "none";
        document.getElementById('contact_detail').style.display = "block";
        document.getElementById('Education_detail').style.display = "none";
        document.getElementById('Document_check_list').style.display = "none";
        document.getElementById('Welfare').style.display = "none";
         document.getElementById('li2').style.background = "#000066";
         document.getElementById('li1').style.background = "#990000";
         document.getElementById('li3').style.background = "#990000";
         document.getElementById('li4').style.background = "#990000";
         document.getElementById('li5').style.background = "#990000";
        } 
    function fun3() {
        document.getElementById('personal_info').style.display = "none";
        document.getElementById('contact_detail').style.display = "none";
        document.getElementById('Education_detail').style.display = "block";
        document.getElementById('Document_check_list').style.display = "none";
        document.getElementById('Welfare').style.display = "none";
        document.getElementById('li3').style.background = "#000066";
        document.getElementById('li2').style.background = "#990000";
         document.getElementById('li1').style.background = "#990000";
         document.getElementById('li4').style.background = "#990000";
         document.getElementById('li5').style.background = "#990000";
        } 
    function fun4() {
        document.getElementById('personal_info').style.display = "none";
        document.getElementById('contact_detail').style.display = "none";
        document.getElementById('Education_detail').style.display = "none";
        document.getElementById('Document_check_list').style.display = "block";
        document.getElementById('Welfare').style.display = "none";
        document.getElementById('li4').style.background = "#000066";
        document.getElementById('li2').style.background = "#990000";
         document.getElementById('li3').style.background = "#990000";
         document.getElementById('li1').style.background = "#990000";
         document.getElementById('li5').style.background = "#990000";
        } 
    function fun5() {
        document.getElementById('personal_info').style.display = "none";
        document.getElementById('contact_detail').style.display = "none";
        document.getElementById('Education_detail').style.display = "none";
        document.getElementById('Document_check_list').style.display = "none";
        document.getElementById('Welfare').style.display = "block";
        document.getElementById('li5').style.background = "#000066";
        document.getElementById('li2').style.background = "#990000";
         document.getElementById('li3').style.background = "#990000";
         document.getElementById('li4').style.background = "#990000";
         document.getElementById('li1').style.background = "#990000";
        } 
</script>
<link href="ddd.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {
	font-size: 16px;
	font-weight: bold;
}
.style3 {font-size: 18px; font-weight: bold; }
-->
</style>
</head>

    <body>
       
    <div style="margin: 0px;">
        <div style="border: outset black; width: 100%; background-color: #990000; margin: 0px; border-radius: 8px;">
            <ul style="display: inline">
                <li style="border: 1px dotted white; border-radius: 8px; display: inline-block; list-style: none; color: #ffffff; margin: 5px 0px; padding: 2px 10px; cursor: pointer;">
                    Admission</li>
                <li style="border: 1px dotted white; border-radius: 8px; display: inline-block; list-style: none;  color: #ffffff; margin: 5px 15px; padding: 2px 10px; cursor: pointer;">
                    Student MIS</li>
                <li style="border: 1px dotted white; border-radius: 8px; display: inline-block; list-style: none; color: #ffffff; margin: 5px 0px; padding: 2px 10px; cursor: pointer;">
                    Security</li>
            </ul>
        </div>
        <div style="width: 100%; border: outset black; margin-top: 2px; border-radius: 8px;">
            <form name="FS">
           
                <div style="background-color: #000066; color: #ffffff; height: 20px; padding-left: 20px; padding-top: 5px; padding-bottom: 10px;">
                Admission Detail
                 <label style="margin-left:50px " >Enquiry No:</label>
                <input type="text" name="enq_id" size="30" placeholder="Enquiry No" pattern="[0-9]+" title="enter numbers only" id="t1" style="margin-bottom: 2% ; border-radius: 4px;" required/>
                <input type="button"  value="submit" onclick="special()"></input>
           
                <label style="margin-left:50px " >Admission No:</label>
                <input type="text" name="admx_no" size="30" placeholder="Admission No" pattern="[0-9]+" title="enter numbers only" id="admx_no" style="margin-bottom: 2% ; border-radius: 4px;"/>
                <input type="button"  value="submit" onclick="special_second()"></input>
                </form>
                
            </div>
                           

           <form action="Admissionf" name="first_form_Adm" method="get">
                <div style="float: left;font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
                
              <!--  <input type="submit" name="Print" id="submit" value="Print" style=" border-radius:4px; margin-left:100px" /> -->
                <input type="reset" name="New" id="submit" value="New" style=" border-radius:4px"/>
                <input type="submit" name="Submit" id="submit"  style=" border-radius:4px" />
                
                <span>Message:${message}</span>
                <table cellpadding="10px;" border="0" style="height: 310px;">
                    <tr>
                        <th align="left">Admission No:</th>
                        <td><input name="Admission_No" id="AaddNo" size="30" maxlength="30" type="text" placeholder="Admission No" style="border-radius:4px;" pattern="[0-9]+" title="enter numbers only"/></td>
                                
                    </tr>
                    <tr>
                        <th align="left">Student Name:</th>
                        <td><input name="Name" id="Name" size="30" maxlength="25" type="text" placeholder="Student Name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></td>
                    </tr>
                    <tr>
                        <th align="left">Middle Name:</th>
                        <td><input type="text" name="Middle_Name" id="Middle_Name" size="30" maxlength="15" placeholder="middle name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></td>
                    </tr>
                    <tr>
                        <th align="left">Last Name:</th>
                        <td><input type="text" name="Last_Name" id="Last_Name" size="30" maxlength="10" placeholder="Last name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></td>
                    </tr>
                    <tr>
                        <th align="left">DOB:</th>
                        <td><input type="date" name="DOB" id="DOB" size="30" placeholder="Date Of Birth" style="border-radius:4px;" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" title="enter date" required /></td>
                    </tr>
                    <tr>
                        <th align="left">Father Name:</th>
                        <td><input type="text" value="Mr." readonly style="width: 20px;"  style="border-radius:4px;"/>
                            <input name="Father_Name" id="Father_Name" size="26" maxlength="25" type="text" placeholder="Father name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></td>
                    </tr>
                 </table>
            </div>
               
            <div style="float: left; margin-left: 5%; font-family: Arial, Helvetica, sans-serif; font-size: 12px; color:  #990000;">
                <table cellpadding="10px" border="0" style="height: 310px;">
                    <tr>
                        <th align="left">Mother Name:</th>
                        <td><input type="text" name="Mother_Name" id="Mother_Name" size="30" maxlength="20" placeholder="mother name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></td>
                    </tr>
                    <tr>
                        <th align="left">Admission Date:</th>
                        <td><input name="Admission_Date" id="Admission_Date" type="date" size="30" placeholder="Admission Date" style="border-radius:4px;" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" title="enter date" required/></td>
                    </tr>
                    <tr>
                        <th align="left">Admission Mode:</th>
                        <td><select name="Admission_Mode" id="Admission_Mode" placeholder="Admission Mode" style="border-radius:4px;">
                            <option>Online</option>
                            <option>Offline</option>
                            </select>
                        </td>
                    </tr>
                     <tr>
                        <th align="left">Class:</th>
                        <td><select name="Class1" id="Class1"  style="border-radius:4px;">
                            <option>nursery</option>
                            <option>L.K.G</option>
                            <option>U.K.G</option>
                            <option>First</option>
                            <option>Second</option>
                            <option>Third</option>
                            <option>Fourth</option>
                            <option>Fifth</option>
                            <option>Sixth</option>
                            <option>Seventh</option>
                            <option>Eighth</option>
                            <option>Ninth</option>
                            <option>High School</option>
                            <option>Eleventh</option>
                            <option>Intermediate</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th align="left">School:</th>
                        <td><input name="School" id="School" size="30" maxlength="50" type="text" placeholder="School name" style="border-radius:4px;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"/></td>
                    </tr>
                   
                    <tr>
                        <th align="left">Year:</th>
                        <td><select name="Year" id="Year"  style="border-radius:4px;">
                            <option>2015</option>
                            <option>2016</option>
                            
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
                </form>
            <div style=" margin-left: 66%; border: 2px #666666 dotted; height: 310px;">
               <div style="margin-top:5px; margin-left: 10px">
                <form enctype="multipart/form-data" name="form_photo" id="form_photo" method="post" action="UploadPhoto" target="target_upload">   
                <input type="file" name="photo" id="photo"></input>
                <input type="submit" value="upload_photo" name="upload_photo" id="upload_photo"></input>
               <br>
                 
                   
                   <img src="/SchoolM/DisplayPhoto" id="photoIMG" height="40" width="40" style="margin-left:260px"></img>
                </form>  
                   <span>Message:${message2}</span>
               </div>
                <div style="margin-top:30px; margin-left: 10px">
                <form enctype="multipart/form-data" name="form_thumb" id="form_thumb" method="post" action="UploadThumb" target="target_upload">  
                <input type="file" name="thumb" id="thumb"></input>
                <input type="submit" value="upload_thumb" name="upload_thumb" id="upload_thumb"></input>
                <br>
                <img src="/SchoolM/DisplayThumb" height="40" width="40" style="margin-left:260px"></img>
                </form>
                    <span>Message:${message3}</span>
                </div>
                <div style="margin-top:30px; margin-left: 10px">
                <form enctype="multipart/form-data" name="form_sign" id="form_sign" method="post" action="UploadSign" target="target_upload">      
                 <input type="file" name="sign" id="sign"></input>
                 <input type="submit" value="upload_sign" name="upload_sign" id="upload_sign"></input>
                 <br>
                 <img src="/SchoolM/DisplaySign" height="40" width="40" style="margin-left:260px"></img>
                </form>
                     <span>Message:${message4}</span>
                </div>
                </div>
        </div>
        <div style="background: #990000; width: 100%; border: outset black; margin-top: 2px; border-radius: 8px;">
            <ul style="display: inline;">
                <li  id="li1" style="border: 1px dotted white; border-radius: 8px; color: #FFFFFF; display: inline-block; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun1();">
                    Personal Information</li>
                <li  id="li2" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun2();">
                    Contact Detail</li>
                <li id="li3" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun3();">
                    Education Detail</li>
                <li id="li4" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun4();">
                    Document Check List</li>
                <li id="li5" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun5();">
                    Welfare/Concession</li>
            </ul>
        </div>
    </div>
    <!--  PERSONAL INFORMATION TABLE-->
    <form method="post" action="personal_info_submit">
        <div id="personal_info" style=" border: outset black; margin: 2px; border-radius: 8px;">
        <div style="width: 100%; background-color: #000066; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Personal Information
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" border-radius: 4px; margin-top: 6px; margin-left: 80%; "/>
        
        </div>
        <div style="margin-top: 5px; margin-left: 2%; float: left; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000 ;font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <table cellpadding="10px;" border="0" style="height: 550px;">
                <tr>
                    <th align="left">Roll No:</th>
                    <td><input name="RNo" type="text" id="RNo" size="60" maxlength="30" placeholder="Roll No" style="border-radius:4px;" pattern="[0-9]+" title="enter numbers only"/></td>
                </tr>
                <tr>
                    <th align="left">Enrollment No:</th>
                    <td><input name="ENo" id="ENo" type="text" size="60" maxlength="30" placeholder="Enrollment no" style="border-radius:4px;"pattern="[0-9]+" title="enter numbers only"/></td>
                </tr>
                
                <tr>
                    <th align="left">Gender:</th>
                    <td><select name="Gender" id="Gender" style="border-radius:4px;">
                        <option>Female</option>
                        <option>male</option>
                        <option>Others</option></select>
                    </td>
                </tr>
                <tr>
                    <th align="left">Father Occupation:</th>
                    <td><input name="FOccupation" id="FOccupation" type="text" size="60" maxlength="40" placeholder="Father Occupation" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></td>
                </tr>
                <tr>
                    <th align="left">Parent Income:</th>
                    <td><input type="text" name="PIncome" id="PIncome" size="60" maxlength="40" placeholder="Parent Income" style="border-radius:4px;" pattern="[0-9]+" title="enter numbers only"/></td>
                </tr>
                <tr>
                    <th align="left">Income Amt:</th>
                    <td><input type="text" name="IncomeAmt" id="IncomeAmt"  size="60" maxlength="40" placeholder="Income Ammount" style="border-radius:4px;" pattern="[0-9]+" title="enter numbers only"/></td>
                </tr>
                <tr>
                    <th align="left">Mother Name:</th>
                    <td><input name="Mname" id="Mname" type="text" size="60" maxlength="20" placeholder="Mother name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
                </tr>
                <tr>
                    <th align="left">Mother Occupation:</th>
                    <td><input name="MOccupation" id="MOccupation" type="text" size="60" maxlength="25" placeholder="Mother Occupation" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
                </tr>
                <tr>
                    <th align="left">Caste Category:</th>
                    <td><select name="CasteC" id="CasteC" style="width:200px ;border-radius:4px;">
                        <option>General</option>
                        <option>OBC</option>
                        <option>SC/ST</option></select>
                    </td>
                </tr>
                <tr>
                    <th align="left">Type of Student:</th>
                    <td><select name="ToStudent" id="ToStudent" style="width:200px ;border-radius:4px;">
                        <option>Regular</option></select>
                    </td>
                </tr>
                <tr>
                    <th align="left">Domicile State:</th>
                    <td><select name="DState" id="DState" style="width:200px;border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"></select></td>
                </tr>
            </table>
        </div>
        <div style="margin-top: 5px; margin-bottom: 5px; margin-left: 50%; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <span>Message:${message5}</span>
            <table cellpadding="10px;" border="0" style="height: 550px;">
                
                <tr>
                    <th align="left">Nationality:</th>
                    <td><input name="Nation"  id="Nation" size="60" type="text" maxlength="15" placeholder="Nationality" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" /></td>
                </tr>
                <tr>
                    <th align="left">Religion:</th>
                    <td><select name="Religion" id="Religion" style="width:200px; border-radius:4px" placeholder="Religion" />
                        <option>Hindu</option>
                        <option>Muslim</option>
                        </select></td>
                </tr>
               
                <tr>
                    <th align="left">Blood Group:</th>
                    <td><select name="BGroup" id= "BGroup" style="width:200px; border-radius:4px;" placeholder="Blood Group" />
                        <option>B+</option>
                        <option>B-</option>
                        </select></td>
                </tr>
                
                <tr>
                    <th align="left">Physical Disability:</th>
                    <td><input name="PDisability" id="PDisability" type="text" size="60" placeholder="Physical Disability" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
                </tr>
                <tr>
                    <th align="left">Vision</th>
                    <td><select name="Vision" id="Vision" style="width:200px ; border-radius:4px;" placeholder="Vision">
                        <option>good</option>
                        <option>bad</option>
                        </select></td>
                </tr>
                <tr>
                    <th align="left">Hobbies:</th>
                    <td><input name="Hobbies" id="Hobbies" type="text" size="60" placeholder="Hobbies" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
                </tr>
               
            </table>
        </div>
    </div>
    </form>
            
            <!------------------------------------------------------ CONTACT DETAILS FORM ----------------------------------------------------------->
    <form id="form2" name="form2" method="post" action="contact_info_submit">
        <div id="contact_detail" style=" border: outset black; margin: 2px; border-radius: 8px;">
        <div style="width: 100%; background-color: #000066; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Contact Detail
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%;  border-radius:4px;"/>
        </div>
            <span>Message:${message6}</span>
        <div style="margin-top: 5px; margin-left: 2%; float: left; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <table cellpadding="10px;" border="0" style="height: 650px;">
                <tr>
                    <th align="left">Student Address:</th>
                </tr>
                <tr>
                    <th align="left">Address1:</th>
                    <td><input name="Address1" id="Address1" type="text" size="60" placeholder="Address First" style="border-radius:4px;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" title="enter valid address"/></td>
                </tr>
                <tr>
                    <th align="left">Address2:</th>
                    <td><input name="Address2" id="Address2" type="text" size="60" placeholder="Address Second" style="border-radius:4px;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" title="enter valid address"/></td>
                </tr>
                <tr>
                    <th align="left">Pin Code:</th>
                    <td><input name="PinCode" id="PinCode" type="text" size="60" placeholder="Pin code" style="border-radius:4px;" pattern="[0-9]+" title="enter valid numbers"/></td>
                </tr>
                <tr>
                    <th align="left">City</th>
                    <td><select name="City" id="City" style="width:200px ;border-radius:4px;">
                        <option>Mathura</option>
                        <option>Gwalior</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th align="left">Email:</th>
                    <td><input name="Email" id="Email" type="text" size="60" placeholder="Email" style="border-radius:4px;" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="enter valid email" /></td>
                </tr>
                <tr>
                    <th align="left">Mob No:</th>
                    <td><input name="Mno" id="Mno" type="text" size="60" placeholder="Mobile Number" style="border-radius:4px;" pattern="^\d{10}$" title="enter valid number" /></td>
                 </tr>
                  <tr>
                    <th align="left">Guardian Detail:</th>
                   </tr>
                   <tr>
                        <th align="left">Name:</th>
                        <td><input name="G_name" id="G_name" type="text" size="60" placeholder=" Guardian Name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
                   </tr>
                   <tr>
                        <th align="left">Occupation:</th>
                        <td><input name="G_ocptn" id="G_ocptn" type="text" size="60" placeholder="Guardian Occupation" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
                   </tr>
                    <tr>
                        <th align="left">Contact No:</th>
                        <td><input name="G_ContactNo" id="G_ContactNo" type="text" size="60" placeholder="Guardian Contact no" style="border-radius:4px;"  pattern="[0-9]+" title="enter valid numbers"/></td>
                    </tr>
                    <tr>
                        <th align="left">Mobile No:</th>
                       <td><input name="G_MobileNo" id="G_MobileNo" type="text" size="60" placeholder="Guardian Mobile no" style="border-radius:4px;" pattern="^\d{10}$" title="enter valid number" /></td>
                    </tr>
                    <tr>
                        <th align="left">Relation:</th>
                        <td><input name="Relation" id="Relation" type="text" size="60" placeholder="Religion" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*"  /></td>
                    </tr>
                    <tr>
                            <th align="left">Email</th>
                            <td><input name="G_email" id="G_email" type="text" size="60" placeholder="Email" style="border-radius:4px;" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="enter valid email"/></td>
                    </tr>
             </table>
        </div>
        <div style="margin-top: 5px; margin-bottom: 5px; margin-left: 50%; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <table cellpadding="10px;" border="0" style="height: 650px;">
                 <tr>
                    <th align="left">Permanent Address:</th>
                </tr>
                <tr>
                    <th align="left">Address1:</th>
                    <td><input name="P_Address1" id="P_Address1" type="text" size="60" placeholder="Address1" style="border-radius:4px;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" title="enter valid address"/></td>
                 </tr>
                    <tr>
                         <th align="left">Address2:</th>
                        <td><input name="P_Address2" id="P_Address2" type="text" size="60" placeholder="Address2" style="border-radius:4px;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" title="enter valid address"/></td>
                       </tr>
                    <tr>
                        <th align="left">Pin Code:</th>
                        <td><input name="Pin_Code" id="Pin_Code" type="text" size="60" placeholder="Pin code" style="border-radius:4px;" pattern="[0-9]+" title="enter valid numbers" /></td>
                    </tr>
                    <tr>
                        <th align="left">City</th>
                        <td><select name="P_City" id="P_City" style="width:200px ; border-radius:4px;">
                        </select>
                        </td>
                    </tr>
    <tr>
    <th align="left">Contact No:</th>
    <td><input name="Contact_No" id="Contact_No" type="text" size="60" placeholder="Contact No" style="border-radius:4px;" pattern="[0-9]+" title="enter valid numbers/></td>
    </tr>
   
   
    <tr>
    <th align="left">Emergency Contact:</th>
    </tr>
    <tr>
    <th align="left">Person:</th>
    <td><input name="E_person" id="E_person" type="text" size="60" placeholder="Person Name" style="border-radius:4px;" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/></td>
    </tr>
    <tr>
    <th align="left">Contact No:</th>
    <td><input name="E_ContactNo" id="E_ContactNo" type="text" size="60" placeholder="Contact no" style="border-radius:4px;" pattern="[0-9]+" title="enter valid numbers/></td>
    </tr>
    <tr>
    <th align="left">Mobile No:</th>
    <td><input name="E_MobileNo" id="E_MobileNo" type="text" size="60" placeholder="Mobile no" style="border-radius:4px;" pattern="^\d{10}$" title="enter valid number"/></td>
    </tr>
    </table>
    </div>
  </div>
   </form>
   <form id="form3" name="form3" method="post" action="Insert_Edu_details">
  <div id="Education_detail" style=" border: outset black; margin: 2px; border-radius: 8px;">
        <div style="width: 100%; background-color: #000066; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Education Detail
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%; border-radius:4px; "/>
        
        </div>
    <div>
        <span>${EDU_DETAILS}</span>
        <br>
    <label> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;Any Specific Information:
    <input name="spec_info" type="text" id="spec_info" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" title="enter valid details" />
    </label>
        <br><br>
                 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <label>Class
        <select name="CLASS2" id="CLASS2"  >
             <option value="-1">Select</option> 
     <%

Statement st1;
String query1 = "select * from class_tab";
st1 = conn.createStatement();
ResultSet rs2 = st1.executeQuery(query1);
while(rs2.next())
{
%>

<option value="<%=rs2.getInt(1)%>" ><%=rs2.getString(2)%></option> 

<%
}


%>
        </select>   
        </label>
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <label>School
        <input type="text" name="SCHOOL2" id="SCHOOL2" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" title="enter valid school name" />
        </label>
                 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <label>Board
        <select name="BOARD2" id="BOARD2"  >
            <option>CBSE</option>
            <option>UP</option>
        </select> 
        </label>
                  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <label>Stream
        <select name="STREAM2" id="STREAM2"  >
         <option value="-1">Select</option> 
     <%

Statement st2;
String query2 = "select * from stream_tab";
st2 = conn.createStatement();
ResultSet rs3 = st2.executeQuery(query2);
while(rs3.next())
{
%>

<option value="<%=rs3.getInt(1)%>" ><%=rs3.getString(2)%></option> 

<%
}


%>
        </select>
            </label>
                   &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <label>Year
        <select name="YEAR2" id="YEAR2" >
            <option></option>
        </select>   
        </label>
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <label>Percentage
        <input type="text" name="PERCENT2" id="PERCENT2" pattern="^\d{10}$" title="enter valid percentage"  />
        </label>
    </div>
    
  </div>
       <div ></div>
  </form>
        
        
      <!--*************************************************************************************************************************************-->
      
      
   <form enctype="multipart/form-data" name="form5" id="form5" method="post" action="upload_docPhoto" target="target_upload">
  <div id="Document_check_list" style=" border: outset black; margin: 2px; border-radius: 8px;">
        <div style="width: 100%; background-color: #000066; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Document Check List
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%;  border-radius:4px; "/>
        </div>
      <div style="width:100%; font-family: Arial, Helvetica, sans-serif;font-size: 12px; background-color: #000066; color:  #990000">
          <table cellpadding="10px" border="1" width="100%">
              <tr>
                  <th align="left"style="background-color: #CCCCCC">Document</th>
                  <th style="background-color: #CCCCCC" colspan="2">Is Required &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Is Submitted</th>
                  
                  <th style="background-color: #CCCCCC">Photo Copy/Original</th>
                  <th style="background-color: #CCCCCC">Upload</th>
                  </tr>
              <tr>
                  <th align="left">Photographs</th>
                  <td><input type="radio" name="ReqSubphotoR" id="RequiredphotoR" value="Required" /></td>
                  <td><input type="radio" name="ReqSubphotoR" id="SubmittedphotoR" value="Submitted"/></td>
                  <td><select id="Psel" name="Psel" style="width:100px ; border-radius:4px;">
                          <option value="-1">Select</option>  <%
Statement st5;
String query5 = "select * from photo_file";
st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
while(rs5.next())
{
%>
<option value="<%=rs5.getInt(1)%>" ><%=rs5.getString(2)%></option> 
<%
}
%></select>
<a href="">Delete File</a></td>
                  <td>
                         <input type="file" name="photoF" id="photoF"/>
                          <span>${message_doc}</span></td>
                  </tr>
              <tr> 
                  <th align="left">TC/Migration</th>
                  <td><input type="radio" id="RequiredtcMR" name="ReqSubtcMR" value="Required"/></td>
                  <td><input type="radio" id="SubmittedtcMR" name="ReqSubtcMR" value="Submitted"/></td>
                  <td><select id="Tsel" name="Tsel" style="width:100px; border-radius:4px;">
                          <option value="-1">Select</option> 
     <%
Statement st6;
String query6 = "select * from photo_file";
st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);
while(rs6.next())
{
%>
<option value="<%=rs6.getInt(1)%>" ><%=rs6.getString(2)%></option> 
<%
}
%>    
                      </select>
                      <a href="">Delete File</a>
                      </td>
                  <td>
                  <input type="file" name="MigrationF" id="MigrationF"/>
                  <span>${message_doc}</span>
                  </td>
                  </tr>
              
              <tr> 
                  <th align="left">Marksheet</th>
                  <td><input type="radio" id="RequiredMarkSR" name="ReqSubMarkSR" value="Required"/></td>
                  <td><input type="radio" id="SubmittedMarkSR" name="ReqSubMarkSR" value="Submitted"/></td>
                  <td><select id="Msel" name="Msel" style="width:100px ; border-radius:4px">
                          <option value="-1">Select</option> 
     <%

Statement st7;
String query7 = "select * from photo_file";
st7 = conn.createStatement();
ResultSet rs7 = st7.executeQuery(query7);
while(rs7.next())
{
%>

<option value="<%=rs7.getInt(1)%>" ><%=rs7.getString(2)%></option> 

<%
}


%>    
                      </select>
                      <a href="">Delete File</a>
                      </td>
                  <td>
                  <input type="file" name="MarkF" id="MarkF"/>
                  <span>${message_doc}</span>
                  </td>
                  </tr>
              <tr> 
                  <th align="left">Birth Certificate</th>
                  <td><input type="radio" id="RequiredbirthCR" name="ReqSubbirthCR" value="Required"/></td>
                  <td><input type="radio" id="SubmittedbirthCR" name="ReqSubbirthCR" value="Submitted"/></td>
                  <td><select id="Bsel" name="Bsel" style="width:100px ; border-radius:4px">
                          <option value="-1">Select</option> 
     <%

Statement st8;
String query8 = "select * from photo_file";
st8 = conn.createStatement();
ResultSet rs8 = st8.executeQuery(query8);
while(rs8.next())
{
%>

<option value="<%=rs8.getInt(1)%>" ><%=rs8.getString(2)%></option> 

<%
}


%>    
                      </select>
                      <a href="">Delete File</a>
                      </td>
                  <td>
                  <input type="file" name="birthF" id="birthF"/>
                  <span>${message_doc}</span>
                  </td>
                  </tr>
              <tr> 
                  <th align="left">Character Certificate</th>
                  <td><input type="radio" id="RequiredcharacterCR" name="ReqSubcharacterCR" value="Required"/></td>
                  <td><input type="radio" id="SubmittedcharacterCR" name="ReqSubcharacterCR" value="Submitted"/></td>
                  <td><select id="Csel" name="Csel" style="width: 100px ; border-radius:4px">
                          <option value="-1">Select</option> 
     <%

Statement st9;
String query9 = "select * from photo_file";
st9 = conn.createStatement();
ResultSet rs9 = st9.executeQuery(query9);
while(rs9.next())
{
%>

<option value="<%=rs9.getInt(1)%>" ><%=rs9.getString(2)%></option> 

<%
}


%>    
                      </select>
                      <a href="">Delete File</a>
                      </td>
                  <td>
                  <input type="file" name="charF" id="charF"/>
                  <span>${message_doc}</span>
                  </td>
                  </tr>
              <tr> 
                  <th align="left">Caste Certificate</th>
                  <td><input id="RequiredcasteCR" type="radio" name="ReqSubcasteCR" value="Required"/></td>
                  <td><input id="SubmittedcasteCR" type="radio" name="ReqSubcasteCR" value="Submitted"/></td>
                  <td><select id="Ctsel" name="Ctsel" style="width:100px ; border-radius:4px">
                          <option value="-1">Select</option> 
     <%

Statement st10;
String query10 = "select * from photo_file";
st10 = conn.createStatement();
ResultSet rs10 = st10.executeQuery(query10);
while(rs10.next())
{
%>

<option value="<%=rs10.getInt(1)%>" ><%=rs10.getString(2)%></option> 

<%
}


%>    
                      </select>
                      <a href="">Delete File</a>
                      </td>
                  <td>
                  <input type="file" name="casteF" id="casteF"/>
                  <span>${message_doc}</span>
                  </td>
                  </tr>
              <tr> 
                  <th align="left">Domicile Certificate</th>
                  <td><input type="radio" name="ReqSubdomicileCR" id="RequireddomicileCR" value="Required"/></td>
                 
                  <td><input type="radio" name="ReqSubdomicileCR" id="SubmitteddomicileCR" value="Submitted"/></td>
                  <td><select id="Dsel" name="Dsel" style="width:100px ; border-radius:4px">
                          <option value="-1">Select</option> 
     <%

Statement st11;
String query11 = "select * from photo_file";
st11 = conn.createStatement();
ResultSet rs11 = st11.executeQuery(query11);
while(rs11.next())
{
%>

<option value="<%=rs11.getInt(1)%>" ><%=rs11.getString(2)%></option> 

<%
}


%>    
                      </select>
                       <a href="">Delete File</a>
                      </td>
                  <td>
                  <input type="file" name="domicileF" id="domicileF"/>
                  <span>${message_doc}</span>
                  </td>
              </tr>
              
              </table>
          </div>
      
  </div>
   </form>
                  
                  
                  
                  
                  
                  
 <!--******************************************************************************************************************************-->                 
                  
  <form id="form4" name="form4" method="post" action="WelfareSubmit">
  <div id="Welfare" style=" border: outset black; margin: 2px; height:360px; border-radius: 8px;">
  <div style="width: 100%; background-color: #0000FF; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">WelFare/Concession
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%; border-radius:4px ;"/>
  </div>
  <div style=" width:100%; ">
               <br/>     
                   
              <font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000;margin-left: 10px">
                <b>  Admission Type</b>
              </font>
                   
                 <select id="AdmType" name="AdmType" style="width:200px; border-radius: 4px;">
                                <option> Select Admission Type</option>
                                <option></option>
                                <option></option>
                                </select>
                   <br/><br/>     
                       
                  <font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px;margin-left: 10px; color:  #990000"> <b> Concession Name</b> </font>
                  <select id="Concession_Name" name="Concession_Name" style="width:200px; border-radius:4px">
                  <option></option>
                  <option></option>
                  <option></option>
                  </select>
                  <br/><br/><br/>
                        
                                
                                <font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px;margin-left: 10px; align:left; color:#990000"> 
                                           <b>Concession By:</b>
                                </font>
                                <input type="text" id="Concession_By" name="Concession_By" size="60" maxlength="25" placeholder="Concession BY" Style=" border-radius:4px"/>
                                <br/><br/><br/>
                                <label><font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px; align:left; color:#990000;margin-left: 10px"> 
                                <b>Remark:</b></font></label>
                                    <textarea name="Remark" id="Remark" cols="2" row="2" style="width:40% ; border-radius:4px" placeholder="REmark"></textarea>
                                <br/><br/><br/>
                              <font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px; align:left; color:#990000;margin-left: 10px"> 
                              <b>Approved By:</b></font>
                              <input type="text" name="Approved_By" id="Approved_By" size="60" placeholder="Approved By" style=" border-radius:4px"/>
                              <br/><br/><br/>
                              <font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px; align:left;margin-left: 10px; color:#990000"> 
                              <b>Approved Date:</b>
                              <input type="text" name="Approved_Date" id="Approved_Date" size="60" placeholder="Approved Date" style=" border-radius:4px;margin-left: 10px"/>
                               
                            
                      </div>
      <span>${messageW}</span>
              </div>
             
   

      </div>
      
  </form>
  <div id="footer">
   </div>
</body>
</html>

