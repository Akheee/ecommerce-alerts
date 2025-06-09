package com.database;

import java.sql.*;

public class Queries {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12783778",
  "sql12783778",
  "SCazHR9SlQ"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static ResultSet getExecuteQuery(String query) {
        ResultSet rs = null;
        try {
            Connection con = getConnection();
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // ✅ Add this method:
    public static int getExecuteUpdate(String query) {
        int i = 0;
        try {
            Connection con = getConnection();
            Statement st = con.createStatement();
            i = st.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
