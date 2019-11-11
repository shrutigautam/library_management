<%-- 
    Document   : attendanceResultTab
    Created on : Feb 2, 2017, 12:09:23 PM
    Author     : Saumya Joshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" type="text/css" href="css/dashboard.css" />
<%@include file="connect_1.jsp" %>
<!DOCTYPE html>
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
<%
            String session1=request.getParameter("session1_sel");
            String class1=request.getParameter("class1_sel");
            String section1=request.getParameter("section1_sel");
            String faculty_code=request.getParameter("faculty_code");
            String faculty_name=request.getParameter("faculty_name");
            String sub_select=request.getParameter("sub_select_name");
            String select_type=request.getParameter("select_type");
            String date1=request.getParameter("date1");
            String status1_sel=request.getParameter("status1_sel");
            String list1_sel=request.getParameter("list1_sel"); 
            Statement s1;
            String query_s1 = "select admission_tab.Admission_No, admission_tab.Student_Name, admission_tab.Middle_Name, admission_tab.Last_Name, personal_info.std_rollno FROM admission_tab INNER JOIN personal_info ON admission_tab.Admission_No=personal_info.admission_no WHERE admission_tab.Year='"+session1+"' AND admission_tab.Class='"+class1+"' AND admission_tab.Section='"+section1+"' ";
            s1 = conn.createStatement();
            ResultSet rs_s1 = s1.executeQuery(query_s1); 
            ArrayList<String> arr=new ArrayList<String>();
            int i=1;
            while(rs_s1.next())
            {
            arr.add(i+","+rs_s1.getString(1)+","+rs_s1.getString(2)+" "+rs_s1.getString(3)+" "+rs_s1.getString(4)+","+rs_s1.getString(5));    
            arr.add(",");
            i++;
            }
            i--;
            String [][]matrix1=new String[i][4];
            int t=0,g=0;
            StringBuilder builder = new StringBuilder();
            for (String value : arr) {
            builder.append(value);
            }
            String text = builder.toString();
            String []res=text.split(",");
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
              out.print("<br/>");
            }
            
            int i1,j1;
            matrix1=mysort(matrix1);
            for(i1=0;i1<i;i1++){
            for(j1=0;j1<4;j1++){
            out.print(matrix1[i1][j1]+"  ");
            }
            out.println("<br/>");
            } 
%>