<%-- 
    Document   : ID2
    Created on : Apr 18, 2017, 4:38:45 PM
    Author     : Vermas
--%>

<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%> 
<link rel="stylesheet" type="text/css" href="css/dashboard.css" />
<%@include file="connect_1.jsp" %>
<!DOCTYPE html>
 <link rel="stylesheet" href="css/studentdetail.css">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #table_div{
                 position: absolute;
                 top: 178px;
                 right: 500px;
                 width: 460px;
                 height: 400px;
                 border: 3px solid #d0d0d0;
                 overflow: scroll;
            }    
            #button_pdf{
                 position: absolute;
                 top: 600px;
                 right: 800px;
                 
                
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
            #button_pdf:hover{
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
            function aPdf(a){
             
             
                
        var adm=[];
        var b=[];
        adm=a.split(",");
                var t=0;
                for(t=0;t<adm.length;t++)
                {
                    if(document.getElementById(adm[t]).checked)
                    {  
                        b.push(document.getElementById(adm[t]).value);
                    }
                
                }  
        if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","First_Report_Id?&b="+b,true);
                req.send();  
        
        
        }
        </script>
      
          
    </head>
    
    <body id="bID">
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
          
         <span id="present_students"></span>        
         <div id="table_div">
             
              <% 
            String session2=request.getParameter("session1_sel");
            String class2=request.getParameter("class1_sel");
            String section2=request.getParameter("section1_sel");
            ArrayList<String> arr1=new ArrayList<String>(); 
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            Statement stmt=con.createStatement();
            
               String query2="select Admission_No, Student_Name, Middle_Name, Last_Name, Father_Name FROM admission_tab WHERE Year='"+session2+"' AND Class='"+class2+"' AND Section='"+section2+"' ";
               ResultSet rs = stmt.executeQuery(query2);
               int i=0,count=0;
              while(rs.next())
                 {
                arr1.add(rs.getString(1)+","+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+","+rs.getString(5));    
                arr1.add(",");
                i++;
                count++;
                 }
             String arr_str=arr1.toString();
           
            out.println("<b>strength:</b> "+count);
       
            String [][]matrix1=new String[i][3];
           
            int t=0,g=0;
            StringBuilder builder = new StringBuilder();
            for (String value : arr1) {
            builder.append(value);
            }
            String text = builder.toString();
            String []res=text.split(",");
             int l=0;
            for(int m=0;m<i;m++){
             for(int n=0;n<3;n++){
                 if(l<res.length){
                 matrix1[m][n]=res[l];
                }
                else
                break;
                l++;
                }
            }
            
        int i1,j1;
          ArrayList<String> matrix2=new ArrayList<String>(); 
        for(i1=0;i1<i;i1++)
        {
           matrix2.add(matrix1[i1][0]);
           if(i1<i-1)
           matrix2.add(",");
        }
       StringBuilder builder2 = new StringBuilder();
            for (String value : matrix2) {
            builder2.append(value);
            }
            String text2 = builder2.toString();
            out.print("<table  bgcolor=\"#d0d0d0\">");
            out.print("<tr><th>AdmissionNo.</th><th>Name</th><th>Father's Name</th><th>Status</th></tr>");
            for(i1=0;i1<i;i1++){
            out.print("<tr>");    
            for(j1=0;j1<3;j1++){
            out.print("<td>"+"    "+matrix1[i1][j1]+"   "+"</td>");
            }
            out.println("<td><input type=\"checkbox\" value="+matrix1[i1][0]+" name=\"check\" id="+matrix1[i1][0]+"></td>");
            out.println("</tr>");
            }
            out.print("</table>");
          %>
        
         </div>
              <input type="button" value="Generate Id Cards" id="button_pdf" onclick="aPdf('<%= text2%>')">
<span id="success_insert"></span>
</body>
</html>