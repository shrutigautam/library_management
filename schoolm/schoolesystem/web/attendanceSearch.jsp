<%-- 
    Document   : attendanceSearch
    Created on : Feb 4, 2017, 5:25:14 PM
    Author     : Saumya Joshi
--%>

<%@page import="java.io.FileInputStream"%>
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
            #fs{
                border:none;
            }
            #side-nav, #main-content {float:left;}
            
            #head_div{
                 position: absolute;
                 top: 178px;
                 right: 300px;
                 width: 600px;
                 height: 110px;
                 border: 3px solid #d0d0d0;
                 
            }    
            
            #tab_div{
                 position: absolute;
                 top: 300px;
                 right: 300px;
                 width: 600px;
                 height: 400px;
                 border: 3px solid #d0d0d0;
                 overflow: scroll;
            }    
            #session_lab{
                 position: absolute;
                 top: 5px;
                 right: 530px;
            }
            #session1_sel{
                position: absolute;
                 top: 5px;
                 right: 410px;
                 width:85px;
            }
            #class_lab{
                 position: absolute;
                 top: 40px;
                 right:  545px;
            }
            #class1_sel{
                 position: absolute;
                 top: 40px;
                 right: 410px;
                 width:85px;
            }
            #section_lab{
                 position: absolute;
                 top: 75px;
                 right:  530px;
            }
            #section1_sel{
                 position: absolute;
                 top: 75px;
                 right:  410px;
                 width:85px;
            }
            #from_date_lab{
                 position: absolute;
                 top: 5px;
                 right:  290px; 
            }
            #date1{
                 position: absolute;
                 top: 5px;
                 right:  170px; 
            }
           
            #to_date_lab{
                 position: absolute;
                 top: 45px;
                 right:  315px; 
            }
             #date2{
                 position: absolute;
                 top: 45px;
                 right:  170px;
            }
            #ajaxPdf_button{
                 position: absolute;
                 top: 5px;
                 right:  50px;
                 width:85px;
                 
                 color:#fff;
                 border-style:none;
                 background: -webkit-linear-gradient(lightblue, blue); /* For Safari 5.1 to 6.0 */
                 background: -o-linear-gradient(lightblue, blue); /* For Opera 11.1 to 12.0 */
                 background: -moz-linear-gradient(lightblue, blue); /* For Firefox 3.6 to 15 */
                 background: linear-gradient(lightblue, blue); /* Standard syntax (must be last) */
            }
            #ajaxXcel_button{
                  position: absolute;
                 top: 40px;
                 right:  50px;
                 width:85px;
                 
                 color:#fff;
                 border-style:none;
                 background: -webkit-linear-gradient(lightblue, blue); /* For Safari 5.1 to 6.0 */
                 background: -o-linear-gradient(lightblue, blue); /* For Opera 11.1 to 12.0 */
                 background: -moz-linear-gradient(lightblue, blue); /* For Firefox 3.6 to 15 */
                 background: linear-gradient(lightblue, blue); /* Standard syntax (must be last) */
            }
            #ajaxShow_button{
                  position: absolute;
                 top: 75px;
                 right:  50px;
                 width:85px;
                 
                 color:#fff;
                 border-style:none;
                 background: -webkit-linear-gradient(lightblue, blue); /* For Safari 5.1 to 6.0 */
                 background: -o-linear-gradient(lightblue, blue); /* For Opera 11.1 to 12.0 */
                 background: -moz-linear-gradient(lightblue, blue); /* For Firefox 3.6 to 15 */
                 background: linear-gradient(lightblue, blue); /* Standard syntax (must be last) */
            }
        </style>
        <script>
            var a,count=0;
            function ajaxShow(){
            var session1_val=document.getElementById("session1_sel").value;
            var class1_val=document.getElementById("class1_sel").value;
            var section1_val=document.getElementById("section1_sel").value;
            var date1_val=document.getElementById("date1").value;
            var date2_val=document.getElementById("date2").value;  
            if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","attendanceShow?session1_val="+session1_val+"&class1_val="+class1_val+"&section1_val="+section1_val+"&date1_val="+date1_val+"&date2_val="+date2_val+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str1=req.responseText; 
                var res =str1.split(",");
                
                
                a="<table><tr><th>Serial No.</th><th>Roll No</th><th>Name</th><th>Admission No.</th><th>Status</th></tr><tr>"
                a=a+"<td>"+res[0]+"</td>";
                count++;
                for(var i=1;i<res.length-1;i++){
                a=a+"<td>"+res[i]+"</td>";
                count++;
                if((count)%5==0)
                    a=a+"</tr><tr>"
                  }
                   document.getElementById("tab_div1").innerHTML=a;
    
        }
    }}    
        </script>
        <script>
            
            function ajaxPdf(){
              
          
            var session1_val=document.getElementById("session1_sel").value;
            var class1_val=document.getElementById("class1_sel").value;
            var section1_val=document.getElementById("section1_sel").value;
            var date1_val=document.getElementById("date1").value;
            var date2_val=document.getElementById("date2").value;  
            if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","First_Report?session1_val="+session1_val+"&class1_val="+class1_val+"&section1_val="+section1_val+"&date1_val="+date1_val+"&date2_val="+date2_val+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str2=req.responseText; 
              //  alert("Download: http://localhost:8080/schoolesystem/DownloadServlet");
                if(window.confirm("would you like to download?")){
                    window.location.href="http://localhost:8080/schoolesystem/DownloadServlet"
                }      
        }
    }
   
 
}    
        </script>
         <script>
          
            function ajaxXcel(){
            var session1_val=document.getElementById("session1_sel").value;
            var class1_val=document.getElementById("class1_sel").value;
            var section1_val=document.getElementById("section1_sel").value;
            var date1_val=document.getElementById("date1").value;
            var date2_val=document.getElementById("date2").value;  
            if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","attendanceXcelReport?session1_val="+session1_val+"&class1_val="+class1_val+"&section1_val="+section1_val+"&date1_val="+date1_val+"&date2_val="+date2_val+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str3=req.responseText; 
               
    
        }
    }}    
        </script>
    </head>
    <body>
        <%@include file="menu_nav.jsp"  %>
      <%
        String Atndnc_Mark=(String)session.getAttribute("Atndnc_Mark");
        String Atndnc_View=(String)session.getAttribute("Atndnc_View");
         %> 
        <form name="FS">
            <%
           if(Atndnc_View.equals("0")){
            %>
            <fieldset id="fs" disabled>
            <%
            }
           else{
            %>
           <fieldset id="fs"> 
           <%    
           }
           %>
        <div id="head_div">
         
      <div id="session-select">
                        <label for="session" id="session_lab">Session</label>
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
                   
                       
      
                        <label for="class" id="class_lab">Class</label>
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
                         <label for="section" id="section_lab">Section</label>
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
                    
                        <label for="date" id="from_date_lab">From Date</label>
                        <input type="date" style="width:90px;" id="date1" name="date1" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" value=""></input>
                         
                        <label for="date" id="to_date_lab">To Date</label>
                        <input type="date" style="width:90px;" id="date2" name="date1" placeholder="dd/mm/yy" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" value=""></input>
                       
                        <input id="ajaxPdf_button" type="button" value="Pdf/Report" onclick="ajaxPdf()">
                        <input id="ajaxXcel_button" type="button" value="XcelReport" onclick="ajaxXcel()">
                        <input id="ajaxShow_button" type="button" value="Show" onclick="ajaxShow()">
         </div>
                        
     <div id="tab_div">
         <span id="tab_div1"></span>   
     </div>
                       
  </fieldset>                      
  </form>
                       
    </body>
    
</html>
