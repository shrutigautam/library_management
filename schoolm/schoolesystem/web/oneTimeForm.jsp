<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
           
        </title>
        <link rel="stylesheet" type="text/css" href="css/oneTimeForm.css">
    </head>
    <body>
<div class="container">  
  <form id="contact" action="schoolInfoSubmit" method="post" enctype="multipart/form-data">
    <h3>School Registration</h3>
    <h4>Enter School Details</h4>
    <fieldset>
      <input placeholder="School Name" id="school_name" name="school_name" type="text" tabindex="1" required autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="Logo" type="file" id="school_logo" name="school_logo" tabindex="2" required>
    </fieldset>
    <fieldset>
      <input placeholder="School Phone Number (optional)"id="school_phone_number" name="school_phone_number" type="tel" tabindex="3" required>
    </fieldset>
    <fieldset>
      <input placeholder="School Web Site" type="url" id="school_web_site" name="school_web_site" tabindex="4" required>
    </fieldset>
    <fieldset>
      <input placeholder="Director's Sign" type="file" id="director_sign" name="director_sign" tabindex="5" required>
    </fieldset>
    <fieldset>
      <textarea placeholder="Enter School Address...." id="school_address" name="school_address" tabindex="6" required></textarea>
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
    </fieldset>
    
  </form>
</div>
    </body>
    </html>