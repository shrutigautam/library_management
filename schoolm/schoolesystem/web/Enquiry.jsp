<%-- 
    Document   : Enquiry
    Created on : Jul 5, 2016, 8:00:18 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <script>
           
         /*  function myFunction()
           {
              
               var enq=document.Enq.enq_id.value;
               var num=/^[0-9]+$/;
               if(!enq.match(num))
                {
                    enq_id_sp.innerHTML="invalid";
                    document.Enq.enq_id.focus();
                    return false;
                }
                else
                {
                    enq_id_sp.innerHTML=" ";
                    return true;
                }
           }
           
           function myFunction2()
           {
               
           var name=document.Enq.Name.value;
           var char=/^[A-Za-z]+$/;
           if(!name.match(char))
                {
                    Name_sp.innerHTML="invalid";
                    document.Enq.Name.focus();
                    return false;
                }
                else
                {
                    Name_sp.innerHTML=" ";
                }
           
           }
           
            function myFunction3()
           {
               var dob=document.Enq.DOB.value;
               var num=/^[0-9]+$/;
               if(!dob.match(num))
                {
                    DOB_sp.innerHTML="enter numbers only";
                    document.Enq.DOB.focus();
                    return false;
                }
                else
                {
                    DOB_sp.innerHTML=" ";
                }
           }
    
            function myFunction4()
           {
               var fname=document.Enq.FName.value;
               var char=/^[A-Za-z]+$/;
               if(!fname.match(char))
                {
                    FName_sp.innerHTML="invalid";
                    document.Enq.FName_id.focus();
                    return false;
                }
                else
                {
                    FName_sp.innerHTML=" ";
                }
           }
           
            function myFunction5()
           {
               var foccupation=document.Enq.FOccupation.value;
               var char=/^[A-Za-z]+$/;
               if(!foccupation.match(char))
                {
                    FOccupation_sp.innerHTML="enter numbers only";
                    document.Enq.FOccupation.focus();
                    return false;
                }
                else
                {
                    FOccupation_sp.innerHTML=" ";
                }
           }
           
            function myFunction6()
           {
               var mname=document.Enq.MName.value;
               var char=/^[A-Za-z]+$/;
               if(! mname.match(char))
                {
                    MName_sp.innerHTML="enter numbers only";
                    document.Enq.MName.focus();
                    return false;
                }
                else
                {
                    MName_sp.innerHTML=" ";
                }
           }
            function myFunction7()
           {
               var address=document.Enq.Address.value;
               var alpha=/^[a-zA-Z\s-,]+$/;
               if(!address.match(alpha))
                {
                    Address_sp.innerHTML="enter proper address";
                    document.Enq.Address.focus();
                    return false;
                }
                else
                {
                    Address_sp.innerHTML=" ";
                }
           }
            function myFunction8()
           {
               var emailid=document.Enq.Email_ID.value;
               var email=/^\w+([\.-]?w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
               if(!emailid.match(email))
                {
                    Email_ID_sp.innerHTML="enter proper email";
                    document.Enq.Email_ID.focus();
                    return false;
                }
                else
                {
                    Email_ID_sp.innerHTML=" ";
                }
           }
            function myFunction9()
           {
               var school=document.Enq.School.value;
                var alpha=/^[a-zA-Z\s-,]+$/;
               if(!enq.match(num))
                {
                    School_sp.innerHTML="invalid";
                    document.Enq.School.focus();
                    return false;
                }
                else
                {
                    School_sp.innerHTML=" ";
                }
           }
            function myFunction10()
           {
               var parents=document.Enq.Parents.value;
                var char=/^[A-Za-z]+$/;
               if(!parents.match(char))
                {
                    Parents_sp.innerHTML="invalid";
                    document.Enq.Parents.focus();
                    return false;
                }
                else
                {
                    Parents_sp.innerHTML=" ";
                }
           }
            function myFunction11()
           {
               var mobileno=document.Enq.Mobile_No.value;
               var num=/^[0-9]+$/;
               if(!mobileno.match(num)||)
                {
                    Mobile_No_sp.innerHTML="invalid";
                    document.Enq.enq_id.focus();
                    return false;
                }
                else
                {
                    Mobile_No_sp.innerHTML=" ";
                }
           }
            function myFunction12()
           {
               var landlineno=document.Enq.Landline_No.value;
               var num=/^[0-9]+$/;
               if(!landlineno.match(num))
                {
                    Landline_No_sp.innerHTML="invalid";
                    document.Enq.Landline_No.focus();
                    return false;
                }
                else
                {
                    Landline_No_sp.innerHTML=" ";
                }
           }
            function myFunction13()
           {
               var alternateno=document.Enq.Alternate_No.value;
               var num=/^[0-9]+$/;
               if(!alternateno.match(num))
                {
                    Alternate_No_sp.innerHTML="invalid";
                    document.Enq.Alternate_No.focus();
                    return false;
                }
                else
                {
                    Alternate_No_sp.innerHTML=" ";
                }
           }
            function myFunction14()
           {
               var familyincome=document.Enq.Family_Income.value;
               var num=/^[0-9]+$/;
               if(!familyincome.match(num))
                {
                    Family_Income_sp.innerHTML="invalid";
                    document.Enq.Family_Income.focus();
                    return false;
                }
                else
                {
                    Family_Income_sp.innerHTML=" ";
                }
           }
            function myFunction15()
           {
               var admissionplace=document.Enq.Admission_Place.value;
                var alpha=/^[a-zA-Z\s-,]+$/;
               if(!admissionplace.match(alpha))
                {
                    Admission_Place_sp.innerHTML="invalid";
                    document.Enq.Admission_Place.focus();
                    return false;
                }
                else
                {
                    Admission_Place_sp.innerHTML=" ";
                }
           }
            function myFunction16()
           {
               var remark=document.Enq.Remark.value;
               var alpha=/^[a-zA-Z\s-,]+$/;
               if(!remark.match(alpha))
                {
                    Remark_sp.innerHTML="invalid";
                    document.Enq.Remark.focus();
                    return false;
                }
                else
                {
                    Remark_sp.innerHTML=" ";
                }
           }  */
        </script>
         <link rel="stylesheet" href="css/menu_nav.css">
    </head>
    <%@include file="connect.jsp" %>
    
    <body>
        
        
      <%-- ------------------------------------------OPEN HEADER-------------------------------------------- --%>
       
        <%@include file="header.jsp"  %>  
        
         <div id="nav">
            <ul id="topnav" class="topnav">
                <li id="nav-btn"><a href="#" onclick="abcd()">&#9776;</a></li>
                <li class="btn-menu" id="1a"><a id="menu-home" href="#">HOME</a></li>
                <li class="btn-menu" id="2a"><a href="#">MASTER</a></li>
                <li class="btn-menu" id="3a"><a href="#">ENQUIRY</a></li>
                <li class="btn-menu" id="4a"><a href="#">ADMISSION</a></li>
                <li class="btn-menu" id="5a"><a href="#">EMPLOYEE</a></li>
                <li class="btn-menu" id="1a"><a href="#">USER</a></li>
                <li class="btn-menu" id="2a"><a href="#">NOTICE</a></li>
                <li class="btn-menu" id="3a"><a href="#">STUDENT DETAIL</a></li>
                <li class="btn-menu" id="4a"><a href="#">ATTENDANCE</a></li>
                <li class="btn-menu" id="5a"><a href="#">EXAMINATION</a></li>
                <li class="btn-menu" id="4a"><a href="#">ID CARD</a></li>
                <li class="btn-menu" id="5a"><a href="#">REPORT</a></li>
                <li><a href="#" class="log">LOGOUT</a></li>
                
            </ul>
        </div>
        <div id="after-click">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">MASTER</a></li>
                <li><a href="#">STUDENT DETAIL</a></li>
                <li><a href="#">ATTENDANCE</a></li>
                <li><a href="#">EXAMINATION</a></li>
            </ul>
        </div>
                        
              <%-- ------------------------------------------CLOSE HEADER-------------------------------------------- --%>
               <%-- ------------------------------------------OPEN FORM-------------------------------------------- --%>
               <form action="Enquiry" method="post" name="Enq">
        <div style="width: 100%; border: outset black; margin-top: 0px; height: 540px">
            <div style="background-color: #666666; color: #ffffff; height: 25px; padding-left: 20px; padding-top: 1px; padding-bottom: 5px;">
                 Enquiry Form
             
                 <input type="submit" name="Submit" id="Submit" value="Submit" onclick="enq_form_valid()" style="border-radius: 4px;margin-left: 1100px;" />
                <input type="reset" name="Refresh" id="Refresh" value="reset" style="border-radius: 4px;"/>
                <input type="submit" name="print" id="print" value="print" style="border-radius: 4px;"/>
            </div>
            <div style="float: left;">
                <table cellspacing="20px;" border="0" style="height:200px">
      <tr>
         <th align="left">Enquiry id</th>
         <td><input type="text" name="enq_id" id="enq_id" size="50" maxlength="25" style="margin-top: 10px;border-radius: 4px;" pattern="[0-9]+" title="enter numbers only" required/><span id="enq_id_sp" style="color:red;"></span></td>
      </tr>
    <tr> <th align="left">Name:</th>
        <td><input name="Name" type="text" id="Name" size="50" maxlength="25"  style="border-radius: 4px" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/><span id="Name_sp" style="color:red;"></span></td>
     </tr>
     <tr>
     <th align="left">DOB:</th>
     <td><input type="date" name="DOB" id="DOB" placeholder="dd/mm/yy" style="border-radius: 4px" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" title="enter date" required/><span id="DOB_sp" style="color:red;"></span></td>
     </tr>
     <tr>
     <th align="left">Father's Name:</th>
     <td><input name="FName" type="text" id="Fathers_Name" size="50" maxlength="30" style="border-radius: 4px" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/><span id="FName_sp" style="color:red;"></span></td>
     </tr>
     <tr>
     <th align="left">Father's Occupation:</th>
     <td><input name="FOccupation" type="text" id="Fathers_Occupation" size="50" maxlength="30" style="border-radius: 4px" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/><span id="FOccupation_sp" style="color:red;"></span></td>
     </tr>
     <tr>
     <th align="left">Mother's Name:</th>
     <td><input name="MName" required type="text" id="Mother_Name" placeholder="Enter Mother's Name" size="50" maxlength="30" style="border-radius: 4px" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only"/><span id="MName_sp" style="color:red;"></span></td>
     </tr>
     <tr>
     <th align="left">Address:</th>
     <td> <textarea name="Address" required cols="39" rows="2" id="Address" placeholder="Enter Address" style="border-radius: 4px; resize: none;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" ></textarea><span id="Address_sp" style="color:red;"></span></td>
     </tr>
     <tr>
     <th align="left">City:</th>
     <td>
     <select name="City" id="City" style="width:200px; border-radius: 4px">
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
     </select>     </td>
     </tr>
    <tr>
          <th align="left">Gender:</th>
          <td>
          <select name="Gender" id="Gender" style="width:200px; border-radius: 4px">
              <option>Male</option>
              <option>Female</option>
            </select>            </td>
            </tr>
            <tr>
            <th align="left">Email ID:</th>
            <td><input name="Email_ID" type="text" required id="Email_ID" placeholder="Enter Email ID" size="50" maxlength="50" style="border-radius: 4px"  /><span id="Email_ID_sp" style="color:red;"></span></td>
			</tr>
             <tr>
            <th align="left">Date:</th>
            <td><input name="date_ID" type="date" required id="date_ID"  size="50" maxlength="50" style="border-radius: 4px"/>
	    </tr>            
           
            </table>
         </div>
      <div id="Div4" style="width:50%; margin-left: 50%; height: 450px;">
      <table cellspacing="20px" height="150px" width="100%">
           <tr>
            <th align="left">Class:</th>
            <td>
            <select name="Class" style="width:200px; border-radius: 4px" >
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
      <tr>
      <th align="left"><span class="style8">School:</span></th>
      <td>
          <input name="School" type="text" placeholder="Enter School Name" size="50" maxlength="50" style="border-radius: 4px"/><span id="School_sp" style="color:red;"></span></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Parents/Guardian:</span></th>
        <td><input name="Parents" type="text" required id="Parents" size="50" maxlength="30" style="border-radius: 4px" pattern="[a-zA-Z][a-zA-Z ]*" /><span id="Parents_sp" style="color:red;"></span></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Mobile No:</span></th>
        <td><input name="Mobile_No" type="text" required id="Mobile No" placeholder="Enter Mobile Number" size="50" maxlength="10" style="border-radius: 4px" required pattern="^\d{10}$" title="enter valid number" /><span id="Mobile_No_sp" style="color:red;"></span></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Landline No:</span></th>
        <td> <input name="Landline_No" type="text" id="Landline No" placeholder="Enter Landline Number" size="50" maxlength="12" style="border-radius: 4px" pattern="^\d{11}$" title="enter valid number" /><span id="Landline_No_sp" style="color:red;"></span></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Alternate No:</span></th>
        <td> <input name="Alternate_No" type="text" id="Alternate No" placeholder="Enter Alternate Number" size="50" maxlength="20" style="border-radius: 4px" pattern="^\d{11}$" title="enter valid numbers" /><span id="Alternate_No_sp" style="color:red;"></span></td>
        </tr>
        <tr>
        <th align="left"><span class="style8">Category:</span></th>
        <td>
          <select name="Category" id="Category" style="width:200px;border-radius: 4px">
            <option value="-1">Select</option>
                <%

Statement st3;
String query3 = "select * from category_tab";
st3 = conn.createStatement();
ResultSet rs4 = st3.executeQuery(query3);
while(rs4.next())
{
%>
            <option value="<%=rs4.getInt(1)%>" ><%=rs4.getString(2)%></option>
             
        <%
}
%>
          </select>          </td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Family Income(PA):</span></th>
          <td><input name="Family_Income" type="text" id="Family_Income" placeholder="Enter Family Income" size="50" maxlength="30" style="border-radius: 4px" pattern="[0-9]+" title="enter valid numbers" /><span id="Family_Income_sp" style="color:red;"></span></td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Admission Mode:</span></th>
          <td>
          <select name="Admission_Mode" id="Admission_Mode" style="width:200px; border-radius: 4px">
            <option>Online</option>
            <option>Offline</option>
          </select>          </td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Admission Place:</span></th>
          <td><input name="Admission_Place" type="text" id="Admission_Place" placeholder="Enter Admission Place" size="50" maxlength="30" style="border-radius: 4px" title="enter valid place"/><span id="Admission_Place_sp" style="color:red;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"></span></td>
          </tr>
          <tr>
          <th align="left"><span class="style8">Remark:</span></th>
          <td><textarea name="Remark" cols="39" rows="2" id="Remark" style="border-radius: 4px;resize: none;" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" ></textarea><span id="Remark_sp" style="color:red;"></span></td>
          </tr>
          
     
                <%-- ------------------------------------------CLOSE FORM-------------------------------------------- --%>
    
     <!------------------------------------------ footer ------------------------------------------->
     
     
    </table>
  
    </div>
    </div>
        </form>
    <!-- end #footer -->
   <div style="width: 100%; border: outset black; margin-top: 1px; height: 25px">
            <div style="background-color: #666666; color: #ffffff; height: 10px; padding-left: 20px; padding-top: 5px; padding-bottom: 10px;">
        </div>
    </div>
</body>


