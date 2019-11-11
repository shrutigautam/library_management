
<%-- 
    Document   : employee
    Created on : Jul 8, 2016, 12:49:25 PM
    Author     : hp
--%>
  <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
<%@page contentType="text/html" pageEncoding="UTF-8" import="package1.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="stylesheet" href="Bootstrap/bootstrap.css">
        <script src="Bootstrap/jquery.js"></script>
        <script src="Bootstrap/javascript.js"></script>-->
        <link rel="stylesheet" href="css/employee.css">
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <title>JSP Page</title>
        <style>
                fieldset {
    border: 0;
} 
        </style>
       
    </head>
    <body>
        <%@include file="connect.jsp" %>
        
         <script>
            var f;
            var arr=[];
          function toggleVisibility(sub_val)
            {
                if (document.getElementById(sub_val).checked) {
                   arr.push(sub_val);
                   arr.push("<br/>")
                   var str = arr.join(" ");
                  // document.getElementById("sel_subjects").innerHTML=arr.toString();
                  document.getElementById("sel_subjects").innerHTML=str;
                 } 
              else if(document.getElementById(sub_val).checked==false){
                  for(var i=0;i<arr.length;i++)
                  {
                      if(arr[i]==sub_val)
                       f=i;   
                  }
              if(f>-1){
                  arr.splice(f,1);
                  arr.splice(f,1)
              }
                arr.pop("<br/>")
                  var str1 = arr.join(" ");
               // document.getElementById("sel_subjects").innerHTML=arr.toString();
                 document.getElementById("sel_subjects").innerHTML=str1;
                  arr.push("<br/>")
              }   
              
           }
         
        </script>
        <script>
            
             var req;
           function ajax_fun1(){
                var a=document.FS.employee_id_.value;
                var b=arr.toString();
                if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","Specialized_subjects_insert?empl_id="+a+"&sbz_subs="+b,true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str=req.responseText;
                document.getElementById("verification_mssg").innerHTML=str;
                 }}}
                
         </script>
        <div class="">
           
             <%@include file="header.jsp"  %>
            <ul class="tab">
                <li><a href="#" class="tablinks" onclick="openCity(event, 'employee_detail')">EMPLOYEE DETAIL</a></li>
                <li><a href="#" class="tablinks" onclick="openCity(event, 'faculty')">FACULTY</a></li>
            </ul>
        </div>
         <%
           String LS=(String)session.getAttribute("TYPE");
           String UserCode=(String)session.getAttribute("USERCODE");
           String Emp_details=(String)session.getAttribute("Emp_details");
           String Emp_faculty=(String)session.getAttribute("Emp_faculty");
         %>   
        <form action="employee" method="post" style="width:100%" enctype="multipart/form-data">
            <%
           if(Emp_details.equals("0")){
            %>
            <fieldset disabled>
            <%
            }
           else{
            %>
           <fieldset> 
           <%    
           }
           %>
                <div id="employee_detail" class="tabcontent">
                    <div id="personal_info">
                        <h4 class="div_heading">Personal Information</h4>
                        <div id="personal_info_div1">
                            <div id="employee_id">
                                     <%

Statement stId;
int no = 0;
String queryId = "SELECT max(employee_id) FROM employee_tab ";
stId = conn.createStatement();
ResultSet rsId = stId.executeQuery(queryId);
while (rsId.next()) {
 no = rsId.getInt(1) + 1;
  }

%>
                                Employee ID: <input type="text" value="<%=no%>" name="employee_id" pattern="[0-9]+" title="enter numbers only" required/>
                           
                            </div>
                            <div id="name">
                                 Name: <input type="text" name="empl_name" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></input>
                            </div>
                            <div id="fname">
                                Father: <input type="text" name="empl_fname" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></input>
                            </div>
                            <div id="spouse">
                                Spouse: <input type="text" name="empl_spouse" pattern="[a-zA-Z][a-zA-Z ]*" title="enter alphabets only" required/></input>
                            </div>
                            <div id="dob">
                                Date Of Birth: <input type="date" name="empl_dob" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" title="enter date" required/>
                            </div>
                            <div id="category">
                                Category: 
                                <select name="empl_category">
                                    <option value="-1">Select</option>
                                    <%

                                    Statement st;
                                    String query = "select * from category_tab ";
                                    st = conn.createStatement();
                                    ResultSet rs = st.executeQuery(query);
                                    while(rs.next())
                                    {
                                    %>

                                    <option value="<%=rs.getInt(1)%>-<%=rs.getString(2)%>" ><%=rs.getString(2)%></option> 

                                    <%
                                     }

                                    %>
                                </select>
                            </div>
                        </div>

                        <div id="personal_info_div2">
                            <div id="maritial_status">
                                Marital Status: 
                                <select name="empl_mstatus">
                                    <option value="-1">Select</option>
                                    <option value="1">Married</option>
                                    <option value="2">Unmarried</option>
                                </select>
                            </div>
                            <div id="gender">
                                Sex: 
                                <select name="empl_gender">
                                    <option value="-1">Select</option>
                                    <option value="1">Male</option>
                                    <option value="2">Female</option>
                                </select>
                            </div>
                            <div id="email">
                                Email: <input type="text" name="empl_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" >
                            </div>
                            <div id="pan_no">
                                PAN No.: <input type="text" name="empl_pan_no">
                            </div>
                            <div id="phone">
                                Phone: <input type="text" name="empl_phone" required pattern="^\d{11}$" title="enter valid number" />
                            </div>
                            <div id="mobile">
                                Mobile: <input type="text" name="empl_mobile" required pattern="^\d{10}$" title="enter valid number" />
                            </div>
                        </div>

                        <div id="personal_info_div3">
                            <div id="permanent_address">
                                <p id="text_permanent">Permanent Address:</p>
                                <textarea rows="2" cols="35" name="empl_permanent_address"></textarea>
                            </div>
                            <div id="permanent_address_city_state_pin">
                                City/State/Pin:
                                <select class="city_box" id="city_box1" name="empl_p_city">
                                    <option value="-1">Select</option>
                                    <%

Statement st1;
String query1 = "select * from city_tab ";
st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
while(rs1.next())
{
%>

<option value="<%=rs1.getInt(1)%>" ><%=rs1.getString(2)%></option> 

<%
}

%>
                                </select>
                                <select class="state_box" name="empl_p_state">
                                    <option value="-1">Select</option>
                                </select>
                                <input class="pin_box" type="text" name="empl_p_pin" pattern="[0-9]+" >
                            </div>

                            <div id="present_address">
                                <p id="text_present">Present Address:</p>
                                <textarea rows="3" cols="25" name="empl_t_address" pattern="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"></textarea>
                            </div>
                            <div id="check_box">
                                <input id="check_box_btn" type="checkbox" onclick="myf();" name="check_box"> <label>Same as above</label>
                            </div>
                            <div id="present_address_city_state_pin">
                                City/State/Pin:
                                <select class="city_box" id="city_box2" name="empl_t_city">
                                    <option value="-1">Select</option>
                                    <%

Statement st2;
String query2 = "select * from city_tab ";
st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
while(rs2.next())
{
%>

<option value="<%=rs2.getInt(1)%>" ><%=rs2.getString(2)%></option> 

<%
}

%>
                                </select>
                                <select class="state_box" name="empl_t_state">
                                    <option value="-1">Select</option>
                                </select>
                                <input class="pin_box" type="text" name="empl_t_pin" pattern="[0-9]+" title="enter numbers only" required/>
                            </div>
                        </div>

                    </div>
                    <div id="official_info">
                        <h4 class="div_heading">Official Information</h4>
                        <div id="official_info_div1">
                            <div id="department">
                                Department:
                                <select name="empl_dept">
                                    <option value="-1">Select</option>
                                     <%

Statement st3;
String query3 = "select * from department_tab ";
st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
while(rs3.next())
{
%>

<option value="<%=rs3.getInt(1)%>" ><%=rs3.getString(2)%></option> 

<%
}

%>
                                </select>
                            </div>
                            <div id="designation">
                                Designation:
                                <select name="empl_designation">
                                    <option value="-1">Select</option>
                                     <%

Statement st4;
String query4 = "select * from designation_tab ";
st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
while(rs4.next())
{
%>

<option value="<%=rs4.getInt(1)%>" ><%=rs4.getString(2)%></option> 

<%
}

%>
                                </select>
                            </div>
                            <div id="code">
                                Code:
                                <input type="text" name="empl_code">
                            </div>
                             <div id="employee_type">
                                Employee Type:
                                <input type="radio" name="staff_type" value="teaching"> Teaching
                                <input type="radio" name="staff_type" value="non_teaching"> Non-Teaching
                            </div>    
                                
                        </div>
                        <div id="official_info_div2">
                            <div id="joining_date">
                                Joining Date:
                                <input type="date" name="empl_j_date" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" title="enter date" required/>
                            </div>
                            <div id="employee_status">
                                Status:
                                <select name="empl_status">
                                    <option value="-1">Select</option>
                                </select>
                               
                            </div>
                            <div id="employee_type">
                                Employee Type:
                                <input type="radio" name="empl_type" value="salaried"> Salaried
                                <input type="radio" name="empl_type" value="guest"> Guest
                            </div>
                            <div id="salary">
                                Basic Salary:
                                <input type="text" name="empl_b_salary" pattern="[0-9]+" title="enter numbers only" required/>
                            </div>
                        </div>
                        <div id="official_info_div3">
                            <div id="employee_img">
                         <!--        <img src="/schoolesystem/DisplayEmployeeImage" height="40" width="40" style="margin-left:260px"></img>  -->
                            </div>
                            <div>
                                <input id="img_choose" type="file" name="empl_photo" accept=".jpg,.jpeg" >
                             
                            </div>
                        </div>
                    </div>
                    <div id="control">
                        <input id="add_btn" type="submit" value="Add">
                    </div>
                </div>          <!-- employee detail end -->
                  </fieldset>
                </form>
                <div id="faculty" class="tabcontent">
   <form name="FS">
       <%
           if(Emp_faculty.equals("0")){
            %>
            <fieldset disabled>
            <%
            }
           else{
            %>
           <fieldset> 
           <%    
           }
           %>
                    <div id="name">
                                Employee ID: <input type="text" name="employee_id_" id="employee_id_" pattern="[0-9]+" title="enter numbers only" required/>
                     <span id="verification_mssg"></span>       
                     </div>
                    
                    <br>
                    <div id="specialized_sub">
                        <h4 class="div_heading">Specialized Subject</h4>
                        <div id="subject_table">
                            <table>
                            <%

                            Statement st5;
                            String query5 = "select * from subject_tab ";
                            st5 = conn.createStatement();
                            ResultSet rs5 = st5.executeQuery(query5);
                            while(rs5.next())
                           {
                           %>
                           <tr>
 <td>
 <input type="checkbox" id="<%=rs5.getString(2)%>" onchange="toggleVisibility('<%=rs5.getString(2)%>')" value="<%=rs5.getInt(1)%>-<%=rs5.getString(2)%>"><%=rs5.getString(2)%>  </td>
                           </tr>
                           <%
                           }
                           %>
                           </table>

                        </div>
                    </div>
                           
                           <div id="selected_sub">
                              <h4 class="div_heading">Selected subjects</h4>
                              <div id="selected_subtable">
                                  <table>
                                      <tr>
                                      <span id="sel_subjects"></span>    
                                    
                                      </tr>
                                  </table>
                              </div>
                               
                               
                           </div>
                    
                     <div id="control">
                        
                         <input id="add_btn" type="button" value="Add" onclick="ajax_fun1()">
                        
                        </div>
           </fieldset>      
                </form>
            </div>
        
        <script>
            function openCity(evt, tabName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
            }
        </script>
        <script>
            function myf(){
                var ch = document.getElementById("check_box_btn").checked;
                if(ch === true) {
                    var a= document.getElementById("city_box1").value;
                  
                    document.getElementById("city_box2").disabled = true;
                    document.getElementById("city_box2").value=a;
                    
                }
                else if(ch === false) {
                    document.getElementById("city_box2").disabled = false;
                   
                    document.getElementById("city_box2").value= "select";
                }
             }
        </script>
    </body>
</html>
