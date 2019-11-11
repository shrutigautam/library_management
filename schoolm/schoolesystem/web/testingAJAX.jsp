<%-- 
    Document   : testingAJAX
    Created on : Dec 31, 2016, 5:44:42 PM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script>
           var req;
           var arr=[a,b,c,d,e,f];
          function special(){
                var a=document.FS.employee_id_.value;
                //var b=arr.toString();
                if(window.XMLHttpRequest){
                req=new XMLHttpRequest();}
                else{
                req=new ActiveXObject("Microsoft.XMLHTTP");}
                req.open("GET","Specialized_subjects_insert?empl_id="+a,true);
                req.send();
                req.onreadystatechange=function(){
                if(req.readyState==4){ 
                var str=req.responseText;
                document.getElementById("demo").value=str;
                 }}}
                
         </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="FS">
         Employee ID: <input type="text" name="employee_id_"></input>
         <input  type="button" value="Submit" onclick="special()"></input>
        </form>
      <input type="text" id="demo"></input>
         </body>
</html>
