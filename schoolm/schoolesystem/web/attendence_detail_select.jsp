<%-- 
    Document   : attendence_detail_select
    Created on : Jul 6, 2016, 4:36:23 PM
    Author     : hp
--%>

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect_1.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/attendence_detail_select.css">
        <link rel="stylesheet" href="css/w3.css">
        <title>JSP Page</title>
        <script>
            function show1()
            {
              var employee=document.getElementById("faculty_code").value;
              document.getElementById("employee_name_disp").innerHTML=employee;
            }
            function show()
            {
              var subject=document.getElementById("sub_select").value;
              document.getElementById("sub_name_disp").innerHTML=subject;
            }
        </script>
        <style>
            fieldset{
                border:none;
            }
            </style>
    </head>
   
    <body>
           <%
          
           String Atndnc_Mark=(String)session.getAttribute("Atndnc_Mark");
           String Atndnc_View=(String)session.getAttribute("Atndnc_View");
         %> 
        <form action="attendanceResult.jsp">
          <%
           if(Atndnc_Mark.equals("0")){
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
        <div id="main-content">
            <div id="content-div1">
                <div id="content-div1-sub1">
                    <div id="session-select"
                         <label for="session">Session</label>
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
                    </div>
                    <div id="class-select"
                         <label for="class">Class</label>
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
                    </div>
                    <div id="section-select"
                         <label for="section">Section</label>
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
                    </div>
                </div>
                <div id="content-div1-sub2">
                    <div id="faculty-detail">
                        <label for="faculty">Faculty</label>
                         <select id="faculty_code" name="faculty_code" onChange="show1()">
                            <option value="select">Select</option>
                             <%

                         Statement fclt;
                         String query_fclt = "select * from employee_tab";
                         fclt = conn.createStatement();
                         ResultSet rs_fclt = fclt.executeQuery(query_fclt); 
                         while(rs_fclt.next())
                         {
                             %>
                        <option value="<%=rs_fclt.getString("empl_name")%>" ><%=rs_fclt.getString("empl_code")%></option>
                         <%
                         }
                         %>    
                        </select>
                        <label for="employee-code" id="employee_name_disp"></label>
                   <!--     <input id="faculty_code" name="faculty_code" type="text"></input>
                        <input id="faculty_name" name="faculty_name" type="text"></input>  -->
                    </div>
                    <div id="subject-select">
                        <label for="subject-code">Subject Code</label>
                        <select id="sub_select" name="sub_select_name" onChange="show()">
                            <option value="select">Select</option>
                             <%

                         Statement cst4;
                         String query_cst4 = "select * from subject_tab";
                         cst4 = conn.createStatement();
                         ResultSet rs_cst4 = cst4.executeQuery(query_cst4); 
                         while(rs_cst4.next())
                         {
                             %>
                        <option value="<%=rs_cst4.getString("subject_name")%>" ><%=rs_cst4.getString("subject_code")%></option>
                         <%
                         }
                         %>    
                        </select>
                       
                        <label for="subject-code" id="sub_name_disp"></label> 
                        
                    </div>
                    <div id="type-select">
                        <label for="type">Type</label>
                        <select id="select_type" name="select_type">
                            <option value="select">Select</option>
                            <option value="lab">Lab</option>
                            <option value="lecture">Lecture</option>
                        </select>
                    </div>
                </div>
            </div>

            <div id="content-div2">
                <div id="content-div2-sub1">
                    <div id="date-select">
                        <label for="date">Date</label>
                        <input type="date" id="date1" name="date1" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" value=""></input>
                    </div>
                   
                </div>

                <div id="content-div2-sub2">
                   
                    <div id="list-based-select">
                        <label for="list-based-on">List Based On</label>
                        <select id="list1_sel" name="list1_sel">
                            <option value="select">Select</option>
                            <option value="admission-num">Admission No.</option>
                            <option value="roll-num">Roll No.</option>
                            <option value="serial-num">Serial No.</option>
                        </select>
                    </div>
                </div>
                <div id="btn">
                    <input type="submit" value="SHOW STUDENTS"   id="button"></input>
                </div>
                 
            </div>
                       
        </div>
           </fieldset>
        </form>
    </body>
</html>
