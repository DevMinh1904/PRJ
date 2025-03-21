//
//
///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package util;
//
//import java.io.FileNotFoundException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
///**
// *
// * @author tungi
// */
//
//
//public class DBConnection1 {
//
//    private static final String DB_Name = "OnlineExaminationDB";
//    private static final String DB_Username = "sa";
//    private static final String DB_Password = "12345";
//
//    public static Connection getConnection() throws SQLException {
//        Connection conn = null;
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_Name;
//        // jdbc:sqlserver://190.128.4.195\instanceName:1433;databaseName=unicodedemo;useUnicode=true&characterEncoding=UTF-8
//        conn = DriverManager.getConnection(url, DB_Username, DB_Password);
//        return conn;
//    }
//    
//    
//    public static Connection getConnection1() throws SQLException {
//        return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
//    }
//    
//    public static void closeConnection(Connection connection) {
//        if (connection != null) {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//    public static void main(String[] args) {
//        try {
//            Connection c = getConnection();
//            System.out.println(c);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//}