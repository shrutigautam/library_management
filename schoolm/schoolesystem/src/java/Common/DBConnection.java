
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Common;
import java.sql.*;
/**
 *
 * @author tusha
 */
public class DBConnection {
    static Connection conn;
    public static Connection getDBConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7","root","password");
        return conn;
    }
}
