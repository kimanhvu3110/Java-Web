/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author black
 */
public class DBContext {
    protected Connection connection;
    public DBContext(){
        try{
         String user = "sa";
         String pass = "nhutren";
         String url = "jdbc:sqlserver://DESKTOP-TTT93I2:1433;databaseName=WEBBAO";
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         connection = DriverManager.getConnection(url, user, pass);
    }
        catch(Exception ex){
           Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

