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
            <table width="1000" height="300" border="0" bgcolor="#ffffff">
                <%
                String AdmissionNo=(String)session.getAttribute("Adm_sess");
                Statement st;
                String query = "select * from education_detail WHERE admission_no='"+AdmissionNo+"'";
                st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next())
                {
                %>
                <h1>Education Details:</h1>


                <tr><td width="35%" bgcolor="#D4EAA9" >Any specific Information</td>
                    <td bgcolor="#D2D7D3" width="50%">
                        <input type="text" style="width:100px;" name="studname" value="<%=rs.getString(2)%>">
                    </td>              
                </tr> 

                <tr><td bgcolor="#D4EAA9" >Class</td>
                    <td bgcolor="#D2D7D3" > 
                        <input type="text" style="width:100px;" name="gname" value="<%=rs.getString(3)%>">
                    </td>
                </tr> 

                <tr><td bgcolor="#D4EAA9" >School</td>
                    <td bgcolor="#D2D7D3" >
                        <input type="text" style="width:100px;" name="mname" value="<%=rs.getString(4)%>">
                    </td>        
                </tr>     

                <tr><td bgcolor="#D4EAA9" >Board</td>
                    <td bgcolor="#D2D7D3">
                        <input type="text" style="width:100px;" name="sex" value="<%=rs.getString(5)%>">
                    </td>      
                </tr>           

                <tr><td bgcolor="#D4EAA9" >Stream</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="phone" value="<%=rs.getString(6)%>">
                    </td>           
                </tr>          

                <tr><td  bgcolor="#D4EAA9" >Year</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="contact" value="<%=rs.getString(7)%>">
                    </td>            
                </tr>

                <tr><td  bgcolor="#D4EAA9" >Percentage</td>
                    <td bgcolor="#D2D7D3"> 
                        <input type="text" style="width:100px;" name="foccupation" value="<%=rs.getString(8)%>">
                    </td>
                </tr>

                  <%
                } 

                %>

            </table>
        </div>
    </form>

