package package1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author sunil
 */
public class connect {
    public Connection conn=null;
  public  Connection connection(Connection conn) throws ClassNotFoundException{
    
     try{
        
            Class.forName("com.mysql.jdbc.Driver");
             conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
        } catch (SQLException ex) 
        {}
   return conn;
  }   
}





//