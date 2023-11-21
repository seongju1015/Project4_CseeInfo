package com.example.cseeinfo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtill {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p232_22000523","p232_22000523","va8BeL");
        }catch (Exception e){
            System.out.println(e);
        }
        return con;
    }
    /*public static void main(String args[]){
        Connection conn = getConnection();
        if(conn != null){
            System.out.println("DB 연동성공");
        }
        else{
            System.out.print("DB연결 중 오류");
        }
    }*/
}