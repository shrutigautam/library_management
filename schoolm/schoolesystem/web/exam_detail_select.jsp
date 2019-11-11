<%-- 
    Document   : exam_detail_select
    Created on : Feb 8, 2017, 12:36:28 PM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect_1.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
      
       
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>        
        <link rel="stylesheet" href="css/w3.css">
        <title>JSP Page</title>
           
         
        <style>
            .sub_button{
                position: absolute;
                left:450px;
                bottom:350px;
                
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
            .lab_max_marks{
                position: absolute;
                left:870px;
                bottom:500px;
            }
            .lab_min_marks{
                 position: absolute;
                left:655px;
                bottom:500px;
            }
            .max_marks{
                position: absolute;
                left:1000px; 
                bottom:500px;
                width:80px;
            }
            .min_marks{
                position: absolute;
                left:740px;
                width:80px;
                bottom:500px;
            }
            .lab_subs{
                position: absolute;
                left:450px;
                bottom:500px;
            }
            .lab_exam_code{
                position: absolute;
                left:870px;
                bottom:528px;
            }
            .exam_code{
                position: absolute;
               left:1000px; 
                bottom:528px;
                width:80px;
            }
            .lab_class{
                position: absolute;
                left:655px;
                bottom:528px;
            }
            .class1{
                position: absolute;
                left:740px;
                width:80px;
                bottom:528px;
            }
            .lab_session{
                position: absolute;
                left:450px;
                bottom:528px; 
            }
            .session1{
                position: absolute;
                left:525px;
                bottom:528px;
            }
            #subject_table{
                position: absolute;
                left: 525px;
                height: 120px;
                width:110px;
                bottom:400px;
                overflow: scroll; 
            }
            #content-div3{
                 margin:4% 0 0 1%;
                 border:1px solid #c0c0c0;
                 height:545px;
                 width:92%
            }
    fieldset {
    border: 0;
    }        
        </style>
        <!-- Initialize the plugin: -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#example-getting-started').multiselect();
    });
</script>
    </head>
   <body>
        <%
           String Exam_create=(String)session.getAttribute("Exam_create");
          
        %>  
       <form action="ExamShow" method="POST">
            <%
           if(Exam_create.equals("0")){
            %>
            <fieldset disabled>
            <%
            }
           else{
            %>
           <fieldset> 
           <%    
           }
           %>
                <label for="session" class="lab_session">Session</label>
                        
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
                        <br/>
                    
                         <label for="class" class="lab_class">Class</label>
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
                         <br/>        
            
                         <label for="exam_code" class="lab_exam_code">Exam code:</label>
                         <input type="text" id="exam_CODE" name="exam_CODE" class="exam_code">
                          <br/>                    
                         <label for="Subjects:-" class="lab_subs">Subjects</label>   
                                          
                         <div id="subject_table">
                           
                          
                            <table>
                            <%

                            Statement st5;
                            String query5 = "select * from subject_tab ";
                            st5 = conn.createStatement();
                            ResultSet rs5 = st5.executeQuery(query5);
                            while(rs5.next())
                           {
                           %>
                           <tr>
                           <td>
 <input type="checkbox" id="subjects_id" name="subjects_id" onchange="toggleVisibility('<%=  rs5.getString(2)%>')" value="<%=  rs5.getInt(1)%>"><%=  rs5.getString(2)%>  </td>
                           </tr>
                           <%
                           }
                           %>
                           </table> 

                        </div>
                        <br/>
                    
                        
                       
                        
                   
                        
                         <label for="maximum_marks" class="lab_max_marks">Max Marks:</label>
                         <input type="text" id="maximum_MARKS" name="maximum_MARKS" class="max_marks">
                      
                        
                     <br/>
                          
                         <label for="minimum_marks" class="lab_min_marks">Min Marks:</label>
                         <input type="text" id="minimum_MARKS" name="minimum_MARKS" class="min_marks">
                         <br/>
                    
                       <input type="submit" value="submit" class="sub_button">   
              <fieldset>          
             </form>
   </body>
</html>
