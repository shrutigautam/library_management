
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
            <table width="1000" height="600" border="0" bgcolor="#ffffff">

                <h1>Personal Information:</h1>
                <%
                String AdmissionNo=(String)session.getAttribute("Adm_sess");
                Statement st;
                String query = "select * from personal_info WHERE admission_no='"+AdmissionNo+"'";
                st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next())
                {
                %>

              

               

                <tr><td width="35%" bgcolor="#D4EAA9" >Roll No</td>
                    <td bgcolor="#D2D7D3" width="50%">
                        <input type="text" style="width:100px;" name="studname" value="<%=rs.getString(2)%>">
                    </td>              
                </tr> 

                <tr><td bgcolor="#D4EAA9" >Enrollment No</td>
                    <td bgcolor="#D2D7D3" > 
                        <input type="text" style="width:100px;" name="gname" value="<%=rs.getString(3)%>">
                    </td>
                </tr> 

                <tr><td bgcolor="#D4EAA9" >Gender</td>
                    <td bgcolor="#D2D7D3" >
                            <%

                                    Statement st_gen;
                                    String query_gen = "select * from gender_tab WHERE gender_id='"+rs.getString(4)+"'";
                                    st_gen = conn.createStatement();
                                    ResultSet rs_gen = st_gen .executeQuery(query_gen);
                                    while(rs_gen.next())
                                    {
                                    %>
                                   <input type="text" style="width:100px;" name="mname" value="<%=rs_gen.getString(2)%>">
                           <%
                                     }

                           %>
                        </td>        
                </tr>     

                <tr><td bgcolor="#D4EAA9" >Father Occupation</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="sex" value="<%=rs.getString(5)%>">
                    </td>      
                </tr>           

                <tr><td bgcolor="#D4EAA9" >Parent Income</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="phone" value="<%=rs.getString(6)%>">
                    </td>           
                </tr>          

                <tr><td  bgcolor="#D4EAA9" >Income Amount</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="contact" value="<%=rs.getString(7)%>">
                    </td>            
                </tr>

                <tr><td  bgcolor="#D4EAA9" >Mother Name</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="foccupation" value="<%=rs.getString(8)%>">
                    </td>
                </tr>

                <tr><td  bgcolor="#D4EAA9" >Mother Occupation</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="moccupation" value="<%=rs.getString(9)%>">
                            </td>
                </tr>

                <tr><td  bgcolor="#D4EAA9" >Caste Category</td>
                    <td bgcolor="#D2D7D3">
                            <%

                                    Statement st_caste;
                                    String query_caste = "select * from caste_tab WHERE caste_id='"+rs.getString(10)+"'";
                                    st_caste = conn.createStatement();
                                    ResultSet rs_caste = st_caste.executeQuery(query_caste);
                                    while(rs_caste.next())
                                    {
                                    %>
                                   <input type="text" style="width:100px;" name="city" value="<%=rs_caste.getString(2)%>">
                           <%
                                     }

                           %>
                      
                           </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Type of Student</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(11)%>">
                      </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Domicile State</td>
                    <td bgcolor="#D2D7D3">
                          <%

                                    Statement st_domicile;
                                    String query_domicile = "select * from state_tab WHERE state_id='"+rs.getString(18)+"'";
                                    st_domicile = conn.createStatement();
                                    ResultSet rs_domicile = st_domicile.executeQuery(query_domicile);
                                    while(rs_domicile.next())
                                    {
                                    %>
                                   <input type="text" style="width:100px;" name="city" value="<%=rs_domicile.getString(2)%>">
                           <%
                                     }

                           %>
                      
                       
                        </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Nationality</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(12)%>">
                       </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Religion</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(14)%>">
                            </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Blood Group</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(13)%>">
                           </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Physical Disability</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(15)%>">
                           </td>           
                </tr>
                <tr><td  bgcolor="#D4EAA9" >Vision</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(16)%>">
                       </td>           
                </tr>
                
                <tr><td  bgcolor="#D4EAA9" >Hobbies</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="city" value="<%=rs.getString(17)%>">
                           </td>           
                </tr>

               <%
                } 

                %>
            </table>
        </div>
    </form>

