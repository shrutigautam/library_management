<%-- 
    Document   : exam_detail_select.jsp
    Created on : Feb 8, 2017, 1:57:14 PM
    Author     : Vermas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect_1.jsp" %>

        
        
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
          <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/exam_detail_select.css">
        <link rel="stylesheet" href="css/w3.css">
        <title>JSP Page</title>
         <script>
    $(function()
    {
        $('#subject').multiselect({
            includeSelectAllOption:true
        });
        $('#btnget').click(function(){
            alert($('#subject').val());
        });
        });
        </script>
        <style> 
            .multiselect-container>li>a>label{
                padding:4px 20px 3px 20px;
            }
        </style>
        
    </head>
    <body>
        <form action="ExamShow">
            <div id="main-content">
            <div id="content-div1">
                <div id="content-div1-sub1">
                    <div id="examId-select">
                        <label>Exam Id</label>
                        <input type="text" id="examId"></input>
                    </div>
                    <div id="session-select">
                         <label for="session">Session</label>
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
                    </div>
                    <div id="class-select">
                         <label for="class">Class</label>
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
                    </div>
                    <div id="section-select">
                        <label for="section">Section</label>
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
                </div>
                <div id="content-div1-sub2">
                        <div id="subject-select">
                             <label for="">Subject</label>
                               <select id="subject" multiple="multiple"> 
                                  
                             
                            
                             <%

                         Statement cst4;
                         String query_cst4 = "select * from subject_tab";
                         cst4 = conn.createStatement();
                         ResultSet rs_cst4 = cst4.executeQuery(query_cst4); 
                         while(rs_cst4.next())
                         {
                             %>
                            <option value="<%=rs_cst4.getString(1)%>" ><%=rs_cst4.getString(2)%></option>
                           
                            <%
                         }
                         %>
                        </select>
                    </div>
                         <div id="examCode-select">
                         <label for="">Exam Code</label>
                         <input type="text" id="examCode"></input>
                    </div>
                        <div id="maxMarks-select">
                         <label for="">Max. marks</label>
                        <input type="text" id="maxMarks"></input>
                    </div>
                        <div id="minMarks-select">
                         <label for="">Min. marks</label>
                        <input type="text" id="minMarks"></input>
                    </div>
                </div>
                         <div id="btn">
                    <input type="submit" value="CREATE"   id="button"></input>
                </div>
            </div>
            </div>
        </form>
    </body>
</html>
