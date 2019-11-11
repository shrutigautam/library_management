<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>enquiry </title>
        <link href="css/ccc.css" rel="stylesheet" type="text/css" />
	    <style type="text/css">
<!--
.style8 {font-family: "Times New Roman", Times, serif}
-->
        </style>
</head>
<%@include file="connect.jsp" %>
<body class="oneColLiqCtrHdr">	
    
	<div id="container">
  		<div id="header">
    		<!-- end #header -->
        </div>
            <form id="form1" name="form1" action="form1">
  		<div id="mainContent">
                    
    		<div class="Style1" id="Div">Enquiry Form
                <input type="submit" name="Submit" id="Submit" value="Submit" align="left" class="style2" style="margin-left: 900px;"/>
                <input type="submit" name="Refresh" id="Refresh" value="Refresh" align="left" style="margin-left: 20px;"/>
    		</div>
    
    <div class="Style3" id="Div1" style="height: auto;">
    <div id="Div3" style="float:left; width: 50%; height: 450px;" >
      
      <table cellspacing="15px">
      <tr>
     <th align="left"><span class="style8">Name:</span></th>
     <td><input name="Name" type="text" id="Name" size="50" maxlength="25" /></td>
     </tr>
     <tr>
     <th align="left"><span class="style8">DOB:</span></th>
     <td><input type="text" name="DOB" id="DOB" /></td>
     </tr>
     <tr>
     <th align="left"><span class="style8">Father's Name:</span></th>
     <td><input name="Father's Name" type="text" id="Father Name" size="50" maxlength="30" /></td>
     </tr>
     <tr>
     <th align="left"><span class="style8">Father's Occupation</span>:</th>
     <td><input name="Father's Occupation" type="text" id="Father Occupation" size="50" maxlength="30" /></td>
     </tr>
     <tr>
     <th align="left"><span class="style8">Mother's Name:</span></th>
     <td><input name="Mother's Name" type="text" id="Mother's Name" size="50" maxlength="30" /></td>
     </tr>
     <tr>
     <th align="left"><span class="style8">Address:</span></th>
     <td> <textarea name="Address" cols="39" rows="2" id="Address"></textarea></td>
     </tr>
     <tr>
     <th align="left"><span class="style8">City:</span></th>
     <td>
         
         
            
            <select  id="city" name="city" style="width:200px">
<option value="-1">Select</option> 


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

</select>   
         
          </td>
     </tr>
    <tr>
          <th align="left"><span class="style8">Gender</span></th>
          <td>
          <select name="Gender" id="Gender" style="width:200px">
              <option>Male</option>
              <option>Female</option>
            </select>            </td>
            </tr>
            <tr>
            <th align="left"><span class="style8">Email ID:</span></th>
            <td><input name="Email ID" type="text" id="Email ID" size="50" maxlength="50" /></td>
			</tr>
            <tr>
            <th align="left"><span class="style8">Class:</span></th>
            <td>
            <select name="Class" style="width:200px">
                <option value="-1">Select</option>
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
            </table>
            
         </div>
      <div id="Div4" style="width:50%; margin-left: 50%; height: 450px;">
      <form id="form2" name="form2" method="post" action="servlet/">
      <table cellspacing="15px">
      <tr>
      <th align="left"><span class="style8">School:</span></th>
      <td>
          <input name="School" type="text" size="50" maxlength="50" /></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Parents/Guardian:</span></th>
        <td><input name="Parents/Guardian" type="text" id="Parents/Guardian" size="50" maxlength="30" /></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Mobile No:</span></th>
        <td><input name="Mobile No" type="text" id="Mobile No" size="50" maxlength="10" /></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Landline No:</span></th>
        <td> <input name="Landline No" type="text" id="Landline No" size="50" maxlength="12" /></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Alternate No:</span></th>
        <td> <input name="Alternate No" type="text" id="Alternate No" size="50" maxlength="20" /></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Category:</span></th>
        <td>
          <select name="Category" id="Category" style="width:200px">
               <option value="-1">Select</option>
                <%

Statement st3;
String query3 = "select * from caste_tab";
st3 = conn.createStatement();
ResultSet rs4 = st3.executeQuery(query3);
while(rs4.next())
{
%>
            <option value="<%=rs4.getInt(1)%>" ><%=rs4.getString(2)%></option>
             
        <%
}
%>
</select>
        </td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Family Income(PA):</span></th>
          <td><input name="Family Income(PA)" type="text" id="Family Income(PA)" size="50" maxlength="30" /></td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Admission Mode:</span></th>
          <td>
          <select name="Admission Mode" id="Admission Mode" style="width:200px">
            <option>Online</option>
            <option>Offline</option>
          </select>          </td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Admission Place:</span></th>
          <td><input name="Admission Place" type="text" id="Admission Place" size="50" maxlength="30" /></td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Remark:</span></th>
          <td><textarea name="Remark" cols="39" rows="2" id="Remark"></textarea></td>
          </tr>
         </table>
      </form>
      </div>
    </div>
    
    <div class="style4" id="Div2">
     <form id="form3" name="form3" method="post" action="">
      <p>School of Examination</p>
      <table width="100%" border="1">
      <tr>
          <th width="13%"  align="center" bgcolor="#CCCCCC" scope="row"><span class="style8">Sno Class</span></th>
          <th width="35%" align="center" bgcolor="#CCCCCC" scope="row"><span class="style8">School Name</span></th>
          <th width="22%" align="center" bgcolor="#CCCCCC" scope="row"><span class="style8">Stream</span></th>
          <th width="15%" align="center" bgcolor="#CCCCCC" scope="row"><span class="style8">Year</span></th>
          <th width="15%" align="center" bgcolor="#CCCCCC" scope="row"><span class="style8">Age</span></th>
        </tr>
        <tr>
          <th width="13%" scope="row" align="left"><span class="style8">1. Nursery</span></th>
          <td width="35%">
         <input name="textfield" type="text" id="textfield" size="60" maxlength="50" />         </td>
          <td width="22%"><input name="textfield2" type="text" id="textfield2" size="37" maxlength="25" />          </td>
          <td width="15%"><input name="textfield31" type="text" id="textfield31" size="25" maxlength="15" /></td>
          <td width="15%"><input name="textfield32" type="text" id="textfield32" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">2. L.K.G</span></th>
          <td><input name="textfield3" type="text" id="textfield3" size="60" maxlength="50" /></td>
          <td>
            <input name="textfield4" type="text" id="textfield4" size="37" maxlength="25" />          </td>
          <td><input name="textfield33" type="text" id="textfield33" size="25" maxlength="15" /></td>
          <td><input name="textfield34" type="text" id="textfield34" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">3. U.K.G</span></th>
          <td><input name="textfield5" type="text" id="textfield5" size="60" maxlength="50" /></td>
          <td><input name="textfield6" type="text" id="textfield6" size="37" maxlength="25" /></td>
          <td><input name="textfield35" type="text" id="textfield35" size="25" maxlength="15" /></td>
          <td><input name="textfield36" type="text" id="textfield36" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">4. First</span></th>
          <td><input name="textfield7" type="text" id="textfield7" size="60" maxlength="50" /></td>
          <td><input name="textfield8" type="text" id="textfield8" size="37" maxlength="25" /></td>
          <td><input name="textfield37" type="text" id="textfield37" size="25" maxlength="15" /></td>
          <td><input name="textfield38" type="text" id="textfield38" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">5. Second</span></th>
          <td><input name="textfield9" type="text" id="textfield9" size="60" maxlength="50" /></td>
          <td><input name="textfield10" type="text" id="textfield10" size="37" maxlength="25" /></td>
          <td><input name="textfield39" type="text" id="textfield39" size="25" maxlength="15" /></td>
          <td><input name="textfield40" type="text" id="textfield40" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">6. Third</span></th>
          <td><input name="textfield11" type="text" id="textfield11" size="60" maxlength="50" /></td>
          <td><input name="textfield13" type="text" id="textfield13" size="37" maxlength="25" /></td>
          <td><input name="textfield41" type="text" id="textfield41" size="25" maxlength="15" /></td>
          <td><input name="textfield42" type="text" id="textfield42" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">7. Fourth</span></th>
          <td><input name="textfield12" type="text" id="textfield12" size="60" maxlength="50" /></td>
          <td><input name="textfield14" type="text" id="textfield14" size="37" maxlength="25" /></td>
          <td><input name="textfield43" type="text" id="textfield43" size="25" maxlength="15" /></td>
          <td><input name="textfield44" type="text" id="textfield44" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">8. Fifth</span></th>
          <td><input name="textfield15" type="text" id="textfield15" size="60" maxlength="50" /></td>
          <td><input name="textfield16" type="text" id="textfield16" size="37" maxlength="25" /></td>
          <td><input name="textfield45" type="text" id="textfield45" size="25" maxlength="15" /></td>
          <td><input name="textfield46" type="text" id="textfield46" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">9. Sixth</span></th>
          <td><input name="textfield17" type="text" id="textfield17" size="60" maxlength="50" /></td>
          <td><input name="textfield18" type="text" id="textfield18" size="37" maxlength="25" /></td>
          <td><input name="textfield47" type="text" id="textfield47" size="25" maxlength="15" /></td>
          <td><input name="textfield48" type="text" id="textfield48" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">10. Seventh</span></th>
          <td><input name="textfield19" type="text" id="textfield19" size="60" maxlength="50" /></td>
          <td><input name="textfield20" type="text" id="textfield20" size="37" maxlength="25" /></td>
          <td><input name="textfield49" type="text" id="textfield49" size="25" maxlength="15" /></td>
          <td><input name="textfield50" type="text" id="textfield50" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">11. Eighth</span></th>
          <td><input name="textfield21" type="text" id="textfield21" size="60" maxlength="50" /></td>
          <td><input name="textfield22" type="text" id="textfield22" size="37" maxlength="25" /></td>
          <td><input name="textfield51" type="text" id="textfield51" size="25" maxlength="15" /></td>
          <td><input name="textfield52" type="text" id="textfield52" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row" align="left"><span class="style8">12. Ninth</span></th>
          <td><input name="textfield23" type="text" id="textfield23" size="60" maxlength="50" /></td>
          <td><input name="textfield24" type="text" id="textfield24" size="37" maxlength="25" /></td>
          <td><input name="textfield53" type="text" id="textfield53" size="25" maxlength="15" /></td>
          <td><input name="textfield54" type="text" id="textfield54" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th scope="row"  align="left"><span class="style8">13. High School</span></th>
          <td><input name="textfield25" type="text" id="textfield25" size="60" maxlength="50" /></td>
          <td><input name="textfield26" type="text" id="textfield26" size="37" maxlength="25" /></td>
          <td><input name="textfield55" type="text" id="textfield55" size="25" maxlength="15" /></td>
          <td><input name="textfield56" type="text" id="textfield56" size="25" maxlength="15" /></td>
        </tr><tr>
          <th scope="row" align="left"><span class="style8">14. Eleventh</span></th>
          <td><input name="textfield27" type="text" id="textfield27" size="60" maxlength="50" /></td>
          <td><input name="textfield28" type="text" id="textfield28" size="37" maxlength="25" /></td>
          <td><input name="textfield57" type="text" id="textfield57" size="25" maxlength="15" /></td>
          <td><input name="textfield58" type="text" id="textfield58" size="25" maxlength="15" /></td>
        </tr>
        <tr>
          <th align="left" class="style8" scope="row">15. Intermediate</th>
          <td><input name="textfield29" type="text" id="textfield29" size="60" maxlength="50" /></td>
          <td><input name="textfield30" type="text" id="textfield30" size="37" maxlength="25" /></td>
          <td><input name="textfield59" type="text" id="textfield59" size="25" maxlength="15" /></td>
          <td><input name="textfield60" type="text" id="textfield60" size="25" maxlength="15" /></td>
        </tr>
      </table>
      </form>
    </div>
    <div class="style5" id="Div5">
      <div class="style11" id="Div11"><strong>Current Call Detail</strong>
        <label style="margin-left:150px">Stage
            <select name="Stage" id="Stage" style="width:170px">
            </select>
          </label>
          <label style="margin-left:150px">Status
          <select name="Status" id="Status" style="width:170px">
          </select>
          </label>
          <input type="submit" name="Submit2" id="Submit2" value="Submit"  style="margin-left:130px" class="style2"/>
      </div>
      <table width=100% border="1">
      <tr>
      <th width="18%" bgcolor="#999999"><span class="style8">Interest level</span></th>
      <th width="34%" bgcolor="#999999"><span class="style8">Call Time & Date</span></th>
      <th width="30%" bgcolor="#999999"><span class="style8">Time and Date for next Call</span></th>
      <th width="18%" bgcolor="#999999"><span class="style8">Follow Up Action</span></th>
      </tr>
      <tr>
      <td>
      <select name="Interest level" id="Interest level" style="width:170px">
      </select>
      </td>
      <td>&nbsp; </td>
      <td>&nbsp;</td>
      <td>
      <select name="Follow Up Action" id="Follow Up Action" style="width:176px">
      </select>
      </td>
      </tr>
      </table>
          <textarea name="textarea" id="textarea" cols="160" rows="5">Comment on this Call!....</textarea>
    </div>
    <div class="style6" id="Div6">
      <div style="float:left; width:50%" id="Div12">
          <label><strong>&nbsp; &nbsp;Send SMS</strong>
          <select name="Send SMS" id="Send SMS" style="width:150px">
            </select>
        </label>
          <input type="submit" name="Submit3" id="Submit3" value="Submit" style="margin-left:150px" class="style2"/>
      </div>
      <div style="width:50%; margin-left:50%" id="Div12">
          <label><strong>&nbsp; &nbsp;Send Email</strong>
          <select name="Send Email" id="Send Email" style="width:160px">
            </select>
        </label>
          <input type="submit" name="Submit4" id="Submit4" value="Submit"  style="margin-left:150px" class="style2"/>
      </div>
    </div>
    <div class="style7" id="Div7">
    <div class="style13" id="Div13">
    <select name="list" id="list" style="width:159px;">
    </select>
    <textarea cols="75" rows="3"  style="margin-left:180px;"></textarea>
        <input type="submit" name="button" id="button" value="Submit"  style="margin-left:135px;" class="style2"/>
      </div>
       <div class"style13" id="Div14">
       <p><span class="style8">Communication History...</span></p>
      </div>
       <p>&nbsp;</p>
       <div id="Div14"><span class="style8">Lead Routing
         </span>
         <input type="submit" name="button2" id="button2" value="Submit" style="margin-left:930px;" class="style2" />
      </div>
         <select name="list2" id="list2" style="width:190px">
         </select>
         <select name="list3" id="list3" style="width:190px">
         </select>
         <select name="list4" id="list4" style="width:190px">
         </select>
         <textarea cols="60" style="margin-left:80px"></textarea>
    </div>
    <p>
      <!-- end #mainContent -->
    </p>
  </div>
  <div id="footer">
    <!-- end #footer -->
  </div>
<!-- end #container --></div>
</body>
</html>
