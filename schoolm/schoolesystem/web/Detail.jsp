<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admission Form</title>
<link rel="stylesheet" type="text/css" href="Detail.css"/>
     <script type="text/javascript" src="Detail.js"></script>
     <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
<style type="text/css"/></style>

      <script>
             var req;
     function special()
     {var a=document.FS.t1.value;
      if(window.XMLHttpRequest){
      req=new XMLHttpRequest();}
      else{
      req=new ActiveXObject("Microsoft.XMLHTTP");}
      req.open("GET","retrieve?na1="+a,true);
      req.send();
      req.onreadystatechange=function(){
      if(req.readyState==4){ 
      var str=req.responseText;
      var res =str.split(",");
    //  document.getElementById("AaddNo").value=res[0];
      document.getElementById("SName").value=res[0];
    //  document.getElementById("MName").value=res[2];
      //document.getElementById("LName").value=res[3];
      document.getElementById("DOB").value=res[1];
      document.getElementById("FaName").value=res[2];
      document.getElementById("MotherName").value=res[3];
     // document.getElementById("addDate").value=res[7];
     // document.getElementById("AddMode").value=res[8];
      document.getElementById("School").value=res[4];
      document.getElementById("Class").value=res[5];
      document.getElementById("Gender").value=res[6];
      document.getElementById("FOccupation").value=res[7];
      document.getElementById("PIncome").value=res[8];
      document.getElementById("CasteC").value=res[9];
      document.getElementById("Address1").value=res[10];
      document.getElementById("City").value=res[11];
      document.getElementById("Email").value=res[12];
      document.getElementById("MobN").value=res[13];
      
      
        }}}
</script>    
</head>

<body>
    <%@include file="connect.jsp" %>
    <div style="margin: 0px;">
         <div id="header">
            <div class="logo"><a href="dashboard.html">Dash<span>Board</span></a>
                <ul style="display: inline; margin-left: 20px">
                <li style="border: 1px dotted white; border-radius: 8px; display: inline-block; list-style: none; color: #ffffff; margin: 5px 4px; padding: 2px 10px; cursor: pointer;">
                    Admission</li>
                <li style="border: 1px dotted white; border-radius: 8px; display: inline-block; list-style: none;  color: #ffffff; margin: 5px 15px; padding: 2px 10px; cursor: pointer;">
                    Student MIS</li>
                <li style="border: 1px dotted white; border-radius: 8px; display: inline-block; list-style: none; color: #ffffff; margin: 5px 4px; padding: 2px 10px; cursor: pointer;">
                    Security</li>
                </ul>
            </div>
        </div>
        <div style="width: 100%; border: outset black; margin-top: 2px;">
            <form name="FS">
            <div style="background-color: #666666; color: #ffffff; height: 20px; padding-left: 20px; padding-top: 5px; padding-bottom: 10px;">Admission Detail
            
                
               
                    <label style="margin-left:50px " >Enquiry No:</label>
                <input type="text" name="enNo" size="30" placeholder="Enquiry No" id="t1" style="margin-bottom: 2% ; border-radius: 4px;"/>
                <input type="button"  value="submit" onclick="special()" style="border-radius: 4px;"></input>
           
                <label style="margin-left: 70px">Admission no:</label>
                 <input type="text" name="AdNo" size="30" placeholder="Admission no"></input>
                 <input type="button" value="submit" style="border-radius: 4px;"></input>
                 
                <input type="submit" name="Print" id="submit" value="Print" style=" border-radius:4px; margin-left:100px" />
                <input type="submit" name="New" id="submit" value="New" style=" border-radius:4px"/>
                <input type="submit" name="Submit" id="submit" style=" border-radius:4px" />
            </div>
            </form>

            <div style="float: left;font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
                <table cellpadding="10px;" border="0" style="height: 310px;">
                    <tr>
                        <th align="left">Admission No:</th>
                        <td><input name="AddNo" id="AaddNo" size="30" maxlength="30" type="text" placeholder="Admission No" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Student Name:</th>
                        <td><input name="SName" id="SName" size="30" maxlength="25" type="text" placeholder="Student Name" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Middle Name:</th>
                        <td><input type="text" name="MName" id="MName" size="30" maxlength="15" placeholder="middle name" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Last Name:</th>
                        <td><input type="text" name="LName" id="LName" size="30" maxlength="10" placeholder="Last name" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">DOB:</th>
                        <td><input type="date" name="DOB" id="DOB" size="30" placeholder="Date Of Birth" style="border-radius:4px;" /></td>
                    </tr>
                    <tr>
                        <th align="left">Father Name:</th>
                        <td><input type="text" value="Mr." readonly style="width: 20px;"  style="border-radius:4px;"/>
                            <input name="FaName" id="FaName" size="26" maxlength="25" type="text" placeholder="Father name" style="border-radius:4px;"/></td>
                    </tr>
                 </table>
            </div>
            <div style="float: left; margin-left: 5%; font-family: Arial, Helvetica, sans-serif; font-size: 12px; color:  #990000;">
                <table cellpadding="10px" border="0" style="height: 310px;">
                    <tr>
                        <th align="left">Mother Name:</th>
                        <td><input type="text" name="MotherName" id="MotherName" size="30" maxlength="20" placeholder="mother name" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Admission Date:</th>
                        <td><input name="addDate" id="addDate" type="date" size="30" placeholder="Admission Date" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Admission Mode:</th>
                        <td><select name="AddMode" id="AddMode" placeholder="Admission Mode" style="border-radius:4px;">
                            <option>Online</option>
                            <option>Offline</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th align="left">School:</th>
                        <td><input name="School" id="School" size="30" maxlength="50" type="text" placeholder="School name" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Class:</th>
                        <td><select name="Class" id="Class"  style="border-radius:4px;">
                             <%

Statement st2;
String query2 = "select * from class_tab";
st2 = conn.createStatement();
ResultSet rs3 = st2.executeQuery(query2);
while(rs3.next())
{
%>
<option value="<%=rs3.getString(1)%>" ><%=rs3.getString(2)%></option>
            <%
}
%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th align="left">Year:</th>
                        <td><select name="Year" id="Year"  style="border-radius:4px;">
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div style=" margin-left: 66%; border: 2px #666666 dotted; height: 310px;">
                <p align="center">photo session</p>
            </div>
        </div>
        <div style="background: #990000; width: 100%; border: outset black; margin-top: 2px;">
            <ul style="display: inline;">
                <li  id="li1" style="border: 1px dotted white; border-radius: 8px; color: #FFFFFF; display: inline-block; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun1();">Personal Information</li>
                <li  id="li2" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun2();">Contact Detail</li>
                <li id="li3" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun3();">Education Detail</li>
                <li id="li4" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun4();">Document Check List</li>
                <li id="li5" style="border: 1px dotted white; border-radius: 8px; display: inline-block; color: #FFFFFF; list-style: none; margin: 2px 0px; padding: 5px 10px; cursor: pointer;" onclick="fun5();">Welfare/Concession</li>
            </ul>
        </div>
    </div>
    <form method="post" action="#">
        <div id="personal_info" style=" border: outset black; margin: 2px;">
        <div style="width: 100%; background-color: #666666; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Personal Information
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" border-radius: 4px; margin-top: 6px; margin-left: 80%; "/>
        </div>
        <div style="margin-top: 5px; margin-left: 2%; float: left; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000 ;font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <table cellpadding="10px;" border="0" style="height: 550px;">
                <tr>
                    <th align="left">Roll No:</th>
                    <td><input name="RNo" type="text" id="RNo" size="60" maxlength="30" placeholder="Roll No" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Enrollment No:</th>
                    <td><input name="ENo" id="ENo" type="text" size="60" maxlength="30" placeholder="Enrollment no" style="border-radius:4px;"/></td>
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
                    <td><input name="FOccupation" id="FOccupation" type="text" size="60" maxlength="40" placeholder="Father Occupation" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Parent Income:</th>
                    <td><input type="text" name="PINcome" id="PIncome" size="60" maxlength="40" placeholder="Parent Income" style="border-radius:4px;"/></td>
                </tr>
               
                
                <tr>
                    <th align="left">Mother Occupation:</th>
                    <td><input name="MOccupation" type="text" size="60" maxlength="25" placeholder="Mother Occupation" style="border-radius:4px;"/></td>
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
                    <td><select name="ToStudent" style="width:200px ;border-radius:4px;">
                        <option>Regular</option></select>
                    </td>
                </tr>
                <tr>
                    <th align="left">Domicile State:</th>
                    <td><select name="DState" style="width:200px;border-radius:4px;"></select></td>
                </tr>
            </table>
        </div>
        <div style="margin-top: 5px; margin-bottom: 5px; margin-left: 50%; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <table cellpadding="10px;" border="0" style="height: 550px;">
                <tr>
                    <th align="left">Attach Photo:</th>
                    <td><input type="file" name="photo" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Signature:</th>
                    <td><input type="file" name="sign" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Nationality:</th>
                    <td><input name="nation" size="60" type="text" maxlength="15" placeholder="Nationality" style="border-radius:4px;" /></td>
                </tr>
                <tr>
                    <th align="left">Religion:</th>
                    <td><select name="Religion" style="width:200px; border-radius:4px" placeholder="Religion"/></select></td>
                </tr>
                <tr>
                    <th align="left">Thumb:</th>
                    <td><input type="file" name="thumb" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Blood Group:</th>
                    <td><select name="Bgroup" style="width:200px; border-radius:4px;" placeholder="Blood Group" /></select></td>
                </tr>
               
                <tr>
                    <th align="left">Physical Disability:</th>
                    <td><input name="PDisability" type="text" size="60" placeholder="Physical Disability" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Vision</th>
                    <td><select name="Vision" style="width:200px ; border-radius:4px;" placeholder="Vision"></select></td>
                </tr>
                <tr>
                    <th align="left">Hobbies:</th>
                    <td><input name="Hobbies" type="text" size="60" placeholder="Hobbies" style="border-radius:4px;"/></td>
                </tr>
                
            </table>
        </div>
    </div>
    </form>
    <form id="form2" name="form2" method="post" action="">
        <div id="contact_detail" style=" border: outset black; margin: 2px;">
        <div style="width: 100%; background-color: #666666; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Contact Detail
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%;  border-radius:4px;"/>
        </div>
        <div style="margin-top: 5px; margin-left: 2%; float: left; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
            <table cellpadding="10px;" border="0" style="height: 650px;">
                <tr>
                    <th align="left">Student Address:</th>
                </tr>
                <tr>
                    <th align="left">Address1:</th>
                    <td><input name="Add1" id="Address1" type="text" size="60" placeholder="Address First" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Address2:</th>
                    <td><input name="Add2" type="text" size="60" placeholder="Address Second" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Pin Code:</th>
                    <td><input name="PinCode" type="text" size="60" placeholder="Pin code" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">City</th>
                    <td><select name="City" id="City" style="width:200px ;border-radius:4px;">
                      <%

Statement st1;
String query1 = "select * from city_tab";
st1 = conn.createStatement();
ResultSet rs2 = st1.executeQuery(query1);
while(rs2.next())
{
%>

<option value="<%=rs2.getInt(1)%>" ><%=rs2.getString(2)%></option> 

<%
}


%>
                        </select></td>
                </tr>
                <tr>
                    <th align="left">Email:</th>
                    <td><input name="Email" id="Email" type="text" size="60" placeholder="Email" style="border-radius:4px;"/></td>
                </tr>
                <tr>
                    <th align="left">Mob No:</th>
                    <td><input name="Mno" id="MobN" type="text" size="60" placeholder="Mobile Number" style="border-radius:4px;"/></td>
                 </tr>
                  <tr>
                    <th align="left">Guardian Detail:</th>
                   </tr>
                   <tr>
                        <th align="left">Name:</th>
                        <td><input name="Gname" type="text" size="60" placeholder=" Guardian Name" style="border-radius:4px;"/></td>
                   </tr>
                    <tr>
                        <th align="left">Occupation:</th>
                        <td><input name="Gocc" type="text" size="60" placeholder="Guardian Occupation" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Contact No:</th>
                        <td><input name="ConNo" type="text" size="60" placeholder="Guardian Contact no" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Mobile No:</th>
                       <td><input name="MobgNO" type="text" size="60" placeholder="Guardian Mobile no" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">Relation:</th>
                        <td><input name="Rel" type="text" size="60" placeholder="Religion" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                            <th align="left">Email</th>
                            <td><input name="Gemail" type="text" size="60" placeholder="Email" style="border-radius:4px;"/></td>
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
                    <td><input name="PAdd1" type="text" size="60" placeholder="Address1" style="border-radius:4px;"/></td>
                 </tr>
                    <tr>
                         <th align="left">Address2:</th>
                        <td><input name="pAdd2" type="text" size="60" placeholder="Address2" style="border-radius:4px;"/></td>
                       </tr>
                    <tr>
                        <th align="left">Pin Code:</th>
                        <td><input name="Code" type="text" size="60" placeholder="Pin code" style="border-radius:4px;"/></td>
                    </tr>
                    <tr>
                        <th align="left">City</th>
                        <td><select name="pCity" style="width:200px ; border-radius:4px;">
                        </select>
                        </td>
                    </tr>
    <tr>
    <th align="left">Contact No:</th>
    <td><input name="Cn" type="text" size="60" placeholder="Contact No" style="border-radius:4px;"/></td>
    </tr>
    <tr>
    <th align="left">Email:</th>
    <td><input name="pEmail" type="text" size="60"placeholder="Email" style="border-radius:4px;" /></td>
    </tr>
    <tr>
    <th align="left">Mob No:</th>
    <td><input name="pMno" type="text" size="60" placeholder="Mobile No" style="border-radius:4px;"/></td>
    </tr>
    <tr>
    <th align="left">Emergency Contact:</th>
    </tr>
    <tr>
    <th align="left">Person:</th>
    <td><input name="person" type="text" size="60" placeholder="Person Name" style="border-radius:4px;"/></td>
    </tr>
    <tr>
    <th align="left">Contact No:</th>
    <td><input name="Conmno" type="text" size="60" placeholder="Contact no" style="border-radius:4px;"/></td>
    </tr>
    <tr>
    <th align="left">Mobile No:</th>
    <td><input name="sMno" type="text" size="60" placeholder="Mobile no" style="border-radius:4px;"/></td>
    </tr>
    </table>
    </div>
  </div>
   </form>
   <form id="form3" name="form3" method="post" action="">
  <div id="Education_detail" style=" border: outset black; margin: 2px;">
        <div style="width: 100%; background-color: #666666; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Education Detail
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%; border-radius:4px; "/>
        </div>
    <div>
    <label>Any Specific Information:
    <input name="textfield" type="text" id="textfield" size="214" maxlength="100" />
    </label>
        </div>
    <div style=" font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">Qualification Detail
     <table width="100%" border="0">
      <tr>
          <th width="13%"  align="center" bgcolor="#CCCCCC" scope="row">Sno Class</th>
          <th width="35%" align="center" bgcolor="#CCCCCC" scope="row">School Name</th>
          <th width="22%" align="center" bgcolor="#CCCCCC" scope="row">Stream</th>
          <th width="15%" align="center" bgcolor="#CCCCCC" scope="row">Year</th>
          <th width="15%" align="center" bgcolor="#CCCCCC" scope="row">Age</th>
        </tr>
        <tr>
          <th width="13%" scope="row" align="left">1. Nursery</th>
          <td width="35%">
         <input name="textfield" type="text" id="textfield" size="60" maxlength="50" style="border-radius: 4px;"/>         </td>
          <td width="22%"><input name="textfield2" type="text" id="textfield2" size="37" maxlength="25" style="border-radius: 4px;" />          </td>
          <td width="15%"><input name="textfield31" type="text" id="textfield31" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td width="15%"><input name="textfield32" type="text" id="textfield32" size="25" maxlength="15" style="border-radius: 4px; "/></td>
        </tr>
        <tr>
          <th scope="row" align="left">2. L.K.G</th>
          <td><input name="textfield3" type="text" id="textfield3" size="60" maxlength="50"style="border-radius: 4px;" /></td>
          <td>
            <input name="textfield4" type="text" id="textfield4" size="37" maxlength="25" style="border-radius: 4px;"/>          </td>
          <td><input name="textfield33" type="text" id="textfield33" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield34" type="text" id="textfield34" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row" align="left">3. U.K.G</th>
          <td><input name="textfield5" type="text" id="textfield5" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield6" type="text" id="textfield6" size="37" maxlength="25"style="border-radius: 4px;" /></td>
          <td><input name="textfield35" type="text" id="textfield35" size="25" maxlength="15"style="border-radius: 4px;" /></td>
          <td><input name="textfield36" type="text" id="textfield36" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row" align="left">4. First</th>
          <td><input name="textfield7" type="text" id="textfield7" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield8" type="text" id="textfield8" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield37" type="text" id="textfield37" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield38" type="text" id="textfield38" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row" align="left">5. Second</th>
          <td><input name="textfield9" type="text" id="textfield9" size="60" maxlength="50"style="border-radius: 4px;" /></td>
          <td><input name="textfield10" type="text" id="textfield10" size="37" maxlength="25"style="border-radius: 4px;" /></td>
          <td><input name="textfield39" type="text" id="textfield39" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield40" type="text" id="textfield40" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row" align="left">6. Third</th>
          <td><input name="textfield11" type="text" id="textfield11" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield13" type="text" id="textfield13" size="37" maxlength="25"style="border-radius: 4px;" /></td>
          <td><input name="textfield41" type="text" id="textfield41" size="25" maxlength="15"style="border-radius: 4px;" /></td>
          <td><input name="textfield42" type="text" id="textfield42" size="25" maxlength="15"style="border-radius: 4px;" /></td>
        </tr>
        <tr>
          <th scope="row" align="left">7. Fourth</th>
          <td><input name="textfield12" type="text" id="textfield12" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield14" type="text" id="textfield14" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield43" type="text" id="textfield43" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield44" type="text" id="textfield44" size="25" maxlength="15"style="border-radius: 4px;" /></td>
        </tr>
        <tr>
          <th scope="row" align="left">8. Fifth</th>
          <td><input name="textfield15" type="text" id="textfield15" size="60" maxlength="50"style="border-radius: 4px;" /></td>
          <td><input name="textfield16" type="text" id="textfield16" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield45" type="text" id="textfield45" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield46" type="text" id="textfield46" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row" align="left">9. Sixth</th>
          <td><input name="textfield17" type="text" id="textfield17" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield18" type="text" id="textfield18" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield47" type="text" id="textfield47" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield48" type="text" id="textfield48" size="25" maxlength="15"style="border-radius: 4px;" /></td>
        </tr>
        <tr>
          <th scope="row" align="left">10. Seventh</th>
          <td><input name="textfield19" type="text" id="textfield19" size="60" maxlength="50"style="border-radius: 4px;" /></td>
          <td><input name="textfield20" type="text" id="textfield20" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield49" type="text" id="textfield49" size="25" maxlength="15"style="border-radius: 4px;" /></td>
          <td><input name="textfield50" type="text" id="textfield50" size="25" maxlength="15"style="border-radius: 4px;" /></td>
        </tr>
        <tr>
          <th scope="row" align="left">11. Eighth</th>
          <td><input name="textfield21" type="text" id="textfield21" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield22" type="text" id="textfield22" size="37" maxlength="25"style="border-radius: 4px;" /></td>
          <td><input name="textfield51" type="text" id="textfield51" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield52" type="text" id="textfield52" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row" align="left">12. Ninth</th>
          <td><input name="textfield23" type="text" id="textfield23" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield24" type="text" id="textfield24" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield53" type="text" id="textfield53" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield54" type="text" id="textfield54" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th scope="row"  align="left">13. High School</th>
          <td><input name="textfield25" type="text" id="textfield25" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield26" type="text" id="textfield26" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield55" type="text" id="textfield55" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield56" type="text" id="textfield56" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr><tr>
          <th scope="row" align="left">14. Eleventh</th>
          <td><input name="textfield27" type="text" id="textfield27" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield28" type="text" id="textfield28" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield57" type="text" id="textfield57" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield58" type="text" id="textfield58" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
        <tr>
          <th align="left" scope="row">15. Intermediate</th>
          <td><input name="textfield29" type="text" id="textfield29" size="60" maxlength="50" style="border-radius: 4px;"/></td>
          <td><input name="textfield30" type="text" id="textfield30" size="37" maxlength="25" style="border-radius: 4px;"/></td>
          <td><input name="textfield59" type="text" id="textfield59" size="25" maxlength="15" style="border-radius: 4px;"/></td>
          <td><input name="textfield60" type="text" id="textfield60" size="25" maxlength="15" style="border-radius: 4px;"/></td>
        </tr>
      </table>
    </div>
  </div>
  </form>
   <form id="form5" name="form5" method="post" action="">
  <div id="Document_check_list" style=" border: outset black; margin: 2px; border-radius: 8px;">
        <div style="width: 100%; background-color: #666666; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">Document Check List
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%;  border-radius:4px; "/>
        </div>
      <div style="width:100%; font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
          <table cellpadding="10px" border="1" width="100%">
              <tr>
                  <th align="left"style="background-color: #CCCCCC">Document</th>
                  <th style="background-color: #CCCCCC">Is Required</th>
                  <th style="background-color: #CCCCCC">Is Submitted</th>
                  <th style="background-color: #CCCCCC">Photo Copy/Original</th>
                  <th style="background-color: #CCCCCC">Upload</th>
                  </tr>
              <tr>
                  <th align="left">Photographs</th>
                  <td><input type="radio" name="pho" value=""/></td>
                  <td><input type="radio" name="toh" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px;">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="ppp"/></td>
                  </tr>
              <tr> 
                  <th align="left">Migration</th>
                  <td><input type="radio" name="mi" value=""/></td>
                  <td><input type="radio" name="tgt" value=""/></td>
                  <td><select style="width:100px; border-radius:4px;">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="hh"/></td>
                  </tr>
              <tr> 
                  <th align="left">Marksheet(Intermediate)</th>
                  <td><input type="radio" name="mmar" value=""/></td>
                  <td><input type="radio" name="inrt" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="dest"/></td>
                  </tr>
              <tr> 
                  <th align="left">Marksheet(High School)</th>
                  <td><input type="radio" name="high" value=""/></td>
                  <td><input type="radio" name="sch" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="mtd"/></td>
                  </tr>
              <tr> 
                  <th align="left">Medical Certificate</th>
                  <td><input type="radio" name="med" value=""/></td>
                  <td><input type="radio" name="cer" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="cate"/></td>
                  </tr>
              <tr> 
                  <th align="left">Character Certificate</th>
                  <td><input type="radio" name="char" value=""/></td>
                  <td><input type="radio" name="ter" value=""/></td>
                  <td><select style="width: 100px ; border-radius:4px">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="tifi"/></td>
                  </tr>
              <tr> 
                  <th align="left">Caste Certificate</th>
                  <td><input type="radio" name="caste" value=""/></td>
                  <td><input type="radio" name="mis" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="jojo"/></td>
                  </tr>
              <tr> 
                  <th align="left">Domicile Certificate</th>
                  <td><input type="radio" name="domi" value=""/></td>
                  <td><input type="radio" name="cile" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px">
                          </select>
                       <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="csct"/></td>
                  </tr>
              <tr> 
                  <th align="left"></th>
                  <td><input type="radio" name="mmm" value=""/></td>
                  <td><input type="radio" name="lll" value=""/></td>
                  <td><select style="width:100px ; border-radius:4px">
                          </select>
                      <a href="">Delete File</a>
                      </td>
                  <td><input type="file" name="ooo"/></td>
                  </tr>
              </table>
          </div>
      
  </div>
   </form>
  <form id="form4" name="form4" method="post" action="">
  <div id="Welfare" style=" border: outset black; margin: 2px; height:360px; border-radius: 8px;">
        <div style="width: 100%; background-color: #666666; height: 35px;">
            <div style="float: left; color: #ffffff; padding: 7px 20px;">WelFare/Concession
            </div>
            <input type="submit" name="Submit" id="Submit" value="Submit" style=" margin-top: 6px; margin-left: 80%; border-radius:4px ;"/>
        </div>
          <div style=" width:100%; ">
                <div style="float:left; width:50%">
                         <div style="border: 2px outset black;background-color:  #CCCCCC; height: 35px; color: black; padding: 7px 20px;">Admission Type
                            <select style="width:200px; border-radius: 4px;">
                                <option> Select Admission Type</option>
                                <option></option>
                                <option></option>
                                </select>
                        </div>
                    <div style="border: 2px outset black;">
                    <div style="  background-color:  #CCCCCC; height: 35px; color: black; padding: 7px 20px;">Concession Name
                            <select style="width:200px; border-radius:4px">
                                <option></option>
                                <option></option>
                                <option></option>
                                </select>
                        </div>
                        <div style="font-family: Arial, Helvetica, sans-serif;font-size: 12px; color:  #990000">
                           <table cellpadding="10px" border="0" width="100%">
                             <tr>
                                 <th align="left">Concession By:</th>
                                 <td><input type="text" name="Conse" size="60" maxlength="25" placeholder="Concession BY" Style=" border-radius:4px"/></td>
                                 </tr>
                             <tr>
                                 <th align="left">Remark:</th>
                                 <td><textarea name="Remark" cols="2" row="2" style="width:50% ; border-radius:4px" placeholder="REmark"></textarea></td>
                                 </tr>
                             <tr>
                                 <th align="left">Approved By:</th>
                                 <td><input type="text" name="App" size="60" placeholder="Approved By" style=" border-radius:4px"/></td>
                                 </tr>
                             <tr>
                                 <th align="left">Approved Date:</th>
                                 <td><input type="text" name="date" size="60" placeholder="Approved Date" style=" border-radius:4px"/></td>
                               </tr>
                             </table>
                      </div>
              </div>
                    </div>
           <div style="margin-left:50% ; border: 2px outset black;">
                 <div style="border: 2px outset black; background-color:  #CCCCCC; height: 35px; color: black; padding: 7px 20px;">
                     <input type="radio" name="wetfare"/>Welfare Application
                     </div>
                     <div>
                         <textarea name="application" cols="79" rows="16"></textarea>
                         </div>
              </div>
  </div>
      </div>
  </form>
  <div id="footer">
   </div>
</body>
</html>

