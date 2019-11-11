
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Search</title>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link rel="stylesheet" href="css/studentdetail.css">
        <%@include file="connect_1.jsp" %>



    </head>

    <body>
        <div id="header">
            <div class="logo"><a href="dashboard.html">Dash<span>Board</span></a>
            </div>
        </div>
        <div id="nav">
            <ul id="topnav" class="topnav">
                <li id="nav-btn"><a href="#" onclick="abcd()">&#9776;</a></li>
                <li class="btn-menu" id="1a"><a id="menu-home" href="#">HOME</a></li>
                <li class="btn-menu" id="2a"><a href="#">MASTER</a></li>
                <li class="btn-menu" id="3a"><a href="#">STUDENT DETAIL</a></li>
                <li class="btn-menu" id="4a"><a href="#">ATTENDANCE</a></li>
                <li class="btn-menu" id="5a"><a href="#">EXAMINATION</a></li>
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




        <!-- ########################################################################################## -->
        <div id="side-nav">
            <div id="nav-list">
                <h2>Side Navigation</h2>
                <nav>
                    <ul class="nav-list">
                        <li><a href="Search.jsp">Search</a></li>
                        <hr>
                        <li><a href="personalDetail.jsp">Personal Details</a></li>
                        <hr>
                        <li><a href="contactDetail.jsp">Contact Details</a></li>
                        <hr>
                        <li><a href="educationDetail.jsp">Education Details</a></li>
                       
                        
                    </ul>
                </nav>
            </div>
        </div>

        <div id="side-nav-horizontal">
            <div id="nav-heading">
                <p>Navigation<p>
            </div>
            <div id="nav-list-horizontal">
                <ul>
                   <div id="horizontal-first">
                        <li><a href="Search.jsp">Search</a></li>
                        <li><a href="personalDetail.jsp">Personal Details</a></li>
                        <li><a href="contactDetail.jsp">Contact Details</a></li>
                        <li><a href="educationDetail.jsp">Education Details</a></li>
                        
                    </div>
                </ul>
            </div>
        </div>



    </div> 
    <form action="#">   
        <div id="main-content" style=" overflow:auto;">
            <table width="1000" height="800" border="0" bgcolor="#ffffff">
                 <%
                String AdmissionNo=(String)session.getAttribute("Adm_sess");
                Statement st;
                String query = "select * from contact_detail WHERE admission_no='"+AdmissionNo+"'";
                st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next())
                {
                %>
                <h1>Contact Details:</h1>

                <tr> <td><h3>Student Address:</h3></td></tr>
                <tr><td width="35%" bgcolor="#D4EAA9" >Address1</td>
                    <td bgcolor="#D2D7D3" width="50%">
                        <input type="text" style="width:100px;" name="studname" value="<%=rs.getString(2)%>">
                    </td>              
                </tr> 

                <tr><td bgcolor="#D4EAA9" >Address2</td>
                    <td bgcolor="#D2D7D3" > 
                        <input type="text" style="width:100px;" name="gname" value="<%=rs.getString(3)%>">
                    </td>
                </tr> 

                <tr><td bgcolor="#D4EAA9" >Pincode</td>
                    <td bgcolor="#D2D7D3" >
                        <input type="text" style="width:100px;" name="mname" value="<%=rs.getString(4)%>">
                    </td>        
                </tr>     

                <tr><td bgcolor="#D4EAA9" >City</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="sex" value="<%=rs.getString(5)%>">
                    </td>      
                </tr>           

                <tr><td bgcolor="#D4EAA9" >Email</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="phone" value="<%=rs.getString(6)%>">
                    </td>           
                </tr>          

                <tr><td  bgcolor="#D4EAA9" >Mobile No.</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="contact" value="<%=rs.getString(7)%>">
                    </td>            
                </tr>
                <tr> <td><h3>Guardian Detail:</h3></td></tr>

                <tr><td  bgcolor="#D4EAA9" >Name</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="foccupation" value="<%=rs.getString(8)%>">
                    </td>
                </tr>

                <tr><td  bgcolor="#D4EAA9" >Occupation</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="moccupation" value="<%=rs.getString(9)%>">
                            </td>
                </tr>

                <tr><td  bgcolor="#D4EAA9" >Contact No</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(10)%>">
                           </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Mobile No</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(11)%>">
                      </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Relation</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(12)%>">
                        </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Email</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(13)%>">
                       </td>           
                </tr>
                <tr> <td><h3>Permanent Address:</h3></td></tr>
                
                <tr><td  bgcolor="#D4EAA9" >Address1</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(14)%>">
                            </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Address2</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(15)%>">
                           </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Pincode</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(16)%>">
                           </td>           
                </tr>
                <tr><td  bgcolor="#D4EAA9" >City</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(17)%>">
                       </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Contact No</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(18)%>">
                           </td>        
                           
                </tr><tr> <td><h3>Emergency Contact:</h3></td></tr>
                
                <tr><td  bgcolor="#D4EAA9" >Person</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(19)%>">
                           </td>           
                </tr>
                <tr><td  bgcolor="#D4EAA9" >Contact No</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(20)%>">
                       </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Mobile No</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(21)%>">
                           </td>        
                </tr>
                  <%
                } 

                %>

            </table>
        </div>
    </form>


