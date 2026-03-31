/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject;

import java.sql.*;

public class MyConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Check if running online (Railway)
            String host = System.getenv("DB_HOST"); // Railway automatically sets this

            if (host != null) {
                // 🌐 Online DB
                String port = System.getenv("DB_PORT");
                String db = System.getenv("DB_NAME");
                String user = System.getenv("DB_USER");
                String pass = System.getenv("DB_PASS");

                String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=true&allowPublicKeyRetrieval=true";
                con = DriverManager.getConnection(url, user, pass);

            } else {
                // 💻 Localhost DB
                String url = "jdbc:mysql://localhost:3306/tests_db";
                String user = "root";
                String pass = "spdt";

                con = DriverManager.getConnection(url, user, pass);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}