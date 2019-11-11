<%-- 
    Document   : MasterP
    Created on : Jun 16, 2016, 8:30:12 AM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="package1.*"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/dashboard1.css" />
        <link rel="stylesheet" href="css/menu_nav.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link href='css/style2' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script> 
        <script src="js/bootstrap.min.js"></script>
        <script src="js/html5shiv.min.js"></script>
        <script src="js/respond.min.js"></script>
        <link rel="stylesheet" href="css/back-color.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="jquery-1.11.3.js"></script>
        <script src="js/mstlistscript.js"></script>
       
    </head>
    <body>
        <%@include file="header.jsp"  %>
        <%@include file="connect.jsp" %>
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
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
       
        <br>
        <br>
        <br>
        <br>

        <div class="container">
            <div class="row">
                <div class="col-sm-6" style="width: 350px">
                    <div class="panel panel-danger"  >
                        <div class="panel-heading" style="background-color:#990000;">
                            <h3><font color="white">Select</font></h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked" class="red-pills" >
                                <% String s = request.getParameter("key");

                                %>
                                <li <%if (request.getParameter("key").equals("0")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu">Session</a></li>
                                <li <%if (request.getParameter("key").equals("1")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu1">Class</a></li>
                                <li <%if (request.getParameter("key").equals("2")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu2">Section</a></li>
                                <li <%if (request.getParameter("key").equals("3")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu3">House</a></li>
                                <li <%if (request.getParameter("key").equals("4")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu4">City</a></li>
                                <li <%if (request.getParameter("key").equals("5")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu5">Caste</a></li>
                                <li <%if (request.getParameter("key").equals("6")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu6">Country</a></li>
                                <li <%if (request.getParameter("key").equals("7")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu7">Religion</a></li>
                                <li <%if (request.getParameter("key").equals("8")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu8">Subject</a></li>
                                <li <%if (request.getParameter("key").equals("9")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu9">Category</a></li>
                                <li <%if (request.getParameter("key").equals("10")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu10">Designation</a></li>
                                <li <%if (request.getParameter("key").equals("11")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu11">Department</a></li>
                                <li <%if (request.getParameter("key").equals("12")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu12">State</a></li>
                                <li <%if (request.getParameter("key").equals("13")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu13">Gender</a></li>
                                <li <%if (request.getParameter("key").equals("14")) { %>class="active"<% } else { %>class="" <% } %>><a data-toggle="pill"  href="#menu14">Marital_Status</a></li>
                                                            
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="col-sm-6">

                    <div class="tab-content">
                        <div id="menu" class="tab-pane <%if (request.getParameter("key").equals("0")) { %> fade in active<% } %> " >
                            <div style="float: left">
                                <h3>SESSION</h3>
                                <form class="form-inline" role="form" action="session" >

                                    <%
                                        Statement sth;
                                        int no = 0;
                                        String queryh = "SELECT max(session_id) FROM session_tab ";
                                        sth = conn.createStatement();
                                        ResultSet rsh = sth.executeQuery(queryh);
                                        while (rsh.next()) {
                                            no = rsh.getInt(1) + 1;
                                        }
                                    %><table>
                                        
                                        <tr ><th >    <label for="SessionId">Session id:</label>
                                            </th><td>  <input type="text" class="form-control" id="session_id" name="sid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no%>">
                                            </td></tr>


                                        <tr><th>  <label for="SessionName">Session name:</label>
                                            </th><td> <input type="text" class="form-control" id="session_name" name="sname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>

                                        <tr><td>  
                                            </td> <td><button type="submit" class="btn btn-danger" id="addbt"  name="btname" value="add" >Add</button>
                                                <button type="submit" class="btn btn-danger" id="updatebt" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger" name="btname" value="reset">Reset</button></td></tr>
                                    </table>
                                </form></div>



                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> SESSION NAME</h3>


                                <select  id="slct" name="semp_id" onchange="showtext()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st;
                                        String query = "select * from session_tab order by session_name";
                                        st = conn.createStatement();
                                        ResultSet rs = st.executeQuery(query);
                                        while (rs.next()) {
                                    %>

                                    <option value="<%=rs.getInt(1)%>-<%=rs.getString(2)%>" ><%=rs.getString(2)%></option> 

                                    <%
                                        }

                                    %>

                                </select>     
                            </div>    
                        </div>      

                        <div id="menu1" class="tab-pane <%if (request.getParameter("key").equals("1")) { %> fade in active<% } %>">
                            <div style="float: left"> <h3>CLASS</h3>
                                <form class="form-inline" role="form" action="classm" method="post">

                                    <%
                                        Statement sth1;

                                        int no1 = 0;
                                        String queryh1 = "SELECT max(class_id) FROM class_tab ";
                                        sth1 = conn.createStatement();
                                        ResultSet rsh1 = sth1.executeQuery(queryh1);
                                        while (rsh1.next()) {
                                            no1 = rsh1.getInt(1) + 1;
                                        }
                                    %>
                                    <table>
                                        <tr ><th > 
                                                <label for="ClassId">Class id:</label>
                                            </th><td> <input type="text" class="form-control" id="class_id" name="cid" value="<%= no1%>" style="margin-bottom: 5px;margin-left: 3px" >
                                            </td></tr> 
                                        <tr ><th > 
                                                <label for="ClassName">Class name:</label>
                                            </th><td>  <input type="text" class="form-control" id="class_name" name="cname" style="margin-bottom: 5px;margin-left: 3px" required>

                                            </td></tr> 
                                        <tr ><td></td><td>  <button type="submit" class="btn btn-danger black" id="addbt1"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt1" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button>
                                            </td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> CLASS NAME</h3>


                                <select  id="slct1" name="semp_id" onchange="showtext1()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st1;
                                        String query1 = "select * from class_tab";
                                        st1 = conn.createStatement();
                                        ResultSet rs1 = st1.executeQuery(query1);
                                        while (rs1.next()) {
                                    %>

                                    <option value="<%=rs1.getInt(1)%>-<%=rs1.getString(2)%>" ><%=rs1.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>    

                        </div>


                        <div id="menu2" class="tab-pane <%if (request.getParameter("key").equals("2")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>SECTION</h3>
                                <form class="form-inline" role="form" action="sectionm" method="post">
                                    <%
                                        Statement sth2;

                                        int no2 = 0;
                                        String queryh2 = "SELECT max(section_id) FROM section_tab ";
                                        sth2 = conn.createStatement();
                                        ResultSet rsh2 = sth2.executeQuery(queryh2);
                                        while (rsh2.next()) {
                                            no2 = rsh2.getInt(1) + 1;
                                        }
                                    %>
                                    <table>
                                        <tr ><th > 
                                                <label for="SectionId">Section id:</label>
                                            </th><td> <input type="text" class="form-control" id="section_id" name="secid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no2%>">

                                            </td></tr>
                                        <tr><th> <label for="SectionName">Section name:</label>
                                            </th><td>  <input type="text" class="form-control" id="section_name" name="secname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td><button type="submit" class="btn btn-danger" id="addbt2"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger" id="updatebt2" name="btname" value="update" disabled="true">Update</button>
                                                <button type="submit" class="btn btn-danger" name="btname" value="reset">Reset</button>
                                            </td></tr></table> 
                                </form>
                            </div>

                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> SECTION NAME</h3>


                                <select  id="slct2" name="semp_id" onchange="showtext2()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st2;
                                        String query2 = "select * from section_tab order by section_name";
                                        st2 = conn.createStatement();
                                        ResultSet rs2 = st2.executeQuery(query2);
                                        while (rs2.next()) {
                                    %>

                                    <option value="<%=rs2.getInt("section_id")%>-<%=rs2.getString("section_name")%>" ><%=rs2.getString("section_name")%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  


                        </div>
                        <div id="menu3" class="tab-pane <%if (request.getParameter("key").equals("3")) { %> fade in active<% } %>">
                            <div style="float: left">
                                <h3>HOUSE</h3>
                                <form class="form-inline" role="form" name="f4" action="house">
                                    <%
                                        Statement sth3;

                                        int no3 = 0;
                                        String queryh3 = "SELECT max(house_id) FROM house_tab ";
                                        sth3 = conn.createStatement();
                                        ResultSet rsh3 = sth3.executeQuery(queryh3);
                                        while (rsh3.next()) {
                                            no3 = rsh3.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="HouseId">House id:</label>

                                            </th><td>  <input type="text" class="form-control" id="house_id" name="hid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no3%>">
                                            </td></tr>
                                        <tr><th><label for="HouseName">House name:</label>
                                            </th><td> <input type="text" class="form-control" id="house_name" name="hname"style="margin-bottom: 5px;margin-left: 3px" required>

                                            </td></tr>
                                        <tr><td></td>
                                            <td>

                                                <button type="submit" class="btn btn-danger" id="addbt3"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger" id="updatebt3" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>

                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> HOUSE NAME</h3>


                                <select  id="slct3" name="semp_id" onchange="showtext3()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st3;
                                        String query3 = "select * from house_tab order by house_name";
                                        st3 = conn.createStatement();
                                        ResultSet rs3 = st3.executeQuery(query3);
                                        while (rs3.next()) {
                                    %>

                                    <option value="<%=rs3.getInt(1)%>-<%=rs3.getString(2)%>" ><%=rs3.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>   


                        </div>



                        <div id="menu4" class="tab-pane <%if (request.getParameter("key").equals("4")) { %> fade in active<% } %>">
                            <div style="float: left">
                                <h3>CITY</h3>
                                <form class="form-inline" role="form" name="f5" action="city">
                                    <%
                                        Statement sth4;

                                        int no4 = 0;
                                        String queryh4 = "SELECT max(city_id) FROM city_tab ";
                                        sth4 = conn.createStatement();
                                        ResultSet rsh4 = sth4.executeQuery(queryh4);
                                        while (rsh4.next()) {
                                            no4 = rsh4.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="CityId">City id:</label>
                                            </th><td>   <input type="text" class="form-control" id="city_id" name="ctid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no4%>">
                                            </td></tr><tr><th>
                                                <label for="CityName">City name:</label>
                                            </th><td> <input type="text" class="form-control" id="city_name" name="ctname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger" id="addbt4"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger" id="updatebt4" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> CITY NAME</h3>


                                <select  id="slct4" name="semp_id" onchange="showtext4()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st4;
                                        String query4 = "select * from city_tab order by city_name";
                                        st4 = conn.createStatement();
                                        ResultSet rs4 = st4.executeQuery(query4);
                                        while (rs4.next()) {
                                    %>

                                    <option value="<%=rs4.getInt(1)%>-<%=rs4.getString(2)%>" ><%=rs4.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                        <div id="menu5" class="tab-pane <%if (request.getParameter("key").equals("5")) { %> fade in active<% } %>">
                            <div style="float: left">
                                <h3>CASTE</h3>
                                <form class="form-inline" role="form" name="f6" action="caste">
                                    <%
                                        Statement sth5;

                                        int no5 = 0;
                                        String queryh5 = "SELECT max(caste_id) FROM caste_tab ";
                                        sth5 = conn.createStatement();
                                        ResultSet rsh5 = sth5.executeQuery(queryh5);
                                        while (rsh5.next()) {
                                            no5 = rsh5.getInt(1)+1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="CasteId">Caste id:</label>
                                            </th><td> <input type="text" class="form-control" id="caste_id" name="cstid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no5%>">
                                            </td></tr>
                                        <tr><th>
                                                <label for="CasteName">Caste name:</label>
                                            </th><td><input type="text" class="form-control" id="caste_name" name="cstname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger" id="addbt5"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger" id="updatebt5" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> CASTE NAME</h3>


                                <select  id="slct5" name="semp_id" onchange="showtext5()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st5;
                                        String query5 = "select * from caste_tab order by caste_name";
                                        st5 = conn.createStatement();
                                        ResultSet rs5 = st5.executeQuery(query5);
                                        while (rs5.next()) {
                                    %>

                                    <option value="<%=rs5.getInt(1)%>-<%=rs5.getString(2)%>" ><%=rs5.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                        <div id="menu6" class="tab-pane <%if (request.getParameter("key").equals("6")) { %> fade in active<% } %>">
                            <div style="float: left">
                                <h3>COUNTRY</h3>
                                <form class="form-inline" role="form" name="f7" action="country">
                                    <%
                                        Statement sth6;

                                        int no6 = 0;
                                        String queryh6 = "SELECT max(country_id) FROM country_tab ";
                                        sth6 = conn.createStatement();
                                        ResultSet rsh6 = sth6.executeQuery(queryh6);
                                        while (rsh6.next()) {
                                            no6 = rsh6.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="CountryId">Country id:</label>
                                            </th><td>  <input type="text" class="form-control" id="country_id" name="cntid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no6%>">
                                            </td></tr>
                                        <tr><th>
                                                <label for="CountryName">Country name:</label>
                                            </th><td>  <input type="text" class="form-control" id="country_name" name="cntname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger" id="addbt6"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger" id="updatebt6" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> COUNTRY NAME</h3>


                                <select  id="slct6" name="semp_id" onchange="showtext6()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st6;
                                        String query6 = "select * from country_tab order by country_name";
                                        st6 = conn.createStatement();
                                        ResultSet rs6 = st6.executeQuery(query6);
                                        while (rs6.next()) {
                                    %>

                                    <option value="<%=rs6.getInt(1)%>-<%=rs6.getString(2)%>" ><%=rs6.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>

                        <div id="menu7" class="tab-pane <%if (request.getParameter("key").equals("7")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>RELIGION</h3>
                                <form class="form-inline" role="form" name="f8" action="religion">
                                    <%
                                        Statement sth7;

                                        int no7 = 0;
                                        String queryh7 = "SELECT max(religion_id) FROM religion_tab ";
                                        sth7 = conn.createStatement();
                                        ResultSet rsh7 = sth7.executeQuery(queryh7);
                                        while (rsh7.next()) {
                                            no7 = rsh7.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="ReligionId">Religion id:</label>
                                            </th><td><input type="text" class="form-control" id="religion_id" name="rlgid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no7%>">
                                            </td></tr>
                                        <tr><th>
                                                <label for="ReligionName">Religion name:</label>
                                            </th><td>  <input type="text" class="form-control" id="religion_name" name="rlgname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt7"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt7" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3> RELIGION NAME</h3>


                                <select  id="slct7" name="semp_id" onchange="showtext7()" size="8" style="width: 125px;  ">
                                    <option value="-1">Select</option> 


                                    <%

                                        Statement st7;
                                        String query7 = "select * from religion_tab order by religion_name";
                                        st7 = conn.createStatement();
                                        ResultSet rs7 = st7.executeQuery(query7);
                                        while (rs7.next()) {
                                    %>

                                    <option value="<%=rs7.getInt(1)%>-<%=rs7.getString(2)%>" ><%=rs7.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>

                        <div id="menu8" class="tab-pane <%if (request.getParameter("key").equals("8")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>SUBJECT</h3>
                                <form class="form-inline" role="form" name="f8" action="subject">
                                    <%
                                        Statement sth8;

                                        int no8 = 0;
                                        String queryh8 = "SELECT max(subject_id) FROM subject_tab";
                                        sth8 = conn.createStatement();
                                        ResultSet rsh8 = sth8.executeQuery(queryh8);
                                        while (rsh8.next()) {
                                            no8 = rsh8.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="SubjectId">Subject id:</label>
                                            </th><td><input type="text" class="form-control" id="subject_id" name="subid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no8%>">
                                            </td></tr>
                                        <tr><th>
                                                <label for="SubjectCode">Subject code:</label>
                                            </th><td>  <input type="text" class="form-control" id="subject_code" name="subcode" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><th>
                                                <label for="SubjectName">Subject name:</label>
                                            </th><td>  <input type="text" class="form-control" id="subject_name" name="subname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt8"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt8" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>SUBJECT NAME</h3>
                                <select  id="slct8" name="semp_id" onchange="showtext8()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st8;
                                        String query8 = "select * from subject_tab";
                                        st8 = conn.createStatement();
                                        ResultSet rs8 = st8.executeQuery(query8);
                                        while (rs8.next()) {
                                    %>

                                    <option value="<%=rs8.getInt(1)%>-<%=rs8.getString(2)%>" ><%=rs8.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                                      <div id="menu9" class="tab-pane <%if (request.getParameter("key").equals("9")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>CATEGORY</h3>
                                <form class="form-inline" role="form" name="f9" action="Category">
                                    <%
                                        Statement sth9;

                                        int no9 = 0;
                                        String queryh9 = "SELECT max(category_id) FROM category_tab ";
                                        sth9 = conn.createStatement();
                                        ResultSet rsh9 = sth9.executeQuery(queryh9);
                                        while (rsh9.next()) {
                                            no9 = rsh9.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="CategoryId">Category id:</label>
                                            </th><td><input type="text" class="form-control" id="category_id" name="categoryid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no9%>">
                                            </td></tr>
                                        
                                        <tr><th>
                                                <label for="CategoryName">Category name:</label>
                                            </th><td>  <input type="text" class="form-control" id="category_name" name="categoryname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt9"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt9" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>CATEGORY NAME</h3>
                                <select  id="slct9" name="semp_id" onchange="showtext9()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st9;
                                        String query9 = "select * from category_tab";
                                        st9 = conn.createStatement();
                                        ResultSet rs9 = st9.executeQuery(query9);
                                        while (rs9.next()) {
                                %>

                                    <option value="<%=rs9.getInt(1)%>-<%=rs9.getString(2)%>" ><%=rs9.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                                    
                            <div id="menu10" class="tab-pane <%if (request.getParameter("key").equals("10")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>DESIGNATION</h3>
                                <form class="form-inline" role="form" name="f10" action="Designation">
                                    <%
                                        Statement sth10;

                                        int no10 = 0;
                                        String queryh10 = "SELECT max(designation_id) FROM designation_tab ";
                                        sth10 = conn.createStatement();
                                        ResultSet rsh10 = sth10.executeQuery(queryh10);
                                        while (rsh10.next()) {
                                            no10 = rsh10.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="DesignationId">Designation id:</label>
                                            </th><td><input type="text" class="form-control" id="designation_id" name="designationid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no10%>">
                                            </td></tr>
                                        
                                        <tr><th>
                                                <label for="DesignationName">Designation name:</label>
                                            </th><td>  <input type="text" class="form-control" id="designation_name" name="designationname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt10"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt10" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>DESIGNATION NAME</h3>
                                <select  id="slct8" name="semp_id" onchange="showtext10()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st10;
                                        String query10 = "select * from designation_tab";
                                        st10 = conn.createStatement();
                                        ResultSet rs10 = st10.executeQuery(query10);
                                        while (rs10.next()) {
                                %>

                                    <option value="<%=rs10.getInt(1)%>-<%=rs10.getString(2)%>" ><%=rs10.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>           

                                       <div id="menu11" class="tab-pane <%if (request.getParameter("key").equals("11")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>DEPARTMENT</h3>
                                <form class="form-inline" role="form" name="f11" action="Department">
                                    <%
                                        Statement sth11;

                                        int no11 = 0;
                                        String queryh11 = "SELECT max(department_id) FROM department_tab ";
                                        sth11 = conn.createStatement();
                                        ResultSet rsh11 = sth11.executeQuery(queryh11);
                                        while (rsh11.next()) {
                                            no11 = rsh11.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="DepartmentId">Department id:</label>
                                            </th><td><input type="text" class="form-control" id="department_id" name="departmentid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no11%>">
                                            </td></tr>
                                        
                                        <tr><th>
                                                <label for="DepartmentName">Department name:</label>
                                            </th><td>  <input type="text" class="form-control" id="department_name" name="departmentname" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt11"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt11" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>DEPARTMENT NAME</h3>
                                <select  id="slct11" name="semp_id" onchange="showtext11()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st11;
                                        String query11 = "select * from department_tab";
                                        st11 = conn.createStatement();
                                        ResultSet rs11 = st11.executeQuery(query11);
                                        while (rs11.next()) {
                                %>

                                    <option value="<%=rs11.getInt(1)%>-<%=rs11.getString(2)%>" ><%=rs11.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                                    
                                               <div id="menu12" class="tab-pane <%if (request.getParameter("key").equals("12")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>STATE</h3>
                                <form class="form-inline" role="form" name="f12" action="State">
                                    <%
                                        Statement sth12;

                                        int no12 = 0;
                                        String queryh12 = "SELECT max(state_id) FROM state_tab ";
                                        sth12 = conn.createStatement();
                                        ResultSet rsh12 = sth12.executeQuery(queryh12);
                                        while (rsh12.next()) {
                                            no12 = rsh12.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="StateId">State id:</label>
                                            </th><td><input type="text" class="form-control" id="state_id" name="stateid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no12%>">
                                            </td></tr>
                                        
                                        <tr><th>
                                                <label for="StateName">State name:</label>
                                            </th><td>  <input type="text" class="form-control" id="state_name" name="statename" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt12"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt12" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>STATE NAME</h3>
                                <select  id="slct12" name="semp_id" onchange="showtext12()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st12;
                                        String query12 = "select * from state_tab";
                                        st12 = conn.createStatement();
                                        ResultSet rs12 = st12.executeQuery(query12);
                                        while (rs12.next()) {
                                %>

                                    <option value="<%=rs12.getInt(1)%>-<%=rs12.getString(2)%>" ><%=rs12.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                                    
                                    
                                               <div id="menu13" class="tab-pane <%if (request.getParameter("key").equals("13")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>GENDER</h3>
                                <form class="form-inline" role="form" name="f13" action="Gender">
                                    <%
                                        Statement sth13;

                                        int no13 = 0;
                                        String queryh13 = "SELECT max(gender_id) FROM gender_tab ";
                                        sth13 = conn.createStatement();
                                        ResultSet rsh13 = sth13.executeQuery(queryh13);
                                        while (rsh13.next()) {
                                            no13 = rsh13.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="GenderId">Gender id:</label>
                                            </th><td><input type="text" class="form-control" id="gender_id" name="genderid" style="margin-bottom: 5px;margin-left: 3px" value="<%=no13%>">
                                            </td></tr>
                                        
                                        <tr><th>
                                                <label for="GenderName">Gender name:</label>
                                            </th><td>  <input type="text" class="form-control" id="gender_name" name="gendername" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt13"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt13" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>GENDER NAME</h3>
                                <select  id="slct13" name="semp_id" onchange="showtext13()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st13;
                                        String query13 = "select * from gender_tab";
                                        st13 = conn.createStatement();
                                        ResultSet rs13 = st13.executeQuery(query13);
                                        while (rs13.next()) {
                                %>

                                    <option value="<%=rs13.getInt(1)%>-<%=rs13.getString(2)%>" ><%=rs13.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                                    
                                    
                                               <div id="menu14" class="tab-pane <%if (request.getParameter("key").equals("14")) { %> fade in active<% } %>">
                            <div style="float:left">
                                <h3>MARITAL STATUS</h3>
                                <form class="form-inline" role="form" name="f14" action="MaritalStatus">
                                    <%
                                        Statement sth14;

                                        int no14 = 0;
                                        String queryh14 = "SELECT max(marital_status_id) FROM marital_status_tab ";
                                        sth14 = conn.createStatement();
                                        ResultSet rsh14 = sth14.executeQuery(queryh14);
                                        while (rsh14.next()) {
                                            no14 = rsh14.getInt(1) + 1;
                                        }
                                    %>
                                    <table><tr><th>
                                                <label for="Marital_Status_Id">Marital_Status id:</label>
                                            </th><td><input type="text" class="form-control" id="marital_status_id" name="marital_status_id" style="margin-bottom: 5px;margin-left: 3px" value="<%=no14%>">
                                            </td></tr>
                                        
                                        <tr><th>
                                                <label for="Marital_Status_Name">Marital_Status name:</label>
                                            </th><td>  <input type="text" class="form-control" id="marital_status_name" name="marital_status_name" style="margin-bottom: 5px;margin-left: 3px" required>
                                            </td></tr>
                                        <tr><td></td><td>
                                                <button type="submit" class="btn btn-danger  black" id="addbt14"  name="btname" value="add" >Add</button>

                                                <button type="submit" class="btn btn-danger black" id="updatebt14" name="btname" value="update" disabled="true">Update</button>
                                                <button type="reset" class="btn btn-danger black" name="btname" value="reset">Reset</button></td></tr></table>
                                </form>
                            </div>
                            <div style=" width: 200px; float: left;margin-left: 20px; text-align: center">

                                <h3>MARITAL STATUS</h3>
                                <select  id="slct14" name="semp_id" onchange="showtext14()" size="8" style="width: 125px;  ">
                                <option value="-1">Select</option> 
                                <%
                                        Statement st14;
                                        String query14 = "select * from marital_status_tab";
                                        st14 = conn.createStatement();
                                        ResultSet rs14 = st14.executeQuery(query14);
                                        while (rs14.next()) {
                                %>

                                    <option value="<%=rs14.getInt(1)%>-<%=rs14.getString(2)%>" ><%=rs14.getString(2)%></option> 

                                    <%
                                        }
                                    %>

                                </select>     
                            </div>  
                        </div>
                                    
                    </div>

                </div>


            </div>

        </div>


    </body>
</html>
