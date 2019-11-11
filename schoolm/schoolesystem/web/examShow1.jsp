<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="header.jsp"  %>
        <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
        <link rel="stylesheet" type="text/css" href="css/marksUpdate.css" />
        <%@include file="connect_1.jsp" %>
        <style>
            #side-nav, #main-content {float:left;}
            
            #head_div{
                 position: absolute;
                 top: 178px;
                 right: 300px;
                 width: 600px;
                 height: 125px;
                 border: 3px solid #d0d0d0;
            }    
            
            .lab_session1{
                 position: absolute;
                 top:180px;
                 left:450px;
            }
            .session1{
                 position: absolute;
                 top:180px;
                 left:520px;
                 width:110px;
            }
            .lab_class1{
                 position: absolute;
                 top:180px;
                 left:650px;
            }
            .class1{
                 position: absolute;
                 top:180px;
                 left:710px;
                  width:110px;
            }
            .lab_section1{
                position: absolute;
                top:180px;
                left:830px;
            }
            .section1{
                position: absolute;
                top:180px;
                left:920px;
                 width:110px;
            }
            .lab_subject1{
                 position: absolute;
                 top:230px;
                 left:450px;
            }
            .subject1{
                 position: absolute;
                 top:230px;
                 left:520px;
                 width:110px;
                 
            }
            
            .lab_faculty1{
                 position: absolute;
                 top:230px;
                 left:650px;
            }
            .faculty1{
                 position: absolute;
                 top:230px;
                 left:710px;
                  width:110px;
            }
            .lab_exam{
                 position: absolute;
                 top:230px;
                 left:830px;
            }
            .exam1{
                 position: absolute;
                 top:230px;
                 left:920px;
                  width:110px;
            }
             .sub_button{
                position: absolute;
                left:450px;
                bottom:425px;
                
                background: #347ed9;
                background-image: -webkit-linear-gradient(top, #347ed9, #2980b9);
                background-image: -moz-linear-gradient(top, #347ed9, #2980b9);
                background-image: -ms-linear-gradient(top, #347ed9, #2980b9);
                background-image: -o-linear-gradient(top, #347ed9, #2980b9);
                background-image: linear-gradient(to bottom, #347ed9, #2980b9);
                -webkit-border-radius: 7;
                -moz-border-radius: 7;
                border-radius: 7px;
                font-family: Arial;
                color: #ffffff;
                font-size: 15px;
                padding: 8px 16px 8px 16px;
                text-decoration: none;
               }
            .sub_button:hover{
              background: #3cb0fd;
              background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
              background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
              background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
              background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
              background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
              text-decoration: none;
               }

  .sub_button2{
                position: absolute;
                left:650px;
                bottom:425px;
                
                background: #347ed9;
  background-image: -webkit-linear-gradient(top, #347ed9, #2980b9);
  background-image: -moz-linear-gradient(top, #347ed9, #2980b9);
  background-image: -ms-linear-gradient(top, #347ed9, #2980b9);
  background-image: -o-linear-gradient(top, #347ed9, #2980b9);
  background-image: linear-gradient(to bottom, #347ed9, #2980b9);
  -webkit-border-radius: 7;
  -moz-border-radius: 7;
  border-radius: 7px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  padding: 8px 16px 8px 16px;
  text-decoration: none;
            }
            .sub_button2:hover{
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}

  .sub_button3{
                position: absolute;
                left:850px;
                bottom:425px;
                
                background: #347ed9;
  background-image: -webkit-linear-gradient(top, #347ed9, #2980b9);
  background-image: -moz-linear-gradient(top, #347ed9, #2980b9);
  background-image: -ms-linear-gradient(top, #347ed9, #2980b9);
  background-image: -o-linear-gradient(top, #347ed9, #2980b9);
  background-image: linear-gradient(to bottom, #347ed9, #2980b9);
  -webkit-border-radius: 7;
  -moz-border-radius: 7;
  border-radius: 7px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  padding: 8px 16px 8px 16px;
  text-decoration: none;
            }
            .sub_button3:hover{
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
 #tab_div{
                position: absolute;
                top: 350px;
                left:450px;
                width: 715px;
                height: 350px;
                border: 1px solid #c0c0c0;
            }
                    
    #fs1{
            border: none;
            }  
        </style>
  <script>
            var a, count = 0;
     
    
      function ajaxShow() {
          
               var session1_val = document.getElementById("session1_sel").value;
                var class1_val = document.getElementById("class1_sel").value;
                var section1_val = document.getElementById("section1_sel").value;
                var subject1_sel = document.getElementById("subject1_sel").value;
                
                var faculty1_sel = document.getElementById("faculty").value;
                var exam_code = document.getElementById("examCode").value;
               
              
         //   document.getElementById("tab_div1").innerHTML = session1_val+","+class1_val+","+section1_val+","+subject1_sel+","+faculty1_sel+","+exam_code;
               if (window.XMLHttpRequest) {
                    req = new XMLHttpRequest();
                }
                else {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET", "ResultDisplay?session1_val=" + session1_val + "&class1_val=" + class1_val + "&section1_val=" + section1_val + "&exam_code=" + exam_code + "&subject1_sel=" + subject1_sel + "&faculty1_sel=" + faculty1_sel + "&TyM=" + new Date(), true);
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
      <%
       String Exam_ViewResult=(String)session.getAttribute("Exam_ViewResult"); 
      %>
      <form>
            
     <div id="main-content">
         
     <%
           if(Exam_ViewResult.equals("0")){
            %>
            <fieldset id="fs1" disabled>
            <%
            }
           else{
            %>
           <fieldset id="fs1"> 
           <%    
           }
           %>
      
                        <label for="session" class="lab_session1">Session</label>
                        <select id="session1_sel" name="session1_sel" class="session1">
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
                   
                       
      
                        <label for="class" class="lab_class1">Class</label>
                        <select id="class1_sel" name="class1_sel" class="class1">
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
                        <label for="section" class="lab_section1">Section</label>
                        <select id="section1_sel" name="section1_sel" class="section1">
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
                    
                    
                        <label for="exam_code" name="exam_code" class="lab_exam">Exam Code</label>
                       
                         <select id="examCode" name="examCode" class="exam1" onchange="chngsub()">
                         <option value="select">Select</option>
                         <%

                         Statement exmC1;
                        
                         String query_exmC1 = "select * from exam_tab";
                         exmC1 = conn.createStatement();
                         ResultSet rs_exmC1 = exmC1.executeQuery(query_exmC1); 
                         while(rs_exmC1.next())
                         {
                         %>
                         <option value="<%=rs_exmC1.getString("exam_code")%>" ><%=rs_exmC1.getString("exam_code")%></option>
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
                        
                        
                        
                        
                        
                        
            <!--            <label for="date">Date</label>
                        <input type="date" style="width:90px;" id="date1" name="date1" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" value=""></input>
                         -->
                        <label for="faculty" class="lab_faculty1">Faculty</label>
                       
                        <select id="faculty" name="faculty" class="faculty1">
                        <option value="select">Select</option>
                         <%

                         Statement fac1;
                        
                         String query_fac1 = "select * from employee_tab";
                         fac1 = conn.createStatement();
                         ResultSet rs_fac1 = fac1.executeQuery(query_fac1); 
                         while(rs_fac1.next())
                         {
                        %>
                        <option value="<%=rs_fac1.getString(1)%>" ><%=rs_fac1.getString(2)%></option>
                         <%
                         }
                         %>
                        </select>
                        
                        
                        
                        
                       
                    
                        <input type="button" value="Pdf/Report" class="sub_button" onclick="ajaxPdf()">
                        <input type="button" value="Excel/Report" class="sub_button2" onclick="ajaxXcel()">
                        <input type="button" value="View" class="sub_button3" onclick="ajaxShow()">
                      
         
                        
        <div id="tab_div">
            <span id="tab_div1"></span>   
        </div>  
  </fieldset>                      
  </form>
    </body>
    
</html>
