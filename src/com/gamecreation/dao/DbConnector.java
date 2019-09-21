/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class DbConnector {
	
    public Connection getConnection() throws Exception{
    	
        Connection con = null;
        String dbname = "GameCreationDB";
        String dburl = "Localhost";
        String dbusername = "root";
        String dbpassword = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://" + dburl + "/" + dbname, dbusername, dbpassword);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return con;
    }

    void close() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static void main(String[] args) {
		try {
			System.out.println(" connection established . "+new DbConnector().getConnection());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
