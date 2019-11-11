<%-- 
    Document   : marksDisplay
    Created on : Feb 10, 2017, 11:00:05 AM
    Author     : Saumya Joshi
--%>

<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"  %> 
<!--<link rel="stylesheet" type="text/css" href="css/dashboard.css" />-->
<%@include file="connect_1.jsp" %>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #table_div{
                 position: absolute;
                 top: 178px;
                 right: 500px;
                 width: 500px;
                 height: 400px;
                 border: 3px solid #d0d0d0;
            }    
            #present_students{
                position: absolute;
                top:204px;
                right:680px;
                
            }
        </style>
       
        <script>
            var MARKS=[];
            var MARKS2=[];
            function changeStatusSNO(id){
            var x=document.getElementById(id).value;    
            if(MARKS.hasOwnProperty(id))
            delete MARKS[id];
            MARKS[id]=x;
           
                
            if(MARKS2.hasOwnProperty(id))
            delete MARKS2[id];
            MARKS2[id]=id;
           
            } 
            function changeStatusRNO(id){
            var x=document.getElementById(id).value;    
            if(MARKS.hasOwnProperty(id))
            delete MARKS[id];
            MARKS[id]=x;
            
            if(MARKS2.hasOwnProperty(id))
            delete MARKS2[id];
            MARKS2[id]=id;
            } 
            function changeStatusADM(id){
            var x=document.getElementById(id).value;    
            if(MARKS.hasOwnProperty(id))
            delete MARKS[id];
            MARKS[id]=x;
            
            if(MARKS2.hasOwnProperty(id))
            delete MARKS2[id];
            MARKS2[id]=id;
            }  
        </script>
      <script>
        var i=0;
        
        function ajaxExamSubmit(count){
        var session1_val1=document.getElementById("session1_hidden").value 
        var class1_val=document.getElementById("class1_hidden").value 
        var section1_val=document.getElementById("section1_hidden").value 
        var faculty_code_val=document.getElementById("faculty_code_hidden").value 
        var date1_val=document.getElementById("date1_hidden").value
        var subject_1=document.getElementById("subject_hidden").value
        var examCode_1=document.getElementById("examCode_hidden").value
        var all_data=document.getElementById("all_data").value 
        var text2 = "";
        var text22 = "";
        var y, y2;
        for (y in MARKS) {
        text2 += MARKS[y]+",";
        }
        for (y2 in MARKS2) {
        text22 += MARKS2[y2]+",";
        }
        if(window.XMLHttpRequest){
                req=new XMLHttpRequest();
            }
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","ExamResult?session1_val="+session1_val1+"&class1_val="+class1_val+"&section1_val="+section1_val+"&faculty_code_val="+faculty_code_val+"&date1_val="+date1_val+"&subject_1="+subject_1+"&examCode_1="+examCode_1+"&all_data="+all_data+"&MARKS="+text2+"&MARKS2="+text22+"&count="+count+"&TiMe="+ new Date(),true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str1=req.responseText;
                showPOP(req.responseText,"OK");
                }}}    
    </script>
    </head>
    <body id="bID">
        
         <%@include file="exam_menu_nav.jsp"  %>
               
         <div id="table_div">
      
<%!

public static String[][] mysort(String[][] sum)  {
   
    Arrays.sort(sum, new Comparator<String[]>() {
           public int compare(String[] s1, String[] s2) {
           String numOfKeys1 = s1[1];
           String numOfKeys2 = s2[1];
           return numOfKeys1.compareTo(numOfKeys2);
            }
        });
   
   
  return (sum);
}

%>

<%!

public static String[][] mysort2(String[][] sum)  {
   
    Arrays.sort(sum, new Comparator<String[]>() {
           public int compare(String[] s1, String[] s2) {
           String numOfKeys1 = s1[0];
           String numOfKeys2 = s2[0];
           return numOfKeys1.compareTo(numOfKeys2);
            }
        });
   
   
  return (sum);
}

%>
<%!

public static String[][] mysort3(String[][] sum)  {
   
    Arrays.sort(sum, new Comparator<String[]>() {
           public int compare(String[] s1, String[] s2) {
           String numOfKeys1 = s1[3];
           String numOfKeys2 = s2[3];
           return numOfKeys1.compareTo(numOfKeys2);
            }
        });
   
   
  return (sum);
}

%>

<%
            String session1_sel=request.getParameter("session1_sel");
            String class1_sel=request.getParameter("class1_sel");
            String section1_sel=request.getParameter("section1_sel");
            String subject_1=request.getParameter("subject_1");
            String examCode=request.getParameter("examCode");
            String date1=request.getParameter("date1");
            String faculty=request.getParameter("faculty");
            String list1_sel=request.getParameter("list1_sel");
          
%>  
         <input type="hidden" id="session1_hidden" value="<%= session1_sel %>">
         <input type="hidden" id="class1_hidden" value="<%= class1_sel %>">
         <input type="hidden" id="section1_hidden" value="<%= section1_sel %>">
         <input type="hidden" id="faculty_code_hidden" value="<%= faculty %>">
         <input type="hidden" id="date1_hidden" value="<%= date1 %>">
         <input type="hidden" id="subject_hidden" value="<%= subject_1 %>">
         <input type="hidden" id="examCode_hidden" value="<%= examCode %>">
         <%
            Statement s1;
            String query_s1 = "select admission_tab.Admission_No, admission_tab.Student_Name, admission_tab.Middle_Name, admission_tab.Last_Name, personal_info.std_rollno FROM admission_tab INNER JOIN personal_info ON admission_tab.Admission_No=personal_info.admission_no WHERE admission_tab.Year='"+session1_sel+"' AND admission_tab.Class='"+class1_sel+"' AND admission_tab.Section='"+section1_sel+"' ";
            s1 = conn.createStatement();
            ResultSet rs_s1 = s1.executeQuery(query_s1); 
            ArrayList<String> arr=new ArrayList<String>();
            int i=1,count=0;
            while(rs_s1.next())
            {
            arr.add(i+","+rs_s1.getString(1)+","+rs_s1.getString(2)+" "+rs_s1.getString(3)+" "+rs_s1.getString(4)+","+rs_s1.getString(5));    
            arr.add(",");
            i++;
            count++;
            }
            String arr_str=arr.toString();
           
            
            i--;
            String [][]matrix1=new String[i][4];
            int t=0,g=0;
            StringBuilder builder = new StringBuilder();
            for (String value : arr) {
            builder.append(value);
            }
            String text = builder.toString();
            String []res=text.split(",");
             %>
             <input type="hidden" id="all_data" value="<%= text %> ">  
            <%
            int l=0;
            for(int m=0;m<i;m++){
             for(int n=0;n<4;n++){
                 if(l<res.length){
                 matrix1[m][n]=res[l];
                }
                else
                break;
                l++;
                }
              }
            
             StringBuffer Session_Name=new StringBuffer();
             StringBuffer Class_Name=new StringBuffer();
             StringBuffer Section_Name=new StringBuffer();
             StringBuffer Date_Name=new StringBuffer();
            
             Statement sess_1;
             String query_sess_1 = "select session_name from session_tab WHERE session_id='"+session1_sel+"'";
             sess_1 = conn.createStatement();
             ResultSet rs_sess_1 = sess_1.executeQuery(query_sess_1);
             while(rs_sess_1.next())
             {
                 Session_Name.append(rs_sess_1.getString("session_name"));
             }
            
             Statement cls_1;
             String query_cls_1 = "select class_name from class_tab WHERE class_id='"+class1_sel+"'";
             cls_1 = conn.createStatement();
             ResultSet rs_cls_1 = cls_1.executeQuery(query_cls_1);
             while(rs_cls_1.next())
             {
                 Class_Name.append(rs_cls_1.getString("class_name"));
             }
            
             Statement sec_1;
             String query_sec_1 = "select section_name from section_tab WHERE section_id='"+section1_sel+"'";
             sec_1 = conn.createStatement();
             ResultSet rs_sec_1 = sec_1.executeQuery(query_sec_1);
             while(rs_sec_1.next())
             {
                 Section_Name.append(rs_sec_1.getString("section_name"));
             }
             
             

            out.print("<b>Session:</b> "+ Session_Name+" "+"<b>Class:</b> "+Class_Name+" "+"<b>Section:</b> "+Section_Name+" "+"<b>Date:</b> "+date1);
            int i1,j1;
            
           if(list1_sel.equals("roll-num")){
            matrix1=mysort3(matrix1);
            out.print("<table border=\"1\" bgcolor=\"#d0d0d0\">");
            out.print("<tr><th>SNo.</th><th>AdmissionNo.</th><th>Name</th><th>Roll No</th><th>Marks</th></tr>");
            
            for(i1=0;i1<i;i1++){
            out.print("<tr>");    
            for(j1=0;j1<4;j1++){
            out.print("<td>"+"       "+matrix1[i1][j1]+"      "+"</td>");
            }
            out.println("<td><input type=\"text\"  id="+matrix1[i1][j1-1]+" style=\"font-size:7pt;border:2px solid black;padding:3px\" onchange=\"changeStatusRNO("+matrix1[i1][j1-1]+")\"></td>");
            %>
            <input type="hidden" value="">
             <%
            out.println("</tr>");
            }
            
            out.print("</table>");
           }
           else if(list1_sel.equals("admission-num")){
            matrix1=mysort(matrix1);
            out.print("<table border=\"1\" bgcolor=\"#d0d0d0\">");
            out.print("<tr><th>SNo.</th><th>AdmissionNo.</th><th>Name</th><th>Roll No</th><th>Marks</th></tr>");
            
            for(i1=0;i1<i;i1++){
            out.print("<tr>");    
            for(j1=0;j1<4;j1++){
            out.print("<td>"+"       "+matrix1[i1][j1]+"      "+"</td>");
            }
            out.println("<td><input type=\"text\"  id="+matrix1[i1][j1-1]+" style=\"font-size:7pt;border:2px solid black;padding:3px\" onchange=\"changeStatusADM("+matrix1[i1][j1-1]+")\" ></td>");
            out.println("</tr>");
            }
            out.print("</table>");}
            else if(list1_sel.equals("serial-num")){
            matrix1=mysort2(matrix1);
            out.print("<table border=\"1\" bgcolor=\"#d0d0d0\">");
            out.print("<tr><th>SNo.</th><th>AdmissionNo.</th><th>Name</th><th>Roll No</th><th>Marks</th></tr>");
            
            for(i1=0;i1<i;i1++){
            out.print("<tr>");    
            for(j1=0;j1<4;j1++){
            out.print("<td>"+"       "+matrix1[i1][j1]+"      "+"</td>");
            }
            out.println("<td><input type=\"text\" id="+matrix1[i1][j1-1]+" style=\"font-size:7pt;border:2px solid black;padding:3px\" onchange=\"changeStatusSNO("+matrix1[i1][j1-1]+")\"></td>");
            out.println("</tr>");
            }
            out.print("</table>");}
           
        
%>      
<input type="button" value="submit" onclick="ajaxExamSubmit(<%= count%>)">
</div>
<span id="success_insert"></span>
</body>
</html>