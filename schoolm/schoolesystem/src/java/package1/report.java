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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sunil
 */
public class report extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        try  {
            /* TODO output your page here. You may use following sample code. */
           String date1=request.getParameter("na1");
           String date2=request.getParameter("na2");
           ArrayList a1=new ArrayList();
           Class.forName("com.mysql.jdbc.Driver");
    Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
    Statement stmt=(Statement) con.createStatement();
    ResultSet rs=stmt.executeQuery("select enquiry_id,std_name,std_fname,std_mobile,std_address,c.city_name,cs.class_name from enquiry_tab e join city_tab c on e.std_city=c.city_id join class_tab cs on e.std_class=cs.class_id where date between '"+date1+"' and '"+date2+"'");
       
        while(rs.next()){
            
            a1.add(rs.getString("enquiry_id")+",");
            a1.add(rs.getString("std_name")+",");
            a1.add(rs.getString("std_fname")+",");
            a1.add(rs.getString("class_name")+",");
            a1.add(rs.getString("std_mobile")+",");
            a1.add(rs.getString("city_name")+",");
            a1.add(rs.getString("std_address"));
            
        }
            Iterator  it=a1.iterator();
            out.println("<table>");
            while(it.hasNext())
              
            {out.println("<tr><td><span id='a'></span>"+it.next()+"</td><td><span id='b'></span>"+it.next()+"</td><td><span id='c'></span>"+it.next()+"</td><td><span id='d'></span>"+it.next()+"</td><td><span id='e'></span>"+it.next()+"</td><td><span id='f'></span>"+it.next()+"</td><td><span id='g'></span>"+it.next()+"</td></tr>");
                
                
            }
            out.println("</table>");
            
        
        }
        catch(Exception et)
                {
                out.print(et);
                }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

  