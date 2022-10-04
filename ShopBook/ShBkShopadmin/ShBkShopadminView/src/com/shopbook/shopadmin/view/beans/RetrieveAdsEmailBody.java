package com.shopbook.shopadmin.view.beans;

import javax.sql.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class RetrieveAdsEmailBody  {

    public static void main(String[] args) {
        
        try { 
            Connection conn = Helper.getOracleConnection();
            Statement stmt=conn.createStatement();  
            ResultSet rs=stmt.executeQuery("select * from offers");  
            while(rs.next())  
            System.out.println(rs.getInt(1)+"  "+"----"+"  "+rs.getString(3));  
            conn.close();  
        
        } 
        catch (Exception e) {
            
      } 
    }
}