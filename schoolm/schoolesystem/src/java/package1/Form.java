package package1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class Form extends HttpServlet {  
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
try(PrintWriter out = response.getWriter()) { 
   
        String b=request.getParameter("Name");  
        String c=request.getParameter("DOB");  
        String d=request.getParameter("FName");  
        String e=request.getParameter("FOccupation");
        String f=request.getParameter("MName");
        String g=request.getParameter("Address");
        String h=request.getParameter("City");
        String i=request.getParameter("Gender");
        String j=request.getParameter("Email_ID");
        String k=request.getParameter("Class");
        String l=request.getParameter("School");
        String m=request.getParameter("Parents");
        int n=Integer.parseInt(request.getParameter("Mobile_No"));
        int o=Integer.parseInt(request.getParameter("Landline_No"));
        int p=Integer.parseInt(request.getParameter("Alternate_No"));
        String q=request.getParameter("Category");
        int r=Integer.parseInt(request.getParameter("Family_Income"));
        String s=request.getParameter("Admission_Mode");
        String t=request.getParameter("Admission_Place");
        String u=request.getParameter("Remark");
       // String enq="203";
        try{
            Class.forName( "com.mysql.jdbc.Driver");

         
             Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
            if(conn!=null){
            PreparedStatement ps=conn.prepareStatement(
                    "insert into enquiry_tab values('203',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            //out.println("dsf");
            ps.setString(1,b);
            ps.setString(2,c);
            ps.setString(3,d);
            ps.setString(4,e);
            ps.setString(5,f);
            ps.setString(6,g);
            ps.setString(7,h);
            ps.setString(8,i);
            ps.setString(9,j);
            ps.setString(10,k);
            ps.setString(11,l);
            ps.setString(12,m);
            ps.setInt(13,n);
            ps.setInt(14,o);
            ps.setInt(15,p);
            ps.setString(16,q);
            ps.setInt(17,r);
            ps.setString(18,s);
            ps.setString(19,t);
            ps.setString(20,u);
            int v=ps.executeUpdate();
            if(v>0){
                
                out.print("You are successfully registered...");
            }
            }
            else{
              out.println("not connection");
                      }
        }catch (ClassNotFoundException | SQLException e2)
        {
            System.out.println(e2);
        }
      
          }  
  
} 
}