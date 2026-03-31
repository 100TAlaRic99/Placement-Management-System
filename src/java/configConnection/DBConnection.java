/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection(){

        Connection con = null;

        try{

            // step 1: load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // step 2: check online or local
        String host = System.getenv("DB_HOST");

        if (host != null) {
            // 🌐 Online (Railway)
            String port = System.getenv("DB_PORT");
            String db = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASS");

            String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=true&allowPublicKeyRetrieval=true";
            con = DriverManager.getConnection(url, user, pass);

        } else {
            // 💻 Localhost
            String url = "jdbc:mysql://localhost:3306/myprofile_db";
            String user = "root";
            String pass = "spdt";

            con = DriverManager.getConnection(url, user, pass);
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return con;
}
}