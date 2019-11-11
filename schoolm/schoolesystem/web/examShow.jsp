<%-- 
    Document   : examShow
    Created on : Feb 11, 2017, 9:07:06 AM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="header.jsp"  %>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
      
        <%@include file="connect_1.jsp" %>
        <style>
            #side-nav, #main-content {float:left;}
           
        /*    #tab_div{
                position: absolute;
                top: 350px;
                right: 280px;
                width: 715px;
                height: 350px;
                border: 1px solid #c0c0c0;
            }
        */
            .abc{
               position: absolute;
                top:380px;
                left:450px;
            }
          
            .lab_class1{
                postion:absolute;
                 top:180px;
                 left:650px;
            }
            .class1{
                postion:absolute;
                top:180px;
                left:710px;
            }
            .lab_section1{
                postion:absolute;
            }
            .section1{
                postion:absolute;
            }
            .lab_subject1{
                postion:absolute;
            }
            .subject1{
                postion:absolute;
            }
            .lab_date1{
                 postion:absolute;
            }
            .lab_faculty1{
                 postion:absolute;
            }
            .faculty{
                 postion:absolute;
            }
            
           
        </style>
        <script>
            var a, count = 0;
            function ajaxShow() {
                var session1_val = document.getElementById("session1_sel").value;
                var class1_val = document.getElementById("class1_sel").value;
                var section1_val = document.getElementById("section1_sel").value;
                var subject1_sel = document.getElementById("subject1_sel").value;
                var date1 = document.getElementById("date1").value;
                var faculty1_sel = document.getElementById("faculty1_sel").value;

                if (window.XMLHttpRequest) {
                    req = new XMLHttpRequest();
                }
                else {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET", "ResultDisplay?session1_val=" + session1_val + "&class1_val=" + class1_val + "&section1_val=" + section1_val + "&date1_val=" + date1 + "&subject1_sel=" + subject1_sel + "&faculty1_sel=" + faculty1_sel + "&TyM=" + new Date(), true);
                req.send();
                req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                        var str1 = req.responseText;
                        var res = str1.split(",");


                        a = "<table><tr><th>Serial No.</th><th>Roll No</th><th>Name</th><th>Admission No.</th><th>MARKS</th></tr><tr>"
                        a = a + "<td>" + res[0] + "</td>";
                        count++;
                        for (var i = 1; i < res.length - 1; i++) {
                            a = a + "<td>" + res[i] + "</td>";
                            count++;
                            if ((count) % 5 == 0)
                                a = a + "</tr><tr>"
                        }
                        document.getElementById("tab_div1").innerHTML = a;

                    }
                }
            }
        </script>
        <script>

            function ajaxPdf() {
                var session1_val = document.getElementById("session1_sel").value;
                var class1_val = document.getElementById("class1_sel").value;
                var section1_val = document.getElementById("section1_sel").value;
                var date1_val = document.getElementById("date1").value;
                var date2_val = document.getElementById("date2").value;
                if (window.XMLHttpRequest) {
                    req = new XMLHttpRequest();
                }
                else {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET", "First_Report?session1_val=" + session1_val + "&class1_val=" + class1_val + "&section1_val=" + section1_val + "&date1_val=" + date1_val + "&date2_val=" + date2_val + new Date(), true);
                req.send();
                req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                        var str2 = req.responseText;
                        document.getElementById("tab_div2").innerHTML = str2;

                    }
                }
            }
        </script>
        <script>

            function ajaxXcel() {
                var session1_val = document.getElementById("session1_sel").value;
                var class1_val = document.getElementById("class1_sel").value;
                var section1_val = document.getElementById("section1_sel").value;
                var date1_val = document.getElementById("date1").value;
                var date2_val = document.getElementById("date2").value;
                if (window.XMLHttpRequest) {
                    req = new XMLHttpRequest();
                }
                else {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET", "attendanceXcelReport?session1_val=" + session1_val + "&class1_val=" + class1_val + "&section1_val=" + section1_val + "&date1_val=" + date1_val + "&date2_val=" + date2_val + new Date(), true);
                req.send();
                req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                        var str3 = req.responseText;


                    }
                }
            }
        </script>
    </head>
    <body>
        <%@include file="exam_menu_nav.jsp"  %>
       
            
                <form name="FM">
                  
                    <input type="text" class="abc">
                   <label for="session" class="def"></la>
                    
                    <select id="session1_sel" name="session1_sel" class="session1">
                            <option value="select">Select</option>
                            <%                                Statement cst1;
                                String query_cst1 = "select * from session_tab";
                                cst1 = conn.createStatement();
                                ResultSet rs_cst1 = cst1.executeQuery(query_cst1);
                                while (rs_cst1.next()) {
                            %>
                            <option value="<%=rs_cst1.getString(1)%>" ><%=rs_cst1.getString(2)%></option>
                            <%
                                }
                            %>
                    </select>
                          <label for="class" class="lab_class1">Class</label>
                        <select id="class1_sel" name="class1_sel" class="class1">
                            <option value="select">Select</option>
                            <%
                                Statement cst2;
                                String query_cst2 = "select * from class_tab";
                                cst2 = conn.createStatement();
                                ResultSet rs_cst2 = cst2.executeQuery(query_cst2);
                                while (rs_cst2.next()) {
                            %>
                            <option value="<%=rs_cst2.getString(1)%>" ><%=rs_cst2.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                   

                   
                        <label for="section" class="lab_section1">Section</label>
                        <select id="section1_sel" name="section1_sel" class="section1">
                            <option value="select">Select</option>
                            <%
                                Statement cst3;
                                String query_cst3 = "select * from section_tab";
                                cst3 = conn.createStatement();
                                ResultSet rs_cst3 = cst3.executeQuery(query_cst3);
                                while (rs_cst3.next()) {
                            %>
                            <option value="<%=rs_cst3.getString(1)%>" ><%=rs_cst3.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                   
               

               
                    
                        <label for="subject" class="lab_subject1">Subject</label>
                        <select id="subject1_sel" name="subject1_sel" class="subject1">
                            <option value="select">Select</option>
                            <%
                                Statement sub;
                                String query_sub = "select * from subject_tab";
                                sub = conn.createStatement();
                                ResultSet rs_sub = sub.executeQuery(query_sub);
                                while (rs_sub.next()) {
                            %>
                            <option value="<%=rs_sub.getString(1)%>" ><%=rs_sub.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                 

                 
                        <label for="date" class="lab_date1">Date</label>
                        <input type="date" class="date1"  style="width:100px; margin-left: 40px;" id="date1" name="date1" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" value=""></input>
                  
                   
                        <label for="faculty" class="lab_faculty1">Faculty</label>
                        <select id="faculty1_sel" name="faculty1_sel" class="faculty1">
                            <option value="select">Select</option>
                            <%
                                Statement fac;
                                String query_fac = "select * from employee_tab";
                                fac = conn.createStatement();
                                ResultSet rs_fac = fac.executeQuery(query_fac);
                                while (rs_fac.next()) {
                            %>
                            <option value="<%=rs_fac.getString(1)%>" ><%=rs_fac.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                   
              
              
                    <input type="button" value="Pdf/Report" id="button" onclick="ajaxPdf()">
              
                    <input type="button" value="XcelReport" id="button" onclick="ajaxXcel()">
               
                
                    <input type="button" value="Show" id="button" onclick="ajaxShow()">

                     
                  
                 
                </form>
               
    
    </body>
</html>
