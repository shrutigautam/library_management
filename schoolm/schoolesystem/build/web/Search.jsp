<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Search</title>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link rel="stylesheet" href="css/studentdetail.css">
        <%@include file="connect_1.jsp" %>

        <script>
            function special_second()
            {

                var b = document.FS.admx_no.value;
                if (window.XMLHttpRequest) {
                    req = new XMLHttpRequest();
                }
                else {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET", "Search?na2=" + b, true);
                req.send();
                req.onreadystatechange = function () {
                    if (req.readyState == 4) {
                        var str1 = req.responseText;
                    }
                    var res1 = str1.split(",");
                    document.getElementById("AaddNo").value = res1[0];
                    document.getElementById("Name").value = res1[1];
                    document.getElementById("Middle_Name").value = res1[2];
                    document.getElementById("Last_Name").value = res1[3];
                    document.getElementById("DOB").value = res1[4];
                    document.getElementById("Father_Name").value = res1[5];
                    document.getElementById("Mother_Name").value = res1[6];
                    document.getElementById("Admission_Date").value = res1[7];
                    document.getElementById("Admission_Mode").value = res1[8];
                    document.getElementById("School").value = res1[9];
                    document.getElementById("Class1").value = res1[10];

                    document.getElementById("Section1").value = res1[11];

                    document.getElementById("Year").value = res1[12];

                }
            }

        </script>

    </head>

    <body>
        <div id="header">
            <div class="logo"><a href="dashboard.jsp">Dash<span>Board</span></a>
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
    <!-- ################################################################################################ -->




    <div id="main-content" style=" overflow:auto;">
       
        <table width="1000" height="80" border="0" bgcolor="#ffffff">
            <h1>Search:</h1>

            <form name="FS">
                <tr><td width="35%" bgcolor="#D4EAA9"><label>Admission No:</label></td>
                    <td bgcolor="#D2D7D3" width="50%"><input type="text" name="admx_no" size="30" placeholder="Admission No" id="admx_no" pattern="[0-9]+" title="enter numbers only" required/>
                           

                    </td></tr>

                <tr>  
                    <td width="35%" bgcolor="#D4EAA9"><input class="button medium gradient green" type="button" value="New Search" style="margin-left:240px; " onclick="return this.form.reset()"/>
                    </td>
                    <td bgcolor="#D2D7D3" width="50%">  <input type="button"  value="submit" onclick="special_second()"></input>    </td>
                </tr>

            </form>
        </table>
        <table width="1000" height="480" border="0" bgcolor="#ffffff">
            <tr><td><h2>Student Information:</h2></td></tr>


            <tr><td width="35%" bgcolor="#D4EAA9" >Admission No</td>
                <td bgcolor="#D2D7D3" width="50%">
                    <input type="text" style="width:100px;" name="AaddNo" id="AaddNo">
                </td>              
            </tr> 

            <tr><td bgcolor="#D4EAA9" >Student Name</td>
                <td bgcolor="#D2D7D3" > 
                    <input type="text" style="width:100px;" name="Name" id="Name">
                </td>
            </tr> 

            <tr><td bgcolor="#D4EAA9" >Middle Name</td>
                <td bgcolor="#D2D7D3" >
                    <input type="text" style="width:100px;" name="Middle_Name" id="Middle_Name">
                </td>        
            </tr>     

            <tr><td bgcolor="#D4EAA9" >Last Name</td>
                <td bgcolor="#D2D7D3">
                    <input type="text" style="width:100px;" name="Last_Name" id="Last_Name">
                </td>      
            </tr>           

            <tr><td bgcolor="#D4EAA9" >DOB</td>
                <td bgcolor="#D2D7D3"> 
                    <input type="text" style="width:100px;" name="DOB" id="DOB">
                </td>           
            </tr>          

            <tr><td  bgcolor="#D4EAA9" >Father Name</td>
                <td bgcolor="#D2D7D3"> 
                    <input type="text" style="width:100px;" name="Father_Name" id="Father_Name">
                </td>            
            </tr>

            <tr><td  bgcolor="#D4EAA9" >Mother Name</td>
                <td bgcolor="#D2D7D3"> 
                    <input type="text" style="width:100px;" name="Mother_Name" id="Mother_Name">
                </td>
            </tr>

            <tr><td  bgcolor="#D4EAA9" >Admission Date</td>
                <td bgcolor="#D2D7D3"> 
                    <input type="text" style="width:100px;" name="Admission_Date" id="Admission_Date">
                </td>
            </tr>

            <tr><td  bgcolor="#D4EAA9" >Admission Mode</td>
                <td bgcolor="#D2D7D3">
                    <input type="text" style="width:100px;" name="Admission_Mode" id="Admission_Mode">
                </td>           
            </tr>

            <tr><td  bgcolor="#D4EAA9" >Class</td>
                <td bgcolor="#D2D7D3">
                    <input type="text" style="width:100px;" name="Class1" id="Class1">
                </td>           
            </tr>

            <tr><td  bgcolor="#D4EAA9" >Section</td>
                <td bgcolor="#D2D7D3">
                    <input type="text" style="width:100px;" name="Section1" id="Section1">
                </td>           
            </tr>

            <tr><td  bgcolor="#D4EAA9" >School</td>
                <td bgcolor="#D2D7D3">
                    <input type="text" style="width:100px;" name="School" id="School">
                </td>           
            </tr>

            <tr><td  bgcolor="#D4EAA9" >Year</td>
                <td bgcolor="#D2D7D3">
                    <input type="text" style="width:100px;" name="Year" id="Year">
                </td>           
            </tr>
</table>
</div>
</body>
</html>
