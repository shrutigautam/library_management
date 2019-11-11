<%-- 
    Document   : notes
    Created on : Apr 19, 2017, 5:08:00 AM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script>
        
    </script>    
    </head>
    <body>
       <form action="UploadDownloadFileServlet" enctype="multipart/form-data" method="post">
           <input type="file" name="datafile" id="datafile">
           <input type="submit" value="Send">
       </form>
    </body>
</html>
