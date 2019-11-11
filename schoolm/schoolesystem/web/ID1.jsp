<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="header.jsp"  %>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <%@include file="connect_1.jsp" %>
        <link rel="stylesheet" href="css/studentdetail.css">
         
     </head>
     <body>
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
           <div id="side-nav">
            <div id="nav-list">
                <h2>Side Navigation</h2>
                <nav>
                    <ul class="nav-list">
                        
                        
                        <li><a href="ID3.jsp">Generate Employee ID</a></li>
                        <hr>
                        <li><a href="ID1.jsp">Generate Student ID</a></li>
                       


                    </ul>
                </nav>
            </div>
        </div>
 <div id="main-content" style=" overflow:auto;">
                            
            <table width="1000" height="80" border="0" bgcolor="#ffffff">
            <h1>Search:</h1>
               <form action="ID2.jsp">
                <tr><td width="35%" bgcolor="#D4EAA9"><label>Session</label></td>
                    <td bgcolor="#D2D7D3" width="50%">
                        <select id="session1_sel" name="session1_sel">
                            <option value="select">Select</option>
                            <%

                         Statement cst1;
                         String query_cst1 = "select * from session_tab";
                         cst1 = conn.createStatement();
                         ResultSet rs_cst1 = cst1.executeQuery(query_cst1); 
                         while(rs_cst1.next())
                         {
                             %>
                        <option value="<%=rs_cst1.getString(1)%>" ><%=rs_cst1.getString(2)%></option>
                            <%
                         }
                         %>
                        </select>
                           

                    </td></tr>
                
                
                 <tr><td width="35%" bgcolor="#D4EAA9"><label>Class</label></td>
                    <td bgcolor="#D2D7D3" width="50%">
                         <select id="class1_sel" name="class1_sel">
                            <option value="select">Select</option>
                             <%

                         Statement cst2;
                         String query_cst2 = "select * from class_tab";
                         cst2 = conn.createStatement();
                         ResultSet rs_cst2 = cst2.executeQuery(query_cst2); 
                         while(rs_cst2.next())
                         {
                             %>
                        <option value="<%=rs_cst2.getString(1)%>" ><%=rs_cst2.getString(2)%></option>
                            <%
                         }
                         %>
                        </select>
                           

                    </td></tr>
                  <tr><td width="35%" bgcolor="#D4EAA9"><label>Section</label></td>
                    <td bgcolor="#D2D7D3" width="50%">
                       
                        
                        <select id="section1_sel" name="section1_sel">
                            <option value="select">Select</option>
                             <%

                         Statement cst3;
                         String query_cst3 = "select * from section_tab";
                         cst3 = conn.createStatement();
                         ResultSet rs_cst3 = cst3.executeQuery(query_cst3); 
                         while(rs_cst3.next())
                         {
                             %>
                        <option value="<%=rs_cst3.getString(1)%>" ><%=rs_cst3.getString(2)%></option>
                            <%
                         }
                         %>
                        </select>
                    
                           

                    </td></tr>
                 
                 

                <tr>  
                    <td width="35%" bgcolor="#D4EAA9">
                    </td>
                    <td bgcolor="#D2D7D3" width="50%">  <input type="submit"  value="Show"></input>    </td>
                </tr>

            </form>
        </table>
                        </div>
                       
       
                        

    </body>       
</html>
    
         