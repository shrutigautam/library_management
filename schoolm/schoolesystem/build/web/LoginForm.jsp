<%-- 
    Document   : LoginForm
    Created on : Apr 8, 2017, 7:54:57 PM
    Author     : Saumya Joshi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
</head>
<body>
<div id="wrapper">
<form name="login-form" class="login-form" action="loginCheck" method="post">
<div class="header">
<h1>Login Form</h1>
<span>Fill out the form below to login to school management system.</span>
</div>
<div class="content">
<input name="username" type="text" class="input username" placeholder="Username" />
<div class="user-icon"></div>
<input name="password" type="password" class="input password" placeholder="Password" />
<div class="pass-icon"></div>		
</div>
<div class="footer">
<input type="submit" name="submit" value="Login" class="button" />
</div>
</form>
</div>
<div class="gradient"></div>
</body>
</html>
