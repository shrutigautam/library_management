
   

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8" %>

<%@include file="connect.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet" href="css2.css">

<script>
    function sendIt(){
     var a=document.getElementById("sel1").value();
     alert(a);
     var sq_array=a.split('-');
     document.getElementById("r0l").value=sq_array[0];
     document.getElementById("session_name").value=sq_array[1];
     
 }
    </script>
</head>
<body>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<nav class="navbar  navbar-inverse navbar-fixed-top">
<div class="container-fluid">
<!-- start collapsed navbar -->
  <div class="navbar-header">
  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main_navbar" >open!</button>
 </div>
<!-- end collapsed navbar -->
<!--start un-collapsed navbar -->
<div class="collapse navbar-collapse" id="main_navbar">     
<div class="navbar-header">
      <a class="navbar-brand" href="home.html">SchoolManagement</a>
    </div>
<ul class="nav navbar-nav navbar-right">
        <li><a href="#">Admission</a></li>
        <li><a href="#">Student MIS</a></li>
        <li><a href="#">Security</a></li>
		<li><a href="CONTACT.html">Contact Us</a></li>
  <!--    <li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->   
</ul>
</div>
<!-- un-collapsed navbar-->
</div>
</nav>
<br>
<br>
<br>
<br>

<div class="container">
<!--<div class="row"> -->
<div class="col-md-3" style="width: 400px;margin-right: 600px">
<div class="panel panel-primary">
<div class="panel-heading">
<h3><font color="orange">Select</font></h3>
</div>
    <div class="panel-body">
<ul class="nav nav-pills nav-stacked">
   
    <li class="active"><a data-toggle="pill"  href="#menu" onclick="special_session()">Session</a></li>
    <li><a data-toggle="pill"  href="#menu1" onclick="special_class()">Class</a></li>
    <li><a data-toggle="pill"  href="#menu2" onclick="special_section()">Section</a></li>
    <li><a data-toggle="pill"  href="#menu3" onclick="special_house()">House</a></li>
    <li><a data-toggle="pill"  href="#menu4" onclick="special_city()">City</a></li>
    <li><a data-toggle="pill"  href="#menu5" onclick="special_caste()">Caste</a></li>
    <li><a data-toggle="pill"  href="#menu6" onclick="special_country()">Country</a></li>
    <li><a data-toggle="pill"  href="#menu7" onclick="special_religion()">Religion</a></li>
  </ul>
  </div>
  </div>
    </div>
  
  <div class="tab-content" >
 <div id="menu" class="tab-pane fade in active">
     <div id="side">
    <h3>SESSION</h3>
    <form   role="form" action="MasterP.jsp" name="FS">
  <div class="form-group">
    <label for="Session_Id">Session id:</label>
  
    <span id="r01"></span> 
  </div>
  <div class="form-group">
    <label for="SessionName">Session name:</label>
    <input type="text" class="form-control" id="session_name" value="" name="t2">
  </div>
  
  <button type="button" class="btn btn-primary" onclick="insert_session()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
 
  <button type="button" class="btn btn-primary" onclick="edit_session()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r"></span>
    </div>
    </div>
    
    <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
        <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel1" onchange="sendIt()">
    <%
    
    Statement stmt=conn.createStatement();
   
    ResultSet rs=stmt.executeQuery("select * from session_tab");
            
              
            
            %>
            <option value="-1">Select</option>
           <%    while(rs.next())
            {
              %>
              <option value="<%=rs.getString(1) %>-<%=rs.getString(2)%>">
                       
                             <%= rs.getString(2)
                            %>
                    </option>
                  <%  }
                 rs.close();
                  stmt.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>

</div>
                 
  <div id="menu1" class="tab-pane">
  <div id="side">
  <h3>CLASS</h3>
  <form class="form-inline" role="form" name="F1">
  <div  class="form-group" >
  <label for="ClassId">Class id:</label>
  <span id="r02"></span>
  </div>
      <br>
      <br>
  <div class="form-group">
  <label for="ClassName">Class name:</label>
  <br>
  <input type="text" class="form-control" id="class_name" name="t2">
  </div>
  <br>
  <br>
  <button type="button" class="btn btn-primary" onclick="insert_class()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_class()">Edit</button>
  </form>
  <div class="container-fluid">
        <span id="r1"></span>
  </div>
  </div>
      <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt1=conn.createStatement();
    ResultSet rs1=stmt1.executeQuery("select * from class_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel2" onchange="sendIt()">
           <%    while(rs1.next())
            {
              %>
                    <option value="<%=rs1.getString(2) %>">
                        <%=rs1.getString(1)
                %>
                             <%=rs1.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt1.close();
                 rs1.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>
      
  </div>
  <div id="menu2" class="tab-pane">
      <div id="side">
    <h3>SECTION</h3>
    <form class="form-inline" role="form" name="F2">
  <div class="form-group">
    <label for="SectionId">Section id:</label>
     <span id="r03"></span> 
  </div>
        <br><br>
  <div class="form-group">
    <label for="SectionName">Section name:</label>
  <br>
    <input type="text" class="form-control" id="section_name" name="t2">
  
  </div>
        <br>
  <br>
  <button type="button" class="btn btn-primary" onclick="insert_section()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_section()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r2"></span>
    </div>
  </div>
      
      <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt2=conn.createStatement();
    ResultSet rs2=stmt2.executeQuery("select * from section_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel3" onchange="sendIt()">
           <%    while(rs2.next())
            {
              %>
                    <option value="<%=rs2.getString(2) %>">
                        <%=rs2.getString(1)
                %>
                             <%=rs2.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt2.close();
                 rs2.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>
      
      </div>
  <div id="menu3" class="tab-pane">
      <div id="side">
    <h3>HOUSE</h3>
    <form class="form-inline" role="form" name="F3">
  <div class="form-group">
    <label for="HouseId">House id:</label>
     <span id="r04"></span> 
  </div>
        <br><br>
  <div class="form-group">
    <label for="HouseName">House name:</label>
    <br>
    <input type="text" class="form-control" id="house_name" name="t2">
  </div>
  <br><br>
  <button type="button" class="btn btn-primary" onclick="insert_house()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_house()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r3"></span>
    </div>
  </div>
      
      
      <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt3=conn.createStatement();
    ResultSet rs3=stmt3.executeQuery("select * from house_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel4" onchange="sendIt()">
           <%    while(rs3.next())
            {
              %>
                    <option value="<%=rs3.getString(2) %>">
                        <%=rs3.getString(1)
                %>
                             <%=rs3.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt3.close();
                 rs3.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>
  </div>
      </div>
                  
           <div id="menu4" class="tab-pane">
               <div id="side">
    <h3>CITY</h3>
    <form class="form-inline" role="form" name="F4">
  <div class="form-group">
    <label for="CityId">City id:</label>
     <span id="r05"></span> 
  </div>
        <br><br>
  <div class="form-group">
    <label for="CityName">City name:</label>
    <br>
    <input type="text" class="form-control" id="city_name" name="t2">
  </div>
  <br><br>
  <button type="button" class="btn btn-primary" onclick="insert_city()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_city()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r4"></span>
    </div>
  </div>
           
          <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt4=conn.createStatement();
    ResultSet rs4=stmt4.executeQuery("select * from city_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel5" onchange="sendIt()">
           <%    while(rs4.next())
            {
              %>
                    <option value="<%=rs4.getString(2) %>">
                        <%=rs4.getString(1)
                %>
                             <%=rs4.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt4.close();
                 rs4.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div> 
           
           </div>
  <div id="menu5" class="tab-pane">
      <div id="side">
    <h3>CASTE</h3>
    <form class="form-inline" role="form" name="F5">
  <div class="form-group">
    <label for="CasteId">Caste id:</label>
     <span id="r06"></span> 
  </div>
        <br><br>
  <div class="form-group">
    <label for="CasteName">Caste name:</label>
    <br>
    <input type="text" class="form-control" id="caste_name" name="t2">
  </div>
  <br><br>
  <button type="button" class="btn btn-primary" onclick="insert_caste()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_caste()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r5"></span>
    </div>
  </div>
      
      <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt5=conn.createStatement();
    ResultSet rs5=stmt5.executeQuery("select * from caste_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel6" onchange="sendIt()">
           <%    while(rs5.next())
            {
              %>
                    <option value="<%=rs5.getString(2) %>">
                        <%=rs5.getString(1)
                %>
                             <%=rs5.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt5.close();
                 rs5.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>
      
      </div>
  <div id="menu6" class="tab-pane">
      <div id="side">
    <h3>COUNTRY</h3>
    <form class="form-inline" role="form" name="F6">
  <div class="form-group">
    <label for="CountryId">Country id:</label>
     <span id="r07"></span> 
  </div>
        <br><br>
  <div class="form-group">
    <label for="CountryName">Country name:</label>
    <br>
    <input type="text" class="form-control" id="country_name" name="t2">
  </div>
  <br><br>
  <button type="button" class="btn btn-primary" onclick="insert_country()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_country()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r6"></span>
    </div>
  </div>
      
      <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt6=conn.createStatement();
    ResultSet rs6=stmt6.executeQuery("select * from country_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel7" onchange="sendIt()">
           <%    while(rs6.next())
            {
              %>
                    <option value="<%=rs6.getString(2) %>">
                        <%=rs6.getString(1)
                %>
                             <%=rs6.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt6.close();
                 rs6.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>
      
  </div>
  <div id="menu7" class="tab-pane">
      <div id="side">
    <h3>RELIGION</h3>
    <form class="form-inline" role="form" name="F7">
  <div class="form-group">
    <label for="ReligionId">Religion id:</label>
     <span id="r08"></span> 
  </div>
        <br><br>
  <div class="form-group">
    <label for="ReligionName">Religion name:</label>
    <br>
    <input type="text" class="form-control" id="religion_name" name="t2">
  </div>
  <br><br>
  <button type="button" class="btn btn-primary" onclick="insert_religion()">Insert</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  <button type="button" class="btn btn-primary" onclick="edit_religion()">Edit</button>
</form>
    <div class="container-fluid">
    <span id="r7"></span>
    </div>
  </div>
      
      <div class="panel panel-primary"  style="margin-left: 650px;margin-top: 10px;height:180px;">
           
        <div class="panel-heading">select list:</div>
    <div class="panel-body">
    <%
   
    Statement stmt7=conn.createStatement();
    ResultSet rs7=stmt7.executeQuery("select * from religion_tab");
            
              
            
            %>
            <div class="form-group">
                <label for="sel1"></label>
                 
              <select multiple class="form-control" id="sel8" onchange="sendIt()">
           <%    while(rs7.next())
            {
              %>
                    <option value="<%=rs7.getString(2) %>">
                        <%=rs7.getString(1)
                %>
                             <%=rs7.getString(2)
                            %>
                    </option>
                  <%  }
                 stmt7.close();
                 rs7.close();
                  %>
                  
                    </select>
            </div>
        </div>
    </div>
      
  </div>               
  </div>
 
                



               
                  
</body>
</html>
