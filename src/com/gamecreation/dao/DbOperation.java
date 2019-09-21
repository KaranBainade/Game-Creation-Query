
package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DbOperation {

    DbConnector dao = new DbConnector();
    Connection con;

    public String get(String user) {
        
    	String temp = new String();
        
        try {
            con = dao.getConnection();
            System.out.println(user);
            PreparedStatement stmt = con.prepareStatement("select * from registration where name='" + user + "'");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                temp = rs.getString(8);
                System.out.println("temp is:::"+temp);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }catch(Exception e) {
        	e.printStackTrace();
        }
        return temp;
    }

    public String getName(String user) {
        String temp = new String();
        
        try {
            con = dao.getConnection();
            PreparedStatement stmt = con.prepareStatement("select * from registration where email='" + user + "'");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                temp = rs.getString(2) + " " + rs.getString(3);
            }

            System.out.println(temp);

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        	
        }
        return temp;
    }

//    public static void main(String[] args) {
//        DbOperation dbp = new DbOperation();
//        dbp.get("admin");
//    }

}
