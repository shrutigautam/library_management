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
            #fs1{
            border: none;
            } 
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
            }
            .lab_section1{
                 position: absolute;
                 top:180px;
                 left:810px;
            }
            .section1{
                 position: absolute;
                 top:180px;
                 left:870px;
            }
            .lab_exam{
                 position: absolute;
                 top:180px;
                 left:970px;
            }
            .exam1{
                 position: absolute;
                 top:180px;
                 left:1070px;
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
            }
            .lab_list1{
                 position: absolute;
                 top:230px;
                left:970px;
            }
            .list1{
                 position: absolute;
                 top:230px;
                left:1070px;
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
  
        </style>
        <script>
            function chngsub(){
                
                var session1= document.getElementById("session1_sel").value;
                var class1= document.getElementById("class1_sel").value;
                var ExamCode= document.getElementById("examCode").value;
            
                var str1; 
                if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","ExamSubSelect?ExamCode="+ExamCode+"&session1="+session1+"&class1="+class1+"&TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                str1=req.responseText;
                
                var res1 = str1.split(" ");
               
                 var sel = document.getElementById('subject_1');
                 
             //    for(var i = 0; i < (res1.length-1)/2; i++) {
             //    alert("Hi"+res1[i+(res1.length-1)/2]+"length:"+(res1.length-1)/2);
             //    }
  
                 
                 for(var i = 0; i < (res1.length-1)/2; i++) {
                 var opt = document.createElement('option');
                 opt.innerHTML = res1[i+(res1.length-1)/2];
                 opt.value = res1[i];
                 sel.appendChild(opt);
}
        }
  
    }

}
function showsub(){
  //  alert(document.getElementById("subject_1").value);
}
        
    
        </script>    
        </head>
     <body>
     <%@include file="exam_menu_nav.jsp"  %>
     <div id="main-content">
     <%
      String Exam_upload_marks=(String)session.getAttribute("Exam_upload_marks");
      String TYPE=(String)session.getAttribute("TYPE");
      String USERNAME=(String)session.getAttribute("USERNAME");
     %>    
      <form action="marksDisplay.jsp">
      <%
           if(Exam_upload_marks.equals("0")){
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
                        
                        <label for="subject" class="lab_subject1" >Subject</label>
                       
                        <select id="subject_1" name="subject_1" class="subject1" onchange="showsub()">
                            <option></option>
                         </select>
                        
                        
                        
                        
                        
                        
            <!--            <label for="date">Date</label>
                        <input type="date" style="width:90px;" id="date1" name="date1" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" value=""></input>
                         -->
                        <label for="faculty" class="lab_faculty1">Faculty</label>
                        <%
                       if(TYPE.equals("employee")){
                        %>
                       <input type="text" id="faculty" name="faculty" class="faculty1" value="<%=USERNAME%>">
                       <%
                        }
                        else{
            %>
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
           <%    
           }
           %>
                        
                        
                        
                        
                        
                        <label for="list-based-on" class="lab_list1">List Based On</label>
                        <select id="list1_sel" name="list1_sel" class="list1">
                            <option value="select">Select</option>
                            <option value="admission-num">Admission No.</option>
                            <option value="roll-num">Roll No.</option>
                            <option value="serial-num">Serial No.</option>
                        </select>
                    
                        <input type="submit" value="Submit" class="sub_button">
           </fieldset>
                        </form>
         
                        
         
  
    </body>
    
</html>
