<%-- 
    Document   : lib_reg_search
    Created on : Jul 5, 2017, 3:30:14 PM
    Author     : Shruti Gautam
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="connect.jsp" %>
<%
 try 
        {
            Statement stmt;
            stmt = conn.createStatement();
           
            int adm_no=Integer.parseInt(request.getParameter("x"));
         
            String query = "select *,session_tab.session_name,class_tab.class_name from lib_reg join session_tab on session_tab.session_id=lib_reg.ses_id join class_tab on class_tab.class_id=lib_reg.prog_id where lib_reg.adm_no=? ";
             PreparedStatement pst= conn.prepareStatement(query);
            pst.setInt(1,adm_no);
             ResultSet rs=pst.executeQuery(); 
             
              while(rs.next()) 
              {
%>
              
                
                 <div class="col-sm-12">
                             <center>   <div class="row" style="height:100px;width:100px;border:1px solid black;">
    <% out.print("<img src='/schoolesystem/DisplayPhoto?admn="+adm_no+"' style='width:100px;height:100px;'>"); %>
                 </center>        </div>
                     <div class="row">
                         <div class="col-sm-4 a">Category:</div>
                                 <div class="col-sm-8">
                          <select name="cat1" id="cat1">
                             
      <%     
           out.print("<option value='"+rs.getString("cat_id")+"'>"+rs.getString("cat_id")+"</option><br>");
         
         %>                        
                             </select>
                                 </div>
                     </div>
          <div class="row">
      <div class="col-sm-4 a">Session:</div>
          <div class="col-sm-8">
        <select>
            <%     
           out.print("<option value='"+rs.getString("session_name")+"'>"+rs.getString("session_name")+"</option><br>");
         
         %>                        
      
</select>                 
         </div>
           </div>    
<div class="row">
      <div class="col-sm-4 a">class:</div>
          <div class="col-sm-8">
              <select>
    <%     
           out.print("<option value='"+rs.getString("class_name")+"'>"+rs.getString("class_name")+"</option><br>");
         
         %>    
</select>                 
         </div>
           </div>   
<div class="row">
                         <div class="col-sm-4 a">Group Name:</div>
                                 <div class="col-sm-8">
                          <select name="grp" id="grp1">
                           <%     
           out.print("<option value='"+rs.getString("grp")+"'>"+rs.getString("grp")+"</option><br>");
         
         %>    
                             </select>
                                 </div>
                     </div>
<div class="row">
 <div class="col-sm-4 a">Registration date From:</div>
   <div class="col-sm-6">
    <%     
           out.print("<input type='date' value='"+rs.getString("reg1")+"'>");
         
         %>    
     </div>
     </div>
<div class="row">
 <div class="col-sm-4 a">Registration date To:</div>
   <div class="col-sm-6">
   <%     
           out.print("<input type='date' value='"+rs.getString("reg2")+"'>");
         
         %> 
     </div>
     </div>
          
                </div>
 <%
         
      }  
       }
        catch(Exception e)
        {
            out.print("<center><h4>There is nothing to show</h4>"+e);
        }
       %>