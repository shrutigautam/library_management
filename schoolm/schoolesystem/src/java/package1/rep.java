/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package package1;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class rep extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
response.setContentType("text/html;charset=UTF-8");
PrintWriter out=response.getWriter();
response.setContentType("text/html");
try{
            /* TODO output your page here. You may use following sample code. */
String class1=request.getParameter("class1");
String cat1=request.getParameter("cat1");
String date1=request.getParameter("d1");
String date2=request.getParameter("d2");
Class.forName("com.mysql.jdbc.Driver");
Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement stmt=(Statement) con.createStatement();
ResultSet rs=stmt.executeQuery("select * from enquiry_tab where std_class='"+class1+"' AND  date_value between '"+date1+"' and '"+date2+"'");
//out.println("hi");    
    out.println("<table>");
        while(rs.next()){
       
      
        out.println("<tr><td><span id='a'></span><pre>      "+rs.getString(1)+"</pre></td><td><span id='b'></span><pre>      "+rs.getString(2)+"</pre></td><td><span id='c'></span><pre>                   "+rs.getString(4)+"</pre></td><td><span id='d'></span><pre>      "+rs.getString(11)+"</pre></td><td><span id='e'></span><pre>      "+rs.getString(14)+"</pre></td><td><span id='f'></span><pre>      "+rs.getString(8)+"</pre></td><td><span id='g'></span><pre>      "+rs.getString(7)+"</pre></td></tr>");
        }
        out.println("</table>");
           
                   
        
        }
        catch(Exception et)
                {
                out.print(et);
                }
    }

}